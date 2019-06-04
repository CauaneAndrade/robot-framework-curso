*** Settings ***
Resource    ../resource/resourceAPI.robot
Suite Setup    Connect API

*** Test Case ***
# Requisição GET
Test Case 01: Busque todos os livros (GET)
    Requests books
    Conferir status code    200
    Conferir reason    OK
    Conferir quantidade itens    200

Test Case 02: Busque um livro específico (GET)
    Request livro "15"
    Conferir status code    200
    Conferir reason    OK
    Conferir dados json

# Requisição POST
Test Case 03: Cadastrar novo livro (POST)
    Cadastrar novo livro
    Conferir status code    200
    Conferir reason    OK
    Conferir retorno dados livro "42"

Test Case 04: Alterar livro (PUT)
    Alterar livro "9"

# Test Case 05: Deletar livro (DELETE)
#     Conferir retorno livro "200"
