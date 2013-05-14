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
return



; === Hotkeys ===

; If End is pressed for more than 1 s then display then menu, else send End.
End::LongPress("ShowPowerMenu")

; If the key is pressed twice in less than 400 ms then the menu is displayed
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