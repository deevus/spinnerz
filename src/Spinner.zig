const Spinner = @This();
const styles = @import("styles.zig");

const clear = "\r\x1b[2K";
const default_delay: Duration = .fromMilliseconds(80);

pub const Direction = enum { forward, reverse };

io: Io,
message: []const u8,
stop: std.atomic.Value(bool) = .init(false),
future: ?Future(void) = null,
style: []const []const u8,
delay: Duration,
direction: Direction,

pub const Config = struct {
    message: []const u8,
    style: []const []const u8 = styles.braille,
    delay: Duration = default_delay,
    direction: Direction = .forward,
};

pub fn init(io: Io, config: Config) Spinner {
    return Spinner{
        .io = io,
        .message = config.message,
        .style = config.style,
        .delay = config.delay,
        .direction = config.direction,
    };
}

pub fn start(self: *Spinner) !void {
    self.stop.store(false, .release);
    self.future = try self.io.concurrent(run, .{self});
}

pub fn finish(self: *Spinner) void {
    self.stop.store(true, .release);

    if (self.future) |*future| {
        future.cancel(self.io);
        _ = future.await(self.io);
    }

    const stderr = File.stderr();
    var buf: [256]u8 = undefined;
    var w = stderr.writer(self.io, &buf);
    w.interface.writeAll(clear) catch {};
    w.interface.flush() catch {};
}

fn run(self: *Spinner) void {
    const stderr = std.Io.File.stderr();
    var buf: [256]u8 = undefined;
    var w = stderr.writer(self.io, &buf);
    var i: usize = 0;

    while (!self.stop.load(.acquire)) {
        w.interface.print(clear ++ "{s} {s}", .{ self.style[i], self.message }) catch return;
        w.interface.flush() catch return;
        i = (if (self.direction == .reverse) i + self.style.len - 1 else i + 1) % self.style.len;
        self.io.sleep(self.delay, .awake) catch {};
    }
}

pub fn reverse(self: *Spinner) void {
    self.direction = if (self.direction == .forward) .reverse else .forward;
}

const std = @import("std");
const Io = std.Io;
const Future = Io.Future;
const Threaded = Io.Threaded;
const File = Io.File;
const Duration = Io.Duration;
