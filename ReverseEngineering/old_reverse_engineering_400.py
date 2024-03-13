
from time import time


def generate_table(seed):
    table = [0] * 256
    for i in range(256):
        value = i
        for j in range(8):
            if value & 1 == 0:
                value = value >> 1
            else:
                value = value >> 1 ^ seed
        table[i] = value
    return table


def update(table, init_value, key, size):
    ans = 0xffffffff ^ init_value
    for i in range(size):
        ans = table[(key[i] ^ ans) & 0xff] ^ ans >> 8
    return 0xffffffff ^ ans


def update_uint32(table, init_value, value):
    key = [int(hex(value)[2:].zfill(8)[i : i + 2], 16) for i in range(0, 8, 2)]
    return update(table, init_value, key, 4)


def main():
    table = generate_table(0xedb88320)
    seed = int(time()) // 0x1e
    challenge_id = update_uint32(table, 0, seed * 0x1e)

    if challenge_id & 1 == 0:
        target = challenge_id // 0x337 + 0xf29ab3f7 ^ 0xe341c9d9
    else:
        target = challenge_id * 0x39b + 0x8a076da9 ^ 0x8b720af7
    target &= 0xffffffff

    print("Challenge id: ", hex(challenge_id)[2:])
    print("Key", hex(target)[2:])

if __name__ == "__main__":
    main()
