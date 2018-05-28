#SingleInstance Force

; windows does some weird shit with LCtrl and RAlt when switching keyboard layouts with alt gr enabled...

isAlt = 0
~Alt::
	isAlt = 1
~Ctrl::
	SetDefaultKeyboard(0x00813)
	return

~RAlt::LCtrl

~RAlt up::
	Send {Blind}{Ctrl up} ; atm everything seems to work, except when you tap altgr twice in a row really fast.. then ctrl stays down. shrug. This problem only seems to be in the ahk version, im assuming the exe version is simply too fast to have this problem.
~LAlt up::
	isAlt = 0
Ctrl up::				; i have no fucking clue why this works, it shouldnt work because its blocking the ctrl up.
	SetDefaultKeyboard(0x40813)
	return


SetDefaultKeyboard(0x40813)



keyboard = 0;
; credit to Capn Odin
SetDefaultKeyboard(LocaleID) {
	if keyboard == LocaleID
		return
	keyboard = LocaleID
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