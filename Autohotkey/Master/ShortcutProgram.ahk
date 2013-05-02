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


; === F10 :: Filezilla ===
F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA, "Max")


; === F12 :: Mail (Inky) ===
F12::
{
	ProgramShortcut(MAIL_WINDOW, MAIL,, MAIL_FOLDER)
	Sleep, 5000
	WinGet, state, MinMax, %MAIL_WINDOW%
	IfEqual, state, 0
	{
		WinMaximize, %MAIL_WINDOW%
	}
	Return
}


; === Numpad Mult :: Text Editor ===
NumpadMult::ProgramShortcut(EDITOR_WINDOW, EDITOR)


; === Numpad - :: Spotify ===
NumpadSub::
{
DetectHiddenWindows, On
ProgramShortcut(G_SPOTIFY_WINDOW, SPOTIFY)
DetectHiddenWindows, Off
return
}