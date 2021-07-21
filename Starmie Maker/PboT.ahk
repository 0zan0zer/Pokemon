#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;----------------Read Pokemon-------------
IniRead, PokemonPixelX, config.ini, Pokemon Recognation, PokemonPixelX
IniRead, PokemonPixelY, config.ini, Pokemon Recognation, PokemonPixelY
IniRead, ColorPokemon, config.ini, Pokemon Recognation, ColorPokemon
;----------------Read Battle--------------
IniRead, BattlePixelX, config.ini, Battle Recognation, BattlePixelX
IniRead, BattlePixelY, config.ini, Battle Recognation, BattlePixelY
IniRead, ColorBattle, config.ini, Battle Recognation, Colorbattle
;----------------Read Fishing--------------
IniRead, FishingPixelX, config.ini, Fishing Recognation, FishingPixelX
IniRead, FishingPixelY, config.ini, Fishing Recognation, FishingPixelY
IniRead, ColorFishing, config.ini, Fishing Recognation, ColorFishing
IniRead, ColorFishingMark, config.ini, Fishing Recognation, ColorFishingMark
;----------------Read Moves--------------
IniRead, MovefourPixelX, config.ini, Moves Recognation, MovefourPixelX
IniRead, MovefourPixelY, config.ini, Moves Recognation, MovefourPixelY
IniRead, ColorMovefour, config.ini, Moves Recognation, ColorMovefour
IniRead, MoveChoicefour, config.ini, Moves Recognation, MoveChoicefour

IniRead, MovethreePixelX, config.ini, Moves Recognation, MovethreePixelX
IniRead, MovethreePixelY, config.ini, Moves Recognation, MovethreePixelY
IniRead, ColorMovethree, config.ini, Moves Recognation, ColorMovethree
IniRead, MoveChoicethree, config.ini, Moves Recognation, MoveChoicethree

IniRead, MovetwoPixelX, config.ini, Moves Recognation, MovetwoPixelX
IniRead, MovetwoPixelY, config.ini, Moves Recognation, MovetwoPixelY
IniRead, ColorMovetwo, config.ini, Moves Recognation, ColorMovetwo
IniRead, MoveChoicetwo, config.ini, Moves Recognation, MoveChoicetwo

IniRead, MoveonePixelX, config.ini, Moves Recognation, MoveonePixelX
IniRead, MoveonePixelY, config.ini, Moves Recognation, MoveonePixelY
IniRead, ColorMoveone, config.ini, Moves Recognation, ColorMoveone
IniRead, MoveChoiceone, config.ini, Moves Recognation, MoveChoiceone
;---------------Read Pokemon Lists--------
IniRead, New_Pokemons_Colors, config.ini, Pokemons, New_Pokemons_Colors

If (InStr(New_Pokemons_Colors, "|")) {
	NewPokemonsColors := StrSplit(New_Pokemons_Colors, "|")
}
else if(New_Pokemons_Colors=){
	NewPokemonsColors :=
}
else{
	NewPokemonsColors = % New_Pokemons_Colors
}
Fighting = false
Walking = false
Fishing = false
Warning = false

Menu Tray, Icon, icons\Staryu.ico
Gui StaryuFinder: New, -MaximizeBox
Gui, +AlwaysOnTop

Gui Add, Tab2, x2 y2 w300 h300, Oyun|Lokasyon|Savaş

Gui, Tab, Oyun
Gui Add, CheckBox, x13 y35 w188 h23 vFighting, Kaçıyoz mu?
Gui Add, CheckBox, x13 y55 w188 h23 vFishing, Balık mı tutuyoz?
Gui Add, CheckBox, x13 y75 w188 h23 vWalking, Yürütem mi çarı?
Gui Add, Button, x13 y125 w160 h23 gLocalizeFishing, Fishing Yeri
Gui Add, Edit, x183 y125 w70 h21 vInfoFishing, %ColorFishing%
Gui Add, Button, x13 y155 w160 h23 gLocalizeFishingMark, Fishing Ünlem Yeri
Gui Add, Edit, x183 y155 w70 h21 vInfoFishingMark, %ColorFishingMark%
Gui Add, CheckBox, x13 y95 w188 h23 vWarning, Öteyim mi?
Gui Add, Button, x235 y270 w60 h23 gRun, Başlat

Gui, Tab, Lokasyon
Gui Add, Button, x30 y60 w160 h23 gLocalizePokemon, Pokemon Yeri
Gui Add, Edit, x200 y61 w70 h21 vInfoPoke, %ColorPokemon%
Gui Add, Button, x30 y120 w160 h23 gLocalizeBattleMode, Savaş Modu
Gui Add, Edit, x200 y121 w70 h21 vInfoBattle, %ColorBattle%
Gui Add, Text, x30 y95 w20 h21, X=
Gui Add, Edit, x50 y90 w70 h21 vInfoPosX, %PokemonPixelX%
Gui Add, Text, x130 y95 w20 h21, Y=
Gui Add, Edit, x150 y90 w70 h21 vInfoPosY, %PokemonPixelY%
Gui Add, Button, x30 y150 w160 h23 gAdd_Pokemon, Pokemonu Ekle
Gui Add, Edit, x30 y180 w160 h80 vInfoPokes, %New_Pokemons_Colors%
Gui Add, Button, x200 y181 w70 h21 gSavePokemon, Yenile
Gui Add, Button, x190 y270 w100 h23 gRemoveToolTip, ToolTipleri Kaldır

Gui, Tab, Savaş
Gui Add, Text, x13 y40 w100 h21, Saldırı #1
Gui, Add, DropDownList, x13 y60 w160 h200 vMoveChoiceone, Vur|Vurma
GuiControl, Choose, MoveChoiceone, %MoveChoiceone%
Gui Add, Button, x200 y60 w70 h20 gLocalizeMoveone, Saldırı Seç
Gui Add, Text, x13 y90 w100 h21, Saldırı #2
Gui, Add, DropDownList, x13 y110 w160 h200 vMoveChoicetwo, Vur|Vurma
GuiControl, Choose, MoveChoicetwo, %MoveChoicetwo%
Gui Add, Button, x200 y110 w70 h20 gLocalizeMovetwo, Saldırı Seç
Gui Add, Text, x13 y140 w100 h21, Saldırı #3
Gui, Add, DropDownList, x13 y160 w160 h200 vMoveChoicethree, Vur|Vurma
GuiControl, Choose, MoveChoicethree, %MoveChoicethree%
Gui Add, Button, x200 y160 w70 h20 gLocalizeMovethree, Saldırı Seç
Gui Add, Text, x13 y190 w100 h21, Saldırı #4
Gui, Add, DropDownList, x13 y210 w160 h200 vMoveChoicefour, Vur|Vurma
GuiControl, Choose, MoveChoicefour, %MoveChoicefour%
Gui Add, Button, x200 y210 w70 h20 gLocalizeMovefour, Saldırı Seç
Gui Add, Button, x235 y270 w60 h23 gSaveMoves, Kaydet

Gui Show, w310 h310, Staryufinder
return

StaryuFinderGuiEscape:
StaryuFinderGuiClose:
    ExitApp
	
;---------------------------------------------------------------
;---------------------GUI REFERENCE-----------------------------
;---------------------------------------------------------------
SaveMoves:
	GuiControlGet, MoveChoicefour
	GuiControlGet, MoveChoicethree
	GuiControlGet, MoveChoicetwo
	GuiControlGet, MoveChoiceone
	IniWrite, %MoveChoicefour%, config.ini, Moves Recognation, MoveChoicefour
	IniWrite, %MoveChoicethree%, config.ini, Moves Recognation, MoveChoicethree
	IniWrite, %MoveChoicetwo%, config.ini, Moves Recognation, MoveChoicetwo
	IniWrite, %MoveChoiceone%, config.ini, Moves Recognation, MoveChoiceone
	Reload
return

LocalizeMovefour:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, MovefourPixelX, MovefourPixelY
	KeyWait, LButton, U 
	IniWrite, %MovefourPixelX%, config.ini, Moves Recognation, MovefourPixelX
	IniWrite, %MovefourPixelY%, config.ini, Moves Recognation, MovefourPixelY
	PixelGetColor, ColorMovefour, %MovefourPixelX%, %MovefourPixelY%, RGB
	ToolTip, Seçildi{Saldırı #4 Yeri} : {%ColorMovefour%} %MovefourPixelX%.%MovefourPixelY%,  %MovefourPixelX%, %MovefourPixelY%
	IniWrite, %ColorMovefour%, config.ini, Moves Recognation, ColorMovefour
return

LocalizeMovethree:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, MovethreePixelX, MovethreePixelY
	KeyWait, LButton, U 
	IniWrite, %MovethreePixelX%, config.ini, Moves Recognation, MovethreePixelX
	IniWrite, %MovethreePixelY%, config.ini, Moves Recognation, MovethreePixelY
	PixelGetColor, ColorMovethree, %MovethreePixelX%, %MovethreePixelY%, RGB
	ToolTip, Seçildi{Saldırı #3 Yeri} : {%ColorMovethree%} %MovethreePixelX%.%MovethreePixelY%,  %MovethreePixelX%, %MovethreePixelY%
	IniWrite, %ColorMovethree%, config.ini, Moves Recognation, ColorMovethree
return

LocalizeMovetwo:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, MovetwoPixelX, MovetwoPixelY
	KeyWait, LButton, U 
	IniWrite, %MovetwoPixelX%, config.ini, Moves Recognation, MovetwoPixelX
	IniWrite, %MovetwoPixelY%, config.ini, Moves Recognation, MovetwoPixelY
	PixelGetColor, ColorMovetwo, %MovetwoPixelX%, %MovetwoPixelY%, RGB
	ToolTip, Seçildi{Saldırı #2 Yeri} : {%ColorMovetwo%} %MovetwoPixelX%.%MovetwoPixelY%,  %MovetwoPixelX%, %MovetwoPixelY%
	IniWrite, %ColorMovetwo%, config.ini, Moves Recognation, ColorMovetwo
return

LocalizeMoveone:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, MoveonePixelX, MoveonePixelY
	KeyWait, LButton, U 
	IniWrite, %MoveonePixelX%, config.ini, Moves Recognation, MoveonePixelX
	IniWrite, %MoveonePixelY%, config.ini, Moves Recognation, MoveonePixelY
	PixelGetColor, ColorMoveone, %MoveonePixelX%, %MoveonePixelY%, RGB
	ToolTip, Seçildi{Saldırı #1 Yeri} : {%ColorMoveone%} %MoveonePixelX%.%MoveonePixelY%,  %MoveonePixelX%, %MoveonePixelY%
	IniWrite, %ColorMoveone%, config.ini, Moves Recognation, ColorMoveone
return

SavePokemon:
	Gui, Submit, NoHide	
	IniWrite, %InfoPokes%, config.ini, Pokemons, New_Pokemons_Colors
	Reload
return

LocalizeFishing:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, FishingPixelX, FishingPixelY
	KeyWait, LButton, U 
	IniWrite, %FishingPixelX%, config.ini, Fishing Recognation, FishingPixelX
	IniWrite, %FishingPixelY%, config.ini, Fishing Recognation, FishingPixelY
	PixelGetColor, ColorFishing, %FishingPixelX%, %FishingPixelY%, RGB
	ToolTip, Seçildi{Fishing Yeri} : {%ColorFishing%} %FishingPixelX%.%FishingPixelY%,  %FishingPixelX%, %FishingPixelY%
	IniWrite, %ColorFishing%, config.ini, Fishing Recognation, ColorFishing
	GuiControl,, InfoFishing, %ColorFishing%
	;GuiControl,, Fishing, %Fishing%
return
	
LocalizeFishingMark:
	RemoveToolTip()
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	;~ CoordMode, Pixel, Screen
	KeyWait, LButton, D 
		PixelGetColor, ColorFishingMark, %FishingPixelX%, %FishingPixelY%, RGB
	KeyWait, LButton, U 
	ToolTip, Seçildi{Fishing Ünlem Yeri} : {%ColorFishingMark%} %FishingPixelX%.%FishingPixelY%,  %FishingPixelX%, %FishingPixelY%
	IniWrite, %ColorFishingMark%, config.ini, Fishing Recognation, ColorFishingMark
	GuiControl,, InfoFishingMark, %ColorFishingMark%
	;GuiControl,, Fishing, %Fishing%
return

LocalizePokemon:
	RemoveToolTip()
	;~ CoordMode, Pixel, Screen
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	KeyWait, LButton, D 
		MouseGetPos, PokemonPixelX, PokemonPixelY
	KeyWait, LButton, U 
	IniWrite, %PokemonPixelX%, config.ini, Pokemon Recognation, PokemonPixelX
	IniWrite, %PokemonPixelY%, config.ini, Pokemon Recognation, PokemonPixelY
	PixelGetColor, ColorPokemon, %PokemonPixelX%, %PokemonPixelY%, RGB
	ToolTip, Seçildi{Pokemon} : {%ColorPokemon%} %PokemonPixelX%.%PokemonPixelY%,  %PokemonPixelX%, %PokemonPixelY%
	IniWrite, %ColorPokemon%, config.ini, Pokemon Recognation, ColorPokemon
	GuiControl,, InfoPoke, %ColorPokemon%
	GuiControl,, InfoPosX, %PokemonPixelX%
	GuiControl,, InfoPosY, %PokemonPixelY%

return

LocalizeBattleMode:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	;~ CoordMode,Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, BattlePixelX, BattlePixelY
	KeyWait, LButton, U 
	IniWrite, %BattlePixelX%, config.ini, Battle Recognation, BattlePixelX
	IniWrite, %BattlePixelY%, config.ini, Battle Recognation, BattlePixelY
	PixelGetColor, ColorBattle, %BattlePixelX%, %BattlePixelY%, RGB
	ToolTip, Seçildi{BattleMode} : %BattlePixelX%.%BattlePixelY%,  %BattlePixelX%, %BattlePixelY%
	IniWrite, %ColorBattle%, config.ini, Battle Recognation, ColorBattle
	GuiControl,, InfoBattle, %ColorBattle%
	
return

Add_Pokemon:
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	RemoveToolTip()
	KeyWait, LButton, D
		PixelGetColor, New_Pokemon_Color, %PokemonPixelX%, %PokemonPixelY%, RGB
	KeyWait, LButton, U
	if (not InStr(New_Pokemons_Colors, New_Pokemon_Color)){
		TempNewPokemonColor = %New_Pokemons_Colors%|%New_Pokemon_Color%
	}
	else{
		TempNewPokemonColor = %New_Pokemons_Colors%
	}
	IniWrite, %TempNewPokemonColor%, config.ini, Pokemons, New_Pokemons_Colors
	IniRead, New_Pokemons_Colors, config.ini, Pokemons, New_Pokemons_Colors
	ToolTip, Seçildi : {%New_Pokemon_Color%} %PokemonPixelX%.%PokemonPixelY%,  %PokemonPixelX%, %PokemonPixelY%
	if (InStr(New_Pokemons_Colors, "|")) {
		NewPokemonsColors := StrSplit(New_Pokemons_Colors, "|")
	}
	else if(New_Pokemons_Colors=){
		NewPokemonsColors :=
	}
	else{
		NewPokemonsColors = % New_Pokemons_Colors
	}
	GuiControl,, InfoPokes, %New_Pokemons_Colors%

return

Run:
	Gui, Submit
	WinActivate, Pokemon Blaze Online ahk_class LWJGL
	Walk(PokemonPixelX,PokemonPixelY,BattlePixelX,BattlePixelY,ColorBattle,ColorPokemon,NewPokemonsColors,FishingPixelX,FishingPixelY,ColorFishing,Fishing,ColorFishingMark,MoveChoiceone,ColorMoveone,MoveonePixelX,MoveonePixelY,MoveChoicetwo,ColorMovetwo,MovetwoPixelX,MovetwoPixelY,MoveChoicethree,ColorMovethree,MovethreePixelX,MovethreePixelY,MoveChoicefour,ColorMovefour,MovefourPixelX,MovefourPixelY,Warning)
return
;---------------------------------------------------------------
;-----------------------FUNCTIONS-------------------------------
;---------------------------------------------------------------
;--------Random Sleep---------

RandSleep(x,y){
	
	Random, rand, %x%, %y%
	Sleep %rand%
}
;--------Random Sleep---------

RandNum(x,y){
	
	Random, out, %x%, %y%
	return %out%
}
;-------ToolTip Remove-------

RemoveToolTip(){
	ToolTip
return
}
;-------------------------- Pokemon Recognation ------------------------

pokemonRecognation(PokemonPixelX, PokemonPixelY, NewPokemonsColors){
	PixelGetColor, PColor, %PokemonPixelX%, %PokemonPixelY%, RGB
	toretrun := false
	for key, value in NewPokemonsColors{
		;MsgBox %value% = %PColor%
		if(value=PColor){
			toretrun := true
			break
		}
	}
	return toretrun
}
;-------------------------- Move Priorty Function ------------------------
moveselector(MoveChoiceone,MoveChoicetwo,MoveChoicethree,MoveChoicefour){
	return
}

;---------------------Walk------------------------

Walk(PokemonPixelX,PokemonPixelY,BattlePixelX,BattlePixelY,ColorBattle,ColorPokemon,NewPokemonsColors,FishingPixelX,FishingPixelY,ColorFishing,Fishing,ColorFishingMark,MoveChoiceone,ColorMoveone,MoveonePixelX,MoveonePixelY,MoveChoicetwo,ColorMovetwo,MovetwoPixelX,MovetwoPixelY,MoveChoicethree,ColorMovethree,MovethreePixelX,MovethreePixelY,MoveChoicefour,ColorMovefour,MovefourPixelX,MovefourPixelY,Warning){
	RemoveToolTip()
	GuiControlGet, Fighting
	GuiControlGet, Walking
	GuiControlGet, Warning
	Loop{
		Sleep 367
		ToolTip, Ara Reyso, 846, 413
		PixelGetColor, SurrColor, %BattlePixelX%, %BattlePixelY%, RGB
		if(SurrColor==ColorBattle){
			ToolTip, Aha Fight, 846, 413
			RandSleep(200,350)
			if(pokemonRecognation(PokemonPixelX, PokemonPixelY, NewPokemonsColors)=True){
				if(Fighting=1){
					send r
					RandSleep(200,350)
				}
				else{
					PixelGetColor, MoveoneColor, %MoveonePixelX%, %MoveonePixelY%, RGB
					if(MoveChoiceone="Vur"&&MoveoneColor!=ColorMoveone){
						send 1
						RandSleep(200,350)
					}
					else{
						PixelGetColor, MovetwoColor, %MovetwoPixelX%, %MovetwoPixelY%, RGB
						if(MoveChoicetwo="Vur"&&MovetwoColor!=ColorMovetwo){
							send 2
							RandSleep(200,350)
						}
						else{
							PixelGetColor, MovethreeColor, %MovethreePixelX%, %MovethreePixelY%, RGB
							if(MoveChoicethree="Vur"&&MovethreeColor!=ColorMovethree){
								send 3
								RandSleep(200,350)
							}
							else{
								PixelGetColor, MovefourColor, %MovefourPixelX%, %MovefourPixelY%, RGB
								if(MoveChoicefour="Vur"&&MovefourColor!=ColorMovefour){
									send 4
									RandSleep(200,350)
								}
							}
						}
					}
				}
			}
			else{
				Sleep 200
				PixelGetColor, SurrColor, %BattlePixelX%, %BattlePixelY%, RGB
				if(SurrColor==ColorBattle&&pokemonRecognation(PokemonPixelX, PokemonPixelY, NewPokemonsColors)=False&&Warning=1){
					maincounter = 0
					loop{
						if(maincounter < 15&&pokemonRecognation(PokemonPixelX, PokemonPixelY, NewPokemonsColors)=False){
							++maincounter
							sleep 200
						}
						else if(maincounter >= 15&&pokemonRecognation(PokemonPixelX, PokemonPixelY, NewPokemonsColors)=False){
							SoundPlay, music\Siren_Noise-KevanGC-1337458893.wav
							Pause
						}
						else{
							break
						}
					}
				}
			}
		}
		else{
			if(Fishing=1){
				IfWinActive, Pokemon Blaze Online
				{	counter = 0
					PixelGetColor, FishingColor, %FishingPixelX%, %FishingPixelY%, RGB
					if(ColorFishing=FishingColor){
						RandSleep(200,350)
						send f
						Loop{
							ToolTip %counter%
							PixelGetColor, FishingColor, %FishingPixelX%, %FishingPixelY%, RGB
							if(ColorFishingMark=FishingColor){
								send f
								break
							}
							else{
								if(counter < 15){
									++counter
									sleep 200
								}
							    else if(counter >= 15){
									break
								}
							}
					    }
					}
				}
			}
			if(Walking=1&&Fishing=0&&SurrColor!=ColorBattle){
				IfWinActive, Pokemon Blaze Online
				{	Send, {a Down}
					RandSleep(400,515)
					Send, {a Up}
					Sleep 100
					Send, {d Down}
					RandSleep(400,530)
					Send, {d Up}
					Sleep 100
				}
			}
		}
	}
}




^o::
Reload
return

^p::
ToolTip, Paused , 846, 413
Pause
return
^Numpad0:: ExitApp