list1 = [10, 20, 4, 45, 99]

#First Approach
print("Largest element is:", max(list1))

#Second Approach
list1.sort()
print("Largest element is:", list1[-1])

#Third Approach
largest_number = 0
for list in list1:
  if list > largest_number:
    largest_number = list
print("Largest element is:", largest_number)