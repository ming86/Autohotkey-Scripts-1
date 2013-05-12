; ##############################################
; ################ Power Menu ##################
; ##############################################


; === Menu ===
; Create a popup menu by adding some items to it.
;Each item has it's own icon

Menu, PowerMenu, Add, Veille ( &é ), Sleep_
Menu, PowerMenu, Icon, Veille ( &é ), Icons/sleep.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, Redemarrer ( &" ), Reboot_
Menu, PowerMenu, Icon, Redemarrer ( &" ), Icons/reboot.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, Eteindre ( &' ), Stop_
Menu, PowerMenu, Icon, Eteindre ( &' ), Icons/stop.ico,, 32
return


; === Labels, each one run an ahk script ===
Stop_:
Run, %_STOP%
return

Sleep_:
Run, %_SLEEP%
return

Reboot_:
Run, %_REBOOT%
return


; === Functions ===

; Show the power menu if the key (or key combination) is pressed for more than 1 s, else send the key (or key combination).
ShowPowerMenuKeyTime()
{
	start := A_TickCount
	KeyWait, %A_ThisHotkey%
	If (A_TickCount - start) > 1000
	{
		Menu, PowerMenu, Show 
	}
	Else
	{
		Send {%A_ThisHotkey%}
	}
	return
}


; If the key is pressed twice in less than 400 ms then the menu is displayed
ShowPowerMenuKeyDoublePress()
{
	If (A_PriorHotkey <> A_ThisHotkey or A_TimeSincePriorHotkey > 400)
	{
	; Too much time between presses, so this isn't a double-press.
	KeyWait, %A_ThisHotkey%
	Return
	}
; When double key press
Menu, PowerMenu, Show 
Return
}
	


; === Hotkeys ===

End::ShowPowerMenuKeyTime()

SC029::ShowPowerMenuKeyDoublePress()