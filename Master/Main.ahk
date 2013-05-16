#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
#Include Constants.ahk
#Include PowerMenu.ahk
#Include Hotstrings.ahk
#Include Functions.ahk
#Include Folders.ahk
#Include FileExplorer.ahk
#Include Spotify.ahk
#Include Firefox.ahk
#Include ShortcutProgram.ahk
; ---------------- End Includes -------------------


; ------------------ Hotkeys ----------------------

; === Insert key  :: Ctrl+W ===
Insert::^w

; Escape :: Ctrl+w (close tab)
Esc::DoublePress(0,"^{w}")

; === CapsLock :: Pause (Key used for displaying Find And Run Robot) ===
Capslock::Send {Pause}


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
; Mute
F9::DoublePress(0, "{Volume_Mute}")


; Sublime text shortcuts
#IfWinActive, ahk_class PX_WINDOW_CLASS

	; View, Layout, Single
	; (on a french azerty keyboard the original 
	; 	shortcut change the keyboard layout, because it contain Alt+Shift)
	^&::Send, !+1

	; View, Layout, columns:2
	; (idem last shortcut)
	^é::Send, !+2

#IfWinActive

; ----------------- End Hotkeys -------------------
