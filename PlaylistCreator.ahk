#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ####################################################
; ############### Playlist generation ################
; ####################################################
;
; generate a m3u8 file fron the content of a folder.
; folders are not browsed recursively, only the files
; directly in the folder selected are used
;

FileEncoding, UTF-8

StartFolder = *D:\
FilesExt := "mkv,avi,mp4,ogm,mp3,ogg"

FileSelectFolder, Folder, %StartFolder%, 0, Select the folder containing the elements :
	IfEqual, ErrorLevel, 1
		ExitApp

loop, Parse, Folder,\
	FolderName = %A_LoopField% ; we keep just the last folder name

PlaylistPath = %Folder%\%FolderName%.m3u8 ; the playlist will be in the same folder as the files and have the same name as the folder
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