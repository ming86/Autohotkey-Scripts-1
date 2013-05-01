#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Icon, favicon.ico ; Icon displayed in the system tray
Menu, TRAY, Tip, Autohotkey ; text displayed when hover over the icon
; --------------- end System Tray -----------------



#Include Constants.ahk
#Include Hotstrings.ahk
#Include Folders.ahk
#Include Spotify.ahk



; === CapsLock :: Pause (Key used for displaying Find And Run Robot) ===
Capslock::Send {Pause}

; === ² :: numpad+ ===
SC029::NumpadAdd

; === numpad Enter :: Middle Click ===
NumpadEnter::MButton


; === CCleaner (Clean and quit) ===
^!w::
{
MsgBox, 4148, %CCLEANER_TITLE%, %CCLEANER_TEXT%
IfMsgBox, Yes
	Run, CCleaner.exe /AUTO
return
}

; === Ctrl+q :: Close programs ===
^q::
{
; Kill Spotify, not just the window
IfWinActive, %G_SPOTIFY_WINDOW%
	{
	Send !f
	Send q
	}
else ; Close the window
	{
	Send !{F4}
	}
return
}


; === Win+t :: Empty trash, for all drives, but ask before ===
#t::
{
MsgBox, 4148, %TRASH_TITLE%, %TRASH_TEXT%
IfMsgBox, Yes, FileRecycleEmpty
return
}


; === Media Keys ===
; Next
F8::Media_Next
; Previous
F6::Media_Prev
; Play/Pause
F7::Media_Play_Pause



; === shortcut for program windows function ===
ProgramShortcut(WinClassOrName, ProgramPath, MaxMinHide = "", WorkingDir = "")
{
IfWinActive %WinClassOrName%
	{
	winMinimize
	}
else IfWinExist %WinClassOrName%
	{
	WinActivate
	WinMaximize
	}
else
	{
	Run %ProgramPath%, %WorkingDir%, %MaxMinHide%
	}
}



; === F1 :: Firefox ===
F1::ProgramShortcut(FIREFOX_WINDOW, FIREFOX, "Max")

; === F10 :: Filezilla ===
F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA, "Max")

; === F12 :: Mail (Inky) ===
F12::ProgramShortcut(MAIL_WINDOW, MAIL,, MAIL_FOLDER)

; === Numpad Mult :: Text Editor ===
NumpadMult::ProgramShortcut(EDITOR_WINDOW, EDITOR)

; === Numpad - :: Spotify ===
NumpadSub::
{
DetectHiddenWindows, On
ProgramShortcut(G_SPOTIFY_WINDOW, SPOTIFY)
DetectHiddenWindows, Off
return
}


; ====| Firefox |====
#IfWinActive ahk_class MozillaWindowClass

	; Right+numpad0/Left+numpad0 :: Ctrl+Tab/Ctrl+Shift+Tab
	~Numpad0 & ~Up::send ^{Tab}
	~Numpad0 & ~Down::send ^+{Tab}
	~Numpad0 & ~Left::send !{Left}
	~Numpad0 & ~Right::send !{Right}

	; Escape :: Ctrl+w (close tab)
	Esc::^w




; I use clover as replacement for the default file explorer, "ahk_class CabinetWClass" is it's autohotkey window class.
; to work with the default explorer this value must be changed
#IfWinActive, ahk_class CabinetWClass

	; === Ctrl+h :: Toggle file extension in explorer ===
	;
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


	; === Ctrl+h :: Toggle hidden files in explorer ===
	;
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

#IfWinActive