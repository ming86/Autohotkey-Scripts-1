
; === Constants ===

FIREFOX 		= %A_ProgramFiles% (x86)\Mozilla Firefox\FireFox.exe
FIREFOX_WINDOW 	= Mozilla Firefox ahk_class MozillaWindowClass


MAIL 		= %A_ProgramFiles% (x86)\Mozilla Thunderbird\thunderbird.exe
MAIL_WINDOW = Mozilla Thunderbird ahk_class MozillaWindowClass

;MAIL = C:\Users\%A_UserName%\AppData\Local\Inky\inky.exe
;MAIL_WINDOW = ahk_class Inky
;MAIL_FOLDER = C:\Users\%A_UserName%\AppData\Local\Inky\


; FileZilla with a defined profile (prefixed by "0" for custom entries)
FILEZILLA_NAS 		= %A_ProgramFiles% (x86)\FileZilla FTP Client\filezilla.exe --site=0NAS_int
FILEZILLA 			= %A_ProgramFiles% (x86)\FileZilla FTP Client\filezilla.exe
FILEZILLA_WINDOW 	= FileZilla ahk_class wxWindowClassNR


SPOTIFY 				= %A_AppData%\Spotify\spotify.exe
global G_SPOTIFY_WINDOW:="ahk_class SpotifyMainWindow"


EDITOR 			= %A_ProgramFiles%\Sublime Text 2\sublime_text.exe
EDITOR_WINDOW 	= Sublime Text 2 ahk_class PX_WINDOW_CLASS 


CYGWIN_WINDOW 	= ahk_class mintty
CYGWIN 			= C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
;CYGWIN_FOLDER 	= C:\cygwin\home\%A_UserName%



; === Strings ===

TRASH_TITLE = Corbeille
TRASH_TEXT 	= Vider la corbeille ?

CCLEANER_TITLE	= CCleaner
CCLEANER_TEXT 	= Nettoyer le PC ?



; === Folders paths ===

DL 		= C:\Users\%A_UserName%\Downloads
PERSO 	= D:\Documents\Perso
VIDEOS 	= D:\Vidéos
MUSIQUE = D:\Musique
NAS 	= Z:\
JOBS 	= D:\Documents\Perso\Jobs
POGO 	= Y:\
AHK 	= %A_MyDocuments%\GitHub\Autohotkey-Scripts


; === File Paths ===

; Power management scripts path
SLEEP_  	:= "..\sleep.exe --noconfirm"
STOP_ 		:= "..\stop.exe --noconfirm"
REBOOT_ 	:= "..\reboot.exe --noconfirm"
HIBERNATE_ 	:= "..\hibernate.exe --noconfirm"


; Ressources File Path
R_FILE_PATH = %A_WorkingDir%\ressources.txt


; === OnSaveCompileOrReload vars ===

; Full path of the ahk file that is running / from wich the running exe has been compiled
StringTrimRight, P, A_ScriptFullPath, 3
P .="ahk"
AHK_SCRIPT_PATH := A_IsCompiled ? P : A_ScriptFullPath
P :=""

; Script Name (only used for display)
SCRIPT_NAME = Master

RELOAD_DELAY = 60000

; === Help() Vars ===

TREEVIEW_SHORTCUT_LIST =
