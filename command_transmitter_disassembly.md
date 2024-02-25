
# Strings found in the .so file

- My evil plan is finally complete! My robot will destroy everything! I gave out the command for deactivation, as well as the command transmitter, but the transmitter will change any commands to be shouted at the robot! And the robot ignores any commands that are shouted at it, because it only accepts commands from polite people! I left in 2 working command capitalization combinations so that I may deactivate the robot at some point, but nobody will ever figure either of them out! Mwahahahahaha!

- Note to self (the handsome Dr. Dastardly): remember not to compile the command transmitter in debug mode when you give it away, or else your variable names will be on full display! And fix that bad habit of using strings as documentation!

1. D Bugg Documentation: The scrambling is based on the formula: (n*13+7)mod16=result. The numbers 13 and 7 are crucial, so make sure nobody finds them out!
2. D Bugg Documentation: Do not let users try to trick the system! Away with all wrong-length commands!
3. D Bugg Documentation: This pays attention to both the value of a character and its capitalization. Twice the influences means twice the confusion! Very secure!


# Notes

- `%rbp` is a "snapshot" of the stack pointer (`%rsp`) that does not get updated when local variables are pushed on the stack,
    so local variables and functions are accessible from a constant offset from `%rbp`
- `%rbp - 0x18` is an address = 0x7ffff7fb8388 that points to the documentation string n°2
- `%rbp - 0x20` is malloc->strcpy of the function input: it is a copy of the password that will be modified by the function
- `%rbp - 0x24` is initialized to 0x7, and compared in the `<command_transmitter+278>` section of the function (cmpl -> jne)
- `%rbp - 0x28` is initialized to 0x0 and then set to the previous influence index at each loop (same as above, with one loop delay)
- `%rbp - 0x29` gets the value of the character at the influence-index position at some point
- `%rbp - 0x38` is the initial address to the function input: the password is constant

- The influence index is initialized to 7 and then is modified by applying (n*13+7)%16 each loop, so it is successively:
  7, 2, 1, 4, 11, 6, 5, 8, 15, 10, 9, 12, 3, 14, 13, 0

=> For each char in the input, we look at the character at the corresponding influence index position, and switch the case:
  + once if this char is uppercase
  + again if this char is even

- The command is `quietrobotplease`
  + the 0th char looks at the 7th (`b`) which is even and not uppercase, so its case get switched
  + then, the 7th char looks at the 2nd (`i`) which is odd, so no case switch
  + the 2nd looks at the 1st (`u`) which is odd, so no case switch
  + the 1st looks at the 4th (`t`) which is even, so case switch
  + ...

- In order for the first char to be lowercase, the 7th must be uppercase (because it's even)
  But then, the 7th must be switched, and because the 1st is odd, it must be lowercase

Solving code:
```python
influence_index = [0]
while len(influence_index) < 16:
    influence_index.append((influence_index[-1] * 13 + 7) % 16)

msg = list("quietrobotplease")

for i in range(15):
    ind = influence_index[i]
    inf = influence_index[i + 1]
    if (msg[ind].islower() and ord(msg[inf]) % 2 == 0) or (msg[ind].isupper() and ord(msg[inf]) % 2 == 1):
        msg[inf] = msg[inf].swapcase()

print("".join(msg))
```
