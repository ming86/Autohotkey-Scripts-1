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
			Send !f
			Sleep 200
			Send V
		}
		Return
	}


#IfWinActive