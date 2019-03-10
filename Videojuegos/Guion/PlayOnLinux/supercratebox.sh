#!/bin/bash
# Fecha : (06 Junio 2015)
# Distro : Manjaro Linux 64-bit
# Autor : Inukaze ( http://https://goo.gl/ij6WqW / http://www.dailymotion.com/inukaze )
# Licencia : GPL v2
# PlayOnLinux: 4.2.8
   
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
 
GAME_VMS="64"
AUTHOR="Vlambeer"
WINEVERSION="1.7.22"
TITLE="Super Crate Box"
PREFIX="Super_Crate_Box"
GAME_URL="http://supercratebox.com/"
DOWNLOAD_GAME="http://www.supercratebox.com/download/supercratebox.rar"
 
POL_SetupWindow_Init
type -p 7z || POL_Debug_Fatal "$(eval_gettext 'Game Extract failed (Missing 7-zip).')"
POL_Debug_Init
 
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WINEVERSION"
 
POL_Call POL_Install_dsound
POL_Call POL_Install_dinput
POL_Call POL_Install_directmusic
rm -rf "$WINEPREFIX/drive_c/SuperCrateBox"
mkdir -p "$WINEPREFIX/drive_c/SuperCrateBox"
cd "$WINEPREFIX/drive_c/SuperCrateBox"
POL_Download $DOWNLOAD_GAME 962d90ba1aa0e8095f2cbfd2940c5858
 
7z x supercratebox.rar
[ -s supercratebox.exe ] || POL_Debug_Fatal "$(eval_gettext 'Game Extract failed (Missing 7-zip unRAR module).')"
 
POL_SetupWindow_VMS $GAME_VMS
POL_Wine_Direct3D "OffscreenRenderingMode" "pbuffer"
POL_Wine_Direct3D "UseGLSL" "disabled"
POL_Shortcut "supercratebox.exe" "$TITLE" "$TITLE.png"
 
POL_SetupWindow_Close
 
exit 0
