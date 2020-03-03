*** Settings ***
Resource    base.robot

*** Keywords ***
Dado que "${email}" e o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text                  ${INPUT_EMAIL}        ${email}
    Click Element               ${BUTTON_LOGIN}

Entao devo ver a area logada
    Page Should Contain Element     ${DIV_DASH}

