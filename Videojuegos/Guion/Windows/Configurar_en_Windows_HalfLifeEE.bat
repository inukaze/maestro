@echo off

color A
title Half-Life1
set DIR="%CD%"
set PWD=%CD%\wine\data\drive_c\Juegos\Inukaze\Half-Life-EE
set key1=HKEY_CURRENT_USER\Software\Valve
set key2=HKEY_CURRENT_USER\Software\Valve\Half-Life
set key3=HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings
set key4=HKEY_CURRENT_USER\Software\Valve\Half-Life\valve
set key5=HKEY_CURRENT_USER\Software\Valve\Half-Life\valve\Settings
set key6=HKEY_CURRENT_USER\Software\Valve\Steam

REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop

FOR /F "tokens=2*" %%i in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop^|findstr /C:"REG_SZ" /C:"REG_EXPAND_SZ"') DO SET "DEEE=%%j"

FOR /F "usebackq delims=" %%i in (`ECHO %DEEE%`) DO SET DEEE=%%i
set DEEEDHL1EE=%DEEE%\Half-Life1

echo ===========Configurando el Software=========
echo.
echo Borrando Entradas de Registro
echo Anteriores para evitar Conflictos
(reg delete "%key6%" /f)
(reg delete "%key5%" /f)
(reg delete "%key4%" /f)
(reg delete "%key3%" /f)
(reg delete "%key2%" /f)
(reg delete "%key1%" /f)
echo.
echo ============================================
echo.
echo Agregando Entradas de Registro
echo Para que el Software Funcione Correctamente
(reg add "%key1%" /f)
(reg add "%key2%" /f)
(reg add "%key3%" /f)
(reg add "%key4%" /f)
(reg add "%key5%" /f)
(reg add "%key6%" /f)
(reg add "%key3%" /t REG_DWORD /v CrashInitializingVideoMode /d 0 /f)
(reg add "%key3%" /t REG_DWORD /v EngineD3D /d 0 /f)
(reg add "%key3%" /t REG_SZ /v EngineDLL /d hw.dll /f)
(reg add "%key3%" /t REG_SZ /v io /d "" /f)
(reg add "%key3%" /t REG_DWORD /v ScreenBPP /d 32 /f)
(reg add "%key3%" /t REG_DWORD /v ScreenHeight /d 600 /f)
(reg add "%key3%" /t REG_DWORD /v ScreenWidth /d 800 /f)
(reg add "%key3%" /t REG_DWORD /v ScreenWindowed /d 0 /f)
(reg add "%key3%" /t REG_SZ /v "User Token 2" /d "" /f)
(reg add "%key3%" /t REG_SZ /v "User Token 3" /d "" /f)
(reg add "%key3%" /t REG_SZ /v ValveKey /d AAAAA-AAAAA-AAAAA-AAAAA-AAAAA /f)
(reg add "%key3%" /t REG_SZ /v yeK1 /d A0B8FF7E9183788F769199CA89976F05705483F7CEDBBEE8693B8FA228C58EF63F8BA37D480A765A7DB49811E5BA386B6D214CD687AD585FCD837BD523D8A86410ABC84CC2D0EECF0EFB6820DB3664C2ED313B5FF40A577775E8B96C8B187EC362EF8EC4729864A544849EF39173AB1C30B88803612D2B66A390096322534B /f)
(reg add "%key3%" /t REG_SZ /v yeK2 /d C3A53B015287AC10FA40BA8A80BB7C978BCD3C76804288AB164EC591FE37EDB3E7D401ADC30483F42280D228D9DE74EFA4A15C8206D0 /f)
(reg add "%key5%" /t REG_SZ /v "User Token 2" /d "" /f)
(reg add "%key5%" /t REG_SZ /v "User Token 3" /d "" /f)
(reg add "%key6%" /t REG_SZ /v Language /d spanish /f)
(reg add "%key6%" /t REG_SZ /v Rate /d 3500 /f)
(reg add "%key6%" /t REG_SZ /v Skin /d "" /f)
echo.
echo ============================================

cd "%DEEE%"
if exist     "%DEEEDHL1EE%" ( echo "Verificando que existen los Accesos Directos"
if not exist "%DEEEDHL1EE%\Half-Life 1 - Original.lnk" goto crear_hl1o
if not exist "%DEEEDHL1EE%\Half-Life 1 - Opposing Force.lnk" goto crear_hl1of
if not exist "%DEEEDHL1EE%\Half-Life 1 - Blue Shift.lnk" goto crear_hl1bs
if not exist "%DEEEDHL1EE%\Half-Life 1 - Ricochet.lnk" goto crear_hl1r
if not exist "%DEEEDHL1EE%\Half-Life 1 - Team Fortress Classic.lnk" goto crear_hl1tfc
if not exist "%DEEEDHL1EE%\Half-Life 1 - Deathmatch Classic.lnk" goto crear_hl1dc
if not exist "%DEEEDHL1EE%\Half-Life 1 - Counter Strike.lnk" goto crear_hl1cs
if not exist "%DEEEDHL1EE%\Half-Life 1 - Decay.lnk" goto crear_hl1d
if not exist "%DEEEDHL1EE%\Half-Life 1 - Zombie.lnk" goto crear_hl1z
)

:AccesosDirectos
echo.
cd "%DEEE%"

If NOT exist "%DEEEDHL1EE%" ( echo "Creando Accesos Directos"
    md "%DEEEDHL1EE%"
	cd "%DEEEDHL1EE%"
    goto AccesosDirectos
	echo.
)
echo.

:crear_hl1o
echo "Half-Life 1 - Original"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Original.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\hl.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1of
echo "Half-Life 1 - Opposing Force"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Opposing Force.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game gearbox" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\gearbox\game.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1bs
echo "Half-Life 1 - Blue Shift"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Blue Shift.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game bshift" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\bshift\game.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1r
echo "Half-Life 1 - Ricochet"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Ricochet.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = " -nomaster -game ricochet" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\ricochet\game.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

:crear_hl1tfc
echo "Half-Life 1 - Team Fortress Classic"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Team Fortress Classic.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game tfc" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\tfc\game.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1dc
echo "Half-Life 1 - Deathmatch Classic"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Deathmatch Classic.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game dmc" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\dmc\game.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1cs
echo "Half-Life 1 - Counter Strike"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Counter Strike.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game cstrike" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\cstrike\cstrike.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1d
echo "Half-Life 1 - Decay"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Decay.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game decay" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\decay\Decay.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:crear_hl1z
echo "Half-Life 1 - Zombie"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%DEEEDHL1EE%\Half-Life 1 - Zombie.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\hl.exe" >> %SCRIPT%
echo oLink.Arguments = "-nomaster -game zombie" >> %SCRIPT%
echo oLink.IconLocation = "%PWD%\zombie\zombielogo.ico, 0" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

echo ===========Configurando el Software=========
goto deeedhl1ee

:deeedhl1ee
echo.
start /b %windir%\explorer.exe "%DEEEDHL1EE%"
cd %DIR%
