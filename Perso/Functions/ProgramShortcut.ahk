
; === function to interact with a defined program window ===
;
; Return values
;					1 if the window was active
;					2 if the window existed
;					3 if the program had to be started


ProgramShortcut(WinClassOrName, ProgramPath, MaxMinHide = "", WorkingDir = "")
{
	IfWinActive %WinClassOrName%
	{
		WinMinimize
		Return "1"
	}
	Else IfWinExist %WinClassOrName%
	{
		WinRestore
		WinMaximize
		Return "2"
	}
	Else
	{
		Run %ProgramPath%, %WorkingDir%, %MaxMinHide%
		Return "3"
	}
}