*** Settings ***
Documentation     Keywords comuns reutilizáveis para todos os testes
Resource          config.robot

*** Keywords ***
Setup Browser
    [Documentation]    Configura e abre o navegador com configurações padrão
    Open Browser    ${FRONTEND_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${BROWSER_TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Teardown Browser
    [Documentation]    Fecha o navegador e limpa recursos
    Close All Browsers

Wait For Page Load
    [Documentation]    Aguarda a página carregar completamente
    Wait Until Page Contains Element    //body    ${DEFAULT_TIMEOUT}

Take Screenshot On Failure
    [Documentation]    Captura screenshot em caso de falha
    Run Keyword If Test Failed    Capture Page Screenshot    failure_screenshot.png

Verify Element Is Visible
    [Arguments]    ${locator}    ${timeout}=${DEFAULT_TIMEOUT}
    [Documentation]    Verifica se um elemento está visível na página
    Wait Until Element Is Visible    ${locator}    ${timeout}

Verify Text Is Present
    [Arguments]    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    [Documentation]    Verifica se um texto está presente na página
    Wait Until Page Contains    ${text}    ${timeout}
