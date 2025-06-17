x = [0,1,"1",False,True,None,[],[1,2,3]]
y = [0,1,"1",False,True,None,[],[1,2,3]]
print(1==0)
# == tests
x00 = x[0] == y[0]
x01 = x[0] == y[1]
x02 = x[0] == y[2]
x03 = x[0] == y[3]
x04 = x[0] == y[4]
x05 = x[0] == y[5]
x06 = x[0] == y[6]
x07 = x[0] == y[7]
x10 = x[1] == y[0]
x11 = x[1] == y[1]
x12 = x[1] == y[2]
x13 = x[1] == y[3]
x14 = x[1] == y[4]
x15 = x[1] == y[5]
x16 = x[1] == y[6]
x17 = x[1] == y[7]
x20 = x[2] == y[0]
x21 = x[2] == y[1]
x22 = x[2] == y[2]
x23 = x[2] == y[3]
x24 = x[2] == y[4]
x25 = x[2] == y[5]
x26 = x[2] == y[6]
x27 = x[2] == y[7]
x30 = x[3] == y[0]
x31 = x[3] == y[1]
x32 = x[3] == y[2]
x33 = x[3] == y[3]
x34 = x[3] == y[4]
x35 = x[3] == y[5]
x36 = x[3] == y[6]
x37 = x[3] == y[7]
x40 = x[4] == y[0]
x41 = x[4] == y[1]
x42 = x[4] == y[2]
x43 = x[4] == y[3]
x44 = x[4] == y[4]
x45 = x[4] == y[5]
x46 = x[4] == y[6]
x47 = x[4] == y[7]
x50 = x[5] == y[0]
x51 = x[5] == y[1]
x52 = x[5] == y[2]
x53 = x[5] == y[3]
x54 = x[5] == y[4]
x55 = x[5] == y[5]
x56 = x[5] == y[6]
x57 = x[5] == y[7]
x60 = x[6] == y[0]
x61 = x[6] == y[1]
x62 = x[6] == y[2]
x63 = x[6] == y[3]
x64 = x[6] == y[4]
x65 = x[6] == y[5]
x66 = x[6] == y[6]
x67 = x[6] == y[7]
x70 = x[7] == y[0]
x71 = x[7] == y[1]
x72 = x[7] == y[2]
x73 = x[7] == y[3]
x74 = x[7] == y[4]
x75 = x[7] == y[5]
x76 = x[7] == y[6]
x77 = x[7] == y[7]
list_of_x = [x00,x01,x02,x03,x04,x05,x06,x07,x10,x11,x12,x13,x14,x15,x16,x17,x20,x21,x22,x23,x24,x25,x26,x27,x30,x31,x32,x33,x34,x35,x36,x37,x40,x41,x42,x43,x44,x45,x46,x47,x50,x51,x52,x53,x54,x55,x56,x57,x60,x61,x62,x63,x64,x65,x66,x67,x70,x71,x72,x73,x74,x75,x76,x77]
print(list_of_x)
expected = [True,False,False,True,False,False,False,False,False,True,False,False,True,False,False,False,False,False,True,False,False,False,False,False,True,False,False,True,False,False,False,False,False,True,False,False,True,False,False,False,False,False,False,False,False,True,False,False,False,False,False,False,False,False,True,False,False,False,False,False,False,False,False,True]
print(x00 == expected[0])
print(x01 == expected[1])
print(x02 == expected[2])
print(x03 == expected[3])
print(x04 == expected[4])
print(x05 == expected[5])
print(x06 == expected[6])
print(x07 == expected[7])
print(x10 == expected[8])
print(x11 == expected[9])
print(x12 == expected[10])
print(x13 == expected[11])
print(x14 == expected[12])
print(x15 == expected[13])
print(x16 == expected[14])
print(x17 == expected[15])
print(x20 == expected[16])
print(x21 == expected[17])
print(x22 == expected[18])
print(x23 == expected[19])
print(x24 == expected[20])
print(x25 == expected[21])
print(x26 == expected[22])
print(x27 == expected[23])
print(x30 == expected[24])
print(x31 == expected[25])
print(x32 == expected[26])
print(x33 == expected[27])
print(x34 == expected[28])
print(x35 == expected[29])
print(x36 == expected[30])
print(x37 == expected[31])
print(x40 == expected[32])
print(x41 == expected[33])
print(x42 == expected[34])
print(x43 == expected[35])
print(x44 == expected[36])
print(x45 == expected[37])
print(x46 == expected[38])
print(x47 == expected[39])
print(x50 == expected[40])
print(x51 == expected[41])
print(x52 == expected[42])
print(x53 == expected[43])
print(x54 == expected[44])
print(x55 == expected[45])
print(x56 == expected[46])
print(x57 == expected[47])
print(x60 == expected[48])
print(x61 == expected[49])
print(x62 == expected[50])
print(x63 == expected[51])
print(x64 == expected[52])
print(x65 == expected[53])
print(x66 == expected[54])
print(x67 == expected[55])
print(x70 == expected[56])
print(x71 == expected[57])
print(x72 == expected[58])
print(x73 == expected[59])
print(x74 == expected[60])
print(x75 == expected[61])
print(x76 == expected[62])
print(x77 == expected[63])
# print(x[0] == y[0])












# x = 42
# print(x)
# for x in [1,2,3]:
#     print(x)
# print(x)

# row = [1,2,3]
# badmatrix = [row,row,row]
# print(badmatrix)
# badmatrix[1][1] = 42
# print(badmatrix)

# row = [1,2,3]
# badmatrix = [row,row,row]
# print(badmatrix)
# badmatrix[1][1] = 42
# print(badmatrix)

# print([])
# print(([1,2,3])[0])
# print(([1,2,[3,4]])[2])
# print(([1,2,[3,4],"hello"])[3])
# print(([True,False,[3,4],"hello",[None,6]])[4])
# # test for int:
# # equal test for int
# print("1")
# x = 1 == 1
# print(x == True)
# print("2")
# x = 5 == 3
# print(x == False)
# print("3")
# x = -1 == -1
# print(x == True)
# print("4")
# x = 0 == 0
# print(x == True)
# print("5")
# x = 100 == -100
# print(x == False)

# # not equal test for int
# print("6")
# x = 1 != 1
# print(x == False)
# print("7")
# x = 5 != 3
# print(x == True)
# print("8")
# x = -1 != -1
# print(x == False)
# print("9")
# x = 0 != 0
# print(x == False)
# print("10")
# x = 100 != -100
# print(x == True)

# # less than test for int
# print("11")
# x = 1 < 2
# print(x == True)
# print("12")
# x = -5 < -3
# print(x == True)
# print("13")
# x = 0 < 1
# print(x == True)
# print("14")
# x = -1 < 0
# print(x == True)
# print("15")
# x = 100 < 200
# print(x == True)

# # less than or equal test for int
# print("16")
# x = 1 <= 1
# print(x == True)
# print("17")
# x = -5 <= -3
# print(x == True)
# print("18")
# x = 0 <= 0
# print(x == True)
# print("19")
# x = -1 <= 0
# print(x == True)
# print("20")
# x = 100 <= 100
# print(x == True)

# # greater than test for int
# print("21")
# x = 2 > 1
# print(x == True)
# print("22")
# x = -3 > -5
# print(x == True)
# print("23")
# x = 1 > 0
# print(x == True)
# print("24")
# x = 0 > -1
# print(x == True)
# print("25")
# x = 200 > 100
# print(x == True)

# # greater than or equal test for int
# print("26")
# x = 2 >= 1
# print(x == True)
# print("27")
# x = -3 >= -5
# print(x == True)
# print("28")
# x = 0 >= 0
# print(x == True)
# print("29")
# x = 0 >= -1
# print(x == True)
# print("30")
# x = 100 >= 100
# print(x == True)
# # # equal test for string
# # print("1")
# # x = "1" == "1"
# # print(x == True)
# # print("2")
# # x = "abc" == "def"
# # print(x == False)
# # print("3")
# # x = "hello" == "hello"
# # print(x == True)
# # print("4")
# # x = "" == "" # error case
# # print(x == True)
# # print("5")
# # x = "Python" == "python"
# # print(x == False)

# # # not equal test for string
# # print("6")
# # x = "1" != "1" # error case
# # print(x == False)
# # print("7")
# # x = "abc" != "def"
# # print(x == True)
# # print("8")
# # x = "hello" != "hello"
# # print(x == False)
# # print("9")
# # x = "" != ""
# # print(x == False)
# # print("10")
# # x = "Python" != "python"
# # print(x == True)

# # # less than test for string
# # print("11")
# # x = "1" < "2"
# # print(x == True)
# # print("12")
# # x = "abc" < "def"
# # print(x == True)
# # print("13")
# # x = "hello" < "world"
# # print(x == True)
# # print("14")
# # x = "" < "a"
# # print(x == True)
# # print("15")
# # x = "Python" < "python"
# # print(x == True)

# # # less than or equal test for string
# # print("16")
# # x = "1" <= "1"
# # print(x == True)
# # print("17")
# # x = "abc" <= "def"
# # print(x == True)
# # print("18")
# # x = "hello" <= "hello"
# # print(x == True)
# # print("19")
# # x = "" <= ""
# # print(x == True)
# # print("20")
# # x = "Python" <= "python"
# # print(x == True)

# # # greater than test for string
# # print("21")
# # x = "2" > "1"
# # print(x == True)
# # print("22")
# # x = "def" > "abc"
# # print(x == True)
# # print("23")
# # x = "world" > "hello"
# # print(x == True)
# # print("24")
# # x = "a" > ""
# # print(x == True)
# # print("25")
# # x = "python" > "Python"
# # print(x == True)

# # # greater than or equal test for string
# # print("26")
# # x = "2" >= "1"
# # print(x == True)
# # print("27")
# # x = "def" >= "abc"
# # print(x == True)
# # print("28")
# # x = "world" >= "hello"
# # print(x == True)
# # print("29")
# # x = "a" >= ""
# # print(x == True)
# # print("30")
# # x = "python" >= "Python"
# # print(x == True)
# == tests for different types

# # int == int
# print((1 == 1) == True)
# print((1 == 2) == False)

# # str == str
# print(("abc" == "abc") == True)
# print(("abc" == "def") == False)

# # bool == bool
# print((True == True) == True)
# print((True == False) == False)

# # int == bool
# print((1 == True) == True)
# print((0 == False) == True)
# print((2 == True) == False)

# # bool == int
# print((True == 1) == True)
# print((False == 0) == True)
# print((False == 2) == False)


# # str == int
# print(("1" == 1) == False)
# print(("0" == 0) == False)

# # int == str
# print((1 == "1") == False)
# print((0 == "0") == False)

# # str == bool
# print(("True" == True) == False)
# print(("False" == False) == False)

# # bool == str
# print((True == "True") == False)
# print((False == "False") == False)

# # list == list
# print(([1,2] == [1,2]) == True)
# print(([1,2] == [2,1]) == False)

# # None == None
# print((None == None) == True)

# # None == 0
# print((None == 0) == False)

# # None == ""
# print((None == "") == False)
