﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Icon, Icons/Master.ico ; Icon displayed in the system tray
Menu, TRAY, Tip, Autohotkey ; text displayed when hover over the icon
; --------------- end System Tray -----------------



; ------------------ Includes ---------------------

; Auto execution
	#Include Constants.ahk
	#Include Help.ahk


	; In order to work this call mus be within the "auto execution" section of the script.
	; See Functions.ahk for the code
	OnSaveCompileOrReload()

	#Include PowerMenu.ahk
; End auto execution (Return encoutered in PowerMenu.ahk)

#Include FileExplorer.ahk
#Include Firefox.ahk
#Include Folders.ahk
#Include Functions.ahk
#Include Hotstrings.ahk
#Include ShortcutProgram.ahk
#Include Spotify.ahk
#Include SublimeText2.ahk


; ------------------ Hotkeys ----------------------

;/*** Insert :: Ctrl + W ***/
Insert::^w


;/*** Double Press Escape :: Ctrl + W (close tab) ***/
~Esc::DoublePress(0,"^{w}")


;/*** CapsLock :: Pause (Key used for displaying Find And Run Robot) ***/
Capslock::Send {Pause}


;/*** Numpad Enter :: Middle Click ***/
NumpadEnter::MButton


;/*** Ctrl + Alt + W :: CCleaner (Clean and quit) ***/
^!w::
{
	MsgBox, 4148, %CCLEANER_TITLE%, %CCLEANER_TEXT%
	IfMsgBox, Yes
		Run, CCleaner.exe /AUTO
	Return
}


;/*** Ctrl + Q :: Close window ***/
^q::
{
	; Kill Spotify, not just the window
	IfWinActive, %G_SPOTIFY_WINDOW%
	{
		Send !f
		Send q
	}
	Else Send !{F4}
	Return
}


;/*** Win + T :: Empty trash, for all drives, but ask before ***/
#t::
{
	MsgBox, 4148, %TRASH_TITLE%, %TRASH_TEXT%
	IfMsgBox, Yes, FileRecycleEmpty
	Return
}


;/*** F8 :: Next ***/
F8::Media_Next

;/*** F6 :: Previous ***/
F6::Media_Prev

;/*** F7 :: Play/Pause ***/
F7::Media_Play_Pause


;/*** Double press F9 :: Mute Sound ***/
F9::DoublePress(0, "{Volume_Mute}")


;/*** AltGr + H :: Show help window ***/
RAlt & h::
{
	Gui, Font, s13, Verdana
	Gui, Add, TreeView, H600 W800
	CreateTreeView(TREEVIEW_SHORTCUT_LIST)
	Gui, Show
	Return
}