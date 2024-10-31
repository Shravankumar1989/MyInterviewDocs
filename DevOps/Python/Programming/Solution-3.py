table_number = int(input("Please enter the number"))

for number in range(1, 11):
    if number == 5:
        continue
    #print("table_number X {number} = {table_number} * {number}")
    print(table_number, 'x', number, '=', table_number * number)