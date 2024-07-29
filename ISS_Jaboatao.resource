*** Settings ***
Library    OperatingSystem
Library    DateTime
Library    RPA.Browser.Selenium
Library    RPA.Desktop

*** Variables ***
${URL}  https://www.tinus.com.br/csp/JABOATAO/portal/index.csp


*** Keywords ***
Abrir navegador
    Open Available Browser  url=${URL}  headless=${False}  maximized=${True}
        ...  browser_selection=firefox
Acessar pagina de relatorio
    Wait Until Page Contains Element    id=iFrame2  timeout=10
    Select Frame  id=iFrame2
    Wait Until Page Contains Element    xpath=/html/body/form/div[2]/table/tbody/tr[2]/td[1]/iframe  timeout=10
    Select Frame  xpath=/html/body/form/div[2]/table/tbody/tr[2]/td[1]/iframe
    Click Element    xpath=//*[@id="menuFrame"]/li[21]/a  timeout=10
    


    #Get Browser Ids pegar o ID do navegador
    #Get Browser Aliases