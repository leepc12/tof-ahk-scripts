; ToF Weapon/Equipment/Matrice/Simulacra Swapper v8.0
; Discord: Py-ra#4480
;
; This script works only with FHD, QHD and 4k resolution
; Press ESC to stop any running hotkey

#IfWinActive, ahk_exe QRSL.exe
SendMode, Input
SetWorkingDir, %A_ScriptDir%

;;;; Swap-to matrice preset
; - F5: Swap to Set1 (for variables suffixed with 1)
; - F6: Swap to Set2 (for variables suffixed with 2)
; - F7: Swap to Set3 (for variables suffixed with 3)
; - F8: Swap to Set4 (for variables suffixed with 4)

;;;; Matrice preset for each weapon (1,2,3). No swap if 1
MatricePreset1 := [1, 1, 1]
MatricePreset2 := [1, 1, 2]
MatricePreset3 := [2, 2, 1]
MatricePreset4 := [1, 1, 1]

;;;; Fiona weapon location and skill set ID. Ignored if 0
; Set it as 0 if there is no Fiona in a team
FionaLocAndSkillSet1 := [1, 1] ; Fiona is 1st weapon and using skill set 1
FionaLocAndSkillSet2 := [1, 2]
FionaLocAndSkillSet3 := [2, 3]
FionaLocAndSkillSet4 := [0, 0]

;;;; Yulan weapon location and skill set ID (1: Martial, 2: Sweeper)
; Set it as 0 if there is no Yulan in a team
; Currently there is no way to choose yulan skill
YulanLoc1 := 2
YulanLoc2 := 3
YulanLoc3 := 0
YulanLoc4 := 2

;;;; Equipment (equipment set in Backpack menu)
EquipmentSet1 := 1
EquipmentSet2 := 1
EquipmentSet3 := 2
EquipmentSet4 := 1

;;;; Simulacra Trait
; SimulacraTrait1 and SimulacraTrait2 are 1-based indices of
; Simulacra on the game UI. Script will scroll down if index > 6
; 1    2    3
; 4    5    6
; 7    8    9 (script will scroll down)
; ...
SimulacraTrait1 := 1
SimulacraTrait2 := 2
SimulacraTrait3 := 2
SimulacraTrait4 := 2
; Need a dummy trait ID. Make sure that dummy's 4000 trait is unlocked
SimulacraTraitDummy := 3

;;;; Other QoL hotkeys
; - F9: Open Relic Set2 and scroll to right
; - F12: Click on team flag to show team HP
; - Ctrl+F12: Quick exit instance
; - Mouse Mid-Click: Toggle hold-Alt

;;;; Key spammer
; - F3: F spam
; - F4: FCN auto (make sure to use all FC charges b4 using this)

;;;; Simulacra skin
; - Ctrl+F3: Change to Simulacra1's skin
; - Ctrl+F4: Change to Simulacra2's skin
;
; SkinType: "A0", "A3" or "Special" (e.g. Saki wedding, Lin bikini)
SimulacraSkin1 := 1	; Edit this for Ctrl+F3
SimulacraSkinType1 := "A3" ; Edit this for Ctrl+F3
SimulacraSkin2 := 2 ; Edit this for Ctrl+F4
SimulacraSkinType2 := "Special" ; Edit this for Ctrl+F4

;;;;;;;;;;;;;;;;;;;; DEPRECATED ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; DO NOT MODIFY ANYTHING BELOW ;;;;;;;;;;;;;;;;;;;;
Matrices1 := [2,4,2,3] ; Edit this array for F5
Matrices2 := [3,5,3,4] ; Edit this array for F6
Matrices3 := [1,2,1,2] ; Edit this array for F7
Matrices4 := [6,6,5,7] ; Edit this array for F8

;;;;;;;;;;;;;;;;;;; DO NOT MODIFY ANYTHING BELOW ;;;;;;;;;;;;;;;;;;;;
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
XPctMenuButton := 3743/3840
YPctMenuButton := 79/2160

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
XPctMatriceIcon := 3658/3840
YPctMatriceIcon := 524/2160
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
XPctUsePreset1Btn := 3641/3840
YPctUsePreset1Btn := 547/2160
XPctUsePreset2Btn := 3641/3840
YPctUsePreset2Btn := 892/2160
XPctUsePreset3Btn := 3641/3840
YPctUsePreset3Btn := 1238/2160

XPctSmallViewMatriceLeft := 1500/3840
XPctSmallViewMatriceRight := 2510/3840
YPctSmallViewMatriceTop := 650/2160
YPctSmallViewMatriceBottom := 1570/2160
XPctRecommendedMatrix := 3224/3840
YPctRecommendedMatrix := 1916/2160
XPctPresetButton:=3533/3840
YPctPresetButton:=1917/2160
XPctSkillsButton := 2793/3840
YPctSkillsButton := 1395/2160
XPctSkillsSettingButton := 3114/3840
YPctSkillsSettingButton := 475/2160
XPctFionaSkill1 := 1875/3840
XPctFionaSkill2 := 2139/3840
XPctFionaSkill3 := 2406/3840
XPctFionaSkill4 := 2670/3840
XPctFionaSkill5 := 2978/3840
YPctFionaSkill := 1308/2160
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

; Combat
XPctChallenge := 220/3840
YPctChallenge := 1308/2160
XPctFrontierClash := 2013/3840
YPctFrontierClash := 421/2160
XPctGo := 2830/3840
YPctGo := 1594/2160
XPctEnter := 1372/3840
YPctEnter := 1165/2160
XPctAutoFight := 2329/3840
YPctAutoFight := 1854/2160

; Quick Swap Weapon
NumClickSwapToWeaponSet := 2

; Scrolling (Relic, Simulacra)
NumScrollSimulacraPage := 14
NumScrollRelic := 35

; Delay
DelayClick := 472
DelayClickQuick := 312
DelayClickVeryQuick := 272
DelayRelicSet := 300
DelayEquipMatrice := 212
DelayGeneralVeryLong := 990
DelayGeneralLong := 502
DelayGeneralShort := 102
DelayClickSwapToWeaponSet := 328
DelayOpenWeaponMenu := 692
DelayOpenWeaponMenuQuick := 492
DelayOpenEquipMenu := 1592
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

SwapToWeaponSetCoord(XPct, YPct) {
	global NumClickSwapToWeaponSet
	global DelayClickSwapToWeaponSet
	OpenWeaponMenuQuick()

	MoveMouseToXPctYPct(XPct, YPct)
	Loop %NumClickSwapToWeaponSet% {
		MouseClick, Left
		Sleep DelayClickSwapToWeaponSet
	}
	ClickBackBtn()
}

ClickWeaponSet(i) {
	global XPctWeaponSet
	global YPctWeaponSet1
	global YPctWeaponSet2
	global YPctWeaponSet3
	global YPctWeaponSet4
	global YPctWeaponSet5
	global DelayClickWeaponSet
	If (i=1) {
		ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet1)
	}
	Else If (i=2) {
		ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet2)
	}
	Else If (i=3) {
		ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet3)
	}
	Else If (i=4) {
		ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet4)
	}
	Else If (i=5) {
		ClickOnXPctYPct(XPctWeaponSet, YPctWeaponSet5)
	}
	Sleep DelayClickWeaponSet
}

ClickEquipSet(i) {
	global XPctEquipSet1
	global XPctEquipSet2
	global XPctEquipSet3
	global XPctEquipSet4
	global XPctEquipSet5
	global YPctEquipSet
	If (i=1) {
		ClickOnXPctYPct(XPctEquipSet1, YPctEquipSet)
	}
	Else If (i=2) {
		ClickOnXPctYPct(XPctEquipSet2, YPctEquipSet)
	}
	Else If (i=3) {
		ClickOnXPctYPct(XPctEquipSet3, YPctEquipSet)
	}
	Else If (i=4) {
		ClickOnXPctYPct(XPctEquipSet4, YPctEquipSet)
	}
	Else If (i=5) {
		ClickOnXPctYPct(XPctEquipSet5, YPctEquipSet)
	}
}

SwapToWeaponSet(i) {
	global XPctWeaponSet
	global YPctWeaponSet1
	global YPctWeaponSet2
	global YPctWeaponSet3
	global YPctWeaponSet4
	global YPctWeaponSet5

	If (i=1) {
		SwapToWeaponSetCoord(XPctWeaponSet, YPctWeaponSet1)
	}
	Else If (i=2) {
		SwapToWeaponSetCoord(XPctWeaponSet, YPctWeaponSet2)
	}
	Else If (i=3) {
		SwapToWeaponSetCoord(XPctWeaponSet, YPctWeaponSet3)
	}
	Else If (i=4) {
		SwapToWeaponSetCoord(XPctWeaponSet, YPctWeaponSet4)
	}
	Else If (i=5) {
		SwapToWeaponSetCoord(XPctWeaponSet, YPctWeaponSet5)
	}
}

ClickWeapon(i) {
	global XPctWeapon1
	global XPctWeapon2
	global XPctWeapon3
	global YPctWeapon
	If (i=1) {
		ClickOnXPctYPct(XPctWeapon1, YPctWeapon)
	}
	Else If (i=2) {
		ClickOnXPctYPct(XPctWeapon2, YPctWeapon)
	}
	Else If (i=3) {
		ClickOnXPctYPct(XPctWeapon3, YPctWeapon)
	}
}

MoveMouseToWeapon(i) {
	global XPctWeapon1
	global XPctWeapon2
	global XPctWeapon3
	global YPctWeapon
	If (i=1) {
		MoveMouseToXPctYPct(XPctWeapon1, YPctWeapon)
	}
	Else If (i=2) {
		MoveMouseToXPctYPct(XPctWeapon2, YPctWeapon)
	}
	Else If (i=3) {
		MoveMouseToXPctYPct(XPctWeapon3, YPctWeapon)
	}
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

ClickPresetButton() {
	global XPctPresetButton
	global YPctPresetButton
	ClickOnXPctYPct(XPctPresetButton, YPctPresetButton)	
}

ClickSkillsButton() {
	global XPctSkillsButton
	global YPctSkillsButton
	ClickOnXPctYPct(XPctSkillsButton, YPctSkillsButton)		
}

ClickSkillsSettingButton() {
	global XPctSkillsSettingButton
	global YPctSkillsSettingButton
	ClickOnXPctYPct(XPctSkillsSettingButton, YPctSkillsSettingButton)		
}

ClickQuickAffixSet1() {
	global XPctQuickAffixSet1
	global YPctQuickAffixSet1
	ClickOnXPctYPct(XPctQuickAffixSet1, YPctQuickAffixSet1)
}

ClickUsePreset1Button() {
	global XPctUsePreset1Btn
	global YPctUsePreset1Btn
	ClickOnXPctYPct(XPctUsePreset1Btn, YPctUsePreset1Btn)
}

ClickUsePreset2Button() {
	global XPctUsePreset2Btn
	global YPctUsePreset2Btn
	ClickOnXPctYPct(XPctUsePreset2Btn, YPctUsePreset2Btn)
}

ClickUsePreset3Button() {
	global XPctUsePreset3Btn
	global YPctUsePreset3Btn
	ClickOnXPctYPct(XPctUsePreset3Btn, YPctUsePreset3Btn)
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

AltClickMenuButton() {
	global XPctMenuButton
	global YPctMenuButton
	global DelayGeneralShort
	Send {Alt Down}
	Sleep DelayGeneralShort
	ClickOnXPctYPctQuick(XPctMenuButton, YPctMenuButton)
	Send {Alt Up}
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
	; PressEsc()
	AltClickMenuButton()
	Sleep DelayRelicSet
	ClickRelic()
	ClickRelicDeploy()
	ClickRelicSet2()
	ClickRelicSelectRowAndScrollRight()
}

RelicSet3() {
	global DelayRelicSet
	; PressEsc()
	AltClickMenuButton()
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
	Sleep 300
	ClickOnXPctYPct(XPctSimulacraTraitToggle, YPctSimulacraTraitToggle)
	Sleep 300
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

SwapToMatrices4() {
	EquipMatrices4(True)
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

EquipMatrices4(Swap=False) {
	global DelayEquipMatrice
	global Matrices4
	ClickMatriceIcon()
	ClickLargeViewMatriceTL()
	Sleep DelayEquipMatrice
	If (Matrices4[1] > 0) {
		ClickSelectMatriceAndAffixAndOk(Matrices4[1], Swap)
	}
	If (Matrices4[2] > 0) {
		ClickSmallViewMatriceTR()
		ClickSelectMatriceAndAffixAndOk(Matrices4[2], Swap)
	}
	If (Matrices4[3] > 0) {
		ClickSmallViewMatriceBL()
		ClickSelectMatriceAndAffixAndOk(Matrices4[3], Swap)
	}
	If (Matrices4[4] > 0) {
		ClickSmallViewMatriceBR()
		ClickSelectMatriceAndAffixAndOk(Matrices4[4], Swap)
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

EquipMatricePreset(i) {
	ClickMatriceIcon()
	ClickPresetButton()
	Sleep 700
	If (i = 1) {
		ClickUsePreset1Button()
	}
	Else If (i = 2) {
		ClickUsePreset2Button()
	}
	Else If (i = 3) {
		ClickUsePreset3Button()
	}
	Sleep 700
	ClickOk()
	ClickBackBtn()
}

ClickFionaSkill(i) {
	global XPctFionaSkill1
	global XPctFionaSkill2
	global XPctFionaSkill3
	global XPctFionaSkill4
	global XPctFionaSkill5
	global YPctFionaSkill

	If (i=1) {
		ClickOnXPctYPct(XPctFionaSkill1, YPctFionaSkill)
	}
	Else If (i=2) {
		ClickOnXPctYPct(XPctFionaSkill2, YPctFionaSkill)
	}
	Else If (i=3) {
		ClickOnXPctYPct(XPctFionaSkill3, YPctFionaSkill)
	}
	Else If (i=4) {
		ClickOnXPctYPct(XPctFionaSkill4, YPctFionaSkill)
	}
	Else If (i=5) {
		ClickOnXPctYPct(XPctFionaSkill5, YPctFionaSkill)
	}
}

ShowYulanSkillSetting(loc) {
	If (loc>0) {
		ClickWeapon(loc)
		ClickSkillsButton()
		ClickSkillsSettingButton()
	}
	Sleep 500
}

ChooseFionaSkill(loc, i) {
	If (loc>0) {
		ClickWeapon(loc)
		ClickSkillsButton()
		ClickSkillsSettingButton()
		ClickFionaSkill(i)
		PressEsc()
	}
	Sleep 500
}

F3::
SendInput {LALT Down}
Sleep 100
ClickOnXPctYPct(3403/3840,1794/2160)
Sleep 100
SendInput {LALT Up}
; While True {
; 	ControlSend,, {2},Tower of Fantasy
; 	Sleep 1500
; 	ControlSend,, {3},Tower of Fantasy
; 	Sleep 1500
; 	ControlSend,, {1},Tower of Fantasy
; 	Sleep 1000
; 	Loop 20 {
; 		ControlSend,, {LButton}, Tower of Fantasy
; 		Sleep 200
; 	}
; 	; ControlSend,, {1},Tower of Fantasy
; 	; Sleep 27221
; 	; ControlSend,, {f},Tower of Fantasy
; 	; Sleep 12221
; 	; ControlSend,, {LButton Down},Tower of Fantasy
; 	Sleep 4221
; }

return

F4::
; SendInput {LALT Down}
; Sleep 100
; ClickOnXPctYPct(3729/3840,1974/2160)
; Sleep 100
; SendInput {LALT Up}

;FCN Auto (solo)
While True {
	OpenCombatMenu()
	ClickChallenge()
	ClickFrontierClash()
	ClickGo()
	ClickEnter()
	Sleep 28000
	ClickAutoFight()
	MoveW(2500)
	MoveA(1800)
	MoveS(1200)
	Sleep 1000
	MoveW(800)
	PressF()
	MoveA(600)
	PressF()
	MoveW(300)
	PressF()
	MoveA(300)
	PressF()

	Sleep 450000
	; Sleep 550000
}
return

OpenCombatMenu() {
	SendInput {LALT Down}
	Sleep 100
	SendInput {3}
	Sleep 100
	SendInput {LALT Up}
	Sleep 1000
}

ClickChallenge() {
	global XPctChallenge
	global YPctChallenge
	ClickOnXPctYPct(XPctChallenge, YPctChallenge)
	Sleep 1000
}

ClickFrontierClash() {
	global XPctFrontierClash
	global YPctFrontierClash
	ClickOnXPctYPct(XPctFrontierClash, YPctFrontierClash)
	Sleep 1000
}

ClickGo() {
	global XPctGo
	global YPctGo
	ClickOnXPctYPct(XPctGo, YPctGo)
	Sleep 1000
}

ClickEnter() {
	global XPctEnter
	global YPctEnter
	ClickOnXPctYPct(XPctEnter, YPctEnter)
	Sleep 1000
}

MoveW(ms) {
	SendInput {w Down}
	Sleep ms
	SendInput {w Up}
}

MoveA(ms) {
	SendInput {a Down}
	Sleep ms
	SendInput {a Up}
}

MoveS(ms) {
	SendInput {s Down}
	Sleep ms
	SendInput {s Up}
}

MoveD(ms) {
	SendInput {d Down}
	Sleep ms
	SendInput {d Up}
}

PressF() {
	Sleep 1000
	SendInput {f}	
	Sleep 1000
}

ClickAutoFight() {
	global XPctAutoFight
	global YPctAutoFight
	SendInput {LALT Down}
	Sleep 100
	ClickOnXPctYPct(XPctAutoFight, YPctAutoFight)
	Sleep 100
	SendInput {LALT Up}
	Sleep 1000
}

; Simulacra skin
^F3::
VK19 & F3::
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

^F4::
VK19 & F4::
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

F5::
OpenEquipMenu()
ClickEquipSet(EquipmentSet1)
ClickSimulacra()
ClickSelectSimulacra(SimulacraTraitDummy)
ClickSimulacraTraitToggle()
ClickSelectSimulacra(SimulacraTrait1)
ClickSimulacraTraitToggle()
OpenWeaponMenu()
ClickWeaponSet(1)
if (MatricePreset1[1] > 1) {
	ClickWeapon(1)
	EquipMatricePreset(MatricePreset1[1])
}
if (MatricePreset1[2] > 1) {
	ClickWeapon(2)
	EquipMatricePreset(MatricePreset1[2])
}
if (MatricePreset1[3] > 1) {
	ClickWeapon(3)
	EquipMatricePreset(MatricePreset1[3])
}
ChooseFionaSkill(FionaLocAndSkillSet1[1], FionaLocAndSkillSet1[2])
ShowYulanSkillSetting(YulanLoc1)
return

F6::
OpenEquipMenu()
ClickEquipSet(EquipmentSet2)
ClickSimulacra()
ClickSelectSimulacra(SimulacraTraitDummy)
ClickSimulacraTraitToggle()
ClickSelectSimulacra(SimulacraTrait2)
ClickSimulacraTraitToggle()
OpenWeaponMenu()
ClickWeaponSet(2)
if (MatricePreset2[1] > 1) {
	ClickWeapon(1)
	EquipMatricePreset(MatricePreset2[1])
}
if (MatricePreset2[2] > 1) {
	ClickWeapon(2)
	EquipMatricePreset(MatricePreset2[2])
}
if (MatricePreset2[3] > 1) {
	ClickWeapon(3)
	EquipMatricePreset(MatricePreset2[3])
}
ChooseFionaSkill(FionaLocAndSkillSet2[1], FionaLocAndSkillSet2[2])
ShowYulanSkillSetting(YulanLoc2)
return

F7::
OpenEquipMenu()
ClickEquipSet(EquipmentSet3)
ClickSimulacra()
ClickSelectSimulacra(SimulacraTraitDummy)
ClickSimulacraTraitToggle()
ClickSelectSimulacra(SimulacraTrait3)
ClickSimulacraTraitToggle()
OpenWeaponMenu()
ClickWeaponSet(3)
if (MatricePreset3[1] > 1) {
	ClickWeapon(1)
	EquipMatricePreset(MatricePreset3[1])
}
if (MatricePreset3[2] > 1) {
	ClickWeapon(2)
	EquipMatricePreset(MatricePreset3[2])
}
if (MatricePreset3[3] > 1) {
	ClickWeapon(3)
	EquipMatricePreset(MatricePreset3[3])
}
ChooseFionaSkill(FionaLocAndSkillSet3[1], FionaLocAndSkillSet3[2])
ShowYulanSkillSetting(YulanLoc3)
return

F8::
OpenEquipMenu()
ClickEquipSet(EquipmentSet4)
ClickSimulacra()
ClickSelectSimulacra(SimulacraTraitDummy)
ClickSimulacraTraitToggle()
ClickSelectSimulacra(SimulacraTrait4)
ClickSimulacraTraitToggle()
OpenWeaponMenu()
ClickWeaponSet(4)
if (MatricePreset4[1] > 1) {
	ClickWeapon(1)
	EquipMatricePreset(MatricePreset4[1])
}
if (MatricePreset4[2] > 1) {
	ClickWeapon(2)
	EquipMatricePreset(MatricePreset4[2])
}
if (MatricePreset4[3] > 1) {
	ClickWeapon(3)
	EquipMatricePreset(MatricePreset4[3])
}
ChooseFionaSkill(FionaLocAndSkillSet4[1], FionaLocAndSkillSet4[2])
ShowYulanSkillSetting(YulanLoc4)
return

F9::
RelicSet2()
return

; ; Simulacra Trait
; F9::
; OpenWeaponMenuQuick()
; ClickSimulacra()
; ClickSelectSimulacra(SimulacraTrait1)
; ClickSimulacraTraitToggle()
; ClickBackBtn()
; return

; ^!F9::
; OpenWeaponMenuQuick()
; ClickSimulacra()
; ClickSelectSimulacra(SimulacraTrait3)
; ClickSimulacraTraitToggle()
; ClickBackBtn()
; return

; F10::
; OpenWeaponMenuQuick()
; ClickSimulacra()
; ClickSelectSimulacra(SimulacraTrait2)
; ClickSimulacraTraitToggle()
; ClickBackBtn()
; return

; ^!F10::
; OpenWeaponMenuQuick()
; ClickSimulacra()
; ClickSelectSimulacra(SimulacraTrait4)
; ClickSimulacraTraitToggle()
; ClickBackBtn()
; return

; Team flag
F12::
AltClickTeamFlag()
return

; Exit instance
^F12::
VK19 & F12::
AltClickExitInstanceBtnAndOk()
return

; Esc (this will stop any hotkey by reloading script)
Esc::
PressEsc()
Reload
return

~MButton::
Send {LALT Down}
return

~MButton Up::
Send {LALT Up}
return

;;;;;;;;;;; for my controller (reWASD) ;;;;;;;;;;;;;;;;

; Quick weapon swap combo
^F9::
VK19 & F9::
SwapToWeaponSet(1)
return
^F10::
VK19 & F10::
SwapToWeaponSet(2)
return
^F11::
VK19 & F11::
SwapToWeaponSet(3)
return

; Click Approve or Ok
^Backspace::
VK19 & Backspace::
AltClickResultScreenCenter()
; ClickApprove()
ClickOk()
return
