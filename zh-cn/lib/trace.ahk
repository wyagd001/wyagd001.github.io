;~ 各种提示的包装函数
Trace(aText = "", isDie = "", aTitle = "")
{
	;~ 致命错误,程序将退出
	if (isDie = 1)
	{
		if ( aTitle = "" )
		{
			aTitle := "致命错误 `! 30秒后退出程序"
		}
		Suspend , On
		MsgBox, 16, %aTitle%, %aText%, 30
		ExitApp
	}
	;~ 提问对话框,根据点击按钮决定返回1或0
	else if (isDie = 2)
	{
		if ( aTitle = "" )
		{
			aTitle := "问题"
		}
		Suspend , On
		MsgBox, 36, %aTitle%, %aText%
		Suspend, off
		IfMsgBox  yes
		{
			return true
		}
		else
		{
			return false
		}
	}
	;~ 提示对话框,只有一个确定按钮
	else if (isDie = 3)
	{
		if ( aTitle = "" )
		{
			aTitle := "注意"
		}
		Suspend , On
		MsgBox, 0, %aTitle%, %aText%
		Suspend, off
		return true
	}
	else
	{
		if ( aTitle = "" )
		{
			aTitle := "请注意"
		}
		TrayTip, %aTitle%, %aText%, 10, 1
		return true
	}
}