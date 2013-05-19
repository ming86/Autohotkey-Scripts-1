/*
	=== Help(TreeView_Data) ===
	
	Create and Display the help window
*/

Help(TreeView_Data)
{
	Gui, Font, s13, Verdana
	Gui, Add, TreeView, H600 W800
	CreateTreeView(TreeView_Data)
	Gui, Show,, Help
	Return

	GuiCancel:
	GuiClose:
	Gui, Destroy
	Return
}