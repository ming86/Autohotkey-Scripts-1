#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; ####################################################
; ############### Playlist generation ################
; ####################################################
;
; generate a m3u file from a folder's content
; for now, the folder content is not tested
;
; NB : I use this to generate playlist for series, it's not really suited for music



StartFolder = D:\ *D:\Vidéos
FilesExt := "mkv, avi, mp4"

FileSelectFolder, Folder, %StartFolder%, 0, Select the folder containing the episodes :

loop, Parse, Folder,\
	FolderName = %A_LoopField% ; we keep just the last folder name

PlaylistPath = %Folder%\%FolderName%.m3u ; the playlist will be in the same folder as the files and have the same name as the folder
IfExist, %PlaylistPath%
	FileDelete, %PlaylistPath%

FileAppend, #EXTM3U, %PlaylistPath%

Loop, %Folder%\*
{
	SplitPath, A_LoopFileLongPath, OutFileName, , OutExtension, OutNameNoExt

	If OutExtension in %FilesExt%
	{
		FileAppend, `n#EXTINF: %OutNameNoExt%`n%OutFileName%, %PlaylistPath%
	}
}
Return