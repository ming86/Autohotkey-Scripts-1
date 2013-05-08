#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


MsgBox, 4148, Mise en veille, Mettre en veille le PC ?
IfMsgBox, Yes
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
Return