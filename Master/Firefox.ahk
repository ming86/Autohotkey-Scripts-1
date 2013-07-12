; ####################################################
; ###################### Firefox #####################
; ####################################################


;@//  ² + F1 :: launch transmission web interface
SC029 & F1::Run, http://192.168.1.55:7557/tranz/web/


#IfWinActive Mozilla Firefox ahk_class MozillaWindowClass

	;@//  Right+numpad0 / Left+numpad0 :: Ctrl+Tab / Ctrl+Shift+Tab
	~Numpad0 & ~Left::send ^+{Tab}
	~Numpad0 & ~Right::send ^{Tab}

	;@//  Up+Numpad0 / Down+Numpad0 :: Alt+Left / Alt+Right
	~Numpad0 & ~Down::send !{Left}
	~Numpad0 & ~Up::send !{Right}

	;@//  Double press NumpadDot :: right click menu => view image => open in a new tab
	~NumpadDot::DoublePress(1,"viewImage")

	;@//  Double press on ! :: right click menu => Add to transmission
	~!::DoublePress(1,"addTransmission")

	;@//  Double press Escape :: Ctrl+w (close tab)
	~Esc::DoublePress(0,"^{w}")

	;@//  Double press "=" :: Ctrl+w (close tab)
	=::DoublePress(0,"^{w}")	

	;@//  Double press "ù" :: Pin tab
	ù::DoublePress(1,"pinTab")

	;@// Double Press "$" :: Unpin Tab
	~$::DoublePress(1,"unPinTab")


#IfWinActive