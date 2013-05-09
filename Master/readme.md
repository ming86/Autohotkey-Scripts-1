Master script
=========

[Main](Main.ahk)
-
Main script, the one that I launch on my computer startup. Every other AHK scripts in this folder are included in it.

* [Constants and strings](Constants.ahk)

This file contain all the variable declarations, such as folders path, programs path, string used for message box.

There is also a loop that parse a file that contain some text used for hotstrings, text I put in a "ressources.txt" file, with "sensible" content (mail adresses for example). Each values in this file must be separated with "|" (a pipe) to work in this configuration.
Each part is stored into a TXT# variable.

* [Power Menu](PowerMenu.ahk)

Create a menu to sleep, shutdown and reboot the computer. It can be triggered by pressing a key for a certain amount of time.

* [Hotstrings](Hotstrings.ahk)

This file contain all the hotstrings.

* [Folders](Folders.ahk)

This file contain all the folder related hotkeys.

* [Spotify](Spotify.ahk)

This file contain Spotify related hotkeys: 
* play/previous/next
* send window to the left/right half of the screen

* [Programs window shortcuts](ShortcutProgram.ahk)

Shortcut to show/hide/launch a program depending on it's state

* [Icons Folder](Icons)

Contain all icons used by this script
