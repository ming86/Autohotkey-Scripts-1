#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2

;===================================================================================
; ======= Change the program used when "right click > edit" on an ahk script =======
;===================================================================================

; must be run as admin, otherwise the value is not changed (at least on windows 8, not tested on other versions)
If not A_IsAdmin
{
	MsgBox, 4112, Error, This script must be run as Admin to change the registry value.
}
Else
{
	inputEntry: ; label for the case where the program does not exist
	; Prompt the user for a program path
	InputBox, entry, Change Autohotkey "edit" program, Change Autohotkey files right click "edit" program.  `n `n `n Program path (Whitout the `%1) :

	If not ErrorLevel ; if cancel is pressed then the script exit
	{	
		IfExist, %entry% ; If the path entered is valid
		{
			RegRead, ahk_editor, HKCR, AutoHotkeyScript\Shell\Edit\Command ; read the registry value

			IfNotEqual, ahk_editor, %entry% `%1 ;compare with the entered value
			{
				; if different then ask what to do
				MsgBox, 4132, Autohotkey "edit",Registry value : %ahk_editor% `n `n Change this value for : %entry% ?
				IfMsgBox, Yes ; If Yes then write the registry value
					RegWrite, REG_SZ, HKCR, AutoHotkeyScript\Shell\Edit\Command, ,%entry% `%1
			}
			Else ; The program entered is already the one used
			{
				MsgBox, 4160, Same value, The registry value is already set with the path you entered.
			}
		}
		Else ; The path entered is invalid
		{
			MsgBox, 4112, Error, This program does not exist.
			Goto, inputEntry ; jump to the inputEntry label
		}
	}
}
Return

ExitApp