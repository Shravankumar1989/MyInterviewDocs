class myclass:
    def __init__(self, name, age):
        self.name = name
        self.age = age

p = myclass("Shravankumar", 36)


class secondclass:
    def __init__(self, name1,age1):
        self.name = name1
        self.age  = age1

sc = secondclass("JaiBaba", 100)

class practice:
    def whatisyournamefun(self, whatisyourname):
        return whatisyourname
    def whatisyouragefun(self, whatisyourage):
        return whatisyourage
myfun = practice()
print(myfun.whatisyournamefun("shravan"))
print(myfun.whatisyouragefun(36))


class practice1:
    @staticmethod
    def whatisyournamefun1(whatisyourname):
        return whatisyourname
    @staticmethod
    def whatisyouragefun1(whatisyourage):
        return whatisyourage
myfun = practice1()
print(myfun.whatisyournamefun1("shravan"))
print(myfun.whatisyouragefun1(36))


