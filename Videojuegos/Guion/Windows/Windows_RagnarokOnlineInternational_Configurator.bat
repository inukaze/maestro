@echo off

color A
title Ragnarok International
set DIR="%CD%"
set PWD=%CD%\wine\data\drive_c\software

C:

REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop

FOR /F "tokens=2*" %%i in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop^|findstr /C:"REG_SZ" /C:"REG_EXPAND_SZ"') DO SET "DESKTOPDIR=%%j"

FOR /F "usebackq delims=" %%i in (`ECHO %DESKTOPDIR%`) DO SET DESKTOPDIR=%%i
set IRODIR=%DESKTOPDIR%\Ragnarok International

echo ===========Configuring Software=========
echo.

cd "%DESKTOPDIR%"
if exist 	 "%IRODIR%" ( echo "Veryfing If Shortcuts Exist"
if not exist "%IRODIR%\Ragnarok Classic.lnk" goto make_icr
if not exist "%IRODIR%\Classic Setup.lnk" goto make_ics
if not exist "%IRODIR%\Setup.lnk" goto make_setup
if not exist "%IRODIR%\Ragnarok Replay.lnk" goto make_replay
if not exist "%IRODIR%\Ragnarok.lnk" goto make_ragnarok
)

:shortcuts
echo.
cd "%DESKTOPDIR%"

If NOT exist "%IRODIR%" ( echo "Making Shotcuts"
    md "%IRODIR%"
	cd "%IRODIR%"
    goto shortcuts
	echo.
)
echo.

:make_icr
echo "Ragnarok Classic"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%IRODIR%\Ragnarok Classic.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\ClassicRO.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:make_ics
echo "Classic Setup"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%IRODIR%\Classic Setup.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\Setup_Classic.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:make_setup
echo "Setup"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%IRODIR%\Setup.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\Setup.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

:make_replay
echo "Ragnarok Replay"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%IRODIR%\Ragnarok Replay.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\Ragexe.exe" >> %SCRIPT%
echo oLink.Arguments = "1rag1 Replay" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

:make_ragnarok
echo "Ragnarok"
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%IRODIR%\Ragnarok.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%PWD%\Ragnarok.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%PWD%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.

echo ===========Configuring Software=========
goto iro

:iro
echo.
REM ;start /b %PWD%\Setup.exe
REM ;start /b %PWD%\Setup_Classic.exe
start /b %windir%\explorer.exe "%IRODIR%"
exit
echo. 