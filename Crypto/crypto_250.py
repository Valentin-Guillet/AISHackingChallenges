
def decrypt(data):
    decrypted_data = []
    for char in data:
        if char > 0x80:
            new_char = 0xff & (char + 0x7f)
        elif char < 0x7f:
            new_char = 0xff & (char - 0x7f)
        else:
            new_char = char

        decrypted_data.append(new_char)
    return bytes(decrypted_data[::-1])

def main():
    with open("important_company_data_backup.zip.ransomed", "rb") as file:
        data = file.read()

    decrypted_data = decrypt(data)
    print(" ".join(map(lambda n: hex(n)[2:].zfill(2), decrypted_data[-50:])))
    with open("important_company_data_backup.zip", "wb") as file:
        file.write(decrypted_data)

if __name__ == "__main__":
    main()
