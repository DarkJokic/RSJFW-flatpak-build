#RSJFW-flatpak-build

#I AM NOT THE ORIGINAL OWNER, visit https://github.com/9nunya/RSJFW for more.

Makes RSJFW compatible with other distros. Tested for ubuntu.

Clone the directory to home.
You might need to register it with flatpak before being able to run it.

Run the fix_rsjfw.sh to patch inconsistencies between arch and ubuntu.

Using flatpak, do:

```bash
flatpak run com.github.nunya.RSJFW
```

If it refuses to open studio and is stuck on waiting for wine, just kill it and reopen, it needs to build prefix.

You might experience errors when you first enter, but just discard them, as they are fixed by the previous script.

Log into studio and enjoy!
