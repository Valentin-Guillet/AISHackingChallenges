
import numpy as np
from PIL import Image


def main():
    img = np.array(Image.open("FlagTime.bmp"))

    # Pixels are stored bottom-up -> flip axis 0
    # Pixels are stored BGR -> flip axis 2 to get RGB
    img = np.flip(img, (0, 2))

    lsb = img & 1
    fake_bmp = np.packbits(lsb, bitorder="big")

    # Remove first false header
    real_bmp = fake_bmp[54:]
    real_bmp.tofile("ans.bmp")


if __name__ == "__main__":
    main()
