def decode(roman: str) -> int:
    # Dictionary to map Roman numeral characters to their corresponding integer values
    roman_to_int = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }

    # Variable to store the total value of the Roman numeral
    total = 0
    
    # Variable to store the value of the previous Roman numeral character
    prev_value = 0

    # Iterate through each character in the Roman numeral string in reverse order
    for char in reversed(roman):
        
        # Get the integer value of the current Roman numeral character
        value = roman_to_int[char]
        
        # If the current value is less than the previous value, subtract it (for cases like IV, IX)
        print(f" {value} and  {prev_value}\n")

        if value < prev_value:
            
            print(f"if cond value - {value} and prev_value {prev_value}\n")

            total -= value
            
            print(f"if total - {total}\n")
        else:
            print("\n")
            
            print(f"else cond value - {value} and prev_value {prev_value}\n")

            # Otherwise, add the value to the total
            total += value
            
            print(f"else total - {total}\n")
        
        # Update prev_value to the current value for the next iteration
        prev_value = value
        
        print(f"prev_value - {prev_value}\n")
    # Return the total value, which is the decoded integer
    
    print(f"total - {total}\n")
    
    print(f"value - {value} and prev_value {prev_value}\n")
    
    return total

# Test cases to check if the decode function works correctly
print(decode("XXI"))      # -> 21
#print(decode("M"))        # -> 1000
#print(decode("MCMXC"))    # -> 1990
#print(decode("MMVIII"))   # -> 2008
#print(decode("MDCLXVI"))  # -> 1666