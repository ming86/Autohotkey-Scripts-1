#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force


; Taux de charges pour le calcul (± 3%)
 TX = 0.77

IfEqual, 0, 0 ; no parameters passed to the script
{
	inputEntry: ; label for the case where input != integer
	; Input for "Salaire Brut"
	InputBox, Salary, Salaire Brut / Net,,,200,120,,,,,Salaire Brut Annuel ?
	If not ErrorLevel ; if cancel is pressed then the script exit
	{	
		Gosub, calcul
	}
}
Else IfEqual, 0, 1 ; one parameter passed to the script
{
	Salary=%1%
	Gosub, calcul
}
Else
{
	MsgBox, 4112, Error, Too many parameters.
}
return

ExitApp


; -----------------------------------------------
		; Label calcul
		calcul:
		{
			If  Salary is integer
			{ 
				setformat, float, 0.2
				Net:= (Salary*TX)/12
				MsgBox, 4096, Salaire Net, Pour un salaire brut annuel de %Salary%  Euros, `n `n le salaire net mensuel sera de :   %Net% €  (± 3`%) 
			}

			Else ; input != integer
			{
				MsgBox, 4112, Error, Le montant saisi doit etre un entier.
			}
		}