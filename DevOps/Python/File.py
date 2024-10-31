

with open('demofile.txt', 'r') as file:
    lines = file.readlines()
    for line in lines[-3:]:
        print(line.strip())