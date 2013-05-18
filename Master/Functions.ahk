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



/*
	=== DoublePress( ActionType, Action ) ===

	If the key is pressed twice in less than 400 ms then :
	If ActionType == 0 : Action is a key or a key combination to press (i.e. "^{Escape}")
	If ActionType == 1 : Action is a label (gosub)
*/

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



/* 
	=== LongPress(Action) ===

	If the key (or key combination) is pressed for more than 1 s then go to the label passed as a parameter ("Action")
	Else send the key (or key combination)
*/

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



/* 
	=== OnSaveCompileOrReload() ===

	Check if any of the files that are included in the main script (all the ahk files of the folder)
	and the main script have been modified, if so reload (if he wasn't running compiled) or recompile and run.

	NB: the idea of renaming the script to be able to compile came from this thread: 
	http://www.autohotkey.com/board/topic/65169-autoreload-script-if-changed-even-compiled-ones/
	wich present a similar script that work for modification on a script, not on its included scripts. 
*/

OnSaveCompileOrReload()
{
	local TimeBefore

	FileDelete, %A_ScriptFullPath%.temp ; remove the temporary file created for the compilation

	Loop, *.ahk
	{
		; get the modification time for all the ahk files in the working directory (%A_WorkingDir%)
		FileGetTime, TimeBefore%A_Index%, %A_LoopFileFullPath%
	}
	SetTimer, CheckState, 60000 ; check for change every minute


	CheckState:
	Loop, *.ahk ; loop for each ahk file in the working dir
	{
		IfNotEqual, TimeBefore%A_Index%, %A_LoopFileTimeModified%
		{
			TrayTip, Autohotkey, The script is reloading, 3
			Sleep 4000 ; let the time for the tray tip to be displayed
			IfEqual, A_IsCompiled, 1
			{
				;It is not possible to compile a running script, but it is possible to rename the running script executable, and then compile the script with its original name. 
				FileMove, %A_ScriptFullPath%, %A_ScriptFullPath%.temp, 1
				; compile the script
				RunWait, %A_ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe /in %AHK_SCRIPT_PATH%
				Run %A_ScriptFullPath%
				Break
			}
			Else 
			{
				Reload ;The script is not compiled
				Break
			}
		}
	}
	Return
}



; === CreateTreeView ===
;
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