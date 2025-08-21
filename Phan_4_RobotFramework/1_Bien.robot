*** Comments ***
# Trong Robot Framework, biến (variable) là cách để lưu trữ giá trị và tái sử dụng nhiều lần trong kịch bản test, giúp code gọn gàng và dễ bảo trì hơn.
# Robot Framework hỗ trợ 4 loại biến chính:

1. Scalar variable – biến đơn
Dùng để lưu một giá trị duy nhất (chuỗi, số, bool, v.v.).
Cú pháp:    ${variable_name}    value

2. List variable – biến danh sách
Dùng để lưu nhiều giá trị trong một danh sách (mảng).
Cú pháp:    @{list_name}    value1    value2    value3

3. Dictionary variable – biến từ điển (key–value)
Dùng để lưu trữ dữ liệu dạng cặp khóa–giá trị.
Cú pháp:    &{dict_name}    key1=value1    key2=value2

4. Environment variable – biến môi trường
Lấy giá trị từ biến môi trường của hệ điều hành.
Cú pháp:    ${ENV_VAR}


*** Variables ***
${USERNAME}     admin123
${PASSWORD}     123456
${TIMEOUT}      10

@{FRUITS}       Apple    Banana    Mango

&{USER}         username=admin    password=1234566


*** Test Cases ***
Login Test
    Log To Console    Username: ${USERNAME}
    Log To Console    Password: ${PASSWORD}

Print Fruits
    Log To Console    Frist fruits: ${FRUITS}[0]
    Log To Console    All fruits: ${FRUITS}

Show User Info
    Log To Console    Username: ${USER.username}
    Log To Console    Password: ${USER.password}

Show Path
    Log To Console    PATH: %{PATH}

Test_GitHub
    Log To Console    test Huong Nguyen
