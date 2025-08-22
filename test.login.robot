*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}    http://localhost:4000/  
${usuario}    julio.lima
${senha}    123456
${senhainvalido}    654321
${usuarioinvalido}    lima.julio
${LOGIN_BTN}      xpath=//button[text()="Entrar"]

*** Keywords ***
Open Robot site
    Open Browser    ${url}    chrome
    Maximize Browser Window
Realizar login
    [Arguments]    ${usuario}    ${senha}
    Input Text     //*[@id="username"]    ${usuario}
    Input Text     //*[@id="senha"]    ${senha}
    Click Button   ${LOGIN_BTN}

*** Test Cases ***
Cenario 1: Test Robot
    Open Robot site
    Close Browser

Cenario 2: Teste de login com sucesso
    Open Robot site
    Realizar login    ${usuario}    ${senha}
    Close Browser
Cenario 3: Teste de login com usuario invalido
    Open Robot site
    Realizar login    ${usuarioinvalido}    ${senha}
    Wait Until Page Contains    Erro no login. Tente novamente.    10s
    Capture Page Screenshot
    Close Browser
Cenario 4: Teste de login com o senha invalida
    Open Robot site
    Realizar login    ${usuario}    ${senhainvalido}
    Wait Until Page Contains    Erro no login. Tente novamente.    10s
    Capture Page Screenshot
    Close Browser

