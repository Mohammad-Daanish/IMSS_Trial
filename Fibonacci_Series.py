" WAP for Fibonachi Series "
number = int(input("Enter a Number for finding Fibonacci: "))
n1,n2=0,1
sum=0
if number<0:
    print("It Should be greater than zero")
else:
    for i in range(0,number):
        print(sum,end='')
        n1=n2
        n2=sum
        sum=n1+n2
print("Thos is just for testing")
#123

