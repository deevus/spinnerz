const Style = []const []const u8;

pub const arrows: Style = &.{ "←", "↖", "↑", "↗", "→", "↘", "↓", "↙" };
pub const bar_up_down: Style = &.{ "▁", "▃", "▄", "▅", "▆", "▇", "█", "▇", "▆", "▅", "▄", "▃", "▁" };
pub const quadrant: Style = &.{ "▖", "▘", "▝", "▗" };
pub const box_corners: Style = &.{ "┤", "┘", "┴", "└", "├", "┌", "┬", "┐" };
pub const triangle: Style = &.{ "◢", "◣", "◤", "◥" };
pub const square_quadrant: Style = &.{ "◰", "◳", "◲", "◱" };
pub const arc_quadrant: Style = &.{ "◴", "◷", "◶", "◵" };
pub const half_circle: Style = &.{ "◐", "◓", "◑", "◒" };
pub const dot_bounce: Style = &.{ ".", "o", "O", "@", "*" };
pub const line: Style = &.{ "|", "/", "-", "\\" };
pub const face: Style = &.{ "◡◡", "⊙⊙", "◠◠" };
pub const braille_spin: Style = &.{ "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" };
pub const fish: Style = &normalize(&.{ ">))'>", " >))'>", "  >))'>", "   >))'>", "    >))'>", "   <'((<", "  <'((<", " <'((<" });
pub const braille_dot: Style = &.{ "⠁", "⠂", "⠄", "⡀", "⢀", "⠠", "⠐", "⠈" };
pub const braille: Style = &.{ "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" };
pub const alphabet: Style = &genRange('a', 26);
pub const bar_shrink: Style = &.{ "▉", "▊", "▋", "▌", "▍", "▎", "▏", "▎", "▍", "▌", "▋", "▊", "▉" };
pub const square_dot: Style = &.{ "■", "□", "▪", "▫" };
pub const arrows_simple: Style = &.{ "←", "↑", "→", "↓" };
pub const cross: Style = &.{ "╫", "╪" };
pub const arrows_double: Style = &.{ "⇐", "⇖", "⇑", "⇗", "⇒", "⇘", "⇓", "⇙" };
pub const braille_wave_1: Style = &.{ "⠁", "⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈", "⠈" };
pub const braille_wave_2: Style = &.{ "⠈", "⠉", "⠋", "⠓", "⠒", "⠐", "⠐", "⠒", "⠖", "⠦", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈" };
pub const braille_wave_3: Style = &.{ "⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠴", "⠲", "⠒", "⠂", "⠂", "⠒", "⠚", "⠙", "⠉", "⠁" };
pub const braille_wave_4: Style = &.{ "⠋", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋" };
pub const katakana: Style = &genRange(0xFF66, 10) ++ genRange(0xFF71, 45);
pub const ellipsis: Style = &normalize(&.{ ".", "..", "..." });
pub const bar_bounce: Style = &.{ "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█", "▉", "▊", "▋", "▌", "▍", "▎", "▏", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁" };
pub const dot_pulse: Style = &.{ ".", "o", "O", "°", "O", "o", "." };
pub const plus_cross: Style = &.{ "+", "x" };
pub const arrow_rotate: Style = &.{ "v", "<", "^", ">" };
pub const arrow_chase: Style = &normalize(&.{ ">>--->", " >>--->", "  >>--->", "   >>--->", "    >>--->", "    <---<<", "   <---<<", "  <---<<", " <---<<", "<---<<" });
pub const pipe_grow: Style = &normalize(&.{ "|", "||", "|||", "||||", "|||||", "|||||||", "||||||||", "|||||||", "||||||", "|||||", "||||", "|||", "||", "|" });
pub const progress_bar: Style = &.{ "[          ]", "[=         ]", "[==        ]", "[===       ]", "[====      ]", "[=====     ]", "[======    ]", "[=======   ]", "[========  ]", "[========= ]", "[==========]" };
pub const bouncing_star: Style = &.{ "(*---------)", "(-*--------)", "(--*-------)", "(---*------)", "(----*-----)", "(-----*----)", "(------*---)", "(-------*--)", "(--------*-)", "(---------*)" };
pub const block_fill: Style = &.{ "█▒▒▒▒▒▒▒▒▒", "███▒▒▒▒▒▒▒", "█████▒▒▒▒▒", "███████▒▒▒", "██████████" };
pub const progress_arrow: Style = &.{ "[                    ]", "[=>                  ]", "[===>                ]", "[=====>              ]", "[======>             ]", "[========>           ]", "[==========>         ]", "[============>       ]", "[==============>     ]", "[================>   ]", "[==================> ]", "[===================>]" };
pub const clock: Style = &genRange(0x1F550, 12);
pub const clock_half: Style = &genInterleaved(0x1F550, 0x1F55C, 12);
pub const globe: Style = &.{ "🌍", "🌎", "🌏" };
pub const arc: Style = &.{ "◜", "◝", "◞", "◟" };
pub const diamond_square_1: Style = &.{ "⬒", "⬔", "⬓", "⬕" };
pub const diamond_square_2: Style = &.{ "⬖", "⬘", "⬗", "⬙" };
pub const bracket_chase: Style = &.{ "[>>>          >]", "[]>>>>        []", "[]  >>>>      []", "[]    >>>>    []", "[]      >>>>  []", "[]        >>>>[]", "[>>          >>]" };
pub const card_suits: Style = &.{ "♠", "♣", "♥", "♦" };
pub const arrow_pulse: Style = &.{ "➞", "➟", "➠", "➡", "➠", "➟" };
pub const ascii_rotate_1: Style = &.{ "  |  ", " \\   ", "_    ", " \\   ", "  |  ", "   / ", "    _", "   / " };
pub const ascii_dots: Style = &.{ "  . . . .", ".   . . .", ". .   . .", ". . .   .", ". . . .  ", ". . . . ." };
pub const ascii_rotate_2: Style = &.{ " |     ", "  /    ", "   _   ", "    \\  ", "     | ", "    \\  ", "   _   ", "  /    " };
pub const horizontal_line: Style = &.{ "⎺", "⎻", "⎼", "⎽", "⎼", "⎻" };
pub const triangle_arrow: Style = &.{ "▹▹▹▹▹", "▸▹▹▹▹", "▹▸▹▹▹", "▹▹▸▹▹", "▹▹▹▸▹", "▹▹▹▹▸" };
pub const bracket_fill: Style = &.{ "[    ]", "[   =]", "[  ==]", "[ ===]", "[====]", "[=== ]", "[==  ]", "[=   ]" };
pub const bouncing_ball: Style = &.{ "( ●    )", "(  ●   )", "(   ●  )", "(    ● )", "(     ●)", "(    ● )", "(   ●  )", "(  ●   )", "( ●    )" };
pub const star_pulse: Style = &.{ "✶", "✸", "✹", "✺", "✹", "✷" };
pub const bouncing_slash: Style = &.{ "▐|\\____________▌", "▐_|\\___________▌", "▐__|\\__________▌", "▐___|\\_________▌", "▐____|\\________▌", "▐_____|\\_______▌", "▐______|\\______▌", "▐_______|\\_____▌", "▐________|\\____▌", "▐_________|\\___▌", "▐__________|\\__▌", "▐___________|\\_▌", "▐____________|\\▌", "▐____________/|▌", "▐___________/|_▌", "▐__________/|__▌", "▐_________/|___▌", "▐________/|____▌", "▐_______/|_____▌", "▐______/|______▌", "▐_____/|_______▌", "▐____/|________▌", "▐___/|_________▌", "▐__/|__________▌", "▐_/|___________▌", "▐/|____________▌" };
pub const bouncing_braille: Style = &.{ "▐⠂       ▌", "▐⠈       ▌", "▐ ⠂      ▌", "▐ ⠠      ▌", "▐  ⡀     ▌", "▐  ⠠     ▌", "▐   ⠂    ▌", "▐   ⠈    ▌", "▐    ⠂   ▌", "▐    ⠠   ▌", "▐     ⡀  ▌", "▐     ⠠  ▌", "▐      ⠂ ▌", "▐      ⠈ ▌", "▐       ⠂▌", "▐       ⠠▌", "▐       ⡀▌", "▐      ⠠ ▌", "▐      ⠂ ▌", "▐     ⠈  ▌", "▐     ⠂  ▌", "▐    ⠠   ▌", "▐    ⡀   ▌", "▐   ⠠    ▌", "▐   ⠂    ▌", "▐  ⠈     ▌", "▐  ⠂     ▌", "▐ ⠠      ▌", "▐ ⡀      ▌", "▐⠠       ▌" };
pub const question: Style = &.{ "¿", "?" };
pub const braille_orbit_1: Style = &.{ "⢹", "⢺", "⢼", "⣸", "⣇", "⡧", "⡗", "⡏" };
pub const braille_orbit_2: Style = &.{ "⢄", "⢂", "⢁", "⡁", "⡈", "⡐", "⡠" };
pub const dots_spread: Style = &.{ ".  ", ".. ", "...", " ..", "  .", "   " };
pub const dot_breathe: Style = &.{ ".", "o", "O", "°", "O", "o", "." };
pub const shade: Style = &.{ "▓", "▒", "░" };
pub const block_rotate: Style = &.{ "▌", "▀", "▐", "▄" };
pub const bowtie: Style = &.{ "⊶", "⊷" };
pub const square_toggle_small: Style = &.{ "▪", "▫" };
pub const square_toggle: Style = &.{ "□", "■" };
pub const bar_toggle: Style = &.{ "▮", "▯" };
pub const dash_equal: Style = &.{ "-", "=", "≡" };
pub const letter_rotate: Style = &.{ "d", "q", "p", "b" };
pub const dot_chase: Style = &.{ "∙∙∙", "●∙∙", "∙●∙", "∙∙●", "∙∙∙" };
pub const moon_phases: Style = &genRange(0x1F311, 8);
pub const shogi: Style = &.{ "☗", "☖" };
pub const circle_grid: Style = &.{ "⧇", "⧆" };
pub const circle_dot: Style = &.{ "◉", "◎" };
pub const magatama: Style = &.{ "㊂", "㊀", "㊁" };
pub const circle_ring: Style = &.{ "⦾", "⦿" };
pub const myanmar: Style = &.{ "ဝ", "၀" };
pub const block_rotate_short: Style = &normalize(&.{ "▌", "▀", "▐▄" });
pub const braille_stack: Style = &.{ "⠈⠁", "⠈⠑", "⠈⠱", "⠈⡱", "⢀⡱", "⢄⡱", "⢄⡱", "⢆⡱", "⢎⡱", "⢎⡰", "⢎⡠", "⢎⡀", "⢎⠁", "⠎⠁", "⠊⠁" };
pub const dash_bounce: Style = &.{ "________", "-_______", "_-______", "__-_____", "___-____", "____-___", "_____-__", "______-_", "_______-", "________", "_______-", "______-_", "_____-__", "____-___", "___-____", "__-_____", "_-______", "-_______", "________" };
pub const line_bounce: Style = &.{ "|_______", "_/______", "__-_____", "___\\____", "____|___", "_____/__", "______-_", "_______\\", "_______|", "______\\_", "_____-__", "____/___", "___|____", "__\\_____", "_-______" };
pub const square_fill_1: Style = &.{ "□", "◱", "◧", "▣", "■" };
pub const square_fill_2: Style = &.{ "□", "◱", "▨", "▩", "■" };
pub const shade_fill: Style = &.{ "░", "▒", "▓", "█" };
pub const shade_toggle: Style = &.{ "░", "█" };
pub const circle_toggle: Style = &.{ "⚪", "⚫" };
pub const circle_fill: Style = &.{ "◯", "⬤" };
pub const bar_toggle_thin: Style = &.{ "▱", "▰" };
pub const numbers: Style = &genRange(0x278A, 10);
pub const fractions: Style = &.{ "½", "⅓", "⅔", "¼", "¾", "⅛", "⅜", "⅝", "⅞" };
pub const arrows_heavy: Style = &.{ "↞", "↟", "↠", "↡" };

// Public helpers

/// Returns the display width of a single Unicode codepoint.
pub fn charWidth(cp: u21) u2 {
    // Zero-width: control chars, combining marks, variation selectors, ZWS
    if (cp < 0x20) return 0;
    if (cp >= 0x0300 and cp <= 0x036F) return 0;
    if (cp >= 0x200B and cp <= 0x200F) return 0;
    if (cp >= 0xFE00 and cp <= 0xFE0F) return 0;
    if (cp == 0xFEFF) return 0;

    // Wide: CJK, Hangul, fullwidth forms, emoji
    if (cp >= 0x1100 and cp <= 0x115F) return 2;
    if (cp >= 0x2E80 and cp <= 0x303E) return 2;
    if (cp >= 0x3040 and cp <= 0x9FFF) return 2;
    if (cp >= 0xAC00 and cp <= 0xD7AF) return 2;
    if (cp >= 0xF900 and cp <= 0xFAFF) return 2;
    if (cp >= 0xFE30 and cp <= 0xFE6F) return 2;
    if (cp >= 0xFF01 and cp <= 0xFF60) return 2;
    if (cp >= 0xFFE0 and cp <= 0xFFE6) return 2;
    if (cp >= 0x1F000 and cp <= 0x1FFFF) return 2;
    if (cp >= 0x20000 and cp <= 0x2FFFF) return 2;

    return 1;
}

/// Returns the display width of a UTF-8 encoded string.
pub fn strWidth(s: []const u8) usize {
    var width: usize = 0;
    var i: usize = 0;
    while (i < s.len) {
        const len = seqLen(s[i]);
        if (len == 0 or i + len > s.len) break;
        const cp = decode(s[i..][0..len]);
        width += charWidth(cp);
        i += len;
    }
    return width;
}

/// Pads all frames in a style to uniform display width with trailing spaces.
pub fn normalize(comptime frames: []const []const u8) [frames.len][]const u8 {
    comptime {
        var max_w: usize = 0;
        for (frames) |f| {
            const w = strWidth(f);
            if (w > max_w) max_w = w;
        }
        var result: [frames.len][]const u8 = undefined;
        for (frames, 0..) |f, i| {
            const w = strWidth(f);
            const pad = max_w - w;
            if (pad == 0) {
                result[i] = f;
            } else {
                result[i] = f ++ &[1]u8{' '} ** pad;
            }
        }
        return result;
    }
}

// Internal helpers

fn seqLen(first: u8) u3 {
    if (first < 0x80) return 1;
    if (first & 0xE0 == 0xC0) return 2;
    if (first & 0xF0 == 0xE0) return 3;
    if (first & 0xF8 == 0xF0) return 4;
    return 0;
}

fn decode(bytes: anytype) u21 {
    return switch (bytes.len) {
        1 => @intCast(bytes[0]),
        2 => @as(u21, bytes[0] & 0x1F) << 6 | @as(u21, bytes[1] & 0x3F),
        3 => @as(u21, bytes[0] & 0x0F) << 12 | @as(u21, bytes[1] & 0x3F) << 6 | @as(u21, bytes[2] & 0x3F),
        4 => @as(u21, bytes[0] & 0x07) << 18 | @as(u21, bytes[1] & 0x3F) << 12 | @as(u21, bytes[2] & 0x3F) << 6 | @as(u21, bytes[3] & 0x3F),
        else => 0xFFFD,
    };
}

fn genRange(comptime start: u21, comptime count: usize) [count][]const u8 {
    comptime {
        var result: [count][]const u8 = undefined;
        for (0..count) |i| {
            result[i] = encode(start + @as(u21, @intCast(i)));
        }
        return result;
    }
}

fn genInterleaved(comptime a: u21, comptime b: u21, comptime count: usize) [count * 2][]const u8 {
    comptime {
        var result: [count * 2][]const u8 = undefined;
        for (0..count) |i| {
            result[i * 2] = encode(a + @as(u21, @intCast(i)));
            result[i * 2 + 1] = encode(b + @as(u21, @intCast(i)));
        }
        return result;
    }
}

fn encode(comptime cp: u21) []const u8 {
    comptime {
        if (cp < 0x80) {
            return &[_]u8{@intCast(cp)};
        } else if (cp < 0x800) {
            return &[_]u8{
                @intCast(0xC0 | (cp >> 6)),
                @intCast(0x80 | (cp & 0x3F)),
            };
        } else if (cp < 0x10000) {
            return &[_]u8{
                @intCast(0xE0 | (cp >> 12)),
                @intCast(0x80 | ((cp >> 6) & 0x3F)),
                @intCast(0x80 | (cp & 0x3F)),
            };
        } else {
            return &[_]u8{
                @intCast(0xF0 | (cp >> 18)),
                @intCast(0x80 | ((cp >> 12) & 0x3F)),
                @intCast(0x80 | ((cp >> 6) & 0x3F)),
                @intCast(0x80 | (cp & 0x3F)),
            };
        }
    }
}
