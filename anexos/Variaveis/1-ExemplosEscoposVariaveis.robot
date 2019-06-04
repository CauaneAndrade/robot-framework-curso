*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)
Library         String

*** Variable ***
${GLOBAL_INSTANCIADA}     Minha variável GLOBAL_INSTANCIADA foi instanciada para a suíte

*** Test Cases ***
Test Case 01
    Keyword Exemplo 01
    Keyword Exemplo 02

Test Case 02
    Keyword Exemplo 02
    Keyword Exemplo 03

Test Case 03
    Keyword Exemplo 04

*** Keywords ***
Keyword Exemplo 01
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}     Generate Random String
    #A variável "global" pode ser utilizada em todas as suítes em execução
    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    #A variável "suite" pode ser utilizada somente nos testes da suíte em execução
    Set Suite Variable     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suíte
    #A variável "test" pode ser utilizada somente nas todas as keywords do teste em execução
    Set Test Variable      ${TESTE_01}   Variável do teste 01
    Log         ${TESTE_01}
    #A variável "local" pode ser utilizada somente na keyword em execução
    ${LOCAL}    Set Variable    Variável local da keyword 01

Keyword Exemplo 02
    ${LOCAL}     Set Variable    Variável local da keyword 02
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
    # A keyword abaixo vai funcionar no Caso de Teste 01 e falhar no Case de Teste 02
    Log    ${TESTE_01}

Keyword Exemplo 03
    ${LOCAL}     Set Variable    Variável local da keyword 03
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable    Variável local da keyword 04
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
