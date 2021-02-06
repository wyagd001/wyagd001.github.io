; 改变 MsgBox 的按钮名称
; https://www.autohotkey.com
; 这是个可运行示例脚本, 它使用计时器改变消息框中按钮的名称.
; 尽管改变了按钮名称, 但 IfMsgBox 命令中仍需要引用它们原始的按钮名称表示的按钮.

#SingleInstance
SetTimer, ChangeButtonNames, 50 
MsgBox, 4, Add or Delete, Choose a button:
IfMsgBox, YES 
	MsgBox, You chose Add. 
else 
	MsgBox, You chose Delete. 
return 

ChangeButtonNames: 
IfWinNotExist, Add or Delete
	return  ; Keep waiting.
SetTimer, ChangeButtonNames, Off 
WinActivate 
ControlSetText, Button1, &Add 
ControlSetText, Button2, &Delete 
return