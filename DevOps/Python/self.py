class Person:
    def __init__(self, name, age):
        self.name = name  # self refers to the current instance of the class
        self.age = age

    def greet(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

p1 = Person("Alice", 30)
print(p1.greet())  # Output: Hello, my name is Alice and I am 30 years old.
