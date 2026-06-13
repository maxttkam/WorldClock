CC      = gcc
BUILD   = build

all: prepare
	windres worldclock.rc -o $(BUILD)/resource.o
	$(CC) wclock.c worldclock.c $(BUILD)/resource.o -o $(BUILD)/WorldClock.exe -lgdi32 -luser32 -mwindows -O2 -s

debug: prepare
	windres worldclock.rc -o $(BUILD)/resource.o
	$(CC) wclock.c worldclock.c $(BUILD)/resource.o -o $(BUILD)/WorldClock.exe -lgdi32 -luser32 -mwindows -g -O0

msvc: prepare
	rc /fo $(BUILD)/resource.res worldclock.rc
	cl wclock.c worldclock.c $(BUILD)/resource.res /Fe:$(BUILD)/WorldClock.exe /link user32.lib gdi32.lib

prepare:
	rm -rf $(BUILD)
	mkdir $(BUILD)

clean:
	rm -rf $(BUILD)
