*** Settings ***
Library     SeleniumLibrary
# Created by PC at 11/08/2025


*** Test Cases ***
Basis IF
    Log To Console    Kiem tra dieu kien tham gia su kien:
    ${tuoi}    Set Variable    18
    IF    ${tuoi} > 17
        Log To Console    Ban du dieu kien tham gia chuong trinh
    END

Toan tu AND
    Log To Console    Ket hop toan tu AND
    ${tuoi}    Set Variable    18
    ${Co_CMND}    Set Variable    ${True}
    IF    ${tuoi} > 17 and ${Co_CMND}
        Log To Console    Ban du dieu kien tham gia chuong trinh
    END

Toan tu OR
    Log To Console    Ket hop toan tu OR
    ${tuoi}    Set Variable    15
    ${da_dang_ky}    Set Variable    ${False}
    IF    ${tuoi} > 17 or ${da_dang_ky}
        Log To Console    Ban du dieu kien tham gia chuong trinh
    END

Toan tu not
    Log To Console    Toan tu not
    ${da_dang_ky}    Set Variable    ${False}
    IF    not ${da_dang_ky}
        Log To Console    Ban CHUA dang ky tham gia su kien
    END

IF va ELSE
    Log To Console    Kiem tra so chan
    ${so}    Set Variable    7
    IF    ${so}%2 == 0
        Log To Console    Day la so chan
    ELSE
        Log To Console    Day la so le
    END

IF va ELSE IF
    Log To Console    Kiem tra kieu so
    ${so}    Set Variable    7.2
    IF    ${so}%2 == 0
        Log To Console    Day la so chan
    ELSE IF    ${so}%2 == 1
        Log To Console    Day la so le
    ELSE
        Log To Console    Day khong phai so nguyen
    END

# =======================================================================================================================

Vong lap For In
    Log To Console    Duyet danh sach trai cay
    @{danh_sach_trai_cay}    Create List    Xoai Tao Cam
    FOR    ${Trai_cay}    IN    @{danh_sach_trai_cay}
        Log To Console    Trai_cay: ${Trai_cay}
    END

Vong lap For In Range
    Log To Console    Thong tin danh sach:
    FOR    ${i}    IN RANGE    1    10    2
        Log To Console    Gia tri: ${i}
    END

Vong lap For In Enumerate
    Log To Console    Thong tin danh sach:
    @{danh_sach}    Create List    A    B    C
    FOR    ${index}    ${value}    IN ENUMERATE    @{danh_sach}
        Log To Console    Phan tu theo Index ${index}: ${danh_sach}[${index}]
    END

Vong lap Dictionary
    Log To Console    Thong tin Dictionary
    ${nguoi_dung}    Create Dictionary    ten=Nam    tuoi=25
    FOR    ${key}    ${value}    IN    &{nguoi_dung}
        Log To Console    ${key}=${value}
    END

Vong lap While
    Log To Console    Kiem tra dieu kien den:
    ${dem}    Set Variable    ${1}
    WHILE    $dem < 3
        Log To Console    Dang lap den: ${dem}
        ${dem}    Evaluate    ${dem}+1
    END

Vong lap while gioi han
    Log To Console    Vong lap gioi han
    WHILE    $True    limit=5
        Log To Console    Vong lao nay thuc hien 5 lan
    END

# =======================================================================================================================

Dung Break
    Log To Console    Thoat vong lap
    FOR    ${i}    IN RANGE    1    10
        Log To Console    Kiem tra: ${i}
        IF    ${i} == 5
            Log To Console    Da den gia tri ${i}, dung vong lap
            BREAK
        END
    END

Dung Continue bo qua gia tri le
    Log To Console    Tiep tuc vong lap
    FOR    ${I}    IN RANGE    1    6
        IF    ${i}%2 != 0
            Log To Console    ${i} la so le, bo qua
            CONTINUE
        END
        Log To Console    Xu ly so chan: ${i}
    END
# =======================================================================================================================

Mo trinh duyet
    TRY
        Open Browser    https://www.demoblaze.com/    chrome
        Log To Console    Da mo trinh duyet Chrome thanh cong
    EXCEPT
        Log To Console    Loi khi mo trinh duyet Chrome , kiem tra lai Driver hoac cau hinh
    ELSE
        ${status}    Run Keyword And Return Status    Title Should Be    STORE
        IF    ${status}    Log To Console    Dung Tieu De
    END
