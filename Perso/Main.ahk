#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Icon, Icons/Master.ico ; Icon displayed in the system tray
Menu, TRAY, Tip, Autohotkey ; text displayed when hover over the icon
Menu, TRAY, Add, Reload the script, RLD
; --------------- end System Tray -----------------



; ====== Includes ======

; --- Auto execution section

; Data Management folder, must be in auto execution section
#Include Data/Constants.ahk
#Include Data/SortFilesData.ahk

#Include Data/HelpData.ahk
#Include Data/HotstringsData.ahk
#Include Data/PowerMenu.ahk

;Functions ta run periodically
OnSaveCompileOrReload()
;SortFiles()

Return
; --- End auto execution

#Include Labels.ahk

; Functions folder
#Include Functions/CreateTreeView.ahk
#Include Functions/DoublePress.ahk
#Include Functions/Help.ahk
#Include Functions/LongPress.ahk
#Include Functions/OnSaveCompileOrReload.ahk
#Include Functions/ProgramShortcut.ahk
#Include Functions/SortFiles.ahk


; Hotkeys and Hotstrings files
#Include FileExplorer.ahk
#Include Firefox.ahk
#Include Folders.ahk
#Include Hotstrings.ahk
#Include ShortcutProgram.ahk
#Include Spotify.ahk
#Include SublimeText2.ahk
#Include Thunderbird.ahk



; ====== Hotkeys ======


;@//  Insert :: Ctrl + Shift + T
Insert::Send ^+{T}


;@//  CapsLock :: Pause (Key used for displaying Find And Run Robot)
Capslock::Send {Pause}


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


;@//  AltGr + H :: Show help window
RAlt & h::Help(TREEVIEW_SHORTCUT_LIST)


;@//  Double Press Escape :: Ctrl + W (close tab)
~Esc::DoublePress(0,"^{w}")


;@//  Double Press ² :: Display Power Menu
SC029::DoublePress(1,"ShowPowerMenu")


;@//  Ctrl + < :: Minimize current window 
^<::WinMinimize, A

;@//  AppsKey :: Right Mouse Button
AppsKey::RButton