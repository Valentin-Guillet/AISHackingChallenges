
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
