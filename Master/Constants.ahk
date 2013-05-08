; ------------------- Constants -------------------
FIREFOX = %A_ProgramFiles% (x86)\Mozilla Firefox\FireFox.exe
FIREFOX_WINDOW = ahk_class MozillaWindowClass

MAIL = C:\Users\Arnaud\AppData\Local\Inky\inky.exe
MAIL_WINDOW = ahk_class Inky
MAIL_FOLDER = C:\Users\Arnaud\AppData\Local\Inky\

; FileZilla with a defined profile (prefixed by "0" for custom entries)
FILEZILLA_NAS = %A_ProgramFiles% (x86)\FileZilla FTP Client\filezilla.exe --site=0NAS_int
FILEZILLA = %A_ProgramFiles% (x86)\FileZilla FTP Client\filezilla.exe
FILEZILLA_WINDOW = FileZilla ahk_class wxWindowClassNR

SPOTIFY = %A_AppData%\Spotify\spotify.exe
global G_SPOTIFY_WINDOW:="ahk_class SpotifyMainWindow"

EDITOR = %A_ProgramFiles%\Sublime Text 2\sublime_text.exe
EDITOR_WINDOW = Sublime Text 2 ahk_class PX_WINDOW_CLASS 

GIT = C:\Users\Arnaud\AppData\Local\Apps\2.0\XDAWOODX.KZ5\G0NGZG56.7OZ\gith..tion_317444273a93ac29_0001.0000_855c896e1f9f6b94\GitHub.exe
GIT_FOLDER = C:\Users\Arnaud\AppData\Local\Apps\2.0\XDAWOODX.KZ5\G0NGZG56.7OZ\gith..tion_317444273a93ac29_0001.0000_855c896e1f9f6b94
GIT_WINDOW = GitHub ahk_class HwndWrapper\[GitHub\.exe.*\] ;regex

CYGWIN_WINDOW = ahk_class mintty
CYGWIN = C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
;CYGWIN_FOLDER = C:\cygwin\home\Arnaud


; -------------------- Strings --------------------
TRASH_TITLE = Corbeille
TRASH_TEXT = Vider la corbeille ?

CCLEANER_TITLE = CCleaner
CCLEANER_TEXT = Nettoyer le PC ?



; ----------------- Folder paths ------------------
DL = C:\Users\Arnaud\Downloads
PERSO = D:\Documents\Perso
VIDEOS = D:\Vidéos
MUSIQUE = D:\Musique
NAS = Z:\
JOBS = D:\Documents\Perso\Jobs
POGO = Y:\
AHK = C:\Users\Arnaud\Documents\GitHub\Utilities


; ---------------- Hotstrings data ----------------

; Read a file with strings to use and put it in the RESSOURCES variable.
; The file must be save as "utf-8 with BOM" if there is accents in the text (French text for example).
; Each string in this file is separated from the other via the "|" character.
FileRead, RESSOURCES, %A_WorkingDir%\ressources.txt

; store parts of the file in TXT# variables
Loop, parse, RESSOURCES ,|,
{
	TXT%A_Index% = %A_LoopField%
}
; free the memory occupied by the variable
RESSOURCES:=""

return