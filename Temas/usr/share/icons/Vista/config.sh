#! /bin/bash

# Fonction qui propose une aide
usage () {
    echo "Usage: $(basename $0) [options]
  [EN] Please look for the english help with   --help_en
  [FR] Merci de consulter l'aide en francais avec  --help_fr
"
}

usageFR () {
    echo "Usage: $(basename $0) [options]
[FR] Configuration du thème :
Options: -h, -?, --help    Message invitant a choisir sa langue pour l'aide
         --nocache         Ne pas regénérer le fichier de cache
         --color           vista  |  tango 
                           --color vista : icones vista originales,
                           --color tango : icones recoloriees en bleu tango
         --start           blue | green | white
                           --start blue : menu demarrer bleu vista
                           --start green : menu demarrer vert media center
                           --start white : menu demarrer blanc Windows Live
         --update          windows  |  ubuntu  |  mandriva  |  fedora
                           --update windows : icone \"mise à jour\" windows
                           --update ubuntu : icone \"mise à jour\" ubuntu
                           --update mandriva : icone \"mise à jour\" mandriva
                           --update fedora : icone \"mise à jour\" fedora
         --document-open   normal  |  folder
                           --document-open normal : icone \"ouvrir\" standard
                           --document-open folder : icone \"ouvrir\"= icone folder
         --file-manager    gnomelike  |  folder  |  seven
                           --file-manager gnomelike : icone armoire a dossier
                           --file-manager folder : icone de dossier
                           --file-manager seven : icone de porte dossier explorer
         --app-graphics    vista  |  seven
                           --app-graphics vista : icone de paint dans vista 
                           --app-graphics seven : icone de paint dans seven 
         --app-games       vista  |  seven
                           --app-games vista : icone de jeux dans vista 
                           --app-games seven : icone de jeux dans seven 
         --pref-system     vista  |  seven
                           --pref-system vista : panneau config de vista 
                           --pref-system seven : panneau config de seven 
         --folders         vista  |  seven
                           --folders vista : dossiers speciaux de vista 
                           --folders seven : dossiers speciaux de seven 
         --terminal        command  |  powershell
                           --terminal command : icone de terminal (= en noir)
                           --terminal powershell : icone de powershell (= en bleu)
         --html            default | chrome | chromium | firefox | opera | konqueror | rekonq
                           --html default   : icone de fichier html globe
                           --html chrome    : icone de fichier html chrome
                           --html chromium  : icone de fichier html chromium
                           --html firefox   : icone de fichier html firefox
                           --html opera     : icone de fichier html opera
                           --html konqueror : icone de fichier html konqueror
                           --html rekonq    : icone de fichier html rekonq
"
}

usageEN () {
    echo "Usage: $(basename $0) [options]
[EN] Configuration of the theme :
Options: -h, -?, --help    Message to choose the language
         --nocache         Do not re-generate the cache file
         --color           vista  |  tango
                           --color vista : use originals vista icons,
                           --color tango : use colorized icons in tango blue
         --start           blue | green | white
                           --start blue : use original vista for start menu
                           --start green : use media center for start menu
                           --start white : use Windows Live for start menu
         --update          windows  |  ubuntu  |  mandriva  |  fedora
                           --update windows : update icon in windows color
                           --update ubuntu : update icon in ubuntu color
                           --update mandriva : update icon in mandriva color
                           --update fedora : update icon in fedora color
         --document-open   normal | folder
                           --document-open normal : standard \"open\" icon
                           --document-open folder : \"open\" icon = folder icon
         --file-manager    gnomelike  |  folder  |  seven
                           --file-manager gnomelike : folder's cupboard icon
                           --file-manager fodler : folder icon
                           --file-manager seven : seven explorer's icon 
         --app-graphics    vista  |  seven
                           --app-graphics vista : use vista paint icon 
                           --app-graphics seven : use seven paint icon 
         --app-games       vista  |  seven
                           --app-games vista : use vista games icon 
                           --app-games seven : use seven games icon
         --pref-system     vista  |  seven
                           --pref-system vista : vista configuration pannel 
                           --pref-system seven : seven configuration pannel 
         --folders         vista  |  seven
                           --folders vista : Vista's special folders 
                           --folders seven : Seven's special folders 
         --terminal        command  |  powershell
                           --terminal command : terminal icon (= black)
                           --terminal powershell : powershell icon (= blue)
         --html            default | chrome | chromium | firefox | opera | konqueror | rekonq
                           --html default   : globe html icon file
                           --html chrome    : chrome html icon file
                           --html chromium  : chromimum html icon file
                           --html firefox   : firefox html icon file
                           --html opera     : opera html icon file
                           --html konqueror : konqueror html icon file
                           --html rekonq    : rekonq html icon file
"
}



# Definition des variables utiles
color="disabled"
start="disabled"
update="disabled"
documentopen="disabled"
filemanager="disabled"
appgraphics="disabled"
appgames="disabled"
prefsystem="disabled"
folders="disabled"
terminal="disabled"
html="disabled"

cache="enabled"



# Traitement de parametres invalides
if test $# = 0; then
    echo "Missing options."
    usage; 
    exit 1
fi



# Boucle d'analyse des parametres
while test $# -ne 0; do
    case "$1" in
	# Aide => routage vers une langue
	"--help"|"-h"|"-?")
	    usage
	    exit 0
	    ;;

	# Aide en francais
	"--help_fr")
	    usageFR
	    exit 0
	    ;;

	# Aide en Anglais
	"--help_en")
	    usageEN
	    exit 0
	    ;;

	# Desactive la régénération du cache
	"--nocache")
            cache="disabled"
	    ;;

	# Mode de Couleur
	"--color")
	    shift; 
	    if test "$1" = "tango"; then color="tango";
	    elif test "$1" = "vista"; then color="vista"; 
	    else echo "Unknown parameter \"$1\" for --color"; usage; exit 1; fi
	    ;;

	# Mode de couleur menu demarrer
	"--start")
	    shift; 
	    if test "$1" = "blue"; then start="blue";
	    elif test "$1" = "green"; then start="green"; 
	    elif test "$1" = "white"; then start="white"; 
	    else echo "Unknown parameter \"$1\" for --start"; usage; exit 1; fi
	    ;;
	
	# Mode d'icone update
	"--update")
	    shift; 
	    if test "$1" = "windows"; then update="windows";
	    elif test "$1" = "ubuntu"; then update="ubuntu"; 
	    elif test "$1" = "mandriva"; then update="mandriva"; 
	    elif test "$1" = "fedora"; then update="fedora"; 
	    else echo "Unknown parameter \"$1\" for --update"; usage; exit 1; fi
	    ;;

	# Mode d'icone "open"
	"--document-open")
	    shift;
	    if test "$1" = "normal"; then documentopen="normal";
	    elif test "$1" = "folder"; then documentopen="folder"; 
	    else echo "Unknown parameter \"$1\" for --document-open"; usage; exit 1; fi
	    ;;

	# Mode d'icone "file-amanger"
	"--file-manager")
	    shift;
	    if test "$1" = "gnomelike"; then filemanager="gnomelike";
	    elif test "$1" = "folder"; then filemanager="folder"; 
	    elif test "$1" = "seven"; then filemanager="seven"; 
	    else echo "Unknown parameter \"$1\" for --file-manager"; usage; exit 1; fi
	    ;;

	# Mode d'icone "application-graphics"
	"--app-graphics")
	    shift;
	    if test "$1" = "seven"; then appgraphics="seven";
	    elif test "$1" = "vista"; then appgraphics="vista"; 
	    else echo "Unknown parameter \"$1\" for --app-graphics"; usage; exit 1; fi
	    ;;

	# Mode d'icone "application-games"
	"--app-games")
	    shift;
	    if test "$1" = "seven"; then appgames="seven";
	    elif test "$1" = "vista"; then appgames="vista"; 
	    else echo "Unknown parameter \"$1\" for --app-games"; usage; exit 1; fi
	    ;;

	# Mode d'icone "preferences-system"
	"--pref-system")
	    shift;
	    if test "$1" = "seven"; then prefsystem="seven";
	    elif test "$1" = "vista"; then prefsystem="vista"; 
	    else echo "Unknown parameter \"$1\" for --pref-system"; usage; exit 1; fi
	    ;;

	# Mode d'icone "folders"
	"--folders")
	    shift;
	    if test "$1" = "seven"; then folders="seven";
	    elif test "$1" = "vista"; then folders="vista"; 
	    else echo "Unknown parameter \"$1\" for --folders"; usage; exit 1; fi
	    ;;

	# Mode d'icone "utilities-terminal"
	"--terminal")
	    shift;
	    if test "$1" = "command"; then terminal="command";
	    elif test "$1" = "powershell"; then terminal="powershell"; 
	    else echo "Unknown parameter \"$1\" for --terminal"; usage; exit 1; fi
	    ;;

	# Mode d'icone "html"
	"--html")
	    shift;
	    if test "$1" = "default"; then html="default";
	    elif test "$1" = "chrome"; then html="chrome"; 
	    elif test "$1" = "chromium"; then html="chromium"; 
	    elif test "$1" = "firefox"; then html="firefox"; 
	    elif test "$1" = "opera"; then html="opera"; 
	    elif test "$1" = "konqueror"; then html="konqueror"; 
	    elif test "$1" = "rekonq"; then html="rekonq"; 
	    else echo "Unknown parameter \"$1\" for --html"; usage; exit 1; fi
	    ;;

	# Tous les autres cas
	*)
	    echo "Unknown option \"$1\""
	    usage
	    exit 1
	    ;;
    esac
    shift
done



#-----------------------------------------
#  Debut des parametres
#-----------------------------------------
echo "Start of configuration : "
echo



#-----------------------------------------
#  gestion du parametre   --color
#-----------------------------------------
listefichiers="devices/computer
 devices/video-display
 places/network-workgroup
 categories/preferences-system-network
 apps/preferences-desktop-sound
 apps/preferences-desktop-theme
 apps/checkbox"
#Icone de Computer             : devices/computer
#Icone d'ecran                 : devices/video-display
#Icone de reseau               : places/network-workgroup
#Icone de preferences reseau   : categories/preferences-system-network
#Icone de preferences son      : apps/preferences-desktop-sound
#Icone de theme et apparence   : apps/preferences-desktop-theme
#Icone de test du systeme      : apps/checkbox

if test "$color" != "disabled" ; then
    echo "--color $color :"
    for icone in $listefichiers; do
	for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
            dossier=`echo $icone | cut -d / -f 1`
            fichier=`echo $icone | cut -d / -f 2`
	    if test -f $dossier/$taille/${fichier}_$color.png ; then
		cp -vf $dossier/$taille/${fichier}_$color.png $dossier/$taille/$fichier.png
	    fi
	done
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --start
#-----------------------------------------
if test "$start" != "disabled"; then
    echo "--start $start :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f places/$taille/start-here_$start.png ; then	
	    cp -vf places/$taille/start-here_$start.png places/$taille/start-here.png
	fi
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --update
#-----------------------------------------
if test "$update" != "disabled"; then
    echo "--update $update :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f apps/$taille/system-software-update_$update.png ; then	
	    cp -vf apps/$taille/system-software-update_$update.png apps/$taille/system-software-update.png
	fi
    done
    echo
fi




#-----------------------------------------
#  gestion du parametre   --document-open
#-----------------------------------------
if test "$documentopen" != "disabled"; then
    echo "--document-open $documentopen :"
    if test "$documentopen" = "folder"; then
	for taille in 16x16 24x24 32x32 48x48; do 
	    if test -f places/$taille/folder.png ; then
		cp -vf places/$taille/folder.png actions/$taille/document-open.png
	    fi
	done
    else
	for taille in 16x16 24x24 32x32 48x48; do 
	    if test -f actions/$taille/document-open_normal.png ; then
		cp -vf actions/$taille/document-open_normal.png actions/$taille/document-open.png
	    fi
	done
    fi
    echo
fi




#-----------------------------------------
#  gestion du parametre   --file-manager
#-----------------------------------------
if test "$filemanager" != "disabled"; then
    echo "--file-manager $filemanager :"
    if test "$filemanager" = "folder"; then
        for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	    if test -f places/$taille/folder.png ; then
		cp -vf places/$taille/folder.png apps/$taille/system-file-manager.png
	    fi
        done
    else
        for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	    if test -f apps/$taille/system-file-manager_$filemanager.png ; then	
	        cp -vf apps/$taille/system-file-manager_$filemanager.png apps/$taille/system-file-manager.png
            fi
        done
    fi
    echo
fi




#-----------------------------------------
#  gestion du parametre   --app-graphics
#-----------------------------------------
if test "$appgraphics" != "disabled"; then
    echo "--app-graphics $appgraphics :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f categories/$taille/applications-graphics_$appgraphics.png ; then	
	    cp -vf categories/$taille/applications-graphics_$appgraphics.png categories/$taille/applications-graphics.png
	fi
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --app-games
#-----------------------------------------
if test "$appgames" != "disabled"; then
    echo "--app-games $appgames :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f categories/$taille/applications-games_$appgames.png ; then	
	    cp -vf categories/$taille/applications-games_$appgames.png categories/$taille/applications-games.png
	fi
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --pref-system
#-----------------------------------------
if test "$prefsystem" != "disabled"; then
    echo "--pref-system $prefsystem :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f categories/$taille/preferences-system_$prefsystem.png ; then	
	    cp -vf categories/$taille/preferences-system_$prefsystem.png categories/$taille/preferences-system.png
	fi
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --folders
#-----------------------------------------
listefichiers="user-bookmarks
user-home
folder-documents
folder-download
folder-music
folder-pictures
folder-publicshare
folder-video
folder-saved-search
folder-templates
folder-games
folder-desktop"
#Icone de Favoris             : user-bookmarks
#Icone d' Utilisateur         : user-home
#Icone de Documens            : folder-documents
#Icone de Téléchargements     : folder-download
#Icone de Musique             : folder-music
#Icone d' Images              : folder-pictures
#Icone de Partage Public      : folder-publicshare
#Icone de Videos              : folder-video
#Icone de Recherches          : folder-saved-search
#Icone de Modèles             : folder-templates
#Icone de Jeux                : folder-games  #non standard
#icone de Dossier-Bureau      : folder-desktop  #non standard

if test "$folders" != "disabled"; then
    echo "--folders $folders :"
    for fichier in $listefichiers; do
    	for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	    if test -f places/$taille/${fichier}_$folders.png ; then
		cp -vf places/$taille/${fichier}_$folders.png places/$taille/$fichier.png
	    fi
	done
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --terminal
#-----------------------------------------
if test "$terminal" != "disabled"; then
    echo "--terminal $terminal :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f apps/$taille/utilities-terminal_$terminal.png ; then	
	    cp -vf apps/$taille/utilities-terminal_$terminal.png apps/$taille/utilities-terminal.png
	fi
    done
    echo
fi



#-----------------------------------------
#  gestion du parametre   --html
#-----------------------------------------
if test "$html" != "disabled"; then
    echo "--html $html :"
    for taille in 16x16 24x24 32x32 48x48 Scalable256x256; do 
	if test -f mimetypes/$taille/text-html_$html.png ; then	
	    cp -vf mimetypes/$taille/text-html_$html.png mimetypes/$taille/text-html.png
	fi
    done
    echo
fi



#-----------------------------------------
#  Regénération du cache
#-----------------------------------------
if test "$cache" = "enabled"; then
    echo "re-generation of cache"
    echo
    gtk-update-icon-cache --force .
elif test -f "icon-theme.cache"; then
    echo "Warning: you have an old cache file. You should delete it."
    echo
fi



#-----------------------------------------
#  Fin des parametres
#-----------------------------------------
echo "End of configuration"

