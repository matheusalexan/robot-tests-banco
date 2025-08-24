*** Settings ***
Documentation     Testes de funcionalidade de login
Resource          ../../resources/common.robot
Resource          ../../resources/page_objects/login_page.robot
Suite Setup       Setup Browser
Suite Teardown    Teardown Browser

*** Test Cases ***
Cenario 1: Acesso à página de login
    [Documentation]    Verifica se consegue acessar a página de login
    Navigate To Login Page
    Verify Element Is Visible    ${USERNAME_FIELD}
    Verify Element Is Visible    ${PASSWORD_FIELD}
    Verify Element Is Visible    ${LOGIN_BUTTON}

Cenario 2: Login com credenciais válidas
    [Documentation]    Testa login com usuário e senha corretos
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Login Success

Cenario 3: Login com usuário inválido
    [Documentation]    Testa login com usuário incorreto
    Navigate To Login Page
    Perform Login    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    Verify Login Error Message

Cenario 4: Login com senha inválida
    [Documentation]    Testa login com senha incorreta
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Error Message


