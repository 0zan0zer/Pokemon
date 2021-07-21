﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
;~ ;----------------------Coordinates:1123.451---------------------------
;~ Pokemons_colors := [0xA36159, 0x40690F, 0x173882, 0x8AAB30, 0x69C451 ]
;~ Pokemons_names  := ["Pidgey", "Bellsprout", "Gloom", "Oddish", "Weepinbell" ]
;----------------------Coordinates:568.487---------------------------
Pokemons_colors := [0xFEED9B, 0xD46169, 0x592800, 0x9BD449, 0xFEFEFE, 0xA38ABC, 0xABD4ED, 0xE5E582, 0xC43028, 0x178AAB, 0xFE4040, 0xCC9B0F, 0xFEE57A, 0xB3E551, 0xEDE5FE, 0xEDEDFE, 0xF5ED93, 0xF5E551, 0xFEFEAB, 0x594030, 0xE50F00, 0xB19778, 0xFEAB61, 0xF5E5AB, 0x539DC5, 0xC4597A, 0xBCB3A3, 0x0F0F0F, 0x617AC4, 0xCCAB61 ]
Pokemons_names  := ["Pidgey", "Bellsprout", "Gloom", "Oddish", "Weepinbell", "Venonat", "Phanpy", "[S]Pidgey", "Pidgeotto", "Panpour", "Caterpie", "Kakuna", "Weedle", "Metapod", "Beedrill","Butterfree", "Pichu", "Pichu[Spo]", "[S]Weedle", "Pinsir", "[S]Caterpie", "Diglett", "Paras", "Audino", "Nidorino", "Buneary", "Mincino", "Bunnelby", "Spearow", "Ratata" ]
InfoBattle := 0
InfoPoke := 0
InfoEnemyHP := 0
InfoPoxX := 0
InfoPosY := 0
;----------------Read Pokemon-------------
IniRead, PokemonPixelX, config.ini, Pokemon Recognation, PokemonPixelX
IniRead, PokemonPixelY, config.ini, Pokemon Recognation, PokemonPixelY
IniRead, ColorPokemon, config.ini, Pokemon Recognation, ColorPokemon
;----------------Read Battle--------------
IniRead, BattlePixelX, config.ini, Battle Recognation, BattlePixelX
IniRead, BattlePixelY, config.ini, Battle Recognation, BattlePixelY
IniRead, ColorBattle, config.ini, Battle Recognation, Colorbattle
;----------------Read EnemyHP--------------
IniRead, EnemyHPPixelX, config.ini, EnemyHP Recognation, EnemyHPPixelX
IniRead, EnemyHPPixelY, config.ini, EnemyHP Recognation, EnemyHPPixelY
IniRead, ColorEnemyHP, config.ini, EnemyHP Recognation, ColorEnemyHP
;----------------Read OwnHP--------------
IniRead, OwnHPPixelX, config.ini, OwnHP Recognation, OwnHPPixelX
IniRead, OwnHPPixelY, config.ini, OwnHP Recognation, OwnHPPixelY
IniRead, ColorOwnHP, config.ini, OwnHP Recognation, ColorOwnHP
;-------------------------------------------------------------------
;--------------------------------GUI--------------------------------
;-------------------------------------------------------------------

Gui M3chBot: New, -MaximizeBox
Gui, +AlwaysOnTop

Gui Add, Tab2, x2 y2 w300 h300, Oyun|Lokasyon

Gui, Tab, Oyun
Gui Add, Button, x235 y270 w60 h23 gRun, Başlat
Gui Add, Button, x170 y270 w60 h23 gOpen, Aç

Gui, Tab, Lokasyon
Gui Add, Button, x30 y60 w160 h23 gLocalizePokemon, Localize Pokemon's Pixel
Gui Add, Edit, x200 y61 w70 h21 vInfoPoke, %ColorPokemon%
Gui Add, Text, x30 y95 w20 h21, X=
Gui Add, Edit, x50 y90 w70 h21 vInfoPosX, %PokemonPixelX%
Gui Add, Text, x130 y95 w20 h21, Y=
Gui Add, Edit, x150 y90 w70 h21 vInfoPosY, %PokemonPixelY%
Gui Add, Button, x230 y90 w40 h21 gGoToLoc, Git
Gui Add, Button, x30 y120 w160 h23 gLocalizeBattleMode, Localize BattleMode
Gui Add, Edit, x200 y121 w70 h21 vInfoBattle, %ColorBattle%
Gui Add, Button, x30 y180 w160 h23 gLocalizeEnemyHP, Localize EnemyHP
Gui Add, Edit, x200 y181 w70 h21 vInfoEnemyHP, %ColorEnemyHP%
Gui Add, Button, x30 y210 w160 h23 gLocalizeOwnHP, Localize OwnHP
Gui Add, Edit, x200 y211 w70 h21 vInfoOwnHP, %ColorOwnHP%
Gui Add, Button, x190 y270 w100 h23 gRemoveToolTip, RemoveToolTip

Gui Show, w310 h310, M3chBot
return

M3chBotGuiEscape:
M3chBotGuiClose:
    ExitApp
	
;---------------------------------------------------------------
;---------------------GUI REFERENCE-----------------------------
;---------------------------------------------------------------
LocalizePokemon:
	;~ CoordMode, Pixel, Screen
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

LocalizeEnemyHP:
	;~ CoordMode,Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, EnemyHPPixelX, EnemyHPPixelY
	KeyWait, LButton, U 
	IniWrite, %EnemyHPPixelX%, config.ini, EnemyHP Recognation, EnemyHPPixelX
	IniWrite, %EnemyHPPixelY%, config.ini, EnemyHP Recognation, EnemyHPPixelY
	PixelGetColor, ColorEnemyHP, %EnemyHPPixelX%, %EnemyHPPixelY%, RGB
	ToolTip, Seçildi{EnemyHP} : %EnemyHPPixelX%.%EnemyHPPixelY%,  %EnemyHPPixelX%, %EnemyHPPixelY%
	IniWrite, %ColorEnemyHP%, config.ini, EnemyHP Recognation, ColorEnemyHP
	GuiControl,, InfoEnemyHP, %ColorEnemyHP%
	
return

LocalizeOwnHP:
	;~ CoordMode,Pixel, Screen
	KeyWait, LButton, D 
		MouseGetPos, OwnHPPixelX, OwnHPPixelY
	KeyWait, LButton, U 
	IniWrite, %OwnHPPixelX%, config.ini, OwnHP Recognation, OwnHPPixelX
	IniWrite, %OwnHPPixelY%, config.ini, OwnHP Recognation, OwnHPPixelY
	PixelGetColor, ColorOwnHP, %OwnHPPixelX%, %OwnHPPixelY%, RGB
	ToolTip, Seçildi{OwnHP} : %OwnHPPixelX%.%OwnHPPixelY%,  %OwnHPPixelX%, %OwnHPPixelY%
	IniWrite, %ColorOwnHP%, config.ini, OwnHP Recognation, ColorOwnHP
	GuiControl,, InfoOwnHP, %ColorOwnHP%
	
return

GoToLoc:
	Gui Submit, Nohide
	GuiControlGet, InfoPosX
	GuiControlGet, InfoPosY
	PokemonPixelX = %InfoPosX%
	PokemonPixelY = %InfoPosY%
	IniWrite, %PokemonPixelX%, config.ini, Pokemon Recognation, PokemonPixelX
	IniWrite, %PokemonPixelY%, config.ini, Pokemon Recognation, PokemonPixelY
	GuiControl,, InfoPoke, "Değiştirildi"
	
return

Run:
	Gui, Submit
	Walk(PokemonPixelX,PokemonPixelY,BattlePixelX,BattlePixelY,ColorBattle,ColorPokemon,Pokemons_colors, Pokemons_names,ColorEnemyHP,EnemyHPPixelX,EnemyHPPixelY,ColorOwnHP,OwnHPPixelX,OwnHPPixelY)
return

Open:
	run C:\Users\Ozan\Downloads\PokemonPlanet1920x1080.exe
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
;-------CheckColor------------

;~ CheckColor(PixelColX,PixelColY){
	;~ RemoveToolTip()
	;~ PixelGetColor, Color, %PixelColX%, %PixelColY%, RGB
	;~ ToolTip, Renk : {%Color%},  %PixelColX%, %PixelColY%,
	
;~ }
;-------------------------- Pokemon Recognation ------------------------

pokemonRecognation(PokemonPixelX, PokemonPixelY, Pokemons_colors, Pokemons_names){
	;~ CoordMode ,Pixel,Screen
	PixelGetColor, PColor, %PokemonPixelX%, %PokemonPixelY%, RGB

	toretrun := false

	for key, value in Pokemons_colors{
		if( value = PColor )
			toretrun := Pokemons_names[key]
	}
	
	ToolTip, Pokemon Recognation :  %PColor% - %toretrun% - %PokemonPixelX%.%PokemonPixelY%, 846, 413
	
	return toretrun
}

;---------------------Walk------------------------

Walk(PokemonPixelX,PokemonPixelY,BattlePixelX,BattlePixelY,ColorBattle,ColorPokemon,Pokemons_colors, Pokemons_names,ColorEnemyHP,EnemyHPPixelX,EnemyHPPixelY,ColorOwnHP,OwnHPPixelX,OwnHPPixelY){
	RemoveToolTip()
	Loop{
		PixelGetColor, SurrColor, %BattlePixelX%, %BattlePixelY%, RGB
		ToolTip, Geting Surround Color, 846, 413
		if(SurrColor==ColorBattle){
			if(pokemonRecognation(PokemonPixelX, PokemonPixelY, Pokemons_colors, Pokemons_names) = false&&SurrColor==ColorBattle){
				Msgbox, Snorlax Abi
				Pause
			}
			else{
				if(SurrColor==ColorBattle&&pokemonRecognation(PokemonPixelX, PokemonPixelY, Pokemons_colors, Pokemons_names) != false){			 
					PixelGetColor, OHPColor, %OwnHPPixelX%, %OwnHPPixelY%, RGB
					if(OHPColor==ColorOwnHP){
						PixelGetColor, EHPColor, %EnemyHPPixelX%, %EnemyHPPixelY%, RGB
						if(EHPColor==0x444444){
							loop{
								ToolTip, Waiting, 846, 413
								PixelGetColor, SurrColor, %BattlePixelX%, %BattlePixelY%, RGB
								if(SurrColor!=ColorBattle&&pokemonRecognation(PokemonPixelX, PokemonPixelY, Pokemons_colors, Pokemons_names) == false){
									break	
								}
								else{
									sleep 100
								}
							}
						}
						else{
							ToolTip, Attack!, 846, 413
							Sleep, 1 000
							send 1
							RandSleep(200,400)
							send 1
							RandSleep(1000,1400)
						}
					}
					else{
						ToolTip, Healing, 846, 413
						send 1
						RandSleep(500,1000)
						send 4
						RandSleep(1000,1400)
					}
				}
			}
		}
		else{
			ToolTip, Searching Pokemons, 846, 413
			send {a down}
			RandSleep(300, 1000)
			send {a up}
			RandSleep(100, 400)
			send {d down}
			RandSleep(300, 1000)
			send {d up}
			RandSleep(100, 400)
		}
	}
}








^p::
ToolTip, Paused , 846, 413
Pause
return
^Numpad0:: ExitApp