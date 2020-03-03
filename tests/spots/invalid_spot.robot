*** Settings ***
Documentation   Invalid Spot
...     Para que eu possa disponibilizar spots para locacao
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource        ../../resources/spot_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador
Test Template   Invalid spot

*** Keywords ***
Invalid spot
    [Arguments]     ${thubmnail}  ${company}  ${techs}  ${alert}

    Dado que estou logado como "eu@papito.io"
    E que eu tenho um spot disponivel na empresa "${company}"
    E este spot possui a imagem "${thubmnail}"
    E usamos as seguintes tecnologias "${techs}"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o alerta "${alert}"

*** Test Cases ***  thubmnail   company    techs            alert
Empty Thubmnail     ${EMPTY}    Google     java, golang     Precisamos da foto da sua empresa!
Empty company       acme.jpg    ${EMPTY}   ruby, python     O nome da sua empresa é obrigatório!
Empty techs         yahoo.jpg   Yahoo      ${EMPTY}         Informe pelo menos uma tecnologia :)
