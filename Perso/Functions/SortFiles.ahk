/* 
	=== SortFolderFiles() ===

*/

SortFiles()
{
	Global SortFilesCount, SortTimer, FIREFOX_WINDOW, FILEZILLA_WINDOW

	Loop %SortFilesCount%
	{
		folder := Dest_%A_Index%
		IfNotExist %folder%
			FileCreateDir %folder%
	}
	SetTimer, SortActions, %SortTimer%


	; actions to perform
	SortActions:
	DetectHiddenWindows, On 
	;do not move files if there may be some currently downloading
	IfWinNotExist, %FIREFOX_WINDOW%
	{
		IfWinNotExist, %FILEZILLA_WINDOW%
		{
			Loop, %SortFilesCount%
			{
				IfExist % Move_%A_Index%
				{
					D := Dest_%A_Index%
					M := Move_%A_Index%

					FileMove, %M%, %D% 
					If ErrorLevel
					{
						Loop, %M%, 0, 0
						{
							SplitPath,A_LoopFileFullPath,, dir, ext, name
							FileMove, %A_LoopFileFullPath%, %dir%\%name%_%A_Index%.%ext%
						}
					}
				}
			}
		}
	}
	DetectHiddenWindows, Off
	Return
}