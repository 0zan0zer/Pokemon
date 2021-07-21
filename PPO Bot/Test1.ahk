#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force ; Only launch 1 instance of this script.
;~ #Persistent ; Kod çalışmaya devam eder.
;~ Alt key is ! and the Windowskey is # the shift key is + , and control key is ^

;~ ^h::
	;~ MsgBox Hello 
	;~ MsgBox World
;~ return ;Stop going forward

^r:: Reload ; This will reload the script.
^t:: Edit ; This will edit script.

;~ ^m::
	;~ MsgBox Hello World
;~ return

^p::
	run C:\Users\Ozan\Downloads\PokemonPlanet1920x1080.exe
return

;~ ::mec:: Mechanarchy
;~ :r:mec:: Mechanarchy
;~ :*:mec:: Mechanarchy Enter ve ya space e gerek yok .
;~ :o:mech:: Mechanarchy
;~ #NoTrayIcon ikonu kaldırır.

;~ !g::
	;~ send, ^h
;~ return
;~ ^l::
;~ MouseGetPos,LocX,LocY
	;~ MsgBox x is at %LocX% and Y is at %LocY%

	;~ x is at X315 Y296
	;~ Click,481,93

;~ return