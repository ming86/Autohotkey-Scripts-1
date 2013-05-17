; ####################################################
; #################### Functions #####################
; ####################################################


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


; === DoublePress( ActionType, Action ) ===
;
; If the key is pressed twice in less than 400 ms then :
; 		If ActionType == 0 : Action is a key or a key combination to press (with the {}, for example "^{Escape}" )
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
		Gosub, %Action%
	Else IfEqual, ActionType, 0
		Send, %Action%
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
		Gosub, %Action%
	Else
		Send {%A_ThisHotkey%}
	Return
}



; Creates TreeView from a string in which each item is placed in new line and hierarchy is defined by Tab character on the left.
; Item options can be added after one or more Tab characters after item name.
; This function is public domain.
;
; ====> Function created by "Learning one", see http://www.autohotkey.com/board/topic/92863-function-createtreeview/ for more informations

CreateTreeView(TreeViewDefinitionString) {	; by Learning one
	IDs := {} 
	Loop, parse, TreeViewDefinitionString, `n, `r
	{
		if A_LoopField is space
			continue
		Item := RTrim(A_LoopField, A_Space A_Tab), Item := LTrim(Item, A_Space), Level := 0
		While (SubStr(Item,1,1) = A_Tab)
			Level += 1,	Item := SubStr(Item, 2)
		RegExMatch(Item, "([^`t]*)([`t]*)([^`t]*)", match)	; match1 = ItemName, match3 = Options
		if (Level=0)
			IDs["Level0"] := TV_Add(match1, 0, match3)
		else
			IDs["Level" Level] := TV_Add(match1, IDs["Level" Level-1], match3)
	}
}	; http://www.autohotkey.com/board/topic/92863-function-createtreeview/