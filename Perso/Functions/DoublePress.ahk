/*
	=== DoublePress( ActionType, Action ) ===

	If the key is pressed twice in less than 400 ms then :
	If ActionType == 0 : Action is a key or a key combination to press (i.e. "^{Escape}")
	If ActionType == 1 : Action is a label (gosub)
*/

DoublePress(ActionType,Action)
{
	If (A_PriorHotkey <> A_ThisHotkey or A_TimeSincePriorHotkey > 400)
	{
		; Too much time between presses, so this isn't a double-press.
		KeyWait, %A_ThisHotkey%
		Return
	}
	IfEqual, ActionType, 1
		Gosub, %Action%
	Else IfEqual, ActionType, 0
		Send, %Action%
	Return
}