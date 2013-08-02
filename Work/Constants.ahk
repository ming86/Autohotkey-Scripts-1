
FIREFOX 		= %A_ProgramFiles%\Mozilla Firefox\FireFox.exe
FIREFOX_WINDOW 	= Mozilla Firefox ahk_class MozillaWindowClass


MAIL 		= %A_ProgramFiles%\Mozilla Thunderbird\thunderbird.exe
MAIL_WINDOW = Mozilla Thunderbird ahk_class MozillaWindowClass


FILEZILLA 			= %A_ProgramFiles%\FileZilla FTP Client\filezilla.exe
FILEZILLA_WINDOW 	= FileZilla ahk_class wxWindowClassNR


SPOTIFY 				= %A_AppData%\Spotify\spotify.exe
global G_SPOTIFY_WINDOW:="ahk_class SpotifyMainWindow"


CYGWIN_WINDOW 	= ahk_class mintty
CYGWIN 			= C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
;CYGWIN_FOLDER 	= C:\cygwin\home\%A_UserName%

; MD_EDITOR 			= %A_ProgramFiles%\MarkdownPad 2\MarkdownPad2.exe
; MD_EDITOR_WINDOW 	= MarkdownPad 2 ahk_class HwndWrapper[MarkdownPad2.exe



; === Strings ===

TRASH_TITLE = Corbeille
TRASH_TEXT 	= Vider la corbeille ?

CCLEANER_TITLE	= CCleaner
CCLEANER_TEXT 	= Nettoyer le PC ?


; === Folders paths ===

DL 		= C:\Users\%A_UserName%\Downloads


; === File Paths ===

; Power management scripts path
SLEEP_  	:= "..\sleep.exe --noconfirm"
STOP_ 		:= "..\stop.exe --noconfirm"
REBOOT_ 	:= "..\reboot.exe --noconfirm"
HIBERNATE_ 	:= "..\hibernate.exe --noconfirm"


