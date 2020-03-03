*** Settings ***
Documentation   Spots
...     Para que eu possa disponibilizar spots para locacao
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource        ../../resources/spot_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Novo spot
    Dado que estou logado como "eu@papito.io"
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot no dashboard
    E o valor da diaria "R$10/dia"

Spot gratuito
    Dado que estou logado como "eu@papito.io"
    E que eu tenho um spot disponivel na empresa "Acme"
    E este spot possui a imagem "acme.jpg"
    E usamos as seguintes tecnologias "ruby, python"
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot no dashboard
    E o valor da diaria "GRATUITO"

# Cenas para o proximo capitulo
Limite de spots
    [Tags]      todo
    
    Dado que a conta "fernando@google.com" possui 4 spots
    Quando acesso o dashboard
    Entao devo ver a seguinte mensagem "Você pode cadastrar até 4 spots"
