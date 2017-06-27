#Warn, UseUnsetGlobal, Off

Debug(aText = "", aTitle = "")
{
	if !(A_IsCompiled)
	{
		if !(Gs_IsDebug)
		{
			return 1
		}
	}
	else
	{
		return
	}

	Suspend , On
	MsgBox, 52, % A_ScriptName " " aTitle, % aText "`n`n是否继续运行`?"
	Suspend, off
	IfMsgBox  yes
	{
		return 1
	}
	else
	{
		ExitApp
	}
}