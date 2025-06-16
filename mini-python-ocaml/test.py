# equal test for string
print("1")
x = "1" == "1"
print(x == True)
print("2")
x = "abc" == "def"
print(x == False)
print("3")
x = "hello" == "hello"
print(x == True)
print("4")
x = "" == "" # error case
print(x == True)
print("5")
x = "Python" == "python"
print(x == False)

# not equal test for string
print("6")
x = "1" != "1" # error case
print(x == False)
print("7")
x = "abc" != "def"
print(x == True)
print("8")
x = "hello" != "hello"
print(x == False)
print("9")
x = "" != ""
print(x == False)
print("10")
x = "Python" != "python"
print(x == True)

# less than test for string
print("11")
x = "1" < "2"
print(x == True)
print("12")
x = "abc" < "def"
print(x == True)
print("13")
x = "hello" < "world"
print(x == True)
print("14")
x = "" < "a"
print(x == True)
print("15")
x = "Python" < "python"
print(x == True)

# less than or equal test for string
print("16")
x = "1" <= "1"
print(x == True)
print("17")
x = "abc" <= "def"
print(x == True)
print("18")
x = "hello" <= "hello"
print(x == True)
print("19")
x = "" <= ""
print(x == True)
print("20")
x = "Python" <= "python"
print(x == True)

# greater than test for string
print("21")
x = "2" > "1"
print(x == True)
print("22")
x = "def" > "abc"
print(x == True)
print("23")
x = "world" > "hello"
print(x == True)
print("24")
x = "a" > ""
print(x == True)
print("25")
x = "python" > "Python"
print(x == True)

# greater than or equal test for string
print("26")
x = "2" >= "1"
print(x == True)
print("27")
x = "def" >= "abc"
print(x == True)
print("28")
x = "world" >= "hello"
print(x == True)
print("29")
x = "a" >= ""
print(x == True)
print("30")
x = "python" >= "Python"
print(x == True)