def first_non_repeating_character(s):
    # Step 1: Count the occurrences of each character
    char_count = {}
    for char in s:
        if char in char_count:
            char_count[char] += 1
        else:
            char_count[char] = 1
    
    # Step 2: Find the first non-repeating character
    for char in s:
        if char_count[char] == 1:
            return char
    return None

# Example usage
Str = "aabbcccdeeffghi"
result = first_non_repeating_character(Str)
print(result)  # Output should be 'd'