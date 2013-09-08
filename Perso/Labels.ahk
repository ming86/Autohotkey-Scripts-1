; #################################################
; #################### Labels #####################
; #################################################

; === Power Menu ===
ShowPowerMenu:
Menu, PowerMenu, Show 
Return

Stop_:
Run, %STOP_%
Return

Sleep_:
Run, %SLEEP_%
Return

Reboot_:
Run, %REBOOT_%
Return

Hibernate_:
Run, %HIBERNATE_%
Return

Logout_:
Run, %LOGOUT_%
Return


; === File Explorer ===

; Show the properties window for the file selected AND under the mouse's pointer
properties:
SendInput {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
SendInput {R}
Return

extract:
SendInput {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
SendInput 7
Sleep, 10
SendInput {e 3}
Sleep, 10
SendInput {Enter}
Return 

; toggle navigation pane on Windows 8
tnp_W8:
SendInput !v
Sleep, 30
SendInput n
Sleep, 30
SendInput {Enter}
Return

; toggle navigation pane on Windows 7
tnp_W7:
SendInput {F3}
Sleep, 30
SendInput, {Del} ; remove characters entered in the search field, not necessary
Sleep, 30
SendInput {Tab}
Sleep, 30
SendInput {Enter}
Sleep, 30
SendInput d
Sleep, 30
SendInput {v 3}
Sleep, 30
SendInput {Enter}
Return


; === Firefox ===

; right click menu => view image => open it in a new tab (over an image)
viewImage:
; When double key press
SendInput {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
SendInput ^{h} ; Ctrl + H => H for view image (french "shortcut") and Ctrl to open in a new tab
Return


; right click menu => Add to transmission (firefox extension, over a magnet link or a torrent file)
addTransmission:
SendInput {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
SendInput a
Return


; right click menu => Pin tab (over a tab)
pinTab:
SendInput {RButton} ; Right click
Sleep, 50 ; Works better with a sleep between the two key
SendInput p
Return

; right click menu => Unpin tab (over a tab)
unPinTab:
SendInput {RButton} ; Right click
Sleep, 50 ; Works better with a sleep between the two key
SendInput r
Return
