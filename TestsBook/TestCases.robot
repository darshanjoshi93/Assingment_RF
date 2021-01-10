*** Settings ***
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot


#robot -d results Tests/TestCases.robot  


*** Test Cases ***
User should be able to Land on Book details Page
    Open India Bookstore
    Navigate to Category "Childrens Books"
    Click on "Children" Sub Section
    Search for the book title 'The Magic Pudding' in the Booklist
    Go to Expected Book details page
    Verify User navigated to the expected book details
    
User should be able to Select The Shopping Platform
    Select The Shopping Platform
    Click On Add To Cart Button to book to the cart