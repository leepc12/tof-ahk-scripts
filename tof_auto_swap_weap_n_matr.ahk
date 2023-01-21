; ToF Weapon/Equipment/Matrice/Simulacra Swapper v5.0
; Discord: Py-ra#4480
;
; This script works only with FHD, QHD and 4k resolution
; Press ESC to stop any running hotkey
;
; For controllers, best works with this reWASD configuration:
; https://www.rewasd.com/community/config/0310aea0989a70bcba40a70f0694ca99

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
; - F7: Swap to Matrices2 for a selected weapon
; - Ctrl+F5: Equip Matrices1 for a selected weapon
; - Ctrl+F6: Equip Matrices2 for a selected weapon
; - Ctrl+F7: Equip Matrices3 for a selected weapon
;
; "Swap-to" action does "Equip" and then click on "Ok" button
;
; Matrices1 and Matrices2 are 1-based indices of matrice location
; for each part: [TopLeft, TopRight, BottomLeft, BottomRight]
; Set as 0 to skip swapping for a part.
;
; 1    2    3
; 4    5    6
; 7    8    9
; ...
Matrices1 := [1,3,1,4] ; Edit this array for F5
Matrices2 := [4,4,3,2] ; Edit this array for F6
Matrices3 := [3,1,2,1] ; Edit this array for F7

;;;; Simulacra Trait
; - Ctrl+F3: Use trait of SimulacraTrait1
; - Ctrl+F4: Use trait of SimulacraTrait2
; - Ctrl+Alt+F3: Use trait of SimulacraTrait3
; - Ctrl+Alt+F4: Use trait of SimulacraTrait4
;
; SimulacraTrait1 and SimulacraTrait2 are 1-based indices of
;
; Simulacra on the game UI. Script will scroll down if index > 6
; 1    2    3
; 4    5    6
; 7    8    9 (script will scroll down)
; ...
SimulacraTrait1 := 6 ; Edit this for Ctrl+F3
SimulacraTrait2 := 8 ; Edit this for Ctrl+F4
SimulacraTrait3 := 4 ; Edit this for Ctrl+Alt+F3
SimulacraTrait4 := 11 ; Edit this for Ctrl+Alt+F4

;;;; Simulacra skin
; - F9: Change to Simulacra1's skin
; - F10: Change to Simulacra2's skin
;
; SkinType: "A0", "A3" or "Special" (e.g. Saki wedding, Lin bikini)
SimulacraSkin1 := 3	; Edit this for F9
SimulacraSkinType1 := "Special" ; Edit this for F9
SimulacraSkin2 := 1 ; Edit this for F10
SimulacraSkinType2 := "Special" ; Edit this for F10

;;;; Other QoL hotkeys
; - F8: Open Relic Set2 and scroll to right
; - F12: Click on team flag to show team HP
; - Ctrl+F12: Quick exit instance
; - Pause: Click on the center of battle result screen
; - Mouse Mid-Click: Toggle hold-Alt


;;;;;;;;;;;;;;;;;;; DO NOT MODIFY ANYTHING BELOW ;;;;;;;;;;;;;;;;;;;;
AltStatus := False

; General
XPctBackBtn := 100/3840
YPctBackBtn := 100/2160
XPctExitInstanceBtn := 538/3840
YPctExitInstanceBtn := 128/2160
XPctTeamFlag := 3792/3840
YPctTeamFlag := 632/2160
XPctResultScreenCenter := 3240/3840
YPctResultScreenCenter := 1591/2160
XPctMapProgess := 3592/3840
YPctMapProgess := 2048/2160

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
XPctOkBtn := 2396/3840
YPctOkBtn := 1111/2160
XPctOkBtnAlone := 2270/3840
YPctOkBtnAlone := 1136/2160
XPctApproveBtn := 2200/3840
YPctApproveBtn := 1544/2160

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
XPctSimulacraTraitToggle := 3300/3840
YPctSimulacraTraitToggle := 1694/2160
XPctSimulacraBtn := 3043/3840
YPctSimulacraBtn := 1930/2160
XPctSimulacraA3Skin := 1088/3840
YPctSimulacraA3Skin := 1180/2160
XPctSimulacraSpecialSkin := 605/3840
YPctSimulacraSpecialSkin := 1622/2160

; Quick Swap Weapon
NumClickSwapToWeaponSet := 2

; Scrolling (Relic, Simulacra)
NumScrollSimulacraPage := 14
NumScrollRelic := 55

; Delay
DelayClick := 472
DelayClickQuick := 312
DelayClickVeryQuick := 172
DelayRelicSet := 300
DelayEquipMatrice := 212
DelayGeneralVeryLong := 990
DelayGeneralLong := 502
DelayGeneralShort := 102
DelayClickSwapToWeaponSet := 328
DelayOpenWeaponMenu := 592
DelayOpenWeaponMenuQuick := 492
DelayOpenEquipMenu := 892
DelayClickWeaponSet := 812
DelayScroll := 35

; Functions
MoveMouseToXPctYPct(XPct, YPct) {
	WinGetPos, winX, winY, winWidth, winHeight, A
	X := winWidth * XPct
	Y := winHeight * YPct
	MouseMove, X, Y
}

ClickOnXPctYPct(XPct, YPct) {
	global DelayClick
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep DelayClick
}

ClickOnXPctYPctQuick(XPct, YPct) {
	global DelayClickQuick
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep DelayClickQuick
}

ClickOnXPctYPctVeryQuick(XPct, YPct) {
	global DelayClickVeryQuick
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep DelayClickVeryQuick
}

OpenWeaponMenu() {
	global DelayOpenWeaponMenu
	Send, {n}
	Sleep DelayOpenWeaponMenu
}

OpenEquipMenu() {
	global DelayOpenEquipMenu
	Send, {b}
	Sleep DelayOpenEquipMenu
}

OpenWeaponMenuQuick() {
	global DelayOpenWeaponMenuQuick
	Send, {n}
	Sleep DelayOpenWeaponMenuQuick
}

SwapToWeaponSet(XPct, YPct) {
	global NumClickSwapToWeaponSet
	global DelayClickSwapToWeaponSet
	OpenWeaponMenuQuick()

	MoveMouseToXPctYPct(XPct, YPct)
	Loop %NumClickSwapToWeaponSet% {
		MouseClick, Left
		Sleep DelayClickSwapToWeaponSet
	}
}

ClickWeaponSet1() {
	global XPctWeaponSet
	global YPctWeaponSet1
	global DelayClickWeaponSet
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet1)
	Sleep DelayClickWeaponSet
}

ClickWeaponSet2() {
	global XPctWeaponSet
	global YPctWeaponSet2
	global DelayClickWeaponSet
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet2)
	Sleep DelayClickWeaponSet
}

ClickWeaponSet3() {
	global XPctWeaponSet
	global YPctWeaponSet3
	global DelayClickWeaponSet
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet3)
	Sleep DelayClickWeaponSet
}

ClickWeaponSet4() {
	global XPctWeaponSet
	global YPctWeaponSet4
	global DelayClickWeaponSet
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet4)
	Sleep DelayClickWeaponSet
}

ClickWeaponSet5() {
	global XPctWeaponSet
	global YPctWeaponSet5
	global DelayClickWeaponSet
	ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet5)
	Sleep DelayClickWeaponSet
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

ClickMapProgress() {
	global XPctMapProgess
	global YPctMapProgess
	ClickOnXPctYPctQuick(XPctMapProgess, YPctMapProgess)
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

ScrollDownBeforeSelectSimulacra(Id) {
	global NumScrollSimulacraPage
	global XPctSelectSimulacraCol1
	global YPctSelectSimulacraRow1
	global DelayScroll
	global DelayGeneralVeryLong

	NumScroll := Floor((Id-1)/6)*NumScrollSimulacraPage

	If (NumScroll > 0) {
		MoveMouseToXPctYPct(XPctSelectSimulacraCol1, YPctSelectSimulacraRow1)
		Sleep DelayGeneralVeryLong
		Loop %NumScroll% {
			Send, {WheelDown}
			Sleep DelayScroll
		}
	}
}

ClickSelectMatrice(Id) {
	XPct := GetSelectMatriceXPct(Id)
	YPct := GetSelectMatriceYPct(Id)
	ClickOnXPctYPctQuick(XPct, YPct)
}

ClickSelectSimulacra(Id) {
	ScrollDownBeforeSelectSimulacra(Id)
	IdAfterScroll := Mod(Id-1, 6) + 1
	XPct := GetSelectSimulacraXPct(IdAfterScroll)
	YPct := GetSelectSimulacraYPct(IdAfterScroll)
	ClickOnXPctYPctQuick(XPct, YPct)
}

ClickAffix() {
	global XPctAffixBtn
	global YPctAffixBtn
	ClickOnXPctYPctQuick(XPctAffixBtn, YPctAffixBtn)
}

ClickOk() {
	global XPctOkBtn
	global YPctOkBtn
	ClickOnXPctYPctQuick(XPctOkBtn, YPctOkBtn)
}

ClickOkAlone() {
	global XPctOkBtnAlone
	global YPctOkBtnAlone
	ClickOnXPctYPctQuick(XPctOkBtnAlone, YPctOkBtnAlone)
}

ClickApprove() {
	global XPctApproveBtn
	global YPctApproveBtn
	ClickOnXPctYPctQuick(XPctApproveBtn, YPctApproveBtn)
}

ClickSelectMatriceAndAffixAndOk(Id, Swap) {
	global DelayGeneralShort
	ClickSelectMatrice(Id)
	Sleep DelayGeneralShort
	ClickAffix()
	If (Swap) {
		ClickOk()
	}
}

PressEsc() {
	global DelayGeneralLong
	Send, {Esc}
	Sleep DelayGeneralLong
}

AltClickTeamFlag() {
	global XPctTeamFlag
	global YPctTeamFlag
	global DelayGeneralShort
	Send {Alt Down}
	Sleep DelayGeneralShort
	ClickOnXPctYPctVeryQuick(XPctTeamFlag, YPctTeamFlag)
	ClickOnXPctYPctQuick(XPctTeamFlag, YPctTeamFlag)
	Send {Alt Up}
}

AltClickResultScreenCenter() {
	global XPctResultScreenCenter
	global YPctResultScreenCenter
	global DelayGeneralShort
	Send {Alt Down}
	Sleep DelayGeneralShort
	ClickOnXPctYPctVeryQuick(XPctResultScreenCenter, YPctResultScreenCenter)
	Send {Alt Up}
}

AltClickExitInstanceBtnAndOk() {
	global XPctExitInstanceBtn
	global YPctExitInstanceBtn
	global DelayGeneralShort
	global DelayGeneralLong
	Send {Alt Down}
	Sleep DelayGeneralShort
	ClickOnXPctYPctVeryQuick(XPctExitInstanceBtn, YPctExitInstanceBtn)
	ClickOnXPctYPctQuick(XPctExitInstanceBtn, YPctExitInstanceBtn)
	Send {Alt Up}
	Sleep DelayGeneralLong
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

ClickRelicSelectRowAndScrollRight() {
	global YPctRelicSelectRow
	global DelayScroll
	global NumScrollRelic
	global DelayGeneralLong
	MoveMouseToXPctYPct(0.8, YPctRelicSelectRow)
	Sleep DelayGeneralLong
	Loop %NumScrollRelic% {
		Send, {WheelDown}
		Sleep DelayScroll
	}
}

RelicSet2() {
	global DelayRelicSet
	PressEsc()
	Sleep DelayRelicSet
	ClickRelic()
	ClickRelicDeploy()
	ClickRelicSet2()
	ClickRelicSelectRowAndScrollRight()
}

RelicSet3() {
	global DelayRelicSet
	PressEsc()
	Sleep DelayRelicSet
	ClickRelic()
	ClickRelicDeploy()
	ClickRelicSet3()
	ClickRelicSelectRowAndScrollRight()
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

ClickSimulacraTraitToggle() {
	global XPctSimulacraTraitToggle
	global YPctSimulacraTraitToggle
	ClickOnXPctYPct(XPctSimulacraTraitToggle, YPctSimulacraTraitToggle)
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

SwapToMatrices3() {
	EquipMatrices3(True)
}

EquipMatrices1(Swap=False) {
	global DelayEquipMatrice
	global Matrices1
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep DelayEquipMatrice
	If (Matrices1[1] > 0) {
		ClickSelectMatriceAndAffixAndOk(Matrices1[1], Swap)
	}
	If (Matrices1[2] > 0) {
		ClickSmallViewMatriceTR()
		ClickSelectMatriceAndAffixAndOk(Matrices1[2], Swap)
	}
	If (Matrices1[3] > 0) {
		ClickSmallViewMatriceBL()
		ClickSelectMatriceAndAffixAndOk(Matrices1[3], Swap)
	}
	If (Matrices1[4] > 0) {
		ClickSmallViewMatriceBR()
		ClickSelectMatriceAndAffixAndOk(Matrices1[4], Swap)
	}
	ClickBackBtn()
	ClickBackBtn()
}

EquipMatrices2(Swap=False) {
	global DelayEquipMatrice
	global Matrices2
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep DelayEquipMatrice
	If (Matrices2[1] > 0) {
		ClickSelectMatriceAndAffixAndOk(Matrices2[1], Swap)
	}
	If (Matrices2[2] > 0) {
		ClickSmallViewMatriceTR()
		ClickSelectMatriceAndAffixAndOk(Matrices2[2], Swap)
	}
	If (Matrices2[3] > 0) {
		ClickSmallViewMatriceBL()
		ClickSelectMatriceAndAffixAndOk(Matrices2[3], Swap)
	}
	If (Matrices2[4] > 0) {
		ClickSmallViewMatriceBR()
		ClickSelectMatriceAndAffixAndOk(Matrices2[4], Swap)
	}
	ClickBackBtn()
	ClickBackBtn()
}

EquipMatrices3(Swap=False) {
	global DelayEquipMatrice
	global Matrices3
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep DelayEquipMatrice
	If (Matrices3[1] > 0) {
		ClickSelectMatriceAndAffixAndOk(Matrices3[1], Swap)
	}
	If (Matrices3[2] > 0) {
		ClickSmallViewMatriceTR()
		ClickSelectMatriceAndAffixAndOk(Matrices3[2], Swap)
	}
	If (Matrices3[3] > 0) {
		ClickSmallViewMatriceBL()
		ClickSelectMatriceAndAffixAndOk(Matrices3[3], Swap)
	}
	If (Matrices3[4] > 0) {
		ClickSmallViewMatriceBR()
		ClickSelectMatriceAndAffixAndOk(Matrices3[4], Swap)
	}
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



; Weapon/Equip/Matrice swap combo
;
; "Equip-" functions affix matrices without clicking on Ok button
; "SwapTo-" functions affix matrices and click on Ok button
; You can also use EquipRecommendedMatrix1()

F3::
OpenWeaponMenu()
ClickWeaponSet1()

ClickWeapon2()
SwapToMatrices1()
ClickWeapon1()
SwapToMatrices2()

OpenEquipMenu()
ClickEquipSet1()
ClickBackBtn()
return

F4::
OpenWeaponMenu()
ClickWeaponSet2()

ClickWeapon2()
SwapToMatrices1()
ClickWeapon1()
SwapToMatrices2()

OpenEquipMenu()
ClickEquipSet2()
ClickBackBtn()
return

; Simulacra Trait
^F3::
VK19 & F3::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraTrait1)
ClickSimulacraTraitToggle()
ClickBackBtn()
return

^F4::
VK19 & F4::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraTrait2)
ClickSimulacraTraitToggle()
ClickBackBtn()
return

^!F3::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraTrait3)
ClickSimulacraTraitToggle()
ClickBackBtn()
return

^!F4::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraTrait4)
ClickSimulacraTraitToggle()
ClickBackBtn()
return

; Swap Matrices
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
SwapToMatrices3()
return
^F7::
VK19 & F7::
EquipMatrices3()
; SwapToRecommendedMatrix1()
return

; Relic
F8::
RelicSet2()
return

; Simulacra skin
F9::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraSkin1)
If ( SimulacraSkinType1 = "Special" ) {
	ClickSimulacraSpecialSkin()
}
Else If ( SimulacraSkinType1 = "A3" ) {
	ClickSimulacraA3Skin()
}
ClickSimulacraBtn()
ClickBackBtn()
return

F10::
OpenWeaponMenuQuick()
ClickSimulacra()
ClickSelectSimulacra(SimulacraSkin2)
If ( SimulacraSkinType2 = "Special" ) {
	ClickSimulacraSpecialSkin()
}
Else If ( SimulacraSkinType2 = "A3" ) {
	ClickSimulacraA3Skin()
}
ClickSimulacraBtn()
ClickBackBtn()
return

; Team flag
F12::
AltClickTeamFlag()
return

; Exit instance
^F12::
VK19 & F12::
AltClickExitInstanceBtnAndOk()
return

; Click center of result screen
Pause::
AltClickResultScreenCenter()
return

; Esc (this will stop any hotkey by reloading script)
Esc::
PressEsc()
Reload
return

; Mouse middle click to hold Alt
MButton::
If AltStatus
	Send {LALT down}
Else
	Send {LALT up}
AltStatus := !AltStatus
return

;;;;;;;;;;; for my controller (reWASD) ;;;;;;;;;;;;;;;;

; Quick weapon swap combo
^F9::
VK19 & F9::
SwapToWeaponSet1()
return
^F10::
VK19 & F10::
SwapToWeaponSet2()
return
^F11::
VK19 & F11::
SwapToWeaponSet3()
return

; Click Approve or Ok
^Backspace::
VK19 & Backspace::
ClickApprove()
ClickOk()
return

; Open map and click progress to remove stupid blue ring
^F8::
VK19 & F8::
Send, {m}
Sleep DelayOpenWeaponMenu
ClickMapProgress()
PressEsc()
PressEsc()
return

; AFK Skill Spammer, press ESC to stop it
^!F12::
While !AltStatus {
	Sleep 1212
	ControlSend,, {1},Tower of Fantasy
	Sleep 28129
	ControlSend,, {1},Tower of Fantasy
	Sleep 29142
	ControlSend,, {1},Tower of Fantasy
	Sleep 33132
	ControlSend,, {1},Tower of Fantasy
	Sleep 30011
}
return
