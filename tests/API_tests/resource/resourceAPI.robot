*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/

# Dicionário para conferir Jsons
&{BOOK_id15}    ID=15
...             Title=Book 15
...  PageCount=1500

*** Keywords ***
# Setup e Teardown
Connect API
    Create Session    fakerestapi    ${URL_API}

# Requisição GET

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
    ${RESPONSE}    Get Request    fakerestapi    Books/${ID_LIVRO}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Conferir dados json
    # Valores fixos no json
    Dictionary Should Contain Item    ${RESPONSE.json()}  ID  ${BOOK_id15.ID}
    Dictionary Should COntain Item    ${RESPONSE.json()}  Title  ${BOOK_id15.Title}
    Dictionary Should Contain Item    ${RESPONSE.json()}  PageCount  ${BOOK_id15.PageCount}

# Valores que variam no json, mas não podem estar vazios
    Should Not Be Empty    ${RESPONSE.json()["Description"]}
    Should Not Be Empty    ${RESPONSE.json()["Excerpt"]}
    Should Not Be Empty    ${RESPONSE.json()["PublishDate"]}

# Requisição POST

# Test Case 03: Cadastrar novo livro (POST)
Cadastrar novo livro
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${RESPONSE}    Post Request    fakerestapi    Books
    ...                            data={"ID": 42,"Title":"teste","Description":"teste","PageCount":42,"Excerpt":"teste","PublishDate":"2042-06-04T17:25:54.652Z"}
    ...                            headers=${HEADERS}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Conferir retorno dados livro "${ID_LIVRO}"
    Dictionary Should Contain Item    ${RESPONSE.json()}  ID  ${RESPONSE.json()["ID"]}
    Dictionary Should Contain Item    ${RESPONSE.json()}  Title  ${RESPONSE.json()["Title"]}
    Dictionary Should Contain Item    ${RESPONSE.json()}  PageCount  ${RESPONSE.json()["PageCount"]}

    Should Not Be Empty    ${RESPONSE.json()["Description"]}
    Should Not Be Empty    ${RESPONSE.json()["Excerpt"]}
    Should Not Be Empty    ${RESPONSE.json()["PublishDate"]}
    Log    ${RESPONSE.text}

# Requisição PUT

# Test Case 04: Alterar livro (PUT)
Alterar livro "${ID_LIVRO}"
    &{headers}   Create Dictionary    content-type=application/json
    ${RESPONSE}    Put Request  fakerestapi  Books/${ID_LIVRO}  data={"ID": 13,"Title":"teste","Description":"tested","PageCount":42,"Excerpt":"teste","PublishDate":"2042-06-04T17:25:54.652Z"}  headers=${headers}
    # Dictionary Should Contain Key    ${RESPONSE.json()}  Title
    Set To Dictionary    ${RESPONSE.json()}   ID
    Log  ${RESPONSE.json()["ID"]}



# Conferir retorno livro alterado "${LIVRO_ALTERADO}"
#     Set Variable
#     Set Test Variable    ${RESPONSE}



# Requisição DELETE