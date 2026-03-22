# spinnerz

A terminal spinner library for Zig.

## Usage

```zig
const Spinner = @import("spinnerz");

var spinner: Spinner = .init(io, "Loading...");
try spinner.start();
defer spinner.finish();

// Do work...
spinner.message = "Almost done...";
```

## Building

```sh
zig build          # Build the library
zig build run      # Run the demo
```

## Requirements

Zig 0.16.x
