#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ####################################################
; ################# Reboot computer ##################
; ####################################################


IfEqual, 0, 1 ; one parameter passed to the script
{
	IfEqual, 1, --confirm
	{
		MsgBox, 4148, Redémarrage, Redémarrer le PC ?
		IfMsgBox, Yes
			Shutdown, 2
	}
	Else IfEqual, 1, --noconfirm
	{
		Shutdown, 2
	}
	Else
		MsgBox, 4112, Error, Unknown parameter, must be "--noconfirm" or "--confirm".
}
Else
{
	MsgBox, 4112, Error, A parameter is needed, must be "--noconfirm" or "--confirm".
}
return
ExitApp