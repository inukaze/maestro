#!/bin/bash
# ===================================================================
# zonColor Themes Pack Project - http://www.fandigital.com
# Beautiful themes, your own colors, unlimited!
# -------------------------------------------------------------------
# Copyright (C) Zon Saja <zonsaja@gmail.com>
# ===================================================================

# About script
zcBN=$(basename "$0"); zcDR=$(dirname "$0"); zcFP=$(cd "$zcDR" && pwd);
if (test -z "$zcCaller"); then zcCaller=$(ps ax | grep "^ *$PPID" | awk '{print $NF}'); fi;

# Internal variables
ThemeFolderFP=$(cd "$zcFP/.." && pwd);
ThemeName=$(basename "$ThemeFolderFP");
SourceDir=$(cd "$zcFP/../.." && pwd);


# EXECUTION

source "$zcFP"/srcscr;

if (test "$1" = "$ResetAllString"); then
	ResetAllGtkThemes;
else
	CheckAndSetupTheme;
	EnableGtkTheme;
fi;

exit
