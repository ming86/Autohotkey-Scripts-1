Master script
=========

[Main](Main.ahk)
-
Main script, the one that I launch on my computer startup. Every other AHK scripts in this folder are included in it.

[Constants and strings](Constants.ahk)
-
This file contain all the variable declarations, such as folders path, programs path, string used for message box.
Also :
* a loop that parse a file that contain some text used for hotstrings, text I put in a "ressources.txt" file, with "sensible" content (mail adresses for example). Each values in this file must be separated with "|" (a pipe) to work in this configuration. Each part is stored into a TXT# variable.
* Help window generation : get all the lines starting with ;/*** , for each file, and put them in a tree view.

[Functions](Functions.ahk)
-
This file regroup all the functions

[Power Menu](PowerMenu.ahk)
-
Create a menu to sleep, shutdown and reboot the computer. It can be triggered by pressing a key for a certain amount of time or by pressing two times a key (see [Functions](Functions.ahk)).

[Hotstrings](Hotstrings.ahk)
-
Contains all the hotstrings.

[Folders](Folders.ahk)
-
Folders related hotkeys.

[File Explorer](FileExplorer.ahk)
-
File explorer hotkey, such as hotkeys to display or not hidden files and file extensions.

[Spotify](Spotify.ahk)
-
Spotify related hotkeys: 
* play/previous/next
* send window to the left/right half of the screen

[Firefox](Firefox.ahk)
-
Firefox related shortcuts.

[Programs window shortcuts](ShortcutProgram.ahk)
-
Shortcuts to show/hide/launch a program window.

[Sublime Text 2](SublimeText2.ahk)
-
Sublime Text 2 shortcuts.

[Icons Folder](Icons)
-
Contains all icons used by this script
