/* 
	=== LongPress(Action) ===

	If the key (or key combination) is pressed for more than 1 s then go to the label passed as a parameter ("Action")
	Else send the key (or key combination)
*/

LongPress(Action)
{
	start := A_TickCount
	KeyWait, %A_ThisHotkey%
	If (A_TickCount - start) > 1000
		Gosub, %Action%
	Else
		Send {%A_ThisHotkey%}
	Return
}