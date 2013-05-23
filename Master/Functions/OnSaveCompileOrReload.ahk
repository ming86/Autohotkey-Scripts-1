/* 
	=== OnSaveCompileOrReload() ===

	Check if any of the files that are included in the main script (all the ahk files of the folder and subfolders)
	and the main script have been modified, if so reload (if he wasn't running compiled) or recompile and run.

	/!\ Before the function call, RELOAD_DELAY must be defined somewhere, else it will run every 250 ms (cf. http://l.autohotkey.net/docs/commands/SetTimer.htm), which can be a problem if there is a lot of file to check.

	NB: the idea of renaming the script to be able to compile came from this thread: 
	http://www.autohotkey.com/board/topic/65169-autoreload-script-if-changed-even-compiled-ones/
	wich present a similar script that work for modification on a script, not on its included scripts. 
*/



OnSaveCompileOrReload()
{
	local TimeBefore

	FileDelete, %A_ScriptFullPath%.temp ; remove the temporary file created for the compilation

	Loop, *.ahk, 0, 1 ;Loop for each ahk file in the working dir and its subfolders
	{
		; get the modification time for all the ahk files in the working directory (%A_WorkingDir%)
		FileGetTime, TimeBefore%A_Index%, %A_LoopFileFullPath%
	}
	SetTimer, CheckState, %RELOAD_DELAY% ; check for change every %RELOAD_DELAY% ms (See Constants.ahk)

	

	CheckState:
	Loop, *.ahk, 0, 1 ;Loop for each ahk file in the working dir and its subfolders
	{
		IfNotEqual, TimeBefore%A_Index%, %A_LoopFileTimeModified%
		{
			TrayTip, Autohotkey, The %SCRIPT_NAME% script is reloading, 3 ;If SCRIPT_NAME doesn't exist it just display "The script is reloading"
			Sleep 4000 ; let the time for the tray tip to be displayed
			IfEqual, A_IsCompiled, 1
			{
				;It is not possible to compile a running script, but it is possible to rename the running script executable, and then compile the script with its original name. 
				FileMove, %A_ScriptFullPath%, %A_ScriptFullPath%.temp, 1
				; compile the script
				RunWait, %A_ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe /in %AHK_SCRIPT_PATH%
				Run %A_ScriptFullPath%
				Break
			}
			Else 
			{
				Reload ;The script is not compiled
				Break
			}
		}
	}
	Return
}