from typing import List

def possibilities(word: str) -> List[str]:

    # Morse code mapping to letters
    morse_dict = {
        ".": "E", "-": "T",
        "..": "I", ".-": "A", "-.": "N", "--": "M",
        "...": "S", "..-": "U", ".-.": "R", ".--": "W",
        "-..": "D", "-.-": "K", "--.": "G", "---": "O"
    }

    # Helper function to generate possible signal combinations
    def generate_combinations(signal: str) -> List[str]:
        # Base case: if the signal is empty, return an empty combination
        if not signal:
            return ['']
        
        # Get the first character (current signal) and the rest
        first = signal[0]
        rest = signal[1:]
        
        # Recursive call to get combinations for the remaining part of the signal
        rest_combinations = generate_combinations(rest)
        
        if first == '?':
            # If the current signal is '?', it can be either '.' (dot) or '-' (dash)
            return [dot + comb for dot in ['.', '-'] for comb in rest_combinations]
        else:
            # Otherwise, keep the current signal and add it to each combination of the rest
            return [first + comb for comb in rest_combinations]

    # Generate all possible signal combinations from the input word
    all_combinations = generate_combinations(word)

    # Create a set to store unique letters from the generated combinations
    possible_letters = set()
    
    # For each combination, check if it exists in the Morse code dictionary
    for comb in all_combinations:
        if comb in morse_dict:
            # Add the corresponding letter to the set
            possible_letters.add(morse_dict[comb])
    
    # Sort the letters based on the order they appear in the morse_dict
    sorted_letters = sorted(possible_letters, key=lambda x: list(morse_dict.values()).index(x))
    
    return sorted_letters

# Example test cases
#print(possibilities("."))   # -> ["E"]
#print(possibilities("-"))   # -> ["T"]
#print(possibilities("-.") ) # -> ["N"]
#print(possibilities("...")) # -> ["S"]
#print(possibilities("..-")) # -> ["U"]
#print(possibilities("?"))   # -> ["E", "T"]
#print(possibilities(".?"))  # -> ["I", "A"]
print(possibilities("?-?"))  # -> ["R", "W", "G", "O"]
