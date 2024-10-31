fruits = ["apple", "banana", "cherry", "kiwi", "mango"]
newlist = []
for x in fruits:
  if "a" in x:
    newlist.append(x)
print(newlist)


# [expression for item in iterable]
newlist1 = [ x for x in fruits]
print(newlist1)