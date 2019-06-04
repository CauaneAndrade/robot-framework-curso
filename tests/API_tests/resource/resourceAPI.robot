*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/

*** Keywords ***
# Setup e Teardown
Connect API
    Create Session    fakerestapi    ${URL_API}

# Test Case 01: Busque todos os livros (GET)
# Todos os livros
Requests books
# ${VARIAVEL_P_ARMAZENAR}    ação    alias("apelido")    endpoint
# endpoint exemplo: https://fakerestapi.azurewebsites.net/api/Books --> Books == endpoint
    ${RESPONSE}    Get Request    fakerestapi    Books
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Conferir status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPONSE.status_code}  ${STATUSCODE_DESEJADO}

Conferir reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPONSE.reason}  ${REASON_DESEJADO}

Conferir quantidade itens
    [Arguments]    ${QUANTIDADE_LIVROS}
    Length Should Be    ${RESPONSE.json()}    ${QUANTIDADE_LIVROS}
    Log    ${RESPONSE.json()}

# Test Case 02: Busque um livro específico (GET)
# Livro específico
Request livro "${ID_LIVRO}"
    ${RESPONSE}    Get Request    fakerestapi    Books/${ID_LIVRO}caua
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}