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
	~NumpadDot::DoublePress(1,"viewImage")

	; Double press on ! :: right click menu => Add to transmission
	~!::DoublePress(1,"addTransmission")

	; Escape :: Ctrl+w (close tab)
	Esc::DoublePress(0,"^{w}")

	; Double press on "ù" => pin tab
	ù::DoublePress(1,"pinTab")

#IfWinActive


; ------- Labels -------- 

; right click menu => view image => open it in a new tab (over an image)
viewImage:
; When double key press
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send ^{h} ; Ctrl + H => H for view image (french "shortcut") and Ctrl to open in a new tab
Return


; right click menu => Add to transmission (firefox extension, over a magnet link or a torrent file)
addTransmission:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {A}
Return


; right click menu => Pin tab (over a tab)
pinTab:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {P}
Return