; ####################################################
; ################### Thunderbird ####################
; ####################################################

#IfWinActive Mozilla Thunderbird ahk_class MozillaWindowClass

	;@// Ctrl + T :: Empty the trash
	^t::
	{
		MsgBox, 4148, Mail - Corbeille, Vider la Corbeille ?
		IfMsgBox, Yes
		{
			SendInput !f
			Sleep 100
			SendInput V
		}
		Return
	}


#IfWinActive