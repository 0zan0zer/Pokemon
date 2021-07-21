#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinActivate, Pokemon Blaze Online ahk_class LWJGL
nSleep(varsleep){
	nvar = % varsleep//145
	if(mod(varsleep,145)!=0){
		nvar = % nvar + 1
	}
	sleeptime = % nvar*145
	sleep %sleeptime%
}
rSleep(square){
	Sleepsq = % square*150
	sleep %Sleepsq%
}
^p::
rSleep(2)
Send, {Left Down}
rSleep(10)
Send, {Left Up}
rSleep(2)
Send, {Down Down}
rSleep(23)
sleep 50
Send, {Down Up}
rSleep(2)
Send, {Left Down}
rSleep(6)
Send, {Left Up}
rSleep(2)
Send, {Down Down}
rSleep(6)
Send, {Down Up}
rSleep(2)
Send, {Left Down}
rSleep(1)
Send, {Left Up}
rSleep(2)
Send, {Down Down}
rSleep(17)
Send, {Down Up}
rSleep(2)
Send, {Right Down}
rSleep(10)
Send, {Right Up}
rSleep(2)
Send, {Up Down}
rSleep(2)
Send, {Up Up}
rSleep(5)
Send, {Up Down}
rSleep(9)
Send, {Up Up}
rSleep(2)
Send, {Down Down}
rSleep(10)
Send, {Down Up}
rSleep(2)
Send, {Down Down}
rSleep(2)
Send, {Down Up}
rSleep(2)
Send, {Left Down}
rSleep(10)
Send, {Left Up}
rSleep(2)
Send, {Up Down}
rSleep(21)
Send, {Up Up}
rSleep(2)
Send, {Right Down}
rSleep(2)
Send, {Right Up}
rSleep(2)
Send, {Up Down}
rSleep(3)
Send, {Up Up}
rSleep(2)
Send, {Right Down}
rSleep(2)
Send, {Right Up}
rSleep(2)
Send, {Up Down}
rSleep(21)
Send, {Up Up}
rSleep(1)
Send, {Right Down}
rSleep(13)
Send, {Right Up}
rSleep(2)
Send, {Up Down}
rSleep(1)
Send, {Up Up}
rSleep(2)
return