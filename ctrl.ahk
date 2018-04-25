
~RCtrl::
~LAlt::
	SetDefaultKeyboard(0x00813)
	return

~RCtrl Up::
~LAlt Up::
	SetDefaultKeyboard(0x40813)
	return




; fix for alt gr
~*RAlt Up::
	Send {blind}{LCtrl Up}
	SetDefaultKeyboard(0x40813)
	return
LCtrl::
	if not GetKeyState(RAlt, P)
	{
		SetDefaultKeyboard(0x00813)
		Send {blind}{LCtrl Down}
	}
	return
LCtrl Up::
	if not GetKeyState(RAlt, P)
	{
		SetDefaultKeyboard(0x40813)
		Send {blind}{LCtrl Up}
	}
	return








; credit to Capn Odin

SetDefaultKeyboard(LocaleID) {
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
	
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(binaryLocaleID, 4, 0)
	NumPut(LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
	
	WinGet, windows, List
	Loop % windows {
		PostMessage 0x50, 0, % Lan, , % "ahk_id " windows%A_Index%
	}
}