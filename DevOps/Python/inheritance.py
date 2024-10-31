class Animal:

    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("Subclass must implement abstract method")
    
class dog(Animal):

    def speak(self):
        return F"{self.name} says woof woof"
    
class cat(Animal):

    def speak(self):
        return F"{self.name} says meow mewo"
    

Dog = dog("dog")
Cat = cat("cat")

print(Dog.speak())
print(Cat.speak())