#!/bin/bash

# Fix GTK warning issue on GTK 3.6, saying something like
# "Gtk-WARNING **: Theme parsing error: fm.css:40:15: Not using units is deprecated. Assuming 'px'."

zcFP=$(cd "${0%/*}" && pwd); cd "$zcFP";

ThemeFPDir=$(cd "$zcFP/.." && pwd);
ThemeName=$(basename "$ThemeFPDir");

SystemThemesDir="$HOME/.themes";
SourceTargetFPDir="$SystemThemesDir/$ThemeName/gtk-3.0";

cd "$SourceTargetFPDir";

for CssFile in $(find . -type f -name "*.css"); do
	sed -i 's/0 1 /0 1px /g' $CssFile;
	sed -i 's/0 -1 /0 -1px /g' $CssFile;
done;

exit
