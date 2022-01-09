'''
Created by : Fazlur Rahman Amin

#Part 3
#Soal algoritma 4 - appendAndDelete()
'''

#Input for Initial String
s = input() 

#Input for Desired String
t = input()

#Input for Number of Operation
k = int(input())

def appendAndDelete(s, t, k): 
    prefix = 0
    for c1, c2 in zip(s, t):
        if c1 == c2:
            prefix += 1
        else:
            break
    if k >= len(s) + len(t):
        return ("Yes")
    elif k >= len(s) + len(t) - 2 * prefix and k % 2 == (len(s) + len(t)) % 2:
        return ("Yes")
    else:
        return ("No")

print (appendAndDelete(s,t,k))
