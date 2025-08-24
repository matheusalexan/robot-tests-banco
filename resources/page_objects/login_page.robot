*** Settings ***
Documentation     Page Object para a página de login
Resource          ../common.robot

*** Variables ***
# Locators da página de login
${USERNAME_FIELD}        //*[@id="username"]
${PASSWORD_FIELD}        //*[@id="senha"]
${LOGIN_BUTTON}          xpath=//button[text()="Entrar"]
${ERROR_MESSAGE}         Erro no login. Tente novamente.

*** Keywords ***
Navigate To Login Page
    [Documentation]    Navega para a página de login
    Go To    ${FRONTEND_URL}
    Wait For Page Load

Input Username
    [Arguments]    ${username}
    [Documentation]    Preenche o campo de usuário
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    [Documentation]    Preenche o campo de senha
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    [Documentation]    Clica no botão de login
    Click Button    ${LOGIN_BUTTON}

Perform Login
    [Arguments]    ${username}    ${password}
    [Documentation]    Realiza o processo completo de login
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

Verify Login Error Message
    [Documentation]    Verifica se a mensagem de erro de login está presente
    Verify Text Is Present    ${ERROR_MESSAGE}

Verify Login Success
    [Documentation]    Verifica se o login foi bem-sucedido (pode ser customizado)
    # Aqui você pode adicionar verificações específicas para sucesso
    # Por exemplo, verificar se foi redirecionado para dashboard
    Wait Until Page Does Not Contain    ${ERROR_MESSAGE}    ${DEFAULT_TIMEOUT}
