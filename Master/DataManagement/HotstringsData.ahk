/*
	=== Hotstrings data recuperation ===

	Read a file with strings to use and put it in the Ressources variable, 
	then in TXT# Variable used by the hotstrings

	The file must be save as "utf-8 with BOM" if there is accents in the text (French text for example).

	Each string in the ressources file is separated from the other via the "|" character.
*/

FileRead, Ressources, R_FILE_PATH
Loop, parse, Ressources ,|,
{
	TXT%A_Index% = %A_LoopField% ; store parts of the file in TXT# variables
}
; free the memory occupied by the variable
Ressources:=""