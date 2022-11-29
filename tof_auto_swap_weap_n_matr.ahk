; Weapon/Matrice Swapper v2.1
; Written by Py-ra (Server: Nightfall, Crew: Evil)
; Discord: PYRA#4480

SetTitleMatchMode, 2
#IfWinActive, ahk_exe QRSL.exe
SendMode, Input
SetWorkingDir, %A_ScriptDir%

; This script works only when "Tower of Fantasy" is focused
; So you don't need to turn this script off when you are working
; on other processes
;
; MiddleClick: Toggle Alt key hold
; F5: Opens Weapon Menu and swap to Weapon Set 1
; F6: Opens Weapon Menu and swap to Weapon Set 2
; F7: Opens Weapon Menu and swap to Weapon Set 3
; F8: ESC -> Click Relic -> Deploy -> Set2
; F12: Click on the team flag to show team HP
;
; F9: Swap matrices for a selected weapon on Weapon Menu
;   - Edit MatriceIdsF9 to swap matrices with F9
;
; F10: Swap matrices for a selected weapon on Weapon Menu
;   - Edit MatriceIdsF10 to swap matrices with F10
;
; F9, F10 will click on Matrice Icon and start swapping matrices
; The order is [TopLeft, TopRight, BottomLeft, BottomRight]
;
; They are 1-based indices of matrice location on the game UI
;
; 1    2    3
; 4    5    6
; 7    8    9
; ...
;

;;;;;;;;; EDIT THIS PART FOR YOUR OWN MATRICES
MatriceIdsF9 := [3,3,2,3]
MatriceIdsF10 := [1,2,1,2]

;;;;;;;;; DO NOT MODIFY ANYTHING BELOW ;;;;;;;;;;;;;;;;;;;;;;;;;

AltStatus := False

XPctWeaponSet := 336/3840
YPctWeaponSet1 := 1313/2160
YPctWeaponSet2 := 1521/2160
YPctWeaponSet3 := 1719/2160

XPctWeapon1 := 871/3840
XPctWeapon2 := 1516/3840
XPctWeapon3 := 2345/3840
YPctWeapon := 1475/2160

XPctMatriceIcon := 3654/3840
YPctMatriceIcon := 596/2160

XPctLargeViewMatriceTL := 831/3840
YPctLargeViewMatriceTL := 476/2160

XPctBackBtn := 100/3840
YPctBackBtn := 100/2160

XPctAffixBtn := 2916/3840
YPctAffixBtn := 1911/2160

XPctConfirmBtn := 2517/3840
YPctConfirmBtn := 1168/2160

XPctSmallViewMatriceLeft := 1500/3840
XPctSmallViewMatriceRight := 2510/3840
YPctSmallViewMatriceTop := 650/2160
YPctSmallViewMatriceBottom := 1570/2160

XPctTeamFlag := 3792/3840
YPctTeamFlag := 632/2160

XPctEscRelic := 3567/3840
YPctEscRelic := 702/2160
XPctRelicDeploy := 915/3840
YPctRelicDeploy := 2056/2160
XPctRelicSet2 := 482/3840
YPctRelicSet2 := 1202/2160

MoveMouseToXPctYPct(XPct, YPct) {
	WinGetPos, winX, winY, winWidth, winHeight, A
	X := winWidth * XPct
	Y := winHeight * YPct
	MouseMove, X, Y
}

ClickOnXPctYPct(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 1192
}

ClickOnXPctYPctQuick(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 892
}

ClickOnXPctYPctVeryQuick(XPct, YPct) {
	MoveMouseToXPctYPct(XPct, YPct)
	MouseClick, Left
	Sleep 292
}

OpenWeaponMenu() {
	Send, {n}
	Sleep 992
}

OpenWeaponMenuQuick() {
	Send, {n}
	Sleep 592
}

SwapToWeaponSet(XPct, YPct) {
	OpenWeaponMenuQuick()

	MoveMouseToXPctYPct(XPct, YPct)
	Loop 6 {
		MouseClick, Left
		Sleep 448
	}
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
	; Id is one-based here
	return (Mod(Id-1, 3) * (637-217) + 217)/3840
}

GetSelectMatriceYPct(Id) {
	; Id is one-based here
	return (Floor((Id-1)/3) * (958-561) + 561)/2160
}

ClickSelectMatrice(Id) {
	XPct := GetSelectMatriceXPct(Id)
	YPct := GetSelectMatriceYPct(Id)
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

ClickSelectMatriceAndAffixAndOk(Id) {
	ClickSelectMatrice(Id)
	Sleep 500
	ClickAffix()
	ClickOk()
}

PressEsc() {
	Send, {esc}
	Sleep 512
}

ClickAltTeamFlag() {
	global XPctTeamFlag
	global YPctTeamFlag
	Send {Alt Down}
	Sleep 102
	ClickOnXPctYPctVeryQuick(XPctTeamFlag, YPctTeamFlag)
	ClickOnXPctYPctQuick(XPctTeamFlag, YPctTeamFlag)
	Send {Alt Up}
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
	global YPctRelicSet2
	ClickOnXPctYPct(XPctRelicSet2, YPctRelicSet2)
}

F5::
SwapToWeaponSet1()
return

F6::
SwapToWeaponSet2()
return

F7::
SwapToWeaponSet3()
return

F8::
PressEsc()
Sleep 300
ClickRelic()
ClickRelicDeploy()
ClickRelicSet2()
return

F12::
ClickAltTeamFlag()
return


F9::
ClickMatriceIcon()
ClickLargeViewMatriceTL()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF9[1])
ClickSmallViewMatriceTR()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF9[2])
ClickSmallViewMatriceBL()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF9[3])
ClickSmallViewMatriceBR()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF9[4])
ClickBackBtn()
ClickBackBtn()
MoveMouseToWeapon1()
return

F10::
ClickMatriceIcon()
ClickLargeViewMatriceTL()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF10[1])
ClickSmallViewMatriceTR()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF10[2])
ClickSmallViewMatriceBL()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF10[3])
ClickSmallViewMatriceBR()
ClickSelectMatriceAndAffixAndOk(MatriceIdsF10[4])
ClickBackBtn()
ClickBackBtn()
MoveMouseToWeapon2()
return

MButton::
If AltStatus
	Send {LALT down}
Else
	Send {LALT up}
AltStatus := !AltStatus
return
