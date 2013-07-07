#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; ####################################################
; ################ Playlist converter ################
; ####################################################


; Convert absolute path in playlist to relative path
;
; work with m3u & m3u8 playlist generated with VLC, not tested with playlist from other media player
;
; for now, work only if 
;	- all the files from the playlist are all in the same directory
;	- the playlist is in the same directory as the files in the playlist



FileSelectFile, PlaylistFile , 3, , , (*.m3u; *.m3u8)

SplitPath, PlaylistFile, , Dir, Ext, NameNoExt
PlaylistFileRelative = %Dir%\%NameNoExt%_relative.%Ext%

IfExist, %PlaylistFileRelative%
	FileDelete, %PlaylistFileRelative%

Loop, Read, %PlaylistFile%, %PlaylistFileRelative%
{ 
	If (A_Index = 1) ; '#EXTM3U' line (1st line)
		FileAppend, %A_LoopReadLine%

	Else if !Mod( A_Index, 2) ; EXTINF lines (lines 2, 4, 6, ...)
		FileAppend, `n%A_LoopReadLine%

	Else ; lines with absolute path
	{
		SplitPath, A_LoopReadLine, OutFileName
		FileAppend, `n%OutFileName%
	}
}
Return