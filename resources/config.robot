*** Settings ***
Documentation     Configurações globais do projeto de testes
Library           SeleniumLibrary

*** Variables ***
# URLs das aplicações
${FRONTEND_URL}    http://localhost:4000/
${API_URL}         http://localhost:3000/

# Configurações do navegador
${BROWSER}         chrome
${BROWSER_TIMEOUT}    30s
${IMPLICIT_WAIT}      10s

# Credenciais de teste
${VALID_USERNAME}     julio.lima
${VALID_PASSWORD}     123456
${INVALID_USERNAME}   lima.julio
${INVALID_PASSWORD}   654321

# Timeouts
${DEFAULT_TIMEOUT}    10s
${LONG_TIMEOUT}       30s
