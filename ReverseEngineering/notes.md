
- `0x4041b6`: output of `atoi` ?
- Important function: `0x404080`
- Does he check for debugger by reading `/proc/self/status` ? [cf. TracerPid attribute](https://stackoverflow.com/questions/3596781/how-to-detect-if-the-current-process-is-being-run-by-gdb)
- Break at `0x404539`: check for `TracerPid`

