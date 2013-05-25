; #################################################
; #################### Labels #####################
; #################################################

; === Power Menu ===
ShowPowerMenu:
Menu, PowerMenu, Show 
Return

Stop_:
Run, %STOP_%
return

Sleep_:
Run, %SLEEP_%
return

Reboot_:
Run, %REBOOT_%
return


; === File Explorer ===

; Show the properties window for the file selected AND under the mouse's pointer
properties:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {R}
Return



; === Firefox ===

; right click menu => view image => open it in a new tab (over an image)
viewImage:
; When double key press
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send ^{h} ; Ctrl + H => H for view image (french "shortcut") and Ctrl to open in a new tab
Return


; right click menu => Add to transmission (firefox extension, over a magnet link or a torrent file)
addTransmission:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {A}
Return


; right click menu => Pin tab (over a tab)
pinTab:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {P}
Return

; right click menu => Unpin tab (over a tab)
unPinTab:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {R}
Return