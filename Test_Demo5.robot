*** Settings ***
Library        Collections
Library        String



*** Test Cases ***

Working with for loop
    For Loop example 1 using numbers
    For Loop example 2 using numbers
    For Loop example using list using numbers
    For Loop using string

*** Keywords ***

# Using Range Method 1- 10:
For Loop example 1 using numbers
    FOR    ${i}    IN RANGE    1    10
        Log To Console    ${i}
    END

# Output: 2 3 4 5 6 7 8 9 ("Numbers will be printed in every new line")

For Loop example 2 using numbers
    FOR    ${i}    IN    1  2  3  4  5 6 7 8
        Log To Console    ${i}
    END

# 1 space between numbers it will printed in same line
# 2 spaces between numbers it will be printed in different lines

# Creating for loop with list
For Loop example using list using numbers
    @{items}=    Create List    1    2    3    4    5
    FOR    ${index}    IN    ${items}
        Log To Console    ${index}
    END

For Loop using string
    @{listofstring}=    Create List    1    2    3    4    5
    FOR    ${string}    IN    ${listofstring}
        Log To Console   ${string}
        Exit For Loop If    ${string}==3
    END