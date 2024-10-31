global_variable = "global_variable"

def global_variable_function():
    global_variable = "global_variable 1"
    print(global_variable)

global_variable_function()
print(global_variable)



name = "Shravankumar Patil"
def global_variable_function_1():
    global name
    name = "Shravankumar"
    print(name)
global_variable_function_1()
print(name)