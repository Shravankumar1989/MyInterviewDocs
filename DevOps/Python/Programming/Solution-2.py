even_number = 20
sum = 0

for number in range(1, even_number+1):
    if number % 2 == 0:
        sum += 1
print(f"sum of even numbers {sum}")