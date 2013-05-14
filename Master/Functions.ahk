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


; === DoublePress( ActionType, Action ) ===
;
; If the key is pressed twice in less than 400 ms then :
; 		If ActionType == 0 : Action is a key to press (with the {}, for example "{Escape}" )
; 		If ActionType == 1 : Action is a label (gosub)

DoublePress(ActionType,Action)
{
	If (A_PriorHotkey <> A_ThisHotkey or A_TimeSincePriorHotkey > 400)
	{
		; Too much time between presses, so this isn't a double-press.
		KeyWait, %A_ThisHotkey%
		Return
	}

	IfEqual, ActionType, 1
	{
		Gosub, %Action%
	}
	Else IfEqual, ActionType, 0
	{
		Send, %Action%
	}
	Return
}


; === LongPress(GoToAction) ===
;
; If the key (or key combination) is pressed for more than 1 s then go to the label passed as a parameter ("Action")
; Else send the key (or key combination)

LongPress(Action)
{
	start := A_TickCount
	KeyWait, %A_ThisHotkey%
	If (A_TickCount - start) > 1000
	{
		Gosub, %Action%
	}
	Else
	{
		Send {%A_ThisHotkey%}
	}
	return
}