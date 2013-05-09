; ##############################################
; ################ Power Menu ##################
; ##############################################


; Create a popup menu by adding some items to it.
;Each item has it's own icon

Menu, PowerMenu, Add, Eteindre, Stop_
Menu, PowerMenu, Icon, Eteindre, Icons/stop.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, Veille, Sleep_
Menu, PowerMenu, Icon, Veille, Icons/sleep.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, Redemarrer, Reboot_
Menu, PowerMenu, Icon, Redemarrer, Icons/reboot.ico,, 32
return

; --- Labels, each one run an ahk script
Stop_:
Run, %_STOP%
return

Sleep_:
Run, %_SLEEP%
return

Reboot_:
Run, %_REBOOT%
return
; -------


; Insert :: trigger the power menu if pressed for more than 750 ms, else send Ctrl+W (close tab in browser)
Insert::
{
	start := A_TickCount
	KeyWait, %A_ThisHotkey%
	If (A_TickCount - start) > 750
	{
		Menu, PowerMenu, Show 
	}
	Else
	{
		Send ^{w}		
	}
	return
}