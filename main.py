# Made by Martyn van Dijke
# Student number 0887668
# Hamming coding excersie for the Tu/e course Telecommunication Systems


import math

#global variables that are used troughout this program
global Bit_stream, bit, Encode_stream
Encode_stream = []
k = 4


def isEven(number):
    return number % 2 == 0

def Start():
    print "Starting the Hamming coding application"
    Bit_stream = [0,1,1,0,1,0,1]




    #Bit_stream.append(bit)

    Encode(Bit_stream)

def Encode(Bit_stream):
    print "Going to encode a bit stream"
    for i in range(0, k):
        #first add the parity bits to an Encode_stream (list)
        if (i == 0):
            print "Coding first parity bit"
            count = Bit_stream[0] + Bit_stream[1] + Bit_stream[3] + Bit_stream[4] + Bit_stream[6]
            if isEven(count) == True:
                Encode_stream.insert(0,0)
            else :
                Encode_stream.insert(0,1)
            print  Encode_stream
        if (i == 1):
            print "Coding second parity bit"
            count = Bit_stream[0] + Bit_stream[2] + Bit_stream[3] + Bit_stream[5] + Bit_stream[6]
            if isEven(count) == True:
                Encode_stream.insert(1, 0)
            else:
                Encode_stream.insert(1, 1)
            print  Encode_stream
        if (i == 2):
            print "Coding third parity bit"
            count = Bit_stream[1] + Bit_stream[2] + Bit_stream[3]
            if isEven(count) == True:
                Encode_stream.insert(3, 0)
            else:
                Encode_stream.insert(3, 1)
            print  Encode_stream
        if (i == 3):
            print "Coding fourth parity bit"
            count = Bit_stream[4] + Bit_stream[5] + Bit_stream[6]
            if isEven(count) == True:
                Encode_stream.insert(7, 0)
            else:
                Encode_stream.insert(7, 1)
            print  Encode_stream

    #added all parity bits no add the bitstream data to the encoded list
    Encode_stream.insert(2,Bit_stream[0])
    Encode_stream.insert(4,Bit_stream[1])
    Encode_stream.insert(5,Bit_stream[2])
    Encode_stream.insert(6,Bit_stream[3])
    Encode_stream.insert(8,Bit_stream[4])
    Encode_stream.insert(9,Bit_stream[5])
    Encode_stream.insert(10,Bit_stream[6])

    # for j in range(0, len(Bit_stream)) :
    #
    #     if( isEven(math.pow(j,2)) == True):
    #
    #     print "j: %d" %j
    #     i = 3 + 2*j
    #     print "i: %d" %i
    #     print Bit_stream[j]
    #     Encode_stream.insert(i,Bit_stream[j])


    print Encode_stream

def Decode():
    print "Going to decode a bit stream"


Start()