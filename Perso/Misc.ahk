; ====== Misc. Hotkeys ======


;@//  CapsLock :: Pause (Key used for displaying Find And Run Robot)
Capslock::SendInput {Pause}


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
		SendInput !f
		Sleep 50
		SendInput q
		Return
	}
	; do nothing if on the desktop or the taskbar
	Else If WinActive("ahk_class WorkerW") or WinActive("ahk_class Shell_TrayWnd") or WinActive("ahk_class Progman")
	{
		Return
	}
	Else SendInput !{F4}
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
~F9::DoublePress(0, "{Volume_Mute}")



;@//  Double Press Escape :: Ctrl + W (close tab)
~Esc::DoublePress(0,"^{w}")


;@//  Double Press ² :: Display Power Menu
SC029::DoublePress(1,"ShowPowerMenu")


;@//  Ctrl + < :: Minimize current window 
; ^<::WinMinimize, A

;@//  AppsKey :: Right Mouse Button
AppsKey::RButton