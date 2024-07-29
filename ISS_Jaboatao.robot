*** Settings ***
Documentation  Criar relatorio ISS da prefeitura de Jaboatao
Resource  ISS_Jaboatao.resource

*** Tasks ***
Emitir Documento
    Abrir navegador
    Acessar pagina de relatorio