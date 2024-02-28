
import wave

import numpy as np


def count_periods(data):
    is_positive = False
    count = 0
    for x in data:
        if not is_positive and x > 0:
            is_positive = True
            count += 1
        elif is_positive and x < 0:
            is_positive = False
    return count

def main():
    audio_file = wave.open("flagged-waveform")
    samples = audio_file.getnframes()
    audio = np.frombuffer(audio_file.readframes(samples), dtype=np.int16)

    nb_notes = 11
    note_data = np.split(audio, nb_notes)
    msg = ""
    for data in note_data:
        msg += chr(count_periods(data))
    print(msg)


if __name__ == "__main__":
    main()
