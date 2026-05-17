"""Question 1: find duplicate items from list A and list B."""


def find_duplicate_items(list_a, list_b):
    """Return items that exist in both lists, preserving list_a order."""
    list_b_values = set(list_b)
    return [item for item in list_a if item in list_b_values]


if __name__ == "__main__":
    list_a = [1, 2, 3, 5, 6, 8, 9]
    list_b = [3, 2, 1, 5, 6, 0]

    duplicate_items = find_duplicate_items(list_a, list_b)
    print(f"Duplicate items: {duplicate_items}")
