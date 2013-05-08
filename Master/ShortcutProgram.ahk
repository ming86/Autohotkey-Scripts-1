; ################### Shortcuts for programs window ##################


; === function to interact with a defined program window ===
ProgramShortcut(WinClassOrName, ProgramPath, MaxMinHide = "", WorkingDir = "")
{
IfWinActive %WinClassOrName%
	{
	winMinimize
	}
else IfWinExist %WinClassOrName%
	{
	WinActivate
	WinMaximize
	}
else
	{
	Run %ProgramPath%, %WorkingDir%, %MaxMinHide%
	}
}



; === F1 :: Firefox ===
F1::ProgramShortcut(FIREFOX_WINDOW, FIREFOX, "Max")


; === F10 :: Filezilla with a defined profile ===
F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA_NAS, "Max")

; === "à" & F10 :: Filezilla ===
~SC00B & F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA, "Max")


; === F12 :: Mail (Inky) ===
F12::ProgramShortcut(MAIL_WINDOW, MAIL,, MAIL_FOLDER)


; === Numpad Mult :: Text Editor ===
NumpadMult::ProgramShortcut(EDITOR_WINDOW, EDITOR, "Max")


; === ² & F3 :: Cygwin ===
SC029 & ~F3::ProgramShortcut(CYGWIN_WINDOW, CYGWIN)


;² + F2 :: Github
SC029 & ~F2::
{
	SetTitleMatchMode, RegEx
	ProgramShortcut(GIT_WINDOW, GIT, "Max", GIT_FOLDER)
	return
}


; === Numpad - :: Spotify ===
NumpadSub::
{
DetectHiddenWindows, On
ProgramShortcut(G_SPOTIFY_WINDOW, SPOTIFY)
DetectHiddenWindows, Off
return
}