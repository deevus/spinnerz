pub fn main(init: std.process.Init.Minimal) !void {
    const gpa = std.heap.smp_allocator;

    var threaded: std.Io.Threaded = .init(gpa, .{});
    defer threaded.deinit();
    const io = threaded.io();

    const opts = parseArgs(init.args) orelse std.process.exit(1);

    var buf: [64]u8 = undefined;

    var spinner: Spinner = .init(io, .{
        .message = "Starting...",
        .style = opts.style,
        .delay = opts.delay,
        .direction = opts.direction,
    });
    try spinner.start();
    defer spinner.finish();

    try io.sleep(.fromSeconds(1), .awake);

    for (0..5) |i| {
        spinner.message = try std.fmt.bufPrint(&buf, "Reticulating splines ({d})...", .{5 - i});
        try io.sleep(.fromSeconds(1), .awake);
    }

    spinner.message = "Done!";
    try io.sleep(.fromSeconds(1), .awake);
}

const Options = struct {
    style: []const []const u8 = styles.braille,
    delay: std.Io.Duration = .fromMilliseconds(80),
    direction: Spinner.Direction = .forward,
};

fn parseArgs(args: std.process.Args) ?Options {
    var opts: Options = .{};
    var iter = args.iterate();
    _ = iter.next(); // skip program name
    while (iter.next()) |arg| {
        if (std.mem.eql(u8, arg, "-r") or std.mem.eql(u8, arg, "--reverse")) {
            opts.direction = .reverse;
        } else if (std.mem.eql(u8, arg, "-s") or std.mem.eql(u8, arg, "--style")) {
            const name = iter.next() orelse {
                std.debug.print("error: --style requires a value\n", .{});
                return null;
            };
            opts.style = lookupStyle(name) orelse {
                std.debug.print("error: unknown style '{s}'\navailable styles:\n", .{name});
                printStyles();
                return null;
            };
        } else if (std.mem.eql(u8, arg, "-d") or std.mem.eql(u8, arg, "--delay")) {
            const val = iter.next() orelse {
                std.debug.print("error: --delay requires a value in ms\n", .{});
                return null;
            };
            const ms = std.fmt.parseInt(i64, val, 10) catch {
                std.debug.print("error: invalid delay '{s}', expected milliseconds\n", .{val});
                return null;
            };
            opts.delay = .fromMilliseconds(ms);
        } else if (std.mem.eql(u8, arg, "--list-styles")) {
            printStyles();
            std.process.exit(0);
        } else if (std.mem.eql(u8, arg, "-h") or std.mem.eql(u8, arg, "--help")) {
            printUsage();
            std.process.exit(0);
        }
    }
    return opts;
}

fn lookupStyle(name: []const u8) ?[]const []const u8 {
    inline for (@typeInfo(styles).@"struct".decls) |decl| {
        if (@TypeOf(@field(styles, decl.name)) == []const []const u8) {
            if (std.mem.eql(u8, name, decl.name)) {
                return @field(styles, decl.name);
            }
        }
    }
    return null;
}

fn printUsage() void {
    std.debug.print(
        \\Usage: spinnerz-demo [options]
        \\
        \\Options:
        \\  -s, --style <name>  Set the spinner style (default: braille)
        \\  -d, --delay <ms>    Set the frame delay in milliseconds (default: 80)
        \\  -r, --reverse       Reverse the spinner direction
        \\  --list-styles       List all available styles
        \\  -h, --help          Show this help message
        \\
    , .{});
}

fn printStyles() void {
    inline for (@typeInfo(styles).@"struct".decls) |decl| {
        if (@TypeOf(@field(styles, decl.name)) == []const []const u8) {
            std.debug.print("  {s}\n", .{decl.name});
        }
    }
}

const std = @import("std");

const spinnerz = @import("spinnerz");
const Spinner = spinnerz.Spinner;
const styles = spinnerz.styles;
