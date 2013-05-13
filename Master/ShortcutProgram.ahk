; ####################################################################
; ################### Shortcuts for programs window ##################
; ####################################################################


; === F1 :: Firefox ===
F1::ProgramShortcut(FIREFOX_WINDOW, FIREFOX, "Max")


; === F10 :: Filezilla with a defined profile ===
F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA_NAS, "Max")

; === "à" & F10 :: Filezilla ===
~SC00B & F10::ProgramShortcut(FILEZILLA_WINDOW, FILEZILLA, "Max")


; === F12 :: Mail (Inky) ===
F12::ProgramShortcut(MAIL_WINDOW, MAIL,, MAIL_FOLDER)


; === Numpad Mult :: Text Editor ===
NumpadMult::ProgramShortcut(EDITOR_WINDOW, EDITOR, "Max")


; === ² & F3 :: Cygwin ===
SC029 & ~F2::ProgramShortcut(CYGWIN_WINDOW, CYGWIN)


; === Numpad - :: Spotify ===
NumpadSub::
{
DetectHiddenWindows, On
ProgramShortcut(G_SPOTIFY_WINDOW, SPOTIFY)
DetectHiddenWindows, Off
return
}