
import itertools
import re
import string

KEY_BYTES = set(map(ord, string.ascii_letters + string.digits))
MSG_BYTES = set(map(ord, string.ascii_letters + " ,.:'?!()-%$;"))


def load_dict():
    with open("/usr/share/dict/words") as file:
        return set(file.read().strip().split())

def filter_words(word_dict, msg):
    matches = re.findall(r"\b\w+\b", msg)
    return all([word.lower() in word_dict for word in matches])

def get_possible_key_chars(data, offset):
    data = [data[i + offset] for i in range(0, len(data) - offset, 6)]
    possibilities = []
    for byte in KEY_BYTES:
        for d in data:
            if (byte ^ d) not in MSG_BYTES:
                break
        else:
            possibilities.append(byte)

    return possibilities

def xor_data(data, key):
    return "".join([chr(data[i] ^ key[i % len(key)]) for i in range(len(data))])

def main():
    with open("secret.txt") as file:
        data = file.read().strip()

    data = [int(data[i : i + 2], 16) for i in range(0, len(data), 2)]

    possible_chars = [get_possible_key_chars(data, i) for i in range(6)]
    word_dict = load_dict()
    for possible_key in itertools.product(*possible_chars):
        msg = xor_data(data, possible_key)
        if filter_words(word_dict, msg):
            print(msg, " -> key = ", "".join(map(chr, possible_key)))

if __name__ == "__main__":
    main()
