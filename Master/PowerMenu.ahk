; ##############################################
; ################ Power Menu ##################
; ##############################################


; === Menu ===
; Create a popup menu by adding some items to it.
;Each item has it's own icon
Menu, PowerMenu, Add, &Veille, Sleep_
Menu, PowerMenu, Icon, &Veille, Icons/sleep.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, &Redemarrer, Reboot_
Menu, PowerMenu, Icon, &Redemarrer, Icons/reboot.ico,, 32
Menu, PowerMenu, Add  ; Add a separator line.
Menu, PowerMenu, Add, &Eteindre, Stop_
Menu, PowerMenu, Icon, &Eteindre, Icons/stop.ico,, 32
Return


; === Hotkeys ===

;/*** Long press End :: Display Power Menu ***/
End::LongPress("ShowPowerMenu")

;/*** Long Press ² :: Display Power Menu ***/
SC029::DoublePress(1,"ShowPowerMenu")



; === Labels ===

ShowPowerMenu:
Menu, PowerMenu, Show 
Return


Stop_:
Run, %_STOP%
return

Sleep_:
Run, %_SLEEP%
return

Reboot_:
Run, %_REBOOT%
return