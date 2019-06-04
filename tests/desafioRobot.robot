*** Settings ***
Resource    ../resource/ResourceDesafio.robot
Test Setup    Abrir Browser
Test Teardown    Fechar Browser

*** Test Case ***
# # Test Case 01: Listar Produtos
# #     Passar mouse por cima da categoria "WOMEN"
# #     Clicar na sub categoria "Summer Dresses"

# Test Case 02: Adicionar Produtos ao Carrinho
#     Pesquisar produto "t-shirt"
#     Clicar no botão pesquisar
#     Adicionar ao Carrinho
#     Clicar no botão "Proceed to checkout"
#     [Teardown]    NONE

# Test Case 03: Remover Produtos
#     [Setup]    NONE
#     Clicar no ícone carrinho de compras
#     Remover Produto

# Test Case 04: Adicionar Cliente
#     Clicar no botão superior direito "Sign in"
#     Inserir email válido
#     Clicar no botão "Create na account"
#     [Teardown]    NONE

Test Case 05: Enviar Formulário Preenchido Corretamente
    Clicar no botão superior direito "Sign in"
    Inserir email válido
    Clicar no botão "Create na account"
    # Preencher Formulário
    Enviar Formulário
    # [Teardown]    NONE