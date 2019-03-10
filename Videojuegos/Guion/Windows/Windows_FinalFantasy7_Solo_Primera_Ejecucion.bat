@echo off

color A
title Final Fantasy 7
SET SND=
SET MIDI=
set DIR="%CD%"
set PWD=%CD%\wine\data\drive_c\software
set key1=HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII
set key2=HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII\1.00
set key3=HKEY_LOCAL_MACHINE\Software\Square Soft, Inc.\Final Fantasy VII\1.00\Graphics
set key4=HKEY_LOCAL_MACHINE\SOFTWARE\Square Soft, Inc.\Final Fantasy VII\1.00\MIDI
set key5=HKEY_LOCAL_MACHINE\SOFTWARE\Square Soft, Inc.\Final Fantasy VII\1.00\Sound


echo ===========Configurando el Software=========
echo.
echo Borrando Entradas de Registro
echo Anteriores para evitar Conflictos
reg delete "%key1%" /f
echo.
echo ============================================
echo.
echo Agregando Entradas de Registro
echo Para que el Software Funcione Correctamente
reg add "%key1%" /f
reg add "%key2%" /f
reg add "%key3%" /f
reg add "%key4%" /f
reg add "%key5%" /f
echo.
echo ============================================
echo.
echo Estableciendo Configuraciones :
REM +==========================================================================+
REM |   Determinando la Unidad de Disco                                        |
REM |--------------------------------------------------------------------------|
SET ARCHIVO=\ff7\field\char.lgp
REM if ARCHIVO=\sces_009.00 DO echo "FF7 CD1 Espanol PlayStation"
REM if ARCHIVO=\sces_109.00 DO echo "FF7 CD2 Espanol PlayStation"
REM if ARCHIVO=\sces_209.00 DO echo "FF7 CD3 Espanol PlayStation"
REM if ARCHIVO=\slus_008.92 DO echo "FF8 CD1 English PlayStation"
REM if ARCHIVO=\slus_009.08 DO echo "FF8 CD2 English PlayStation"
REM if ARCHIVO=\slus_009.09 DO echo "FF8 CD3 English PlayStation"
REM if ARCHIVO=\slus_009.10 DO echo "FF8 CD4 English PlayStation"
REM if ARCHIVO=\sles_029.69 DO echo "FF9 CD1 Espanol PlayStation"
REM if ARCHIVO=\sles_129.69 DO echo "FF9 CD2 Espanol PlayStation"
REM if ARCHIVO=\sles_229.69 DO echo "FF9 CD3 Espanol PlayStation"
REM if ARCHIVO=\sles_329.69 DO echo "FF9 CD4 Espanol PlayStation"
FOR %%i IN (D E F G H I J K L M N O P Q R S T U V W X Y) DO IF EXIST "%%i:%ARCHIVO%" SET CDROM=%%i:
echo.


reg add "%key1%" /t REG_SZ /v DataDrive /d "%CDROM%\\" /f
reg add "%key1%" /t REG_SZ /v AppPath /d "%PWD%\\" /f
reg add "%key1%" /t REG_SZ /v DataPath /d "%PWD%\Data\\" /f
reg add "%key1%" /t REG_SZ /v MoviePath /d "%CDROM%\FF7\Movies\\" /f
reg add "%key1%" /t REG_DWORD /v DiskNo /d 0 /f
reg add "%key1%" /t REG_DWORD /v FullInstall /d 1 /f
reg add "%key3%" /t REG_BINARY /v DD_GUID /d 00000000000000000000000000000000 /f
reg add "%key3%" /t REG_SZ /v DriverPath /d ff7_opengl.fgd /f
reg add "%key3%" /t REG_DWORD /v Driver /d 3 /f
reg add "%key3%" /t REG_DWORD /v Mode /d 2 /f
reg add "%key3%" /t REG_DWORD /v Options /d 2 /f
reg add "%key4%" /t REG_DWORD /v MIDI_DeviceID /d 0 /f
echo.
echo "Puedes Intentar Utilizar Los Dispositivos MIDIS :"
echo "GENERAL_MIDI o YAMAHA_XG"
echo.
reg add "%key4%" /t REG_SZ /v MIDI_data /d "GENERAL MIDI" /f
echo.
echo "Recomiendo el Volumen valor 100 (64 BIN) para GENERAL MIDI"
echo "Recomiendo el Volumen valor 150 (96 BIN) para YAMAGA XG"
echo.
reg add "%key4%" /t REG_DWORD /v MusicVolume /d 100 /f
reg add "%key4%" /t REG_DWORD /v Options /d 1 /f
reg add "%key5%" /t REG_BINARY /v Sound_GUID /d 1ad76dbdeb3dd111b17100c04fc20001 /f
reg add "%key5%" /t REG_DWORD /v Options /d 0 /f
reg add "%key5%" /t REG_DWORD /v SFXVolume /d 100 /f
echo.
echo ============================================
echo.
echo La Unidad de Disco es "%CDROM%"
echo Establecida La Ruta de Instalacion en :
echo "%PWD%"
echo.
echo ===========Configurando el Software=========

cd %PWD%
echo.
echo Iniciando Final Fantasy 7 ...
FF7.exe
echo. 