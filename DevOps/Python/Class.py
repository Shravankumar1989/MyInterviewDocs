class name:    
    
    def __init__(self, firstname, lastname):
        self.firstname = firstname
        self.lastname  = lastname
        
    def whatisyourguruname(self):
        print(f"My Guruname is {self.firstname} {self.lastname}")

newobject1 = name("Jai", "Sadanand Baba")
newobject1.whatisyourguruname()

newobject2 = name("Jai", "Hanuman")
newobject2.whatisyourguruname()


listOfWords = ['this','is','a','list','of','words']
items = [ word[0] for word in listOfWords ]
print(items)