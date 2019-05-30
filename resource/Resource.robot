*** Settings ***
Library    Selenium2Library  # Library para web

*** Variables ***
# Define-se as variáveis globais
# Podem ser acessadasem qualquer ponto do teste
${URL}    http://automationpractice.com/
${BROWSER}    chrome

*** Keywords ***
# # Setup e Teardown
Open Browser
    Open Browser    ${URL}  ${BROWSER}

Close Browser
    Close Browser

# # Passo-a-passo
Acessar a página home
    Title Should Be    My Store
