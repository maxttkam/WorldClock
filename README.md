# WorldClock

`WorldClock` is a Windows API program originally developed in 1995.

![Example](clocks.png)

## Features

- Displays multiple indepenent digital clocks.
- Supports both hour and minute timezone offsets
- Configuration persistence by saving clock config to INI file

## Timezone Format

Timezones are represented by an hour offset and an optional minute offset. The `GMT±H:MM` notation is used in the following documentation. Offset maybe positive of negative. Examples:

- `GMT+8:00` (Singapore Time)
- `GMT-10:00` (Hawaii-Aleutian Time Zone)

The program stores offsets as two values per clock in the INI file:

- `Clock%dName`: Clock Name (Max size defined as `CLOCK_NAME_SIZE` (Default: 32 chars))
- `Clock%dOffset`: Integer hours offset (-23..23)
- `Clock%dOffsetMinutes`: Integer minutes offset (0..59)

Example `WorldClock.ini` snippet:

```ini
[WindowData]
Layout=13
[ClockData]
NumClocks=2

; Clock 1 (GMT): GMT+0:00 (hours = 0, minutes = 0)
Clock1Name=GMT
Clock1Offset=0
Clock1OffsetMinutes=0

; Clock 2 (GMT): GMT+5:30 (hours = 5, minutes = 30)
Clock2Name=India
Clock2Offset=5
Clock2OffsetMinutes=30
```

## Building & Running

This repository includes a `Makefile` with support for both GCC and MSVC builds. While the original author (*N1KDO / Jeff Otterson*) likely used an MSVC-based toolchain, the compilation support is extended to GCC in the `Makefile`.

Available build targets:

- `make` - compiles with `gcc` using `windres` (for graphics resources `worldclock.rc`) to build `build/WorldClock.exe`.
- `make debug` - compiles with `gcc` and includes debug information.
- `make msvc` - builds with Microsoft tools (`cl` and `rc`) and links `user32.lib` and `gdi32.lib`.

After a successful build, run the executable from the `build` directory:

```sh
build\WorldClock.exe
```

## Limitations
- Program does not support automatic daylight saving time (DST) rules, offsets are static values per clock.



## Credits
Original author: *N1KDO / Jeff Otterson*

Fractional Timezone (and build support) by: *maxttkam / Max Kam*