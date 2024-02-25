
# Client-side Protections

- 10 points: button is `disabled`, remove this and click the button
- 15 points: the API is available through `ButtonClicker_{}` properties, such as `ButtonClicker_num_clicks` that we can modify directly
- 25 points: get the input element and set its value directly: `document.getElementById(...).value = {flag}`
- 50 points: the `paid` flag is included in the payload of the request, so copy/edit/resend the request in order to set `paid = true`


# Programming

- 15 points: cf. js file
- 75 points: after pressing the submit button enough times, a debug message with a random seed appears, we can then regenerate the OTP using python `random.randint()` function
- 150 points: cf. js file
- 250 points: cf. js file


# Networking

- 15 points: no need for wireshark, the password is written somewhere without encryption, so just `strings http-auth.cap | grep 'pass'`
- 30 points: use `aircrack-ng` with `rockyou.txt` word list: password found in a few seconds


# Reverse Engineering

- 25 points:
    By using `strings`, we can find "%11s" right after "Enter the password:" as in a scanf call, so it seems that the password is 11 characters long.
    However, no obvious 11 chars password appears when using `strings`.
    As the binary is statically linked, we can't use `ltrace`.
    So I used `gdb`: when stepping in the main function, we can find the `scanf` call and the password loading before calling a `strncmp`-type function.
    We can then get its address and print it.

- 50 points:
    We're given a shared library object. Using `strings` reveals hints about how to stop the robot, more specifically with a math formula.
    Then, `nm -D command-transmitter.so` allows us to see that it defines a function called `command_transmitter`.
    We can create a C file that calls that function (cf. `reverse_engineering_50.c`) that we compile with debug symbols and we give it the path to the shared library:
    `gcc -o main reverse_engineering_50.c command-transmitter.so -Wl,rpath=$(pwd)` (i.e. we add curr directory to the linker run-time search path)
    We can now execute `./main` in gcc and step into the `command_transmitter` function, the disassembly is in `reverse_engineering_50.asm` and notes are
    in `reverse_engineering_50.md`.

- 100 points:
    The executable seems to generate random sentences finishing with the name of a US President. `strings` reveals that the executable can take a `--debug` flag
    that makes it print the MAC address of the computer and the seed of the RNG, and a `--set-seed` flag to set this seed.
    In the disassembly, we can find a `getFlag` function that checks that the MAC address of the computer is `de:ad:be:ef:fa:ce`.
    Setting the MAC address to this and checking the output of the `getFlag` function then gives us the flag.

- 250 points:
    The executable has a function that checks if it is run in a debugger and crash, but we can set the value of the result of the comparison and avoid this.
    By reading the disassembly of the `phase_unlock` function, we can find the password of the 1st phase in memory.
    Then, reading the `phase_disarm` function reveals that the timer must be stopped using a STP signal (i.e. `C-z`).
    Then the next password is a number sequence that is read using `scanf("%d %d %d %d %d %d %d")`.
    The answer sequence called `wire_cut_sequence` can be found in memory (cf. `reverse_engineering_250.asm`) but is not the direct answer,
    we must find the sequence that "sorts" the given wire cut sequence, i.e. the indices of increasing numbers in the wire cut sequence.
    Then, reading the `phase_reverse` function reveals also a `scanf("%d %d %d")` input, and the check is simply that the sum of the three chars must be 0xffffffff.
    Finally, reading the `phase_disposal` function reveals that we can control the value of the check_light and disposal_mode variables using a simple form of
    buffer overflow. In order to defuse the bomb, the input is compared to a password in memory, and the check_light and disposal_mode variables are also checked.
    Once everything is set, this gives the complete password.
