#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2


; ------------------ System Tray ------------------
Menu, TRAY, Icon, Icons/Master.ico ; Icon displayed in the system tray
Menu, TRAY, Tip, Autohotkey ; text displayed when hover over the icon
; --------------- end System Tray -----------------



; ====== Includes ======

; --- Auto execution section

; Data Management folder, must be in auto execution section
#Include Data/Constants.ahk
#Include Data/SortFilesData.ahk

#Include Data/HelpData.ahk
#Include Data/HotstringsData.ahk
#Include Data/PowerMenu.ahk

;Functions ta run periodically
OnSaveCompileOrReload()
;SortFiles()
Return

; --- End auto execution

#Include Labels.ahk

; Functions folder
#Include Functions/CreateTreeView.ahk
#Include Functions/DoublePress.ahk
#Include Functions/Help.ahk
#Include Functions/LongPress.ahk
#Include Functions/OnSaveCompileOrReload.ahk
#Include Functions/ProgramShortcut.ahk
#Include Functions/SortFiles.ahk


; Hotkeys and Hotstrings files
#Include Misc.ahk
#Include FileExplorer.ahk
#Include Firefox.ahk
#Include Folders.ahk
#Include Hotstrings.ahk
#Include ShortcutProgram.ahk
#Include Spotify.ahk
#Include SublimeText2.ahk
#Include Thunderbird.ahk

;@//  AltGr + H :: Show help window
RAlt & h::Help(TREEVIEW_SHORTCUT_LIST)