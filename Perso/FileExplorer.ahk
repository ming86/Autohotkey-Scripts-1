; ####################################################
; ################### File Explorer ##################
; ####################################################


#IfWinActive, ahk_class CabinetWClass


;@//  Ctrl + E :: Toggle file extension

; registry key : [HKEY_CURRENT_USER\Software\Microsoft\Windows\Curre ntVersion\Explorer\Advanced] => HideFileExt
; values : 0 => show, 1=> do not show
^e::
{
	RegRead, hide_ext, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
	IfEqual, hide_ext, 1
	{
		RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
	}
	Else
	{
		RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
	}
	;Sleep, 300
	Send {F5}
	Return
}


;@//  Ctrl + H :: Toggle hidden files

; registry key : [HKEY_CURRENT_USER\Software\Microsoft\Windows\Curre ntVersion\Explorer\Advanced] => Hidden
; values : 1 => Show, 2 => do not show
^h::
{
	RegRead, hide_ext, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
	IfEqual, hide_ext, 1
	{
		RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
	}
	Else
	{
		RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
	}
	;Sleep, 300
	Send {F5}
	Return
}


;@//  Numpad0 + Up :: Alt+Up (Parent folder)
~Numpad0 & ~Up::Send !{Up}


;@//  Double Press * :: Display file properties
~*::DoublePress(1,"properties")

;@//  Double Press + :: Auto Resize Columns (list view)
~NumpadAdd::DoublePress(0,"^{NumpadAdd}")


;@//  Win + a :: Toggle navigation pane (Windows 8 only)
#a::goto, %TNP%


;@//  Win + z :: Toggle details pane (Windows 8 only)
#z::
{
	Send !v
	Sleep 50
	Send d
	Return
}

;@//  Double Press ! :: extract archive with 7zip -> extract to "archive_name"
~!::DoublePress(1,"extract")

#IfWinActive