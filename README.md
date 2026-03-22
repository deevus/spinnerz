# spinnerz

A configurable terminal spinner library for Zig with many built-in styles.

## Usage

```zig
const spinnerz = @import("spinnerz");
const Spinner = spinnerz.Spinner;
const styles = spinnerz.styles;

var spinner = Spinner.init(io, .{
    .message = "Loading...",
    .style = styles.dots_spread,
    .delay = .fromMilliseconds(100),
    .direction = .forward,
});
try spinner.start();
defer spinner.finish();

// Do work...
spinner.message = "Almost done...";

// Change speed or direction at runtime
spinner.delay = .fromMilliseconds(50);
spinner.direction = .reverse;
spinner.reverse(); // or toggle with reverse()
```

Only `message` is required -- `style`, `delay`, and `direction` have defaults (`braille`, `80ms`, `.forward`).

## Demo

```sh
zig build                                          # build everything
./zig-out/bin/spinnerz-demo                        # default braille spinner
./zig-out/bin/spinnerz-demo --style dots_spread    # pick a style
./zig-out/bin/spinnerz-demo --delay 50             # faster
./zig-out/bin/spinnerz-demo --reverse              # reverse direction
./zig-out/bin/spinnerz-demo --list-styles          # show all available styles
```

## Building

```sh
zig build
```

## Requirements

Zig 0.16.x

## License

MIT
