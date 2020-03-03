*** Settings ***				
Library	    Collections			
Library	    RequestsLibrary
Library     OperatingSystem

*** Variables ***
${base_uri}     http://spotlab-api.herokuapp.com

*** Keywords ***
### /sessions
Set Token
    [Arguments]     ${email}

    Create Session  spotapi     ${base_uri}

    &{payload}      Create Dictionary   email=${email}
    &{headers}=     Create Dictionary   Content-Type=application/json

    ${response}=    Post Request    spotapi     /sessions   data=${payload}     headers=${headers}

    ${token}        Convert To String   ${response.json()['_id']}

    Set Suite Variable  ${token}  

### /spots
Save Spot
    [Arguments]    ${payload}  ${thumb}

    Create Session  spotapi     ${base_uri}

    ${file_data}=       Get Binary File     ${CURDIR}/img/${thumb}
    &{files}=           Create Dictionary   thumbnail=${file_data}

    &{headers}=     Create Dictionary   user_id=${token}
    ${response}=    Post Request        spotapi     /spots  files=${files}      data=${payload}     headers=${headers}

    [return]            ${response}


Save Spot List
    [Arguments]     ${json_file}

    ${my_spots}=     Get File         resources/fixtures/${json_file}
    ${json}=         Evaluate         json.loads('''${my_spots}''')    json
    ${data}=         Set Variable     ${json['data']}

    :FOR    ${item}     IN      @{data}

    \       ${thumb}=           Get From Dictionary     ${item}         thumb
    \       ${payload}=         Get From Dictionary     ${item}         payload
    \       Save Spot           ${payload}      ${thumb}


