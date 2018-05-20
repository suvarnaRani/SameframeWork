SET SIKULIX_HOME=%~dp0%Resources\SikuliX64
SET ProgFiles86Root=%ProgramFiles(x86)%
IF NOT "%ProgFiles86Root%"=="" GOTO amd64
::SET SIKULIX_HOME=%~dp0%Resources\SikuliX86
:amd64
:: Set Variables 
set ANT_HOME=%~dp0%Resources\ant
set PATH=%PATH%;%ANT_HOME%\bin;%~dp0%Resources\allure-cli\bin
set JDK="%ProgramFiles%\Java\jdk*"
for /d %%i in (%JDK%) do set JAVA_HOME=%%i
:: Display Variables and Launch Ant
set JAVA_HOME
echo %ANT_HOME%
echo %PATH%
pushd %~dp0%
Call ant
if not exist "Automation Reports"/Allure/target/allure-results mkdir "Automation Reports"/Allure/target/allure-results
move /Y target\allure-results\*.* "Automation Reports"\Allure\target\allure-results
rmdir /Q /S target
call allure generate "AutAllureomation Reports\Allure\target\allure-results" -o "Automation Reports\Allure\allure-report" -v 1.4.0
pushd "Automation Reports"/
pause