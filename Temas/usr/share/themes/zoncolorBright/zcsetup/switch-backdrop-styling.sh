#!/bin/bash

# zonColor themes: Disable/enable backdrop (unfocused) window styling.
# To see changes, theme must be reloaded (or logout/login).

zcDR=$(dirname "$0"); zcFP=$(cd "$zcDR" && pwd); cd "$zcFP";

ThemeFPDir=$(cd "$zcFP/.." && pwd);
ThemeName=$(basename "$ThemeFPDir");

SystemThemesDir="$HOME/.themes";
SourceTargetFPDir="$SystemThemesDir/$ThemeName/gtk-3.0/style";

Filename_Enable="widget-backdrop.css";
Filename_Disable="widget-backdrop_disabled.css";
Filename_Source="";
Filename_Target="";

String_Enable="Enable";
String_Disable="Disable";
StringEnOrDis="EN_OR_DIS";
StringUsed="";

PromptTitle="$ThemeName GTK Theme";
PromptHead="$StringEnOrDis backdrop styling for '$ThemeName' theme?";
PromptBody="Note: You may need to log out and log back in to see effect.";
PromptFoot="";
PromptString="<big><b>$PromptHead</b></big>\n\n$PromptBody\n\n$PromptFoot";
PromptWin="";
PromptExitcode="";

SwitchPrompt () {
	if (test "$1" = "$String_Enable"); then
		StringUsed="$String_Enable";
		Filename_Source="$Filename_Disable";
		Filename_Target="$Filename_Enable";
	elif (test "$1" = "$String_Disable"); then
		StringUsed="$String_Disable";
		Filename_Source="$Filename_Enable";
		Filename_Target="$Filename_Disable";
	fi;
	PromptStringFinal=$(printf "$PromptString" | sed "s/$StringEnOrDis/$StringUsed/g");
	PromptWin=$(zenity --question --no-wrap --title="$PromptTitle" --text="$PromptStringFinal" 2>/dev/null);
	PromptExitcode=$?;
	case $PromptExitcode in
		0)	mv -f "$SourceTargetFPDir/$Filename_Source" "$SourceTargetFPDir/$Filename_Target"; ;;
		*)	echo -e "\nCancelled.\n"; ;;
	esac;
}

NoCssFilesErrorMsg () {
	NCFErrorMsgHead="Required CSS files not found.";
	NCFErrorMsgBody="Is zonColor GTK-themes installed?";
	NCFErrorMsgFoot="";
	NCFErrorMsgText=$(printf "$NCFErrorMsgHead\n$NCFErrorMsgBody\n$NCFErrorMsgFoot");
	echo "$NCFErrorMsgText";
	zenity --error --no-wrap --text="$NCFErrorMsgText" >/dev/null 2>&1;
}

if (command -v zenity >/dev/null 2>&1); then
	if ((test -f "$SourceTargetFPDir/$Filename_Disable") && \
		(! test -f "$SourceTargetFPDir/$Filename_Enable")); then
		SwitchPrompt "$String_Enable";
	elif ((test -f "$SourceTargetFPDir/$Filename_Enable") && \
		(! test -f "$SourceTargetFPDir/$Filename_Disable")); then
		SwitchPrompt "$String_Disable";
	elif ((test -f "$SourceTargetFPDir/$Filename_Disable") && \
		(test -f "$SourceTargetFPDir/$Filename_Enable")); then
		SwitchPrompt "$String_Disable";
	else
		NoCssFilesErrorMsg;
		exit 1;
	fi;
else
	echo "Unable to show prompt.";
	exit 1;
fi;

exit
