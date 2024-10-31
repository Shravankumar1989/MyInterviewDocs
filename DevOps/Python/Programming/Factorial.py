number = int(input("Please enter the number:\n"))
factorial_number = 1
if number < 0:
  print("Sorry, factorial does not exist for negative numbers")
elif number == 0:
  print(f"The factorial of {number} is 1")
else:
  for i in range(1, number+1):
    #factorial_number = factorial_number * i
    factorial_number *=  i
  print(f"{i} factorial is {factorial_number}")