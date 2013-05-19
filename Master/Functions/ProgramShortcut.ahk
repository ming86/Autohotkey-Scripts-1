
; === function to interact with a defined program window ===

ProgramShortcut(WinClassOrName, ProgramPath, MaxMinHide = "", WorkingDir = "")
{
	IfWinActive %WinClassOrName%
	{
		WinMinimize
	}
	Else IfWinExist %WinClassOrName%
	{
		WinActivate
		WinMaximize
	}
	Else
	{
		Run %ProgramPath%, %WorkingDir%, %MaxMinHide%
	}
	Return
}