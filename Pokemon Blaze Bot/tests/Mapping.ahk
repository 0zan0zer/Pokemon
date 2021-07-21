#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui Mapping: New, -MaximizeBox
Gui, +AlwaysOnTop

Gui Add, Tab2, x2 y2 w300 h300, Ekran|Yer

Gui, Tab, Yer
Gui Add, Button, x30 y60 w160 h23 gLocalizeChar, Karakter Yeri
Gui Add, Button, x235 y270 w60 h23 gRun, Başlat
Gui Add, Button, x150 y270 w60 h23 gRemove, ToolTip Kaldır

Gui Show, w310 h310, Mapping
return

MappingGuiEscape:
MappingGuiClose:
    ExitApp
	
LocalizeChar:
	RemoveToolTip()
	KeyWait, LButton, D 
		MouseGetPos, CharPixelX, CharPixelY
	KeyWait, LButton, U
	ToolTip, Seçildi{Karakter Yeri} : %CharPixelX%.%CharPixelY%,  %CharPixelX%, %CharPixelY%
return

Remove:
	RemoveToolTip()
return

Run:
	Gui, Submit
	Map =
	for key in range(1,6,1){
		for keytwo in range(1,6,1){
			MappingPixelX = % CharPixelX - key
			MappingPixelY = % CharPixelY - keytwo
			PixelGetColor, MappingColor, %MappingPixelX%,%MappingPixelY%
			if(Map =){
				Map = %MappingColor%
			}
			else{
				Map = %Map%|%MappingColor%
			}
		}
	}
	Msgbox %Map%
return
;-------ToolTip Remove-------

RemoveToolTip(){
	ToolTip
return
}
;-------Range Function-------
range(start, stop:="", step:=1) {
	static range := { _NewEnum: Func("_RangeNewEnum") }
	if !step
		throw "range(): Parameter 'step' must not be 0 or blank"
	if (stop == "")
		stop := start, start := 0
	if (step > 0 ? start < stop : start > stop)
		return { base: range, start: start, stop: stop, step: step }
}
_RangeNewEnum(r) {
	static enum := { "Next": Func("_RangeEnumNext") }
	return { base: enum, r: r, i: 0 }
}

_RangeEnumNext(enum, ByRef k, ByRef v:="") {
	stop := enum.r.stop, step := enum.r.step
	, k := enum.r.start + step*enum.i
	if (ret := step > 0 ? k < stop : k > stop)
		enum.i += 1
	return ret
}
