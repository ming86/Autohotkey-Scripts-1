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
	~NumpadDot::DoublePress("viewImage")

	; Double press on ! :: right click menu => Add to transmission
	~!::DoublePress("addTransmission")

	; Escape :: Ctrl+w (close tab)
	;Esc::^w

#IfWinActive


; ------- Labels -------- 

; right click menu => view image => open it in a new tab (firefox)
viewImage:
; When double key press
Send {RButton} ; Right click
Sleep, 10 ; Doesn't work without a sleep between the two key
Send ^{h} ; Ctrl + H => H for view image (french "shortcut") and Ctrl to open in a new tab
Return


; right click menu => Add to transmission (firefox extension)
addTransmission:
Send {RButton} ; Right click
Sleep, 10 ; Doesn't work without a sleep between the two key
Send {A}
Return