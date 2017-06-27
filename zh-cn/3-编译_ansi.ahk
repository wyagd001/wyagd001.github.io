#NoEnv
#Warn
#Warn, LocalSameAsGlobal, Off
#Warn, UseUnsetLocal, Off
#Include N:\资料\autohotkey中文帮助\编译工具\lib\Include_CpTransform.ahk
#Include N:\资料\autohotkey中文帮助\编译工具\lib\fc.ahk
#Include N:\资料\autohotkey中文帮助\编译工具\lib\debug.ahk
#Include N:\资料\autohotkey中文帮助\编译工具\lib\File_GetEncoding.ahk
#Include N:\资料\autohotkey中文帮助\编译工具\lib\trace.ahk


Include_CpTransform()
SetWorkingDir, %A_ScriptDir%

;~ 删除已经存在的输出文件 AutoHotkey.chm
if (FileExist("AutoHotkey.chm"))
{
   FileDelete, AutoHotkey.chm
}

FileCopy, _forReplace\Index.hhk, %A_ScriptDir%, 1
FileCopy, _forReplace\Project.hhp, %A_ScriptDir%, 1
FileCopy, _forReplace\Table of Contents.hhc, %A_ScriptDir%, 1
;~ go_change1()
;~ Convert_cp_4chinese()

; Change this path if the loop below doesn't find your hhc.exe,
; or leave it as-is if hhc.exe is somewhere in %PATH%.
hhc := "N:\资料\autohotkey中文帮助\HTML Help Workshop\hhc.exe"

/*
; Try to find hhc.exe, since it's not in %PATH% by default.
for i, env_var in ["ProgramFiles", "ProgramFiles(x86)", "ProgramW6432"]
{
    EnvGet Programs, %env_var%
    if (Programs && FileExist(checking := Programs "\HTML Help Workshop\hhc.exe"))
    {
        hhc := checking
        break
    }
}
*/

SetWorkingDir %A_ScriptDir%\docs\static

; Rebuild Index.hhk and Table of Contents.hhc.
RunWait "%A_AhkPath%" source\CreateFiles4Help.ahk
FileMove content.js, content.temp.js, 1
FileMove content.chm.js, content.js

; Compile AutoHotkey.chm.
RunWait %hhc% "%A_ScriptDir%\Project.hhp"

; Put it back so that local viewing works.
FileMove content.js, content.chm.js
FileMove content.temp.js, content.js

FileDelete, %A_ScriptDir%\Index.hhk
FileDelete, %A_ScriptDir%\Project.hhp
FileDelete, %A_ScriptDir%\Table of Contents.hhc
return