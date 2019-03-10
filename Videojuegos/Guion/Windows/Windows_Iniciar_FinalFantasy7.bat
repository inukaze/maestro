@echo off

color A
title Final Fantasy 8
set PWD=%CD%\wine\data\drive_c\software
set key=HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII

#REGEDIT#
[HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.]

[HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII]
"AppPath"="C:\\software\\"
"DataDrive"="D:\\"
"DataPath"="C:\\software\\Data\\"
"DiskNo"=dword:00000000
"FullInstall"=dword:00000001
"MoviePath"="D:\\FF7\\Movies\\"

[HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII\1.00]

[HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII\1.00\Graphics]
"DD_GUID"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
"Driver"=dword:00000003
"DriverPath"="ff7_opengl.fgd"
"Mode"=dword:00000002
"Options"=dword:00000002
#REGEDIT#

echo ===========Configurando el Software=========
echo.
echo Borrando Entradas de Registro
echo Anteriores para evitar Conflictos
(reg delete "%key%" /f)
echo.
echo ============================================
echo.
echo Agregando Entradas de Registro
echo Para que el Software Funcione Correctamente
(reg add "%key%" /f)
echo.
echo ============================================
echo.
echo Estableciendo Configuraciones :
(reg add "%key%" /t REG_DWORD /v InstallOptions /d 255 /f)
(reg add "%key%" /t REG_DWORD /v Graphics /d 1048609 /f)
(reg add "%key%" /t REG_DWORD /v MidiOptions /d 3 /f)
(reg add "%key%" /t REG_DWORD /v SoundOptions /d 4 /f)
(reg add "%key%" /t REG_BINARY /v GraphicsGUID /d 00000000000000000000000000000000 /f)
(reg add "%key%" /t REG_BINARY /v MIDIGUID /d d0b4c258e746d11189ac00a0c9054129 /f)
(reg add "%key%" /t REG_BINARY /v SoundGUID /d 00000000000000000000000000000000 /f)
echo.
echo ============================================
echo.
echo Estableciendo La Ruta de Instalacion en :
echo "%PWD%"
(reg add "%key%" /t REG_SZ /v AppPath /d "%PWD%" /f)
(reg add "%key%" /t REG_SZ /v DataDrive /d "v:" /f)
echo.
echo ===========Configurando el Software=========

cd %PWD%
echo.
echo Iniciando Final Fantasy 7 ...
FF7.exe
echo. 