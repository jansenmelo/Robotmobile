*** Settings ***
Resource        ./resources/PO/Home.robot
Test Setup      Acesso Home
Test Teardown   Fechar Aplicacao

*** Variables ***
&{Cliente}                       Usuario=Manoel     Console_Preferido=PS4
${campo_nome}                    accessibility_id=nome
${campo_console}                 accessibility_id=console
${campo_modelo_console}          xpath=//android.widget.CheckedTextView
${campo_check}                   accessibility_id=check
${campo_switch}                  accessibility_id=switch
${valor_console}                 xpath=//android.widget.Spinner/android.widget.TextView
${dispositivo}                   emulator-5556
*** keywords ***
#Inserir o nome do usuário
User
    [Arguments]     ${uname}
    Wait Until Element Is Visible   ${campo_nome}
    Click Element                   ${campo_nome}
    Input Text                      ${campo_nome}           ${uname}
#Selecionar o tipo de console preferido
Console
    [Arguments]     ${tipoConsole}
    Click Element                       ${campo_console}
    Wait Until Element Is Visible       ${campo_modelo_console}
    Click Element                       ${campo_modelo_console}\[@text=${tipoConsole}]

#keywords BDD
Dado que estou na tela de formulario
      Acesso formulario

Quando preencher os campos com nome: "${Cliente.Usuario}", console: "${Cliente.Console_Preferido}"
      User                ${Cliente.Usuario}
      Console             ${Cliente.Console_Preferido}

E marcar o checkbox
        Click Element                          ${campo_check}
        Element Attribute Should Match         ${campo_check}       checked     true

E desabilitar o switch
        Click Element                          ${campo_switch}
        Element Attribute Should Match         ${campo_switch}      checked     false

Então os dados de nome "${Cliente.Usuario}" e console "${Cliente.Console_Preferido}" devem ser gravados com sucesso
      Element Text Should Be                 ${campo_nome}                  ${Cliente.Usuario}
      Element Text Should Be                 ${valor_console}               ${Cliente.Console_Preferido}
      Click Text                     SALVAR


*** Test Cases ***
Cenário 01: Preencher formulario
  Dado que estou na tela de formulario
  Quando preencher os campos com nome: "${Cliente.Usuario}", console: "'${Cliente.Console_Preferido}'"
  E marcar o checkbox 
  E desabilitar o switch
  Então os dados de nome "${Cliente.Usuario}" e console "${Cliente.Console_Preferido}" devem ser gravados com sucesso
