#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ####################################################
; ################ Hibernate computer ################
; ####################################################


IfEqual, 0, 1 ; one parameter passed to the script
{
	IfEqual, 1, --confirm
	{
		MsgBox, 4148, Mise en veille prolongée, Mettre en veille prolongée le PC ?
		IfMsgBox, Yes
		DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
	}
	Else IfEqual, 1, --noconfirm
	{
		DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
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