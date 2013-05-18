; ####################################################
; ##################### Help #########################
; ####################################################


; variable declarations
FileName =
FileList =
ArrayCount = 0
TREEVIEW_SHORTCUT_LIST =



; Get all ahk files name and path
Loop, *.ahk
{
	StringTrimRight, FileName%A_Index%, A_LoopFileName, 4
	FileList%A_Index% = %A_LoopFileFullPath%
	ArrayCount++
}
Sort, FileList, N
Loop %ArrayCount% ; loop for each ahk file
{
	If FileName%A_Index% not in Constants,Functions ; No shortcuts in these files
    {
    	ShortcutsList =
    	elementPath := FileList%A_Index%
	    TREEVIEW_SHORTCUT_LIST .= FileName%A_Index%
	    Loop, Read, %elementPath%
	    {
		    IfInString, A_LoopReadLine,;/***
		    {
		    	Line=%A_LoopReadLine% ; trim the string
		    	ShortcutsList .= Line . "`n"
		    }
	    }    
	    Sort, ShortcutsList, N
	    Loop, Parse, ShortcutsList, `n
	    {
	    	If A_LoopField =  ; Ignore the blank item at the end of the list.
	    	Continue
	    	StringTrimLeft, field, A_LoopField, 5
	    	StringTrimRight, field, field, 5
	    	TREEVIEW_SHORTCUT_LIST .="`n`t" . field
	    }
	    TREEVIEW_SHORTCUT_LIST .="`n"
	}
}