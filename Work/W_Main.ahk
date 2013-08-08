#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Tip, Work
; --------------- end System Tray -----------------


; ====== Includes ======

; --- Auto execution section
#Include ../Perso/Data/Constants.ahk
#Include ../Perso/Data/PowerMenu.ahk
Return
; --- End auto execution

#Include ../Perso/Labels.ahk
#Include W_ShortcutProgram.ahk
#Include ../Perso/Misc.ahk
#Include W_Hotstrings.ahk
#Include ../Perso/FileExplorer.ahk
#Include ../Perso/Firefox.ahk
#Include ../Perso/Thunderbird.ahk
#Include ../Perso/SublimeText2.ahk
#Include ../Perso/Spotify.ahk

; Functions folder
#Include ../Perso/Functions/DoublePress.ahk
#Include ../Perso/Functions/LongPress.ahk
#Include ../Perso/Functions/ProgramShortcut.ahk

