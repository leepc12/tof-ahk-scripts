; Weapon/Matrice Swapper v4.1
; Written by Py-ra (Server: Nightfall, Crew: Evil)
; Discord: PYRA#4480
;
; This script works with 16:9 resolution only
; Press ESC if you want to stop a running hotkey

#IfWinActive, ahk_exe QRSL.exe
SendMode, Input
SetWorkingDir, %A_ScriptDir%

;;;; Run weapon/matrice/equipment swap combo
; - F3: Run combo1
; - F4: Run combo2
;
; Search for "F3::" and "F4::" in this script and build your own combo
; using functions. Code lines are very readable and self-explanatory

;;;; Swap-to/Equip matrices
; - F5: Swap to Matrices1 for a selected weapon
; - F6: Swap to Matrices2 for a selected weapon
; - Ctrl+F5: Equip Matrices1 for a selected weapon
; - Ctrl+F6: Equip Matrices2 for a selected weapon
; - F7: Equip (or swap to) Recommended Matrix Set 1
;
; Matrices1 and Matrices2 are 1-based indices of matrice
; location on the game UI
; 1    2    3
; 4    5    6
; ...
Matrices1 := [3,1,2,1] ; Edit this array for F5
Matrices2 := [4,3,3,2] ; Edit this array for F6

;;;; Simulacra skin
; - F9: Change to Simulacra1's skin
; - F10: Change to Simulacra2's skin
;
; You can also use either key to remove curent Simulacra skin
;
; Simulacra1 and Simulacra2 are 1-based indices of Simulacra
; location on the game UI.
; 1    2    3
; 4    5    6
;
; SkinType: "A0", "A3" or "Special" (e.g. Saki wedding, Lin bikini)
; ...
Simulacra1 := 4
Simulacra1SkinType := "A3"
Simulacra2 := 1
Simulacra2SkinType := "Special"

;;;; Other QoL hotkeys
; - F8: Open Relic Set2 and scroll to right
; - Ctrl+F8: Open Relic Set3 and scroll to right
; - F12: Click on team flag to show team HP
; - Ctrl+F12: Quick exit instance


;;;;;; DO NOT MODIFY ANYTHING BELOW
;;;;;; COORDINATES ARE BASED ON 16:9 RESOLUTION (e.g. 3840x2160)

; General
XPctBackBtn := 100/3840
YPctBackBtn := 100/2160
XPctExitInstanceBtn := 538/3840
YPctExitInstanceBtn := 128/2160
XPctTeamFlag := 3792/3840
YPctTeamFlag := 632/2160
XPctResultScreenCenter := 1920/3840
YPctResultScreenCenter := 1266/2160

; Weapon
XPctWeaponSet := 336/3840
YPctWeaponSet1 := 1020/2160
YPctWeaponSet2 := 1211/2160
YPctWeaponSet3 := 1440/2160
YPctWeaponSet4 := 1631/2160
YPctWeaponSet5 := 1838/2160
XPctWeapon1 := 871/3840
XPctWeapon2 := 1516/3840
XPctWeapon3 := 2345/3840
YPctWeapon := 1475/2160

; Equipment
XPctEquipSet1 := 314/3840
XPctEquipSet2 := 526/3840
XPctEquipSet3 := 726/3840
XPctEquipSet4 := 957/3840
XPctEquipSet5 := 1165/3840
YPctEquipSet := 1800/2160

; Matrice
XPctMatriceIcon := 3654/3840
YPctMatriceIcon := 596/2160
XPctLargeViewMatriceTL := 831/3840
YPctLargeViewMatriceTL := 476/2160
XPctAffixBtn := 2916/3840
YPctAffixBtn := 1911/2160
XPctConfirmBtn := 2517/3840
YPctConfirmBtn := 1168/2160
XPctSmallViewMatriceLeft := 1500/3840
XPctSmallViewMatriceRight := 2510/3840
YPctSmallViewMatriceTop := 650/2160
YPctSmallViewMatriceBottom := 1570/2160
XPctRecommendedMatrix := 3224/3840
YPctRecommendedMatrix := 1916/2160
XPctQuickAffixSet1 := 2859/3840
YPctQuickAffixSet1 := 735/2160
XPctSelectMatriceCol1 := 217/3840
XPctSelectMatriceCol2 := 637/3840
YPctSelectMatriceRow1 := 561/2160
YPctSelectMatriceRow2 := 958/2160

; Relic
YPctRelicSelectRow := 1070/1440
XPctEscRelic := 3567/3840
YPctEscRelic := 702/2160
XPctRelicDeploy := 915/3840
YPctRelicDeploy := 2056/2160
XPctRelicSet2 := 482/3840
XPctRelicSet3 := 457/2560
YPctRelicSet := 1202/2160

; Simulacra
XPctSelectSimulacraCol1 := 2608/3840
XPctSelectSimulacraCol2 := 3083/3840
YPctSelectSimulacraRow1 := 484/2160
YPctSelectSimulacraRow2 := 1166/2160
XPctSimulacra := 2155/3840
YPctSimulacra := 2050/2160
XPctSimulacraBtn := 3043/3840
YPctSimulacraBtn := 1930/2160
XPctSimulacraA3Skin := 1088/3840
YPctSimulacraA3Skin := 1180/2160
XPctSimulacraSpecialSkin := 605/3840
YPctSimulacraSpecialSkin := 1622/2160

; Functions
MoveMouseToXPctYPct(XPct, YPct) {
	WinGetPos, winX, winY, winWidth, winHeight, A
	X := winWidth * XPct
	Y := winHeight * YPct
	MouseMove, X, Y
}

ClickOnXPctYPct(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 652
}

ClickOnXPctYPctQuick(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 512
}

ClickOnXPctYPctVeryQuick(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 192
}

OpenWeaponMenu() {
	Send, {n}
	Sleep 892
}

OpenEquipMenu() {
	Send, {b}
	Sleep 892
}

OpenWeaponMenuQuick() {
	Send, {n}
	Sleep 492
}

SwapToWeaponSet(XPct, YPct) {
	OpenWeaponMenuQuick()

	MoveMouseToXPctYPct(XPct, YPct)
	Loop 6 {
		MouseClick, Left
		Sleep 428
	}
	Sleep 212
	Send, {esc}
}

ClickWeaponSet1() {
	global XPctWeaponSet
	global YPctWeaponSet1
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet1)
}

ClickWeaponSet2() {
	global XPctWeaponSet
	global YPctWeaponSet2
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet2)
}

ClickWeaponSet3() {
	global XPctWeaponSet
	global YPctWeaponSet3
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet3)
}

ClickWeaponSet4() {
	global XPctWeaponSet
	global YPctWeaponSet4
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet4)
}

ClickWeaponSet5() {
	global XPctWeaponSet
	global YPctWeaponSet5
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet5)
}

ClickEquipSet1() {
	global XPctEquipSet1
	global YPctEquipSet
	ClickOnXPctYPct(XPctEquipSet1, YPctEquipSet)
}

ClickEquipSet2() {
	global XPctEquipSet2
	global YPctEquipSet
	ClickOnXPctYPct(XPctEquipSet2, YPctEquipSet)
}

ClickEquipSet3() {
	global XPctEquipSet3
	global YPctEquipSet
	ClickOnXPctYPct(XPctEquipSet3, YPctEquipSet)
}

ClickEquipSet4() {
	global XPctEquipSet4
	global YPctEquipSet
	ClickOnXPctYPct(XPctEquipSet4, YPctEquipSet)
}

ClickEquipSet5() {
	global XPctEquipSet5
	global YPctEquipSet
	ClickOnXPctYPct(XPctEquipSet5, YPctEquipSet)
}

SwapToWeaponSet1() {
	global XPctWeaponSet
	global YPctWeaponSet1
	SwapToWeaponSet(XPctWeaponSet, YPctWeaponSet1)
}

SwapToWeaponSet2() {
	global XPctWeaponSet
	global YPctWeaponSet2
	SwapToWeaponSet(XPctWeaponSet, YPctWeaponSet2)
}

SwapToWeaponSet3() {
	global XPctWeaponSet
	global YPctWeaponSet3
	SwapToWeaponSet(XPctWeaponSet, YPctWeaponSet3)
}

ClickWeapon1() {
	global XPctWeapon1
	global YPctWeapon
	ClickOnXPctYPct(XPctWeapon1, YPctWeapon)
}

ClickWeapon2() {
	global XPctWeapon2
	global YPctWeapon
	ClickOnXPctYPct(XPctWeapon2, YPctWeapon)
}

ClickWeapon3() {
	global XPctWeapon3
	global YPctWeapon
	ClickOnXPctYPct(XPctWeapon3, YPctWeapon)
}

MoveMouseToWeapon1() {
	global XPctWeapon1
	global YPctWeapon
	MoveMouseToXPctYPct(XPctWeapon1, YPctWeapon)
}

MoveMouseToWeapon2() {
	global XPctWeapon2
	global YPctWeapon
	MoveMouseToXPctYPct(XPctWeapon2, YPctWeapon)
}

MoveMouseToWeapon3() {
	global XPctWeapon3
	global YPctWeapon
	MoveMouseToXPctYPct(XPctWeapon3, YPctWeapon)
}

ClickLargeViewMatriceTL() {
	global XPctLargeViewMatriceTL
	global YPctLargeViewMatriceTL
	ClickOnXPctYPct(XPctLargeViewMatriceTL, YPctLargeViewMatriceTL)
}

ClickRecommendedMatrix() {
	global XPctRecommendedMatrix
	global YPctRecommendedMatrix
	ClickOnXPctYPct(XPctRecommendedMatrix, YPctRecommendedMatrix)
}

ClickQuickAffixSet1() {
	global XPctQuickAffixSet1
	global YPctQuickAffixSet1
	ClickOnXPctYPct(XPctQuickAffixSet1, YPctQuickAffixSet1)
}

ClickBackBtn() {
	global XPctBackBtn
	global YPctBackBtn
	ClickOnXPctYPct(XPctBackBtn, YPctBackBtn)
}

ClickMatriceIcon() {
	global XPctMatriceIcon
	global YPctMatriceIcon
	ClickOnXPctYPct(XPctMatriceIcon, YPctMatriceIcon)	
}

ClickSmallViewMatriceTL() {
	global XPctSmallViewMatriceLeft
	global YPctSmallViewMatriceTop
	ClickOnXPctYPctQuick(XPctSmallViewMatriceLeft, YPctSmallViewMatriceTop)
}

ClickSmallViewMatriceTR() {
	global XPctSmallViewMatriceRight
	global YPctSmallViewMatriceTop
	ClickOnXPctYPctQuick(XPctSmallViewMatriceRight, YPctSmallViewMatriceTop)
}

ClickSmallViewMatriceBL() {
	global XPctSmallViewMatriceLeft
	global YPctSmallViewMatriceBottom
	ClickOnXPctYPctQuick(XPctSmallViewMatriceLeft, YPctSmallViewMatriceBottom)
}

ClickSmallViewMatriceBR() {
	global XPctSmallViewMatriceRight
	global YPctSmallViewMatriceBottom
	ClickOnXPctYPctQuick(XPctSmallViewMatriceRight, YPctSmallViewMatriceBottom)
}

GetSelectMatriceXPct(Id) {
	global XPctSelectMatriceCol1
	global XPctSelectMatriceCol2
	; Id is one-based here
	return Mod(Id-1, 3) * (XPctSelectMatriceCol2-XPctSelectMatriceCol1) + XPctSelectMatriceCol1
}

GetSelectMatriceYPct(Id) {
	global YPctSelectMatriceRow1
	global YPctSelectMatriceRow2
	; Id is one-based here
	return Floor((Id-1)/3) * (YPctSelectMatriceRow2-YPctSelectMatriceRow1) + YPctSelectMatriceRow1
}

GetSelectSimulacraXPct(Id) {
	global XPctSelectSimulacraCol1
	global XPctSelectSimulacraCol2
	; Id is one-based here
	return Mod(Id-1, 3) * (XPctSelectSimulacraCol2-XPctSelectSimulacraCol1) + XPctSelectSimulacraCol1
}

GetSelectSimulacraYPct(Id) {
	global YPctSelectSimulacraRow1
	global YPctSelectSimulacraRow2
	; Id is one-based here
	return Floor((Id-1)/3) * (YPctSelectSimulacraRow2-YPctSelectSimulacraRow1) + YPctSelectSimulacraRow1
}

ClickSelectMatrice(Id) {
	XPct := GetSelectMatriceXPct(Id)
	YPct := GetSelectMatriceYPct(Id)
	ClickOnXPctYPctQuick(XPct, YPct)
}

ClickSelectSimulacra(Id) {
	XPct := GetSelectSimulacraXPct(Id)
	YPct := GetSelectSimulacraYPct(Id)
	ClickOnXPctYPctQuick(XPct, YPct)
}

ClickAffix() {
	global XPctAffixBtn
	global YPctAffixBtn
	ClickOnXPctYPctQuick(XPctAffixBtn, YPctAffixBtn)
}

ClickOk() {
	global XPctConfirmBtn
	global YPctConfirmBtn
	ClickOnXPctYPctQuick(XPctConfirmBtn, YPctConfirmBtn)
}

ClickSelectMatriceAndAffixAndOk(Id, Swap) {
	ClickSelectMatrice(Id)
	Sleep 100
	ClickAffix()
	If (Swap) {
		ClickOk()
	}
}

PressEsc() {
	Send, {Esc}
	Sleep 512
}

AltClickTeamFlag() {
	global XPctTeamFlag
	global YPctTeamFlag
	Send {Alt Down}
	Sleep 102
	ClickOnXPctYPctVeryQuick(XPctTeamFlag, YPctTeamFlag)
	ClickOnXPctYPctQuick(XPctTeamFlag, YPctTeamFlag)
	Send {Alt Up}
}

AltClickResultScreenCenter() {
	global XPctResultScreenCenter
	global YPctResultScreenCenter
	Send {Alt Down}
	Sleep 102
	ClickOnXPctYPctVeryQuick(XPctResultScreenCenter, YPctResultScreenCenter)
	ClickOnXPctYPctQuick(XPctResultScreenCenter, YPctResultScreenCenter)
	Send {Alt Up}
}

AltClickExitInstanceBtnAndOk() {
	global XPctExitInstanceBtn
	global YPctExitInstanceBtn
	Send {Alt Down}
	Sleep 102
	ClickOnXPctYPctVeryQuick(XPctExitInstanceBtn, YPctExitInstanceBtn)
	ClickOnXPctYPctQuick(XPctExitInstanceBtn, YPctExitInstanceBtn)
	Send {Alt Up}
	Sleep 402
	ClickOk()
}

ClickRelic() {	
	global XPctEscRelic
	global YPctEscRelic
	ClickOnXPctYPct(XPctEscRelic, YPctEscRelic)
}

ClickRelicDeploy() {
	global XPctRelicDeploy
	global YPctRelicDeploy
	ClickOnXPctYPct(XPctRelicDeploy, YPctRelicDeploy)
}

ClickRelicSet2() {
	global XPctRelicSet2
	global YPctRelicSet
	ClickOnXPctYPct(XPctRelicSet2, YPctRelicSet)
}

ClickRelicSet3() {
	global XPctRelicSet3
	global YPctRelicSet
	ClickOnXPctYPct(XPctRelicSet3, YPctRelicSet)
}

ClickRelicSelectRowAndLeftSwipe() {
	global YPctRelicSelectRow	
	MoveMouseToXPctYPct(0.8, YPctRelicSelectRow)
	Sleep 150
	Loop 65 {
		Send, {WheelDown}
		Sleep 35
	}
}

RelicSet2() {
	PressEsc()
	Sleep 300
	ClickRelic()
	ClickRelicDeploy()
	ClickRelicSet2()
	ClickRelicSelectRowAndLeftSwipe()
}

RelicSet3() {
	PressEsc()
	Sleep 300
	ClickRelic()
	ClickRelicDeploy()
	ClickRelicSet3()
	ClickRelicSelectRowAndLeftSwipe()
}

ClickSimulacra() {
	global XPctSimulacra
	global YPctSimulacra
	ClickOnXPctYPct(XPctSimulacra, YPctSimulacra)
}

ClickSimulacraBtn() {
	global XPctSimulacraBtn
	global YPctSimulacraBtn
	ClickOnXPctYPct(XPctSimulacraBtn, YPctSimulacraBtn)
}

ClickSimulacraA3Skin() {
	global XPctSimulacraA3Skin
	global YPctSimulacraA3Skin
	ClickOnXPctYPct(XPctSimulacraA3Skin, YPctSimulacraA3Skin)
}

ClickSimulacraSpecialSkin() {
	global XPctSimulacraSpecialSkin
	global YPctSimulacraSpecialSkin
	ClickOnXPctYPct(XPctSimulacraSpecialSkin, YPctSimulacraSpecialSkin)
}

SwapToMatrices1() {
	EquipMatrices1(True)
}

SwapToMatrices2() {
	EquipMatrices2(True)
}

EquipMatrices1(Swap=False) {
	global Matrices1
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep 212
	ClickSelectMatriceAndAffixAndOk(Matrices1[1], Swap)
	ClickSmallViewMatriceTR()
	ClickSelectMatriceAndAffixAndOk(Matrices1[2], Swap)
	ClickSmallViewMatriceBL()
	ClickSelectMatriceAndAffixAndOk(Matrices1[3], Swap)
	ClickSmallViewMatriceBR()
	ClickSelectMatriceAndAffixAndOk(Matrices1[4], Swap)
	ClickBackBtn()
	ClickBackBtn()
}

EquipMatrices2(Swap=False) {
	global Matrices2
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep 212
	ClickSelectMatriceAndAffixAndOk(Matrices2[1], Swap)
	ClickSmallViewMatriceTR()
	ClickSelectMatriceAndAffixAndOk(Matrices2[2], Swap)
	ClickSmallViewMatriceBL()
	ClickSelectMatriceAndAffixAndOk(Matrices2[3], Swap)
	ClickSmallViewMatriceBR()
	ClickSelectMatriceAndAffixAndOk(Matrices2[4], Swap)
	ClickBackBtn()
	ClickBackBtn()
}

SwapToRecommendedMatrix1() {
	EquipRecommendedMatrix1(True)
}

EquipRecommendedMatrix1(Swap=False) {
	ClickMatriceIcon()
	ClickRecommendedMatrix()
	ClickQuickAffixSet1()
	If (Swap) {
		ClickOk()
	}
	ClickBackBtn()
}

; Hotkeys

; "Equip-" functions affix matrices without clicking on Ok button
; "SwapTo-" functions affix matrices and click on Ok button

F3::
OpenWeaponMenuQuick()
ClickWeaponSet1()
ClickWeapon3()
SwapToMatrices1()
ClickWeapon1()
EquipMatrices2()
OpenEquipMenu()
ClickEquipSet1()
ClickBackBtn()
return

F4::
OpenWeaponMenuQuick()
ClickWeaponSet2()
ClickWeapon3()
SwapToRecommendedMatrix1()
ClickWeapon2()
EquipMatrices1()
OpenEquipMenu()
ClickEquipSet2()
ClickBackBtn()
return


F5::
SwapToMatrices1()
return

^F5::
VK19 & F5::
EquipMatrices1()
return

F6::
SwapToMatrices2()
return

^F6::
VK19 & F6::
EquipMatrices2()
return

F7::
SwapToRecommendedMatrix1()
return

F8::
RelicSet2()
return

^F8::
VK19 & F8::
RelicSet3()
return

F9::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(Simulacra1)
If ( Simulacra1SkinType = "Special" ) {
	ClickSimulacraSpecialSkin()
}
Else If ( Simulacra1SkinType = "A3" ) {
	ClickSimulacraA3Skin()
}
ClickSimulacraBtn()
ClickBackBtn()
return

F10::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(Simulacra2)
If ( Simulacra2SkinType = "Special" ) {
	ClickSimulacraSpecialSkin()
}
Else If ( Simulacra2SkinType = "A3" ) {
	ClickSimulacraA3Skin()
}
ClickSimulacraBtn()
ClickBackBtn()
return

F12::
AltClickTeamFlag()
return

^F12::
VK19 & F12::
AltClickExitInstanceBtnAndOk()
return

Pause::
AltClickResultScreenCenter()
return

Esc::
PressEsc()
Reload
return
