; <COMPILER: v1.1.24.02>
#NoEnv
#Warn, UseUnsetGlobal, StdOut
#Warn, LocalSameAsGlobal, StdOut
#Warn, UseUnsetLocal, Off
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1
ListLines Off
global Gs_Author := "Fonny"
, Gs_OptionFile := SubStr(A_ScriptName, 1, -3) "ini"
, Gs_DebugLevel := 0
main()
Trace("Done")
Sleep, 2000
return
main()
{
;SYS_FixHeadAndTransCp()
SYS_Convert()
return
}
SYS_FixHeadAndTransCp()
{
Loop, %A_ScriptDir%\*.htm, , 1
{
_newContent := ""
loop, Parse, % content, `n, `r
{
_line := A_LoopField
if (A_Index < 10)
{
if (_line ~= "i)\<meta.+?iso-8859-1")
{
_line := RegExReplace(_line, "i)iso-8859-1", "gb2312")
}
if (_line ~= "i)\<meta.+?UTF-8")
{
_line := RegExReplace(_line, "i)UTF-8", "gb2312")
}
}
_newContent .= _line "`n"
}
_newContent := SubStr(_newContent, 1 , -1)
FileAppend, % _newContent, % A_LoopFileFullPath
FileCodepage_TransTo(A_LoopFileFullPath, 936)
ToolTip, %A_Index% %A_LoopFileFullPath% 完成
}
Trace("替换头部完成")
return
}
SYS_Convert()
{
if (FileExist("AutoHotkey.chm"))
{
FileDelete, AutoHotkey.chm
}
FileCopy, _forReplace\content.js, docs\static\, 1
FileCopy, _forReplace\content.chm.js, docs\static\, 1
FileCopy, _forReplace\data_toc.js, docs\static\source\, 1
FileCopy, _forReplace\CreateFiles4Help.ahk, docs\static\source\, 1
FileCopy, _forReplace\Index.hhk, %A_ScriptDir%, 1
FileCopy, _forReplace\Project.hhp, %A_ScriptDir%, 1
FileCopy, _forReplace\Table of Contents.hhc, %A_ScriptDir%, 1
hhc := "hhc.exe"
for i, env_var in ["ProgramFiles", "ProgramFiles(x86)", "ProgramW6432"]
{
EnvGet Programs, %env_var%
if (Programs && FileExist(checking := Programs "\HTML Help Workshop\hhc.exe"))
{
hhc := checking
break
}
}
SetWorkingDir %A_ScriptDir%\docs\static
RunWait "%A_AhkPath%" source\CreateFiles4Help.ahk
FileMove content.js, content.temp.js, 1
FileMove content.chm.js, content.js
RunWait %hhc% "%A_ScriptDir%\Project.hhp"
FileMove content.js, content.chm.js
FileMove content.temp.js, content.js
FileDelete, %A_ScriptDir%\Index.hhk
FileDelete, %A_ScriptDir%\Project.hhp
FileDelete, %A_ScriptDir%\Table of Contents.hhc
return
}
Trace(ByRef aText := "", isDie := 0, aTitle := "")
{
aTitle := Trim(aTitle)
if (isDie = 1)
{
if ( ! StrLen(aTitle))
{
aTitle := A_ScriptName " - 致命错误!"
}
aText .= "`n`n----------`n确定后退出程序"
Suspend , On
MsgBox, % (4096 + 0 + 16), %aTitle%, %aText%
ExitApp
}
else if (isDie = 2)
{
if ( ! StrLen(aTitle))
{
aTitle := A_ScriptName " - 问题"
}
Suspend , On
MsgBox, % (4096 + 4 + 32), %aTitle%, %aText%
Suspend, off
IfMsgBox  yes
{
return 1
}
else
{
return 0
}
}
else if (isDie = 3)
{
if ( ! StrLen(aTitle))
{
aTitle := A_ScriptName " - 请注意"
}
aText .= "`n`n----------`n确定后继续运行"
Suspend , On
MsgBox, % (4096 + 0 + 64), %aTitle%, %aText%
Suspend, off
return 1
}
else
{
if ( aTitle = "" )
{
aTitle := "请注意"
}
TrayTip, % aTitle, % aText, 10, 1
return 1
}
}
FileCodepage()
{
return 1
}
FileCodepage_TransTo(aFile, aToCpNumber)
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if ! (fsys_isByteFile(aFile))
{
_err := new OC_Error("失败"
, "文件不可读写"
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
_fileCp := FileCodepage_Get(aFile)
if (_fileCp = aToCpNumber)
{
return
}
_fileCp := fc_IfIs(_fileCp, "Number")
? _fileCp
: 65001
aToCpNumber := fc_IfIs(aToCpNumber, "Number")
? ("CP" aToCpNumber)
: aToCpNumber
_content := fc_IfIs(_fileCp, "Number")
? fc_FileRead("*P" _fileCp A_Space aFile)
: fc_FileRead("*P65001" A_Space aFile)
FileDelete, % aFile
FileAppend, % _content, % aFile, % aToCpNumber
_content := ""
return 1
}
FileCodepage_Get(aFile)
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
static _numBytes := 0, _miniNum := 4, _isComplexUnicode := true
try
{
_id := _File_GetEncoding_org(aFile, _numBytes := 0, _miniNum := 4, _isComplexUnicode := true)
}
catch , _err
{
_err := new OC_Error("失败"
, _err
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
if (_id = 1)
{
return "936"
}
else if (_id = 3)
{
return "1200"
}
else if (_id = 4)
{
return "65001"
}
else if (_id = 5)
{
return "12000"
}
else if (_id = 6)
{
return "UTF-8-RAW"
}
_err := new OC_Error("无法探测文件编码"
, "异常: 0 (未知)"
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
_File_GetEncoding_org(aFile, aNumBytes := 0, _miniNum := 4, aIsComplexUnicode := true)
{
_rawBytes := ""
_hFile := FileOpen(aFile, "r")
_hFile.Position := 0
_nBytes := (aNumBytes > 0) ? (_hFile.RawRead(_rawBytes, aNumBytes)) : (_hFile.RawRead(_rawBytes, _hFile.length))
_hFile.Close()
if (_nBytes < aMinimum)
{
return 2
}
_t := 0, _i := 0, _bytesArr := []
loop % _nBytes
_bytesArr[(A_Index - 1)] := Numget(&_rawBytes, (A_Index - 1), "UChar")
if ((_bytesArr[0]=0xFE)
&& (_bytesArr[1]=0xFF))
|| ((_bytesArr[0]=0xFF)
&& (_bytesArr[1]=0xFE))
{
return 3
}
if ((_bytesArr[0]=0xEF)	&& (_bytesArr[1]=0xBB) && (_bytesArr[2]=0xBF))
{
return 4
}
if ((_bytesArr[0]=0x00)	&& (_bytesArr[1]=0x00) && (_bytesArr[2]=0xFE) && (_bytesArr[3]=0xFF))
|| ((_bytesArr[0]=0xFF)	&& (_bytesArr[1]=0xFE) && (_bytesArr[2]=0x00) && (_bytesArr[3]=0x00))
{
return 5
}
if (aIsComplexUnicode)
{
while(_i < _nBytes)
{
if (_bytesArr[_i] == 0x09)
|| (_bytesArr[_i] == 0x0A)
|| (_bytesArr[_i] == 0x0D)
|| ((0x20 <= _bytesArr[_i]) && (_bytesArr[_i] <= 0x7E))
{
_i += 1
continue
}
if (0xC2 <= _bytesArr[_i])
&& (_bytesArr[_i] <= 0xDF)
&& (0x80 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0xBF)
{
_i += 2
continue
}
if (((_bytesArr[_i] == 0xE0)
&& ((0xA0 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF)))
|| ((((0xE1 <= _bytesArr[_i])
&& (_bytesArr[_i] <= 0xEC))
|| (_bytesArr[_i] == 0xEE)
|| (_bytesArr[_i] == 0xEF))
&& ((0x80 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF)))
|| ((_bytesArr[_i] == 0xED)
&& ((0x80 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0x9F))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF))))
{
_i += 3
continue
}
if (((_bytesArr[_i] == 0xF0)
&& ((0x90 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 3])
&& (_bytesArr[_i + 3] <= 0xBF)))
|| (((0xF1 <= _bytesArr[_i])
&& (_bytesArr[_i] <= 0xF3))
&& ((0x80 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 3])
&& (_bytesArr[_i + 3] <= 0xBF)))
|| ((_bytesArr[_i] == 0xF4)
&& ((0x80 <= _bytesArr[_i + 1])
&& (_bytesArr[_i + 1] <= 0x8F))
&& ((0x80 <= _bytesArr[_i + 2])
&& (_bytesArr[_i + 2] <= 0xBF))
&& ((0x80 <= _bytesArr[_i + 3])
&& (_bytesArr[_i + 3] <= 0xBF))))
{
_i += 4
continue
}
_t := 1
break
}
if (_t = 0)
{
return 6
}
}
loop, %_nBytes%
{
if (_bytesArr[(A_Index - 1)] < 9)
|| (_bytesArr[(A_Index - 1)] > 126)
|| ((_bytesArr[(A_Index - 1)] < 32) && (_bytesArr[(A_Index - 1)] > 13))
{
return 1
}
}
return 0
}
Debug(aFuncName := "", aLineFile := "", aLineNumb := "", aText := "", aText2 := "")
{
global Gs_DebugLevel
if ! (Gs_DebugLevel)
{
return
}
if (Obj_Len(aText))
{
aText := Obj_Print(aText)
}
aLineFile := StrReplace(aLineFile, A_ScriptDir)
, aText := "文件: " aLineFile " [" aLineNumb "]`n" "函数: " aFuncName "`n`n" aText "`n" aText2 "`n`n----------`n是否继续运行`?"
Suspend , On
MsgBox, 4164,, % aText
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
Debug_DBGView(aDbgLevel := 0, aFuncName := "", aLineFile := "", aLineNumb := "", aText := "", aText2 := "")
{
global Gs_DebugLevel
if ! (Gs_DebugLevel)
|| (Gs_DebugLevel < aDbgLevel)
{
return
}
if (Obj_Len(aText))
{
aText := Obj_Print(aText)
}
aLineFile := StrReplace(aLineFile, A_ScriptDir)
OutputDebug, % "`n-----`n" "文件: " aLineFile " [" aLineNumb "]`n" "函数: " aFuncName "`n`n" aText "`n" aText2
}
Debug_point(aTarX, aTarY, aWinID = "", aText = "here", aSleepSec = 1)
{
if (!aWinID)
{
aWinID := WinExist("A")
}
_winTitle := fc_WinGetTitle("ahk_id " aWinID)
_color := Color_Get(aWinID, aTarX, aTarY)
MouseMove, aTarX, aTarY, 3
ToolTip, % aText
Sleep, aSleepSec * 1000
ToolTip
Debug(,,,aText
. "`n`ntitle`:`t" _winTitle
. "`ncolor`:`t" _color
. "`nx`:`t" aTarX
. "`ny`:`t" aTarY)
}
fsys_GetPathObj(aPath)
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if (! FileExist(aPath))
{
_err := new OC_Error("失败"
, "参数错误: aPath 路径不存在"
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
_pathObj := {}
loop, % aPath
{
SplitPath, aPath,,,, _fileNameNoExt
_fileDirNameArr 			:= StrSplit(A_LoopFileDir, "\")
, _pathObj.fileDirName 		:= _fileDirNameArr[_fileDirNameArr.Length()]
, _pathObj.fileNameNoExt	:= _fileNameNoExt
, _pathObj.fileName			:= A_LoopFileName
, _pathObj.fileShortName	:= A_LoopFileShortName
, _pathObj.fileExt			:= A_LoopFileExt
, _pathObj.fileAttrib		:= A_LoopFileAttrib
, _pathObj.fileLongPath		:= A_LoopFileLongPath
, _pathObj.fileShortPath	:= A_LoopFileShortPath
, _pathObj.fileDirPath		:= A_LoopFileDir
, _pathObj.fileSize			:= A_LoopFileSize
, _pathObj.fileSizeKB		:= A_LoopFileSizeKB
, _pathObj.fileSizeMB		:= A_LoopFileSizeMB
, _pathObj.fileTimeAccessed	:= A_LoopFileTimeAccessed
, _pathObj.fileTimeCreated 	:= A_LoopFileTimeCreated
, _pathObj.fileTimeModified	:= A_LoopFileTimeModified
}
return _pathObj
}
fsys_GetAhkDir()
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if (A_AhkPath)
{
return fsys_JoinPath(A_AhkPath, "..\")
}
}
fsys_GetFileList(aPath, aFileTypes = "", aIncludeFolders = 0, aIsRecurse = 0)
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
_dir := aPath
, _pathType := FileExist(aPath)
if !(Obj_IsPureArray(aFileTypes))
{
_err := new OC_Error("参数错误"
, "aFileTypes 必须为纯数组"
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
if (! _pathType)
{
_err := new OC_Error("失败"
, "参数错误: aPath 路径不存在"
. "`n" "aPath: " aPath
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
if (_pathType != "D")
{
try
{
_dir := fsys_getPathObj(aPath).fileDirPath
}
catch , _err
{
_err := new OC_Error("失败"
, _err
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
}
_files := []
, _opt := "F"
if (aIncludeFolders)
{
_opt .= "D"
}
if (aIsRecurse)
{
_opt .= "R"
}
loop, Files, %_dir%\*.*, % _opt
{
if isNull(aFileTypes)
{
_files.Push(A_LoopFileLongPath)
}
else if (Array_GetKeyOfValue(aFileTypes, A_LoopFileExt))
{
_files.Push(A_LoopFileLongPath)
}
}
return _files
}
fsys_JoinPath(aRootPath, aSubPathList*)
{
static _dbgLevel := 2
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
_curRootPath := ""
for i, _subPath in aSubPathList
{
if (fsys_isFullPath(_subPath))
{
_err := new OC_Error("失败"
, "子路径参数已经是完整路径"
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
VarSetCapacity(_curRootPath, (A_IsUnicode ? 2 : 1) * 260, 1)
DllCall("Shlwapi.dll\PathCombine", "UInt", &_curRootPath, "UInt", &aRootPath, "UInt", &_subPath)
if (! _curRootPath)
{
_err := new OC_Error("失败"
, "路径组合结果为空"
. "`n" "aRootPath: " aRootPath
. "`n" "_subPath: " _subPath
, A_ThisFunc ? A_ThisFunc : A_ThisLabel
, A_LineFile, A_LineNumber)
_err.Arise()
return
}
aRootPath := _curRootPath
}
return aRootPath
}
fsys_isByteFile(aPath := "")
{
static _dbgLevel := 1
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if (InStr(FileExist(aPath), "A"))
{
return 1
}
}
fsys_isFullPath(aPath := "")
{
static _dbgLevel := 1
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if (aPath ~= "i)^(a-z)\:(\\|\/)")
{
return 1
}
}
fsys_RemoveFolder(aPath)
{
static _dbgLevel := 1
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
IfExist, %aPath%
{
FileRemoveDir, %aPath%, 1
return !ErrorLevel
}
}
fsys_CreateFolder(aPath)
{
static _dbgLevel := 1
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
IfNotExist, %aPath%
{
FileCreateDir, %aPath%
return !ErrorLevel
}
}
fsys_IsFolder(aPath)
{
static _dbgLevel := 1
Debug_DBGView(_dbgLevel, A_ThisFunc, A_LineFile, A_LineNumber)
if (InStr(FileExist(aPath), "D"))
{
return 1
}
}
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
IniRead, _v, %aFilename%, %aSection%, %aKey%, %aDefault%
return _v
}
fc_IniWrite(ByRef aValue, aFileName, aSection, aKey = "")
{
if (aKey)
IniWrite, % aValue, % aFileName, % aSection, % aKey
else
IniWrite, % aValue, % aFileName, % aSection
return !ErrorLevel
}
fc_IniDelete(aFilename, aSection, aKey = "")
{
if (aKey)
IniDelete, % aFilename, % aSection, % aKey
else
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
if (Cmd = "list")
{
throw, {Message: "禁止使用List命令"
, Extra: "List命令无法返回伪数组"
, What: A_ThisFunc ? A_ThisFunc:A_ThisLabel
, File: A_LineFile
, Line: A_LineNumber}
return 0
}
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
Obj_Print(aObj, aIndent = 0)
{
static _sLevel := "  "
_tabs := "", _reStr := ""
Loop % aIndent
_tabs .= _sLevel
if !IsObject(aObj)
{
if aObj is number
return _tabs . aObj
return _tabs . """" . aObj . """"
}
if (Obj_IsPureArray(aObj))
{
_reStr .= _tabs . "[`n"
for _kEach, _vValue in aObj
_reStr .= Obj_Print(_vValue, aIndent + 1) . ",`n"
_reStr := RTrim(_reStr, ",`n")
_reStr .= "`n" _tabs . "]"
}
else
{
_reStr .= _tabs . "{`n"
for _kk, _vValue in aObj
{
if _kk is not number
_kk := """" . _kk . """"
_reStr .= _tabs . _sLevel . _kk " : " Trim(Obj_Print(_vValue, aIndent + 1)) . ",`n"
}
_reStr := RTrim(_reStr, ",")
_reStr .= "`n" _tabs . "}"
}
return _reStr
}
Obj_IsPureArray(aObj, aIsZeroBased = 0)
{
for _kk in aObj
{
if (!aIsZeroBased && _kk != A_Index)
{
return 0
}
else if (aIsZeroBased && _kk != (A_Index - 1))
{
return 0
}
}
return 1
}
Obj_Copy(aObj)
{
if not IsObject(aObj)
return ""
_objRe := {}
for _kk , _vv in aObj
{
if IsObject(_vv)
_objRe[_kk] := Obj_Copy(_vv)
else
_objRe[_kk] := _vv
}
return _objRe
}
Obj_isInKey(aObj, aStr, aSub := 0)
{
for k,v in aObj
{
if (IsObject(v) && (aSub))
{
sub_res := Obj_isInKey(aObj[k],aStr,1)
if (sub_res = 1)
return 1
}
else if (!IsObject(v) && (k=aStr))
return 1
}
Return 0
}
Obj_isInValue(aObj, aStr, aSub := 0)
{
for k,v in aObj
{
if (IsObject(v) && (aSub))
{
sub_res := Obj_isInValue(aObj[k],aStr,aSub)
if (sub_res = 1)
return 1
}
else if (!IsObject(v) && (v=aStr))
return 1
}
}
Obj_Len(aObj)
{
_len := 0
if (Obj_IsPureArray(aObj))
{
_len := aObj.Length()
_len := _len ? _len : 0
}
else
{
for k in aObj
{
_len++
}
}
return _len
}
Obj_GetValueOfKey(aInObj, aIndex)
{
for _kk1, _vv1 in aInObj
{
if (_kk1 == aIndex)
{
return _vv1
}
}
}
Obj_GetKeyOfValue(aInObj, aVal)
{
if !(IsObject(aInObj))
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数错误: 参数1 aInObj 必须是对象类型!"
. "")
return
}
for _k, _v in aInObj
{
if (_v == aVal)
{
return _k
}
}
}
Color_Get(aWinID, aX, aY, aRGB = "RGB")
{
If WinExist("ahk_id " aWinID)
{
WinActivate, % "ahk_id " aWinID
PixelGetColor, _color, % aX, % aY, % aRGB
if (ErrorLevel)
{
return -1
}
else
{
return _color
}
}
return -1
}
Color_Check(aWinID, aColor, aX, aY)
{
_curColor := Color_Get(aWinID, aX, aY)
if (_curColor >= 0)
&& (aColor = _curColor)
{
return 1
}
return 0
}
Color_Compare(aWinID, aX1, aY1, aX2, aY2)
{
c1 := Color_Get(aWinID, aX1, aY1)
c2 := Color_Get(aWinID, aX2, aY2)
if (c1 != -1)
&& (c2 != -1)
&& (c1 = c2)
{
return 1
}
else if (c1 = -1) || (c2 = -1)
{
return -1
}
return 0
}
isNull(aParam)
{
if (aParam = "")
{
return 1
}
else if (IsObject(aParam))
{
for _k, _v in aParam
{
if (! isNull(_v))
{
return 0
}
}
return 1
}
return 0
}
Array_GetValueOfKey(aInObj, aIndex)
{
for _kk1, _vv1 in aInObj
{
if (_kk1 == aIndex)
{
return _vv1
}
}
}
Array_GetKeyOfValue(aInObj, aVal)
{
if !(IsObject(aInObj))
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数错误: 参数1 aInObj 必须是对象类型!"
. "")
return
}
for _k, _v in aInObj
{
if (_v == aVal)
{
return _k
}
}
}
Array_Splite(aInArr, aDelimiter = "`n")
{
_count := Obj_Len(aInArr)
if !(_count)
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数错误: 参数1 aInArr 必须是纯数组!"
. "")
return
}
_sline := ""
loop, % _count
{
_sline .= aInArr[A_Index] aDelimiter
}
return RTrim(_sline, aDelimiter)
}
Array_Merge(ByRef aArr1, aArr2)
{
if (! Obj_Len(aArr1))
|| (! Obj_Len(aArr2))
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数错误: 参数必须都是纯数组类型!"
. "")
return
}
for _kk, _vv in aArr2
{
aArr1.Push(_vv)
}
}
Array_Range(aNumbFrom, aNumbTo, aStep := 1, aPrefix := "", aSuffix := "")
{
aNumbFrom := aNumbFrom + 0
, aNumbTo := aNumbTo + 0
, aStep := aStep + 0
if aNumbFrom is not Number
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数 aNumbFrom 必须是数字类型!"
. "")
return
}
if aNumbTo is not Number
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数 aNumbTo 必须是数字类型!"
. "")
return
}
if aStep is not Number
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数 aStep 必须是数字类型!"
. "")
return
}
_reArr := [aPrefix aNumbFrom aSuffix]
loop, % aNumbTo
{
if (aStep = 0)
{
break
}
aNumbFrom += aStep
if (aNumbFrom > aNumbTo)
{
break
}
_reArr.Push(aPrefix aNumbFrom aSuffix)
}
return _reArr
}
Array_Sort(aInArr, aIsReverse = 0, aIsByNumb = 1, aIsCS = 0)
{
if !(Obj_Len(aInArr))
{
Debug(A_LineFile "`nFunc `: " A_ThisFunc "`nLine : " A_LineNumber "`n"
. "`n" "参数错误: 参数1 aInArr 必须是纯数组!"
. "")
return
}
_sline := Array_Splite(aInArr)
_options := ""
if (aIsReverse)
{
_options := " R"
}
if (aIsByNumb)
{
_options .= " N"
}
else
{
_options .= " CL"
}
Sort, _sline, % _options
_arr := []
loop, Parse, % _sline, `n, `r
{
if (Trim(A_LoopField))
{
_arr.Push(A_LoopField)
}
}
return _arr
}