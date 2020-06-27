; 窗口卷起(卷起窗口到标题栏) -- by Rajat
; https://www.autohotkey.com
; 此脚本通过单个热键实现裁减窗口到它的标题栏,
; 再次使用热键后恢复为原始大小.
; 这种方式可以裁减任意数目的窗口(脚本会记住每个窗口原来的大小).
; 如果脚本由于任何原因退出了,
; 那么所有 "卷起" 的窗口会自动恢复为它们原来的高度.

; Set the height of a rolled up window here.  The operating system
; probably won't allow the title bar to be hidden regardless of
; how low this number is:
ws_MinHeight = 25

; This line will unroll any rolled up windows if the script exits
; for any reason:
OnExit, ExitSub
return  ; End of auto-execute section

#z::  ; Change this line to pick a different hotkey.
; Below this point, no changes should be made unless you want to
; alter the script's basic functionality.
; Uncomment this next line if this subroutine is to be converted
; into a custom menu item rather than a hotkey.  The delay allows
; the active window that was deactivated by the displayed menu to
; become active again:
;Sleep, 200
WinGet, ws_ID, ID, A
Loop, Parse, ws_IDList, |
{
	IfEqual, A_LoopField, %ws_ID%
	{
		; Match found, so this window should be restored (unrolled):
		StringTrimRight, ws_Height, ws_Window%ws_ID%, 0
		WinMove, ahk_id %ws_ID%,,,,, %ws_Height%
		StringReplace, ws_IDList, ws_IDList, |%ws_ID%
		return
	}
}
WinGetPos,,,, ws_Height, A
ws_Window%ws_ID% = %ws_Height%
WinMove, ahk_id %ws_ID%,,,,, %ws_MinHeight%
ws_IDList = %ws_IDList%|%ws_ID%
return

ExitSub:
Loop, Parse, ws_IDList, |
{
	if A_LoopField =  ; First field in list is normally blank.
		continue      ; So skip it.
	StringTrimRight, ws_Height, ws_Window%A_LoopField%, 0
	WinMove, ahk_id %A_LoopField%,,,,, %ws_Height%
}
ExitApp  ; Must do this for the OnExit subroutine to actually Exit the script.
