; ####################################################
; ################# Sublime Text 2 ###################
; ####################################################


#IfWinActive, ahk_class PX_WINDOW_CLASS

	;@//   Ctrl + & :: View, Layout, Single
	; (on a french azerty keyboard the original 
	; 	shortcut change the keyboard layout, because it contain Alt+Shift)
	^&::Send, !+1

	;@//   Ctrl + é :: View, Layout, columns:2
	; (idem last shortcut)
	^é::Send, !+2

#IfWinActive