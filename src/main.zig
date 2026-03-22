pub fn main() !void {
    const gpa = std.heap.smp_allocator;

    var threaded: std.Io.Threaded = .init(gpa, .{});
    defer threaded.deinit();
    const io = threaded.io();

    var buf: [64]u8 = undefined;

    var spinner: Spinner = .init(io, "Starting...");
    try spinner.start();
    defer spinner.finish();

    try io.sleep(.fromSeconds(1), .awake);

    for (0..5) |i| {
        spinner.message = try std.fmt.bufPrint(&buf, "Spinning ({d})...", .{5 - i});
        try io.sleep(.fromSeconds(1), .awake);
    }

    spinner.message = "Done!";
    try io.sleep(.fromSeconds(1), .awake);
}

const std = @import("std");

const Spinner = @import("root.zig");
