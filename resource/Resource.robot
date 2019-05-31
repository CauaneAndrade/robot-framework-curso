*** Settings ***
Library    Selenium2Library  # Library para web

*** Variables ***
# Define-se as variáveis globais
# Podem ser acessadasem qualquer ponto do teste
${URL}    http://automationpractice.com/
${BROWSER}    firefox

*** Keywords ***
# # Setup e Teardown
Abrir Browser
    Open Browser    ${URL}  ${BROWSER}

Fechar Browser
    Close Browser

# # Passo-a-passo
Acessar a página home
    Title Should Be    My Store

Pesquisar produto "${PRODUTO}"
    Input Text    id:search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Button    name:submit_search

Conferir produto listado
# # É importante esperar a página carregar, pode ser que a internet esteja lenta, etc.
    Wait Until Element Is Visible    css:html body#search.search.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-9 h1.page-heading.product-listing    # timeout=30
    Title Should Be    Search - My Store
    Page Should Contain Image    xPath:/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img