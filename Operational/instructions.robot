*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot

*** Keywords ***
Open India Bookstore
    Open Browser  ${url_books}  ${brows}   
    Maximize Browser Window
    sleep  4s
    Verify WebPage title  ${Expected_homePage}
    Execute Javascript  window.scrollTo(0, 500)
    Log to Console  Step1

Navigate to Category "Childrens Books"
    ${category_count} =  Get Element Count  xpath=//*[@id="leftNavContainer"]/ul/li
    #Log to Console  ${category_count}
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${category_count}
        ${dynamic_categ_name} =  Get Text  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        #Log to Console  ${dynamic_categ_name}
        Exit For Loop If  "${dynamic_categ_name}" == "${Expected_category}"
    END
    Set Test Variable  ${static_categ_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Step2
    

Click on "Children" Sub Section
    Mouse Over  ${static_categ_name}
    sleep  1s
    Mouse Over  ${Child_Category}
    sleep  3s
    Verify WebPage title  Age 6 months -5 yrs
    Click Element  ${Child_Category}
    sleep  1s
    Verify WebPage title  ${Expected_Book_Category}
    Log to Console  Step3


Search for the book title 'The Magic Pudding' in the Booklist
    ${buk_list} =  Get Element Count  xpath=//div[@class='col-md-9']/div
    #Log to Console  ${buk_list}
    FOR  ${j}  IN RANGE  2  ${buk_list}
    ${buk_names} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    #Log to Console  ${buk_names}
    Exit For Loop If  "${buk_names}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${exact_buk_elem}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Log to Console  Step4

Go to Expected Book details page
    sleep  5s
    Click Element  ${exact_buk_elem}
    Log to Console  Step5
    
Verify User navigated to the expected book details
    Verify WebPage title  ${Expected_Book_Detailed_Name}
    Log to Console  Step6

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  ${title_name}

Select The Shopping Platform
    Click Element  xpath=//a[contains(@title,'Amazon')]
    Select Window  ${Expected_Site_Name}
    Verify WebPage title  ${Expected_Site_Name}
    Log to Console  Step7

Click On Add To Cart Button to book to the cart
    Click Element  class=a-button-input
    Log to Console  Step8
    Log to Console  Complete