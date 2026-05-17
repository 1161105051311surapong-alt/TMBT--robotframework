"""Question 6: decrypt uppercase English text using a counterclockwise shift."""

import string


def simpleCipher(encrypted, k):
    """Decrypt encrypted text by shifting each uppercase letter backward by k."""
    alphabet = string.ascii_uppercase
    shift = k % len(alphabet)
    decrypted = []

    for character in encrypted:
        original_index = alphabet.index(character)
        decrypted.append(alphabet[(original_index - shift) % len(alphabet)])

    return "".join(decrypted)


if __name__ == "__main__":
    print(simpleCipher("VTAOG", 2))
