

*** Variables ***
### login page
${INPUT_EMAIL}      id:email
${BUTTON_LOGIN}     css:button[type=submit]
${DIV_ALERT}        class:alert

### spot page
${DIV_DASH}             class:dashboard
${INPUT_THUMB}          css:#thumbnail input
${INPUT_COMPANY}        css:input[placeholder*=empresa]
${INPUT_TECHS}          id:techs
${INPUT_PRICE}          css:input[placeholder^=Valor]
${BUTTON_SAVE_SPOT}     //button[contains(text(), 'Cadastrar')]
${LI_SPOT_ITEM}         css:.spot-list li
${UL_SPOT_LIST}         class:spot-list