
; === function to interact with a defined program window ===
;
; Return values
;					1 if the window was active
;					2 if the window existed
;					3 if the program had to be started


ProgramShortcut(WinClassOrName, ProgramPath, MaxMinHide = "", WorkingDir = "")
{
	WinGet, old_win,,A

	IfWinActive %WinClassOrName%
	{
		WinMinimize
		WinActivate, %old_win%
		Return "1"
	}
	Else IfWinExist %WinClassOrName%
	{
		WinActivate
		WinMaximize
		Return "2"
	}
	Else
	{
		Run %ProgramPath%, %WorkingDir%, %MaxMinHide%
		Return "3"
	}
}