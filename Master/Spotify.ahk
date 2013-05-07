; ################### Spotify ##################


/*
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
*/



; Spotify window can't be move by the Windows+Left or Windows+Right shortcuts
; these 2 shortcuts recreate this behaviour (for Spotify only here)

#IfWinActive ahk_class SpotifyMainWindow

	; Left :: previous song
	~Left::send ^{Left}

	; Right :: next song
	~Right::send ^{Right}


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