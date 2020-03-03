*** Settings ***
Library     SeleniumLibrary
Library     ./libs/mongo.py

Resource    pages/elements.robot

*** Keywords ***
### Hooks
Abrir navegador
    Open Browser                about:blank      headlesschrome
    Set Selenium Implicit Wait  10
    Set Window Size             1440  900
    Go To                       https://spotlab.herokuapp.com/

Fechar navegador
    Capture Page Screenshot
    Close Browser

### Shared Steps
Entao devo ver o alerta "${expect_alert}"
    Element Text Should Be      ${DIV_ALERT}     ${expect_alert}