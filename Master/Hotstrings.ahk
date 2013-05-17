; #################################################
; ################### Hotstrings ##################
; #################################################


; Define ending characters for hotstrings. I removed the double quote and the exclamation point.
; default : #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
#Hotstring EndChars -()[]{}:;'/\,.?`n `t


;/*** a@ :: E-mail adress 1 ***/
::a@::
SendInput %TXT1%
Return

;/*** v@ :: E-mail adress 2 ***/
::v@::
SendInput %TXT2%
Return

;/*** g@ :: E-mail adress 3 ***/
::g@::
SendInput %TXT3%
Return

;/*** sig! :: Mail signature ***/
::sig!::
SendInput %TXT4%
Return

;/*** pol! :: Closing formula ***/
::pol!::
SendInput %TXT5%
Return

;/*** sit! ::  Website ***/
::sit!::
SendInput %TXT6%
Return

;/*** av! ::  Name ***/
::av!::
SendInput %TXT7%
Return

;/*** tl! :: Phone ***/
::tl!::
SendInput %TXT8%
Return


;/*** d" :: Today's date ***/
::"d::
{
	FormatTime, CurrentDate,, dd/MM/yyyy
	SendInput %CurrentDate%
	Return
}
