*** Settings ***
Resource    ../resource/Resource.robot
Test Setup    Abrir Browser
Test Teardown    Fechar Browser

*** Variables ***

*** Test Case ***
Test Case 01: Pesquisar Produto Existente
#    # [Setup]    parâmetro    # é possível definir um setup específico para cada teste
    Acessar a página home
    Pesquisar produto "Blouse"
    Clicar no botão pesquisar
    Conferir produto listado
#     # [Teardown]    parâmetro    # é possível definir um teardown específico para cada teste

Test Case 02: Pesquisar Produto não Existente
    # Usa o Setup e o Teardown padrão, definido no Settings
    Acessar a página home
    Pesquisar produto "ItemNãoExistente"
    Clicar no botão pesquisar
    Conferir erro "No results were found for your search "ItemNãoExistente""
