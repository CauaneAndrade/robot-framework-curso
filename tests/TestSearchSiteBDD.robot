*** Settings ***
Resource    ../resource/Resource.robot
Test Setup    Abrir Browser
Test Teardown    Fechar Browser
# # SETUP roda Keyword antes da Suite ou Teste
# # TEARDOWN roda Keyword depois de uma Suite ou Teste

*** Variables ***
# Define-se as variáveis globais
# Podem ser acessadasem qualquer ponto do teste

*** Test Case ***
Cenário 01: Pesquisar Produto Existente
    Dado que estou na página home
    Quando pesquisar pelo produto "Blouse"
    Então produto "Blouse" deve ser listado

Cenário 02: Pesquisar Produto não Existente
    Dado que estou na página home
    Quando pesquisar pelo produto "ItemNãoExistente"
    Então deve exibir erro "No results were found for your search 'ItemNãoExistente'"

*** Keywords ***
Dado que estou na página home
    Acessar a página home

Quando pesquisar pelo produto "${PRODUTO}"
    Pesquisar produto "${PRODUTO}"
    Clicar no botão pesquisar

Então produto "${PRODUTO}" deve ser listado
    Conferir produto listado

Então deve exibir erro "${ALERT_MESSAGE}"
    Conferir erro "${ALERT_MESSAGE}"
