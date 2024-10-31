class Person:
    def __init__(self, name, age):
        # Constructor initializes name and age attributes
        self.name = name
        self.age = age

# Creating an object of the Person class
p1 = Person("John", 25)

# Accessing attributes
print(p1.name)  # Output: John
print(p1.age)   # Output: 25