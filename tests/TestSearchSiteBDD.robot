*** Settings ***
Library    Selenium2Library  # Library para web

# # SETUP roda Keyword antes da Suite ou Teste
# # TEARDOWN roda Keyword depois de uma Suite ou Teste

*** Variables ***
# Define-se as variáveis globais
# Podem ser acessadasem qualquer ponto do teste
${URL}    http://automationpractice.com/
${BROWSER}    Chrome

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
