@echo off

color A
title Call Of Duty 1
set DIR="%CD%"
set PWD=%CD%\wine\data\drive_c\software
C:
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop

FOR /F "tokens=2*" %%i in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop^|findstr /C:"REG_SZ" /C:"REG_EXPAND_SZ"') DO SET "DESKTOPDIR=%%j"

FOR /F "usebackq delims=" %%i in (`ECHO %DESKTOPDIR%`) DO SET DESKTOPDIR=%%i

set CARPETAESCRITORIO=%DESKTOPDIR%\Call Of Duty


REM Configurando Registro :
echo ===========Configurando el Software=========
echo.
REM +==========================================================================+
REM |   Determinando la Unidad de Disco                                        |
REM |--------------------------------------------------------------------------|
SET ARCHIVO=\Setup\Data\main\pak5.pk3
FOR %%i IN (D E F G H I J K L M N O P Q R S T U V W X Y) DO IF EXIST "%%i:%ARCHIVO%" SET CDROM=%%i:
echo.


set key0=HKEY_LOCAL_MACHINE\SOFTWARE\Activision
set key1=HKEY_LOCAL_MACHINE\SOFTWARE\Activision\Call of Duty
(reg delete "%key1%" /f)
(reg add "%key0%" /f)
(reg add "%key1%" /f)
(reg add "%key1%" /t REG_SZ /v codkey /d D4DK4EW4STPWEXD48B09 /f)
(reg add "%key1%" /t REG_SZ /v InstallPath /d %PWD% /f)
(reg add "%key1%" /t REG_SZ /v InstallDrive /d %CDROM% /f)
(reg add "%key1%" /t REG_SZ /v Language /d SP /f)
(reg add "%key1%" /t REG_SZ /v StartMenuFolder /d %PWD /f)
(reg add "%key1%" /t REG_SZ /v Version /d 1.5 /f)

echo.
echo ============================================
echo.
echo Estableciendo La Ruta de Instalacion en :
echo "%PWD%"
echo.
echo ===========Configurando el Software=========
echo.
echo Carpeta en el Escritorio = %DESKTOPDIR%
echo %CARPETAESCRITORIO%


cd "%DESKTOPDIR%"
if exist     "%CARPETAESCRITORIO%" ( echo.
if not exist "%CARPETAESCRITORIO%\Call Of Duty 1 - Un Solo Jugador.lnk" goto make_codsp
if not exist "%CARPETAESCRITORIO%\Call Of Duty 2 - Multijugador.lnk" goto make_codmp
)

:shortcuts
echo.
echo "Creando Directorio"
cd "%DESKTOPDIR%"
echo "Creando Accesos Directos"

If NOT exist "%CARPETAESCRITORIO%" (
    md "%CARPETAESCRITORIO%"
    cd "%CARPETAESCRITORIO%"
    goto shortcuts
    echo.
)
echo.

:make_codsp
echo "Call Of Duty 1 - Un Solo Jugador"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%CARPETAESCRITORIO%\Call Of Duty 1 - Un Solo Jugador.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\CoDSP.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:make_codmp
echo "Call Of Duty 2 - Multijugador"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%CARPETAESCRITORIO%\Call Of Duty 2 - Multijugador.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\CoDMP.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

echo ===========Configuring Software=========
echo.
goto COD1



:COD1
echo.
start /b %windir%\explorer.exe "%CARPETAESCRITORIO%"