def palindrom_or_not(string):
    if string == string[::-1]:
        return f"Yes, {string} is a Palindrome string."
    else:
        return f"No, {string} is not a Palindrome string."

string = input("Please Enter the string: \n")
result = palindrom_or_not(string)
print(result)