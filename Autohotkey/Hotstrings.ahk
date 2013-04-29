; ################### Hotstrings ##################

; Define ending characters for hotstrings. I removed the double quote and the exclamation point.
; default : #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
#Hotstring EndChars -()[]{}:;'/\,.?`n `t


; E-mail adresses
::a@::
SendInput %TXT1%
return

::v@::
SendInput %TXT2%
return

::g@::
SendInput %TXT3%
return

; Mail signature
::sig!::
SendInput %TXT4%
Return

; Closing formula
::pol!::
SendInput %TXT5%
Return

; website
::sit!::
SendInput %TXT6%
Return

; replace "d  with today's date
::"d::
{
FormatTime, CurrentDate,, dd/MM/yyyy
SendInput %CurrentDate%
return
}
