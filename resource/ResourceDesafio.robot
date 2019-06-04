*** Settings ***
Library    Selenium2Library  # Library para web
Library    String

*** Variables ***
# Define-se as variáveis globais
# Podem ser acessadasem qualquer ponto do teste
${URL}    http://automationpractice.com/
${BROWSER}    firefox

# # Test Case 05: Completar Formulário
&{INFORMAÇÕES}    name=cauane  last_name=andrade  password=00001
...               address=endereço_exemplo  city=Exemplo  zip_code=2435


*** Keywords ***
# # Setup e Teardown
Abrir Browser
    Open Browser    ${URL}  ${BROWSER}

Fechar Browser
    Close Browser

# # Test Case 01: Listar Produtos
Passar mouse por cima da categoria "${CATEGORIA}"
    Wait Until Element Is Visible   xPath:/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a
    Mouse Over    xPath:/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a

Clicar na sub categoria "${SUB_CATEGORIA}"
    Wait Until Element Is Visible    xPath:/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a
    Click Link    xPath:/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a

# # Test Case 02: Adicionar Produtos ao Carrinho
Pesquisar produto "${PRODUTO}"
    Input Text    id:search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Button    name:submit_search

Adicionar ao Carrinho
    Wait Until Element Is Visible    xPath:/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img
    Mouse Over    xPath:/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img
    Wait Until Element Is Visible    xPath:/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/div[2]/a[1]/span
    Click Element    xPath:/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/div[2]/a[1]/span

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible    css:html body#search.search.hide-right-column.lang_en div#page div.header-container header#header div div.container div.row div#layer_cart div.clearfix div.layer_cart_cart.col-xs-12.col-md-6 div.button-container a.btn.btn-default.button.button-medium
    Click Element    css:html body#search.search.hide-right-column.lang_en div#page div.header-container header#header div div.container div.row div#layer_cart div.clearfix div.layer_cart_cart.col-xs-12.col-md-6 div.button-container a.btn.btn-default.button.button-medium

# # Test Case 03: Remover Produtos
Clicar no ícone carrinho de compras
    Go To    ${URL}
    Wait Until Element Is Visible    class:shopping_cart
    Click Element    xPath:/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a

Remover Produto
    Title Should Be    Order - My Store
    Click Element    class:icon-trash
    # Run Keyword If    ${PRODUTO}  ==  xPath:/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr[1]/td[2]/p/a
    Wait Until Page Contains    Your shopping cart is empty.
    Page Should Contain    Your shopping cart is empty.

# # Test Case 04: Adicionar Cliente
Clicar no botão superior direito "Sign in"
    Click Element    class:login

Inserir email válido
    Wait Until Element Is Visible    id=email_create
    ${EMAIL}=    Generate Random String    12    [LOWER]
    Input Text    id=email_create    ${EMAIL}@testrobot.com

Clicar no botão "Create na account"
    Click Button    id=SubmitCreate
    Wait Until Element Is Visible    class:page-heading
    Page Should Contain Element    xPath:/html/body/div/div[2]/div/div[3]/div/div/form/div[1]/div[2]/label
    # Click Element    id:uniform-id_gender2


# # Test Case 05: Enviar Formulário Preenchido Corretamente
Preencher Formulário
    Wait Until Element Is Visible    class:page-heading
#     # Click Element    xPath://*[@id="id_gender2"]
#     Input Text    xPath://text[@name ='customer_firstname']   ${INFORMAÇÕES.name}
#     Input Text    id:customer_lastname    ${INFORMAÇÕES.last_name}
#     Input Password    id:passwd    ${INFORMAÇÕES.password}
#     Input Text    id:address1    ${INFORMAÇÕES.address1}
#     Input Text    id:city    ${INFORMAÇÕES.city}
#     Click Element    id:id_state
#     # Wait Until Element Is Visible    id
#     Select From List    value:1
#     Input Text    id:postcode    ${INFORMAÇÕES.zip_code}
#     Click Element    id:id_country
#     Select From List    value:1

Enviar Formulário
    Click Element    xPath://*[@id="submitAccount"]