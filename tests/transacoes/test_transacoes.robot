*** Settings ***
Documentation     Testes de funcionalidade de transações bancárias
Resource          ../../resources/common.robot
Resource          ../../resources/page_objects/login_page.robot
Resource          ../../resources/page_objects/transacoes_page.robot
Suite Setup       Setup Browser
Suite Teardown    Teardown Browser
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
Cenario 1: Acesso à página de transações após login
    [Documentation]    Verifica se consegue acessar transações após fazer login
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Transacoes Page
    Verify Element Is Visible    ${NOVA_TRANSACAO_BTN}

Cenario 2: Criar nova transação de crédito
    [Documentation]    Testa criação de transação de crédito
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Transacoes Page
    Criar Transacao Completa    100.00    ${TIPO_CREDITO}    Teste de crédito

Cenario 3: Criar nova transação de débito
    [Documentation]    Testa criação de transação de débito
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Transacoes Page
    Criar Transacao Completa    50.00    ${TIPO_DEBITO}    Teste de débito

Cenario 4: Cancelar transação
    [Documentation]    Testa cancelamento de transação
    Navigate To Login Page
    Perform Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Transacoes Page
    Click Nova Transacao
    Input Valor Transacao    75.00
    Select Tipo Transacao    ${TIPO_CREDITO}
    Input Descricao Transacao    Transação para cancelar
    Cancelar Transacao
