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




; === File Explorer ===

; Show the properties window for the file selected AND under the mouse's pointer
properties:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send {R}
Return

extract:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send 7
Sleep, 10
Send {e 3}
Sleep, 10
Send {Enter}
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
Send a
Return


; right click menu => Pin tab (over a tab)
pinTab:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send p
Return

; right click menu => Unpin tab (over a tab)
unPinTab:
Send {RButton} ; Right click
Sleep, 10 ; Works better with a sleep between the two key
Send r
Return

; toggle navigation pane on Windows 8
tnp_W8:
Send !v
Sleep 50
Send n
Sleep 50
Send {Enter}
Return

; toggle navigation pane on Windows 7
tnp_W7:
Send {F3}
Sleep 100
Send {Tab}
Sleep 100
Send {Down}
Sleep 100
Send d
Send {v 3}
Send {Enter}
Return