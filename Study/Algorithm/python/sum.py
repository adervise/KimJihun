###
def sum_n(n):
    s = 0
    for i in range (1, n+1):
        s = s + i
    return s

print("sum_n",sum_n(10))

###
def sum_x(n):
    return n * (n+1)//2

print("sum_x",sum_x(100))

###
def sum_n(n):
    s = 0
    for i in range (1, n+1):
        s = s + i
    return s

print("sum_n",sum_n(10))

####
def sum_y(n):
    return n * (n+1) * (2*n+1)//6

print(sum_y(17))

###
def sum_m(n):
    s = 0
    for i in range (1, n+1):
        s = s + i*i
    return s

print("sum_m",sum_m(17))
