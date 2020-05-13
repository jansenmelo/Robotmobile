*** Settings ***
Library         AppiumLibrary
Library         String
Library         OperatingSystem

*** Variables ***
${REMOTE_URL}      http://127.0.0.1:4723/wd/hub
${platformName}    Android
${deviceName}      emulator-5554
${automationName}  uiautomator2
${appPackage}      com.ctappium
${appActivity}     com.ctappium.MainActivity
${formulario}      xpath=//android.widget.TextView[@text='Formulário']
${aplicacao}       ${CURDIR}/APK/CTAppium.apk

*** keywords ***

Acesso Home
  Open Application   ${REMOTE_URL}   platformName=${platformName}  deviceName=${deviceName}  udid=${dispositivo}  app=${aplicacao}  automationName=${automationName}  appPackage=${appPackage}  appActivity=${appActivity}

Acesso formulario
  Wait Until Element Is Visible     ${formulario}
  Click Element                     ${formulario}

Fechar Aplicacao
  Capture Page Screenshot
  Close Application
