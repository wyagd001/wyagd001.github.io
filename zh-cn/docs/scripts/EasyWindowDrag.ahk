; 轻松拖曳窗口 (requires XP/2k/NT)
; https://www.autohotkey.com
; 一般情况下只能通过点击标题栏来拖动窗口.
; 这个脚本扩展到可以在窗口中任何一点拖动窗口.
; 要激活这种模式, 请在点击时按住 CapsLock 或鼠标中键
; 然后拖动窗口到新的位置.

; 注意: 在按下鼠标按钮后您可以释放 CapsLock 或鼠标中键
; 而不需要在整个拖动过程中按住它.
; 此脚本需要 v1.0.25+.

~MButton & LButton::
CapsLock & LButton::
CoordMode, Mouse  ; 切换到屏幕/绝对坐标.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; 仅在窗口不处于最大化状态时
	SetTimer, EWD_WatchMouse, 10 ; 在用户拖动时跟踪鼠标.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; 按钮已经释放, 所以拖动结束.
{
	SetTimer, EWD_WatchMouse, Off
	return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; 按下了 Escape, 所以取消拖动.
{
	SetTimer, EWD_WatchMouse, Off
	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	return
}
; 否则, 改变窗口的位置以匹配
; 用户拖动鼠标引起的鼠标坐标变化:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; 让下面的移动更快速/平滑.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; 为下一次调用此子程序进行更新.
EWD_MouseStartY := EWD_MouseY
return