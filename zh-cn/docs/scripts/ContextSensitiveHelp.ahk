; 任意编辑器中的上下文帮助 -- 作者: Rajat
; https://www.autohotkey.com
; 此脚本设置 Ctrl+2(或您选择的其他热键)
; 来显示选择的 AutoHotkey 命令或关键字的帮助文件页面. 如果没有选择任何内容,
; 那么会提取当前行开始处的命令名.

; 下面的热键使用剪贴板来实现与最大数的
; 编辑器兼容(因为 ControlGet 在大多数高级编辑器中无法工作).
; 它会在之后恢复剪贴板原来的内容, 但只是纯文本,
; 这样似乎比什么都不做要好.

$^2::
; 下面的值只在此热键执行期间有效.
; 因此, 不需要恢复它们原来的值
; 因为在线程结束时会自动进行这个操作:
SetWinDelay 10
SetKeyDelay 0
AutoTrim, On

if A_OSType = WIN32_WINDOWS  ; Windows 9x
	Sleep, 500  ; 提供一些时间让用户释放按键.

C_ClipboardPrev = %clipboard%
clipboard =
; 如果有高亮的单词, 则使用它 (因为有时用户可能
; 故意高亮一些不是命令的内容):
Send, ^c
ClipWait, 0.1
if ErrorLevel <> 0
{
	; 获取整行, 因为编辑器编辑器可能对导航键进行不同的处理:
	Send, {home}+{end}^c
	ClipWait, 0.2
	if ErrorLevel <> 0  ; 罕见的情况, 所以不报告错误.
	{
		clipboard = %C_ClipboardPrev%
		return
	}
}
C_Cmd = %clipboard%  ; 这样会移除前导和尾随的 tab 和空格.
clipboard = %C_ClipboardPrev%  ; 恢复剪贴板为原来的内容.
Loop, parse, C_Cmd, %A_Space%`,  ; 命令末尾的首个空格或逗号.
{
	C_Cmd = %A_LoopField%
	break ; 即我们只需要循环一次.
}
IfWinNotExist, AutoHotkey Help
{
	; 判断 AutoHotkey 的位置:
	RegRead, ahk_dir, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
	if ErrorLevel  ; 没有找到, 所以在其他一些常见位置寻找.
	{
		if A_AhkPath
			SplitPath, A_AhkPath,, ahk_dir
		else IfExist ..\..\AutoHotkey.chm
			ahk_dir = ..\..
		else IfExist %A_ProgramFiles%\AutoHotkey\AutoHotkey.chm
			ahk_dir = %A_ProgramFiles%\AutoHotkey
		else
		{
			MsgBox Could not find the AutoHotkey folder.
			return
		}
	}
	Run %ahk_dir%\AutoHotkey.chm
	WinWait AutoHotkey Help
}
; 上面设置了我们下面要使用的 "最后找到的" 窗口:
WinActivate
WinWaitActive
StringReplace, C_Cmd, C_Cmd, #, {#}
Send, !n{home}+{end}%C_Cmd%{enter}
return