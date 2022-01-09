'''
Created by : Fazlur Rahman Amin

#Part 3
#Soal algoritma 1 - birthdayCakeCandles()
'''


#getuser input for candle height
get_input = input() 

#get user input for list of candles height separated by space
candles_input = input() 

#splitting userinput into array
candles = candles_input.split()

#Function birthdayCakeCandles()
def birthdayCakeCandles (x):
    maxHeight = x
    counter = int(maxHeight)
    res = 0
    while counter != 0:
        if candles.count(str(counter)) > 0:
            res = candles.count(str(counter))
            break
        counter -= 1
    return int(res)

#print the output with count of tallest candle
print(birthdayCakeCandles (get_input))
