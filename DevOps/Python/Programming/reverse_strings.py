strings = input('enter the string :')
reverse_string = strings[::-1]

reverse_strings = ''
#print(reverse_string)

for string in strings:
    reverse_strings = string + reverse_strings
print(reverse_strings)