print("hello")



a=3
print(a)

print("a is",a)

a = 10
if a % 2 == 0:
    print(a)
    print("짝수")
print("-----종료------")

for x in range(5): print("!!!",x)

for x in range(1,11): print("@@@",x)


a = [2,4,6]
for x in a: print("$$$",x)

for x in range(5):
    print("반복",x)

#test
i = 1
while i <= 10:
    print("%%%",i)
    i += 1

i = 1
while True:
    print("^^^",i)
    if i == 10: break
    i += 1

def hello(): #heelo() 함수를 정의
    print("def hello")

hello()
hello()

def square(a):
    return a * a

b = square(4)
print(b)

print("!!!!!!!!!!!!!!!!!!")

import turtle as t

def spiral(sp_len):
    if sp_len <= 5:
        return
    t.forward(sp_len)
    t.right(90)
    spiral(sp_len - 5)

    t.speed(0)
    spiral(200)
    t.hideturtle()
    t.done()


