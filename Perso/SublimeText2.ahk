; ####################################################
; ################# Sublime Text 2 ###################
; ####################################################


#IfWinActive, ahk_class PX_WINDOW_CLASS

	;@//   Ctrl + & :: View, Layout, Single
	; (on a french azerty keyboard the original 
	; 	shortcut change the keyboard layout, because it contain Alt+Shift)
	^&::SendPlay, !+1

	;@//   Ctrl + é :: View, Layout, columns:2
	; (idem last shortcut)
	^é::SendPlay, !+2

#IfWinActive