; ####################################################
; ###################### Firefox #####################
; ####################################################


;@//  ² + F1 :: launch transmission web interface
SC029 & F1::Run, http://192.168.1.55:7557/tranz/web/


#IfWinActive Mozilla Firefox ahk_class MozillaWindowClass

	;@//  Right+numpad0 / Left+numpad0 :: Ctrl+Tab / Ctrl+Shift+Tab
	~Numpad0 & ~Left::SendInput, ^+{Tab}
	~Numpad0 & ~Right::SendInput, ^{Tab}

	;@//  Up+Numpad0 / Down+Numpad0 :: Alt+Left / Alt+Right
	~Numpad0 & ~Down::SendInput, !{Left}
	~Numpad0 & ~Up::SendInput, !{Right}

	;@//  Double press NumpadDot :: right click menu => view image => open in a new tab
	~NumpadDot::DoublePress(1,"viewImage")

	;@//  Double press on ! :: right click menu => Add to transmission
	~!::DoublePress(1,"addTransmission")

	;@//  Double press Escape :: Ctrl+w (close tab)
	~Esc::DoublePress(0,"^{w}")

	;@//  Double press "=" :: Ctrl+w (close tab)
	~=::DoublePress(0,"^{w}")	

	;@//  Double press "ù" :: Pin tab
	~ù::DoublePress(1,"pinTab")

	;@// Double Press "$" :: Unpin Tab
	~$::DoublePress(1,"unPinTab")


	;@//  "Delete" + "End" :: Ctrl+Shift+t
	~Delete & ~End::SendInput, ^+t
	
	;@//  "Delete" + "End" :: Ctrl + w
	~End & ~PgDn::SendInput, ^w


	; ;@//  Press "Delete" then "End" :: Ctrl+Shift+t
	; ~Delete::
	; {
	; 	KeyWait, End, D T0.5 	; wait 0.5 second for the key to be pushed down 
	; 	If !ErrorLevel 		; if the key has been pushed before the time out
	; 		SendInput, ^w
	; 	Return
	; }

AppsKey::MButton

#IfWinActive