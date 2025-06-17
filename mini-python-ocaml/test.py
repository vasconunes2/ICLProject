print([])
print(([1, 2, 3])[0])
print(([1, 2, [3, 4]])[2])
print(([1, 2, [3, 4], "hello"])[3])
print(([True, False, [3, 4], "hello", [None, 6]])[4])
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
# print(([1, 2] == [1, 2]) == True)
# print(([1, 2] == [2, 1]) == False)

# # None == None
# print((None == None) == True)

# # None == 0
# print((None == 0) == False)

# # None == ""
# print((None == "") == False)
