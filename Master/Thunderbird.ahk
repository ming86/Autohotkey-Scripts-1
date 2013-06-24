; ####################################################
; ################### Thunderbird ####################
; ####################################################

#IfWinActive Mozilla Thunderbird ahk_class MozillaWindowClass

	^t::
	{
		MsgBox, 4148, Mail - Corbeille, Vider la Corbeille ?
		IfMsgBox, Yes
		{
			Send !f
			Sleep 200
			Send V
		}
		Return
	}


#IfWinActive