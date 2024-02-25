
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
    We can now execute `./main` in gcc and step into the `command_transmitter` function, the disassembly is in `command_transmitter_disassembly.asm` and notes are
    in `command_transmitter_disassembly.md`.
