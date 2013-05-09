; ####################################################
; ###################### Firefox #####################
; ####################################################


;² + F1 :: launch transmission web interface
SC029 & F1::Run, http://192.168.1.55:7557/tranz/web/


#IfWinActive ahk_class MozillaWindowClass

	; Right+numpad0/Left+numpad0 :: Ctrl+Tab/Ctrl+Shift+Tab
	~Numpad0 & ~Up::send ^{Tab}
	~Numpad0 & ~Down::send ^+{Tab}
	~Numpad0 & ~Left::send !{Left}
	~Numpad0 & ~Right::send !{Right}

	; Escape :: Ctrl+w (close tab)
	Esc::^w


#IfWinActive