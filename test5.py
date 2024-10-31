def decode(roman: str) -> int:
    # Mapping of Roman numerals to their integer values
    roman_to_int = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }

    total = 0
    prev_value = 0

    # Iterate through each character in the Roman numeral string in reverse
    for char in reversed(roman):
        #print(char)
        value = roman_to_int[char]
        # If the current value is less than the previous value, subtract it
        if value < prev_value:
            total -= value
        else:
            total += value
        # Update the previous value to the current value
        prev_value = value
    
    return total

# Test cases
print(decode("XXI"))      # -> 21
print(decode("M"))        # -> 1000
print(decode("MCMXC"))    # -> 1990
print(decode("MMVIII"))    # -> 2008
print(decode("MDCLXVI"))  # -> 1666