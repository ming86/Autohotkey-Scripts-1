; ####################################################
; #################### Functions #####################
; ####################################################


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


; === If the key is pressed twice in less than 400 ms then goto the label passed as a parameter ("GoToAction") ===
DoublePress(GoToAction)
{
	If (A_PriorHotkey <> A_ThisHotkey or A_TimeSincePriorHotkey > 400)
	{
		; Too much time between presses, so this isn't a double-press.
		KeyWait, %A_ThisHotkey%
		Return
	}
	; When double key press
	Gosub, %GoToAction%
	Return
}


; === If the key (or key combination) is pressed for more than 1 s then goto the label passed as a parameter ("GoToAction")
;     else send the key (or key combination) ===
LongPress(GoToAction)
{
	start := A_TickCount
	KeyWait, %A_ThisHotkey%
	If (A_TickCount - start) > 1000
	{
		goto %GoToAction%
	}
	Else
	{
		Send {%A_ThisHotkey%}
	}
	return
}