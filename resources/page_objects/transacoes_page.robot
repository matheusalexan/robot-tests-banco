*** Settings ***
Documentation     Page Object para a página de transações bancárias
Resource          ../common.robot

*** Variables ***
# Locators da página de transações (ajuste conforme sua aplicação)
${TRANSACOES_TAB}           xpath=//a[contains(text(),'Transações')]
${NOVA_TRANSACAO_BTN}       xpath=//button[contains(text(),'Nova Transação')]
${VALOR_FIELD}              //*[@id="valor"]
${TIPO_TRANSACAO_SELECT}    //*[@id="tipo"]
${DESCRICAO_FIELD}          //*[@id="descricao"]
${CONFIRMAR_BTN}            xpath=//button[contains(text(),'Confirmar')]
${CANCELAR_BTN}             xpath=//button[contains(text(),'Cancelar')]

# Valores de teste
${TIPO_CREDITO}             crédito
${TIPO_DEBITO}              débito

*** Keywords ***
Navigate To Transacoes Page
    [Documentation]    Navega para a página de transações
    Go To    ${FRONTEND_URL}
    Wait For Page Load
    Click Element    ${TRANSACOES_TAB}
    Wait For Page Load

Click Nova Transacao
    [Documentation]    Clica no botão para criar nova transação
    Click Button    ${NOVA_TRANSACAO_BTN}
    Wait For Page Load

Input Valor Transacao
    [Arguments]    ${valor}
    [Documentation]    Preenche o campo de valor da transação
    Input Text    ${VALOR_FIELD}    ${valor}

Select Tipo Transacao
    [Arguments]    ${tipo}
    [Documentation]    Seleciona o tipo de transação
    Select From List By Label    ${TIPO_TRANSACAO_SELECT}    ${tipo}

Input Descricao Transacao
    [Arguments]    ${descricao}
    [Documentation]    Preenche o campo de descrição
    Input Text    ${DESCRICAO_FIELD}    ${descricao}

Confirmar Transacao
    [Documentation]    Confirma a transação
    Click Button    ${CONFIRMAR_BTN}

Cancelar Transacao
    [Documentation]    Cancela a transação
    Click Button    ${CANCELAR_BTN}

Criar Transacao Completa
    [Arguments]    ${valor}    ${tipo}    ${descricao}
    [Documentation]    Cria uma transação completa com todos os campos
    Click Nova Transacao
    Input Valor Transacao    ${valor}
    Select Tipo Transacao    ${tipo}
    Input Descricao Transacao    ${descricao}
    Confirmar Transacao
