#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Tip, Work
; --------------- end System Tray -----------------


; ====== Includes ======

; --- Auto execution section
#Include ../Perso/Data/Constants.ahk
#Include ../Perso/Data/PowerMenu.ahk
Return
; --- End auto execution

#Include ../Perso/Labels.ahk
#Include W_ShortcutProgram.ahk
#Include W_Hotstrings.ahk
#Include ../Perso/FileExplorer.ahk
#Include ../Perso/Firefox.ahk
#Include ../Perso/Thunderbird.ahk


; Functions folder
#Include ../Perso/Functions/DoublePress.ahk
#Include ../Perso/Functions/LongPress.ahk
#Include ../Perso/Functions/ProgramShortcut.ahk



;@//  Numpad Enter :: Middle Click
NumpadEnter::MButton


;@//  Ctrl + Alt + W :: CCleaner (Clean and quit)
^!w::
{
	MsgBox, 4148, %CCLEANER_TITLE%, %CCLEANER_TEXT%
	IfMsgBox, Yes
		Run, CCleaner.exe /AUTO
	Return
}


;@//  Ctrl + Q :: Close window
^q::
{
	; Kill Spotify, not just the window
	IfWinActive, %G_SPOTIFY_WINDOW%
	{
		Send ^l
		Sleep 150
		Send {Tab}
		Sleep 150
		Send {Alt}
		Sleep 150
		Send q
		Return
	}
	; do nothing if on the desktop
	Else IfWinActive, ahk_class WorkerW
	{
		Return
	}
	; do nothing if on the taskbar
	Else IfWinActive, ahk_class Shell_TrayWnd
	{
		Return
	}
	Else Send !{F4}
	Return
}


;@//  Win + T :: Empty trash, for all drives, but ask before
#t::
{
	MsgBox, 4148, %TRASH_TITLE%, %TRASH_TEXT%
	IfMsgBox, Yes, FileRecycleEmpty
	Return
}


;@//  F8 :: Next
F8::Media_Next

;@//  F6 :: Previous
F6::Media_Prev

;@//  F7 :: Play/Pause
F7::Media_Play_Pause


;@//  Double press F9 :: Mute Sound
F9::DoublePress(0, "{Volume_Mute}")


;@//  Double Press Escape :: Ctrl + W (close tab)
~Esc::DoublePress(0,"^{w}")


;@//  Double Press ² :: Display Power Menu
SC029::DoublePress(1,"ShowPowerMenu")


;@//  Ctrl + < :: Minimize current window 
^<::WinMinimize, A