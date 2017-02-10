
fizzbuzz = ''

start = int(input("Start Value:"))
end = int(input("End Value:"))

for i in range(start,end+1):
    if i%3 == 0:
        fizzbuzz += "fizz"
    if i%5 == 0:
        fizzbuzz += "buzz"
    if i%3 != 0 and i%5 != 0:
        fizzbuzz += str(i)

    fizzbuzz += ' '

print(fizzbuzz)