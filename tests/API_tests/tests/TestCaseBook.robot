*** Settings ***
Resource    ../resource/resourceAPI.robot
Suite Setup    Connect API

*** Test Case ***
Test Case 01: Busque todos os livros (GET)
    Requests books
    Conferir status code    200
    Conferir reason    OK
    Conferir quantidade itens    200

Test Case 02: Busque um livro específico (GET)
    Request livro "15"
