/*	
	=== Power Menu ===
	Create a popup menu by adding some items to it.
	Each item has it's own icon
*/

Menu, PowerMenu, Add, &Veille, Sleep_
Menu, PowerMenu, Icon, &Veille, Icons/sleep.ico,, 32
Menu, PowerMenu, Add  ; Separator line
Menu, PowerMenu, Add, &Hibernation, Hibernate_
Menu, PowerMenu, Icon, &Hibernation, Icons/hib.ico,, 32
Menu, PowerMenu, Add  ; Separator line
Menu, PowerMenu, Add, &Redemarrer, Reboot_
Menu, PowerMenu, Icon, &Redemarrer, Icons/reboot.ico,, 32
Menu, PowerMenu, Add  ; Separator line
Menu, PowerMenu, Add, &Eteindre, Stop_
Menu, PowerMenu, Icon, &Eteindre, Icons/stop.ico,, 32
Menu, PowerMenu, Add  ; Separator line
Menu, PowerMenu, Add, &Log Out, Logout_
; Menu, PowerMenu, Icon, &Log Out, Icons/logout.ico,, 32