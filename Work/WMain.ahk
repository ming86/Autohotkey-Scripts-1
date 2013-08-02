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
#Include Constants.ahk
#Include ../Perso/Data/PowerMenu.ahk
Return
; --- End auto execution

#Include Labels.ahk
#Include ShortcutProgram.ahk
#Include Hotstrings.ahk

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






#IfWinActive, ahk_class CabinetWClass


	;@//  Ctrl + E :: Toggle file extension

	; registry key : [HKEY_CURRENT_USER\Software\Microsoft\Windows\Curre ntVersion\Explorer\Advanced] => HideFileExt
	; values : 0 => show, 1=> do not show
	^e::
	{
		RegRead, hide_ext, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
		IfEqual, hide_ext, 1
		{
			RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
		}
		Else
		{
			RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
		}
		;Sleep, 300
		Send {F5}
		Return
	}


	;@//  Ctrl + H :: Toggle hidden files

	; registry key : [HKEY_CURRENT_USER\Software\Microsoft\Windows\Curre ntVersion\Explorer\Advanced] => Hidden
	; values : 1 => Show, 2 => do not show
	^h::
	{
		RegRead, hide_ext, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
		IfEqual, hide_ext, 1
		{
			RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
		}
		Else
		{
			RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
		}
		;Sleep, 300
		Send {F5}
		Return
	}


	;@//  Numpad0 + Up :: Alt+Up (Parent folder)
	~Numpad0 & ~Up::Send !{Up}


	;@//  Double Press * :: Display file properties
	~*::DoublePress(1,"properties")

	;@//  Double Press + :: Auto Resize Columns (list view)
	~NumpadAdd::DoublePress(0,"^{NumpadAdd}")


	;@//  Toggle navigation pane
	#a::
	{
		Send {F3}
		Sleep 100
		Send {Tab}
		Sleep 100
		Send {Down}
		Sleep 100
		Send d
		Send {v 3}
		Send {Enter}
		Return
	}

#IfWinActive


#IfWinActive Mozilla Firefox ahk_class MozillaWindowClass

	;@//  Right+numpad0 / Left+numpad0 :: Ctrl+Tab / Ctrl+Shift+Tab
	~Numpad0 & ~Left::send ^+{Tab}
	~Numpad0 & ~Right::send ^{Tab}

	;@//  Up+Numpad0 / Down+Numpad0 :: Alt+Left / Alt+Right
	~Numpad0 & ~Down::send !{Left}
	~Numpad0 & ~Up::send !{Right}

	;@//  Double press NumpadDot :: right click menu => view image => open in a new tab
	~NumpadDot::DoublePress(1,"viewImage")


	;@//  Double press Escape :: Ctrl+w (close tab)
	~Esc::DoublePress(0,"^{w}")

	;@//  Double press "=" :: Ctrl+w (close tab)
	~=::DoublePress(0,"^{w}")	

	;@//  Double press "ù" :: Pin tab
	~ù::DoublePress(1,"pinTab")

	;@// Double Press "$" :: Unpin Tab
	~$::DoublePress(1,"unPinTab")


#IfWinActive