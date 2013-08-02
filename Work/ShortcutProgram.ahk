﻿; ####################################################################
; ################### Shortcuts for programs window ##################
; ####################################################################


;@//  F1  ::  Firefox
F1::ProgramShortcut(FIREFOX_WINDOW, FIREFOX, "Max")


;@//  F12  ::  Mail (Thunderbird)
F12::
{
DetectHiddenWindows, On 
ProgramShortcut(MAIL_WINDOW, MAIL,"Max")
DetectHiddenWindows, Off
Return
}


;F4::ProgramShortcut(MD_EDITOR_WINDOW, MD_EDITOR, "Max")


;@//  Numpad Mult  ::  Text Editor
;NumpadMult::ProgramShortcut(EDITOR_WINDOW, EDITOR, "Max")


;@//  ² + F2  ::  Cygwin
SC029 & ~F2::ProgramShortcut(CYGWIN_WINDOW, CYGWIN)


;@//  Numpad -  ::  Spotify
; NumpadSub::
; {
; DetectHiddenWindows, On
; ProgramShortcut(G_SPOTIFY_WINDOW, SPOTIFY)
; DetectHiddenWindows, Off
; Return
; }