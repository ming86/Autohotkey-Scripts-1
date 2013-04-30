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

#IfWinActive



; ====| Spotify |====

; function to send controls to Spotify, even if the window is hidden or not in focus
SpotifyControl(key)
{
	DetectHiddenWindows, On 
	ControlSend, ahk_parent, %key%, %G_SPOTIFY_WINDOW%
	DetectHiddenWindows, Off
}

; Ctrl+Left :: previous song
^Left::SpotifyControl("^{Left}")

; Ctrl+Right :: next song
^Right::SpotifyControl("^{Right}") 

; Ctrl+Up :: Pause/Play
^Up::SpotifyControl("{Space}")




; Spotify window can't be move by the Windows+Left or Windows+Right shortcuts
; these 2 shortcuts recreate this behaviour (for Spotify only here)

#IfWinActive ahk_class SpotifyMainWindow

	; === Win+Left :: Maximize the window to the left side of the screen ===
	#Left:: 
	{
	; Window to move
	WinGetPos, WinX, WinY, WinWidth, WinHeight, A
	WinCenter := WinX + (WinWidth / 2)

	; First Monitor
	SysGet, Mon1, MonitorWorkArea, 1
	Mon1Width := Mon1Right - Mon1Left
	Mon1Height := Mon1Bottom - Mon1Top

	; Second Monitor
	SysGet, Mon2, MonitorWorkArea, 2
	Mon2Width := Mon2Right - Mon2Left
	Mon2Height := Mon2Bottom - Mon2Top

	if (WinCenter >= Mon1Left and WinCenter <= Mon1Right) ; Window on the first monitor
	{
		NewX := Mon1Left
		NewWidth := (Mon1Width/2)
		NewY := Mon1Top
		NewHeight := Mon1Height	
	}
	else ; Window on the second monitor
	{ 
	  	NewX := Mon2Left
		NewWidth := (Mon2Width/2)
		NewY := Mon2Top
		NewHeight := Mon2Height
	}
	WinRestore
	WinMove, , , %NewX%, %NewY%, %NewWidth%, %NewHeight%
	return
	}


	; === Win+Right :: Maximize the window to the right side of the screen ===
	#Right:: 
	{
	; Window to move
	WinGetPos, WinX, WinY, WinWidth, WinHeight, A
	WinCenter := WinX + (WinWidth / 2)

	; First Monitor
	SysGet, Mon1, MonitorWorkArea, 1
	Mon1Width := Mon1Right - Mon1Left
	Mon1Height := Mon1Bottom - Mon1Top

	; Second Monitor
	SysGet, Mon2, MonitorWorkArea, 2
	Mon2Width := Mon2Right - Mon2Left
	Mon2Height := Mon2Bottom - Mon2Top

	if (WinCenter >= Mon1Left and WinCenter <= Mon1Right) ; Window on the first monitor
	{
		NewX := (Mon1Width/2)
		NewWidth := (Mon1Width/2)
		NewY := Mon1Top
		NewHeight := Mon1Height	
	} 
	else ; Window on the second monitor
	{ 
	  	NewX := Mon2Right-(Mon2Width/2)
		NewWidth := (Mon2Width/2)
		NewY := Mon2Top
		NewHeight := Mon2Height
	}
	WinRestore
	WinMove, , , %NewX%, %NewY%, %NewWidth%, %NewHeight%
	return
	}
#IfWinActive

; ############### End Shortcuts ###################