; ####################################################
; ###################### Firefox #####################
; ####################################################


;² + F1 :: launch transmission web interface
SC029 & F1::Run, http://192.168.1.55:7557/tranz/web/


#IfWinActive ahk_class MozillaWindowClass

	; Right+numpad0/Left+numpad0 :: Ctrl+Tab/Ctrl+Shift+Tab
	~Numpad0 & ~Left::send ^+{Tab}
	~Numpad0 & ~Right::send ^{Tab}

	; Up+numpad0/Down+numpad0 :: Alt+Left/Alt+Right
	~Numpad0 & ~Down::send !{Left}
	~Numpad0 & ~Up::send !{Right}

	; Double press on NumpadDot :: right click menu => view image => open it in a new tab (firefox)
	~NumpadDot::
	{
		If (A_PriorHotkey <> A_ThisHotkey or A_TimeSincePriorHotkey > 400)
		{
			; Too much time between presses, so this isn't a double-press.
			KeyWait, %A_ThisHotkey%
			Return
		}
	; When double key press
	Send {RButton} ; Right click
	Sleep, 10 ; Doesn't work without a sleep between the two key
	Send ^{h} ; Ctrl + H => H for view image (french "shortcut") and Ctrl to open in a new tab
	Return
	}

	; Escape :: Ctrl+w (close tab)
	;Esc::^w

#IfWinActive