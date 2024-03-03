---
layout: default
title: 如意百宝箱-Ahk
description: 如意百宝箱-Ahk 内置变量
---

[返回主页](index.md)

# [](#header-2) 内置变量

能传递给外部脚本的变量参数列表, 例如 \[脚本.ahk "文本参数1" "%变量参数2%"\], 变量需要使用百分号括起来, 参数间使用空格来分隔. 传递给脚本的参数的最大数目为 2 个, 如果传递 2 个以上的参数给脚本, 那么第 2 个参数的值变为 "参数2\|参数3\|参数4"(即从第 2 个参数开始会将后续参数整合为 1 个参数作为 "参数2" 传递给脚本). 如意动作管理界面中的动作内容中的命令和函数也支持以下列出的变量(变量需要使用百分号括起来).  

| 序号 | 变量名称 | 说明 | 
| ----------- | ----------- | ----------- | 
|1|Ahk 内置的变量|Ahk 中的内置变量都可以使用, 例如 %clipboard%, %A_ScriptDir%|
|2|如意配置其他程序内置的变量|如一.ini 文件其他程序条目下的变量都可以使用, 例如 %AutoHotkeyU32%|
|3|B_Autohotkey|A_ScriptDir "\引用程序\\" (A_PtrSize = 8 ? "AutoHotkeyU64.exe" : "AutoHotkeyU32.exe")|
|4|B_Autohotkey2|A_ScriptDir "\引用程序\2.0\\" (A_PtrSize = 8 ? "AutoHotkey64.exe" : "AutoHotkey32.exe")|
|5|Windy_CurWin_id|当前鼠标下的窗口的句柄|
|6|Windy_CurWin_Class|当前鼠标下的窗口的类|
|7|Windy_CurWin_ClassNN|当前鼠标光标下控件的类名|
|8|Windy_CurWin_FolderPath|鼠标下窗口为资源管理器时, 窗口打开的目录|
|9|Windy_CurWin_Fullpath|当前鼠标下的窗口进程文件的路径|
|10|Windy_CurWin_ParentPath|当前鼠标下的窗口进程文件所在目录|
|11|Windy_CurWin_Pid|当前鼠标下的窗口进程的 Pid|
|12|Windy_CurWin_ProcName|当前鼠标下的窗口进程文件的名称|
|13|Windy_CurWin_ProcNameNoExt|当前鼠标下的窗口进程文件的名称(不带扩展名)|
|14|Windy_CurWin_Title|当前鼠标下的窗口的标题|
|15|CandySel|当前选中文本内容或选中文件的路径, 支持多文件, 无选中内容时变量为空|
|16|CandySel_Drive|当前选中文件的所在盘符, 如 C:|
|17|CandySel_Ext|当前选中文件的扩展名|
|18|CandySel_FileName|当前选中文件的名称|
|19|CandySel_FileNameNoExt|当前选中文件的不带扩展名的名称|
|20|CandySel_FirstFile|当前选中的第一个文件的路径|
|21|CandySel_ParentName|当前选中文件的所在目录的名称|
|22|CandySel_ParentPath|当前选中文件的所在目录|
|23|CandySel_Rich|当前选中的内容|

