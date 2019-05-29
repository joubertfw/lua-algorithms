--[[Lua's Observations:]]--

--[[
    ---------------------------------------------------------------------------------------------------
    - Lua code don't need separator between commands, but we can use semicolon
    - Lua consider both zero and empty string as true in conditional tests
    - Lua has no integer type, but can represent any 32-bit integer without rouding problems
    - Lua has many numeric valid constants: 4   0.4   4.57e-3   0.3e12    5e+20
    ---------------------------------------------------------------------------------------------------
    - Lua can store any binary data into strings
    - Lua's strings are immutable values, you cannot change a character inside a string as in C (String example)
    - Lua provides automatic conversions between numbers and strings at run time (String example)
    - The .. is the string concatenation operator in Lua
    - To convert a string to a number explicitly, use the function tonumber, returns nil if the string isn't a number
    - Don't rely on automatic conversions 
    - To convert a number to a string, use function tostring, or concatenate the number with the empty string
    - To get the length of a string, use the prefix '#'
    ---------------------------------------------------------------------------------------------------
    - Lua has a type called table that implements associative arrays
    - An associative array is an array that can be indexed with numbers, strings and any other value of Lua (not nil)
    - io.read, mean “the read function from the io module”. For Lua, means “index the table io using the string “read” as the key”
    - Do not confuse a.x with a[x], a.x == a["x"] and a[x] == a indexed by the value of the variable x (table index example)
    - Lua's customary is to start array with 1
    - Lua's length for table is tricky, use only with array-like tables
    ---------------------------------------------------------------------------------------------------
    - Functions in lua as first-class values 
    - Functions can pass as arguments, store in variables and returned as result
    - A program may can redefine a function or erase to create a secure environment
    - Lua can call functions written in Lua and functions written in C
    ---------------------------------------------------------------------------------------------------
    - Userdata type allows arbritrary C data to be stored in Lua variables
    - It has no predefined operations in Lua, except assignment and equality test
    - Lua compares tables, userdata, and functions by reference
    - Both 'and' and 'or' use short-cut evaluation, they evaluate their second operand only when necessary

]]--

---------------------------------------------------------------------------------------------------
--[[
--String example--

-- String attribution
    a = "one string"
    b = string.gsub(a, "one", "another") -- change string parts
    c = [==[
        need to remove '=='
        and this
        become a string
        good to write piece of codes
        ]==]

    print(a) --> one string
    print(b) --> another string 

--String conversion
    print("10" + 1) --> 11
    print("10 + 1") --> 10 + 1
    print("-5.3e-10"*"2") --> -1.06e-09
    print("hello" + 1) -- ERROR (cannot convert "hello")

    -- String length
    a = "hello"
    print(#a) --> 5
    print(#"good\0bye") --> 8
]]--

---------------------------------------------------------------------------------------------------

--[[
--Function example (fatorial)--

    function fact (n)
        if n == 0 then
            return 1        
        else
            return n * fact(n-1)
        end
    end

    print("enter a number: ")
    a = io.read("*number")
    print(fact(a))
]]--

---------------------------------------------------------------------------------------------------

--[[
--Table example --

-- Table attribution
    a = {} -- create a table and store its reference in ’a’
    k = "x"
    a[k] = 10 -- new entry, with key="x" and value=10
    a[20] = "great" -- new entry, with key=20 and value="great"

    print(a["x"]) --> 10

    k = 20

    print(a[k]) --> "great"

    a["x"] = a["x"] + 1 -- increments entry "x"    
    print(a["x"]) --> 11

-- Table as pointer example
    a = {}
    a["x"] = 10
    b = a -- ’b’ refers to the same table as ’a’
    print(b["x"]) --> 10
    b["x"] = 20
    print(a["x"]) --> 20
    a = nil -- only ’b’ still refers to the table
    b = nil -- no references left to the table

-- Table notation example
    a = {}
    a.x = 10 -- same as a["x"] = 10
    print(a.x) -- same as print(a["x"])
    print(a.y) -- same as print(a["y"])

-- Table index example
    a = {}
    x = "y"
    a[x] = 10 -- put 10 in field "y"
    print(a[x]) --> 10 -- value of field "y"
    print(a.x) --> nil -- value of field "x" (undefined)
    print(a.y) --> 10 -- value of field "y"


-- Table length example
    a = {}
    a[1] = 2
    a[2] = 4

    for i=1, #a do
        print(a[i])
    end

    a = {}
    a["x"] = 1
    print(#a) 

]]--

--[[
    -- Expressions --

-- Modulo example with float
    x = math.pi
    print(x - x%0.01) --> 3.14

-- Logical operators

    print(4 and 5) --> 5
    print(nil and 13) --> nil
    print(false and 13) --> false
    print(4 or 5) --> 4
    print(false or 5) --> 5

]]--   

i = 2
do
    local i = 0;
    print(i)
end

print(i)
