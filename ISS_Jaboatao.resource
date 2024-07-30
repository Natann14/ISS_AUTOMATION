*** Settings ***
Library    OperatingSystem
Library    DateTime
Library    RPA.Browser.Selenium
Library    RPA.Desktop

*** Variables ***
#${URL}  https://www.tinus.com.br/csp/JABOATAO/portal/index.csp
${URL}  https://www.tinus.com.br/csp/JABoATAO/portal/wsicm80pf.csp
${CNPJ}  41025313000181
${DATA_PAGAMENTO}  12

*** Keywords ***
Abrir navegador
    Open Available Browser  url=${URL}  headless=${False}  maximized=${True} browser_selection=edge,chrome

Acessar pagina de relatorio
    
    ${date}  Get Current Date    result_format=%m
    ${date}  Convert To Integer    ${date}
    ${next_month}  Evaluate  ${date} + 1
    

    IF    ${next_month} < 10
        ${next_month}  Convert To String  ${next_month}
        ${next_month}  Set Variable  0${next_month}
    ELSE
        ${next_month}  Convert To String  ${next_month}
    END

    ${day}  Get Current Date  result_format=%d
    ${month}  Get Current Date  result_format=%m
    ${year}  Get Current Date  result_format=%Y

    Execute JavaScript  document.getElementById('cboMesComp').removeAttribute('disabled')

    Wait Until Page Contains Element  xpath=//*[@id="Pagina"]/table/tbody/tr[2]/td[2]/input  timeout=10
    Input Text  xpath=//*[@id="Pagina"]/table/tbody/tr[2]/td[2]/input  ${CNPJ}
    
    Select From List By Value  id=cboMesComp  ${month}
    Select From List By Value  id=cboAnoComp  ${year}

    Select From List By Value  id=cboDiaVenc  ${DATA_PAGAMENTO}
    Select From List By Value  id=cboMesVenc  ${next_month}
    Select From List By Value  id=cboAnoVenc  ${year}
    Select From List By Label  xpath=//*[@id="Pagina"]/table/tbody/tr[3]/td[3]/select  ISS Fonte
    
    Input Text  xpath=//*[@id="Pagina"]/table/tbody/tr[4]/td[3]/input  12345

    ${link}  Get Element Attribute  xpath=//*[@id="Pagina"]/p/input[1]  onclick

    Execute Javascript  ${link}
    Print To Pdf
    # Clicando botao imprimir
    #Click Element   xpath=//*[@id="Pagina"]/p/input[1]
    
    #Get Browser Ids
    #Get Browser Aliases



