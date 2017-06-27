fc()
{
	return true
}
fc_IfBetween(ByRef var, LowerBound, UpperBound)
{
	If var between %LowerBound% and %UpperBound%
		return true
}
fc_IfNotBetween(ByRef var, LowerBound, UpperBound)
{
	If var not between %LowerBound% and %UpperBound%
		return true
}
fc_IfIn(ByRef var, MatchList)
{
	If var in %MatchList%
		return true
}
fc_IfNotIn(ByRef var, MatchList)
{
	If var not in %MatchList%
		return true
}
fc_IfContains(ByRef var, MatchList)
{
	If var contains %MatchList%
		return true
}
fc_IfNotContains(ByRef var, MatchList)
{
	If var not contains %MatchList%
		return true
}
fc_IfIs(ByRef var, type)
{
	If var is %type%
		return true
}
fc_IfIsNot(ByRef var, type)
{
	If var is not %type%
		return true
}
fc_ControlGet(Cmd, Value = "", Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGet, _v, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_ControlGetFocus(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGetFocus, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_ControlGetText(Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGetText, _v, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_DriveGet(Cmd, Value = "")
{
	_v := ""
	DriveGet, _v, %Cmd%, %Value%
	return _v
}
fc_DriveSpaceFree(Path)
{
	_v := ""
	DriveSpaceFree, _v, %Path%
	return _v
}
fc_EnvGet(EnvVarName)
{
	_v := ""
	EnvGet, _v, %EnvVarName%
	return _v
}
fc_FileGetAttrib(Filename = "")
{
	_v := ""
	FileGetAttrib, _v, %Filename%
	return _v
}
fc_FileGetShortcut(LinkFile, ByRef OutTarget = "", ByRef OutDir = "", ByRef OutArgs = "", ByRef OutDescription = "", ByRef OutIcon = "", ByRef OutIconNum = "", ByRef OutRunState = "")
{
	FileGetShortcut, %LinkFile%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
}
fc_FileGetSize(Filename = "", Units = "")
{
	_v := ""
	FileGetSize, _v, %Filename%, %Units%
	return _v
}
fc_FileGetTime(Filename = "", WhichTime = "")
{
	_v := ""
	FileGetTime, _v, %Filename%, %WhichTime%
	return _v
}
fc_FileGetVersion(Filename = "")
{
	_v := ""
	FileGetVersion, _v, %Filename%
	return _v
}
fc_FileRead(Filename)
{
	_v := ""
	FileRead, _v, %Filename%
	return _v
}
fc_FileReadLine(Filename, LineNum)
{
	_v := ""
	FileReadLine, _v, %Filename%, %LineNum%
	return _v
}
fc_FileSelectFile(Options = "", RootDir = "", Prompt = "", Filter = "")
{
	_v := ""
	FileSelectFile, _v, %Options%, %RootDir%, %Prompt%, %Filter%
	return _v
}
;~ 2015-2-15 Fonny修复,参数2默认值为1而不是空
fc_FileSelectFolder(StartingFolder = "", Options = 1, Prompt = "")
{
	_v := ""
	FileSelectFolder, _v, %StartingFolder%, %Options%, %Prompt%
	return _v
}
fc_FormatTime(YYYYMMDDHH24MISS = "", Format = "")
{
	_v := ""
	FormatTime, _v, %YYYYMMDDHH24MISS%, %Format%
	return _v
}
fc_GetKeyState(WhichKey , Mode = "")
{
	_v := ""
	GetKeyState, _v, %WhichKey%, %Mode%
	return _v
}
fc_GuiControlGet(Subcommand = "", ControlID = "", Param4 = "")
{
	_v := ""
	GuiControlGet, _v, %Subcommand%, %ControlID%, %Param4%
	return _v
}
fc_ImageSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ImageFile)
{
	ImageSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
}
fc_IniRead(aFilename, aSection, aKey = "", aDefault = "")
{
	_v := ""
	;~ Ahk 的 ini 读取不支持 key 为空的情况,所以这里不需要判断是否传递空值
	IniRead, _v, %aFilename%, %aSection%, %aKey%, %aDefault%
	return _v
}
;~ Fonny Added
fc_IniWrite(ByRef aValue, aFileName, aSection, aKey = "")
{
	if (aKey)
		IniWrite, % aValue, % aFileName, % aSection, % aKey
	else
		;~ 经测试,与 IniDelete 不同,这里不是必须的,但是为了保持一致性而增加.
		IniWrite, % aValue, % aFileName, % aSection
	return !ErrorLevel
}
;~ Fonny Added
fc_IniDelete(aFilename, aSection, aKey = "")
{
	if (aKey)
		IniDelete, % aFilename, % aSection, % aKey
	else
		;~ 经测试,这里必须省略,而不是传递空字符串值
		IniDelete, % aFilename, % aSection		
	return !ErrorLevel
}
fc_Input(Options = "", EndKeys = "", MatchList = "")
{
	_v := ""
	Input, _v, %Options%, %EndKeys%, %MatchList%
	return _v
}
fc_InputBox(Title = "", Prompt = "", HIDE = "", Width = "", Height = "", X = "", Y = "", Font = "", Timeout = "", Default = "")
{
	_v := ""
	InputBox, _v, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%, , %Timeout%, %Default%
	return _v
}
fc_MouseGetPos(ByRef OutputVarX = "", ByRef OutputVarY = "", ByRef OutputVarWin = "", ByRef OutputVarControl = "", Mode = "")
{
	MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, %Mode%
}
fc_PixelGetColor(X, Y, RGB = "RGB")
{
	_v := ""
	PixelGetColor, _v, %X%, %Y%, %RGB%
	if (ErrorLevel)
	{
		return -1
	}
	return _v
}
fc_PixelSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ColorID, Variation = "", Mode = "")
{
	PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Mode%
}
fc_Random(Min = "", Max = "")
{
	_v := ""
	Random, _v, %Min%, %Max%
	return _v
}
fc_RegRead(RootKey, SubKey, ValueName = "")
{
	_v := ""
	RegRead, _v, %RootKey%, %SubKey%, %ValueName%
	return _v
}
fc_Run(Target, WorkingDir = "", Mode = "")
{
	_v := ""
	Run, %Target%, %WorkingDir%, %Mode%, _v
	return _v
}
fc_SoundGet(ComponentType = "", ControlType = "", DeviceNumber = "")
{
	_v := ""
	SoundGet, _v, %ComponentType%, %ControlType%, %DeviceNumber%
	return _v
}
fc_SoundGetWaveVolume(DeviceNumber = "")
{
	_v := ""
	SoundGetWaveVolume, _v, %DeviceNumber%
	return _v
}
fc_StatusBarGetText(Part = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	StatusBarGetText, _v, %Part%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_SplitPath(ByRef InputVar, ByRef OutFileName = "", ByRef OutDir = "", ByRef OutExtension = "", ByRef OutNameNoExt = "", ByRef OutDrive = "")
{
	SplitPath, InputVar, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
}
fc_StringGetPos(ByRef InputVar, SearchText, Mode = "", Offset = "")
{
	_v := ""
	StringGetPos, _v, InputVar, %SearchText%, %Mode%, %Offset%
	return _v
}
fc_StringLeft(ByRef InputVar, Count)
{
	_v := ""
	StringLeft, _v, InputVar, %Count%
	return _v
}
fc_StringLen(ByRef InputVar)
{
	_v := ""
	StringLen, _v, InputVar
	return _v
}
fc_StringLower(ByRef InputVar, T = "")
{
	StringLower, InputVar, InputVar, %T%
	return InputVar
}
fc_StringMid(ByRef InputVar, StartChar, Count , L = "")
{
	_v := ""
	StringMid, _v, InputVar, %StartChar%, %Count%, %L%
	return _v
}
fc_StringReplace(ByRef InputVar, SearchText, ReplaceText = "", All = "")
{
	_v := ""
	StringReplace, _v, InputVar, %SearchText%, %ReplaceText%, %All%
	return _v
}
fc_StringRight(ByRef InputVar, Count)
{
	_v := ""
	StringRight, _v, InputVar, %Count%
	return _v
}
fc_StringTrimLeft(ByRef InputVar, Count)
{
	_v := ""
	StringTrimLeft, _v, InputVar, %Count%
	return _v
}
fc_StringTrimRight(ByRef InputVar, Count)
{
	_v := ""
	StringTrimRight, _v, InputVar, %Count%
	return _v
}
fc_StringUpper(ByRef InputVar, T = "")
{
	StringUpper, InputVar, InputVar, %T%
	return InputVar
}
fc_SysGet(Subcommand, Param3 = "")
{
	_v := ""
	SysGet, _v, %Subcommand%, %Param3%
	return _v
}
fc_Transform(Cmd, Value1, Value2 = "")
{
	_v := ""
	Transform, _v, %Cmd%, %Value1%, %Value2%
	return _v
}
fc_WinGet(Cmd = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGet, _v, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_WinGetActiveTitle()
{
	_v := ""
	WinGetActiveTitle, _v
	return _v
}
fc_WinGetClass(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetClass, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_WinGetText(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetText, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
fc_WinGetTitle(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetTitle, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
