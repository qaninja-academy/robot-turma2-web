*** Settings ***
Resource    base.robot
Resource    services.robot

*** Variables ***
${price}        ${EMPTY}

*** Keywords ***
Dado que estou logado como "${email}"
    Input Text                      ${INPUT_EMAIL}        ${email}
    Click Element                   ${BUTTON_LOGIN}
    Page Should Contain Element     ${DIV_DASH}

E que eu tenho um spot disponivel na empresa "${company}"
    Set Test Variable         ${company}
    Remove Spot By Company    ${company}

E este spot possui a imagem "${picture}"
    Set Test Variable     ${picture}

E usamos as seguintes tecnologias "${techs}"
    Set Test Variable     ${techs}

E o valor da diaria e de "${price}" reais
    Set Test Variable     ${price}
    
Quando eu faço o cadastro deste spot
    Log To Console      valor da diaria -> ${price}
    Click Link          /new
    Run Keyword if      "${picture}"
    ...                 Choose File         ${INPUT_THUMB}    ${CURDIR}/img/${picture}
    
    Input Text          ${INPUT_COMPANY}         ${company}
    Input Text          ${INPUT_TECHS}           ${techs}
    Input Text          ${INPUT_PRICE}           ${price}
    Click Element       ${BUTTON_SAVE_SPOT}

Entao devo ver o spot no dashboard
    Wait Until Element Is Visible   ${LI_SPOT_ITEM}
    Element Should Contain          ${UL_SPOT_LIST}     ${company}

E o valor da diaria "${valor}"
    Element Should Contain          ${UL_SPOT_LIST}     ${valor}

Dado que a conta "${email}" possui 4 spots
    Set Suite Variable  ${email}
    Set Token           ${email}
    Save Spot List      spots.json

Quando acesso o dashboard
    Dado que estou logado como "${email}"

Entao devo ver a seguinte mensagem "${expect_message}"
    Page Should Contain Element     //button[contains(text(), '${expect_message}')]