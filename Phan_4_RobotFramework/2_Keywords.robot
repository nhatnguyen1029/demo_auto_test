*** Comments ***
Trong Robot Framework, Keyword là “hành động” hoặc “bước lệnh” mà test case sẽ thực hiện.
Bạn có thể hình dung keyword giống như hàm trong lập trình: có tên, có tham số, và có thể tái sử dụng.

Robot Framework có 3 loại keyword chính:

1. Built-in Keywords
Là keyword được Robot Framework cung cấp sẵn (không cần cài thêm thư viện).    (Mau vang)

2. Library Keywords
Là keyword từ các thư viện được import.

Ví dụ, nếu bạn import SeleniumLibrary, bạn sẽ có keyword như:

3. User-defined Keywords
Là keyword do bạn tự định nghĩa để tái sử dụng hoặc gom nhóm các bước lặp lại.

Được khai báo trong *** Keywords *** section hoặc file resource .resource.


*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${USERNAME}     admin123
${PASSWORD}     123456


*** Test Cases ***
Built-in Keywords
    Log To Console    Hello World
    Sleep    2s
    ${VAR}    Set Variable    value
    ${y}    Set Variable    value_y
    Should Be Equal    ${VAR}    ${y}

Library Keywords
    Open Browser    https://google.com    chrome
    Input Text    id:username    admin
    Click Button    id:login
    Close Browser

Test Login
    Login To System

Say Hello
    Greet User    Nguyen

# | Setting    | Chức năng    |
# | ----------------- | ------------------------------ |
# | `[Arguments]`    | Khai báo tham số cho keyword    |
# | `[Documentation]` | Mô tả test case hoặc keyword    |
# | `[Tags]`    | Gắn nhãn để lọc/chạy nhóm test |


*** Keywords ***
Login To System
    Open Browser    https://example.com    chrome
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}

Greet User
    [Arguments]    ${name}
    Log To Console    Hello, ${name}!
