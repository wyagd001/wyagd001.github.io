---
layout: default
title: 如意百宝箱-Ahk
description: 如意百宝箱-Ahk 内置动作
---

[返回主页](index.md)

# [](#header-2) 内置动作

如意中内置的动作, 包括标签和函数. 支持传入[变量](./var.md).  

| 序号 | 动作 | 函数原型 | 说明 | 示例用法 |
| ----------- | ----------- | ----------- | ----------- | ----------- | 
|1|CF_AlwaysOnTop|CF_AlwaysOnTop(WinId)|传入窗口句柄, 使窗口置顶|[动作1049](/Actions/1049.md): canfunc&#124;CF_AlwaysOnTop&#124;%Windy_CurWin_id%|
|2|CF_CloseScreen|CF_CloseScreen()|关闭显示器, 使其黑屏|[动作1168](/Actions/1168.md): canfunc&#124;CF_CloseScreen|
|3|CF_FileDelete|CF_FileDelete(sfile)|传入文件路径, 删除该文件, FileDelete 命令函数化|[动作1073](/Actions/1073.md): canfunc&#124;CF_FileDelete&#124;%CandySel%|
|4|CF_FileGetShortcut|CF_FileGetShortcut(LinkFile, OutValue := 1, clip := 1)|FileGetShortcut 命令函数化, OutValue 为要得到值的序号(1-7)|[动作1149](/Actions/1149.md): Canfunc&#124;CF_FileGetShortcut&#124;%CandySel%|
|5|CF_FileMoveToFolder|CF_FileMoveToFolder(sfile, targetFolderName := "新建文件夹")|将选中文件移动到同级指定文件夹中,如果没有指定文件夹则默认为新建文件夹|[动作1267](/Actions/1267.md): canfunc&#124;CF_FileMoveToFolder&#124;%CandySel%|
|6|CF_FileRecycleEmpty|CF_FileRecycleEmpty(DriveLetter := "")|清空回收站|[动作1362](/Actions/1362.md): canfunc&#124;CF_FileRecycleEmpty|
|7|CF_FileRemoveBlankDir|CF_FileRemoveBlankDir(sfolder)|删除指定文件夹下的所有空目录(每个文件夹只循环一次)|[动作1077](/Actions/1077.md): canfunc&#124;CF_FileRemoveBlankDir&#124;%Windy_CurWin_FolderPath%|
|8|CF_FileShortcutTarget|CF_FileShortcutTarget(sfile)|打开指定lnk快捷方式文件目标所在目录|[动作1053](/Actions/1053.md): CanFunc&#124;CF_FileShortcutTarget&#124;%CandySel%|
|9|CF_FileShortcutToDesk|CF_FileShortcutToDesk(sfile)|创建指定文件的快捷方式到桌面|[动作1085](/Actions/1085.md): canfunc&#124;CF_FileShortcutToDesk&#124;%CandySel%|
|10|CF_FileToClip|CF_FileToClip(sfile)|复制指定文本文件的内容到剪贴板|canfunc&#124;CF_FileToClip&#124;%CandySel%|
|11|CF_OpenProp|CF_OpenProp(sfile)|打开指定文件系统属性对话框|[动作1421](/Actions/1421.md): CanFunc&#124;CF_OpenProp&#124;%CandySel%|
|12|CF_ProcessClose|CF_ProcessClose(WinPid := "")|强制结束指定进程|[动作1244](/Actions/1244.md): canfunc&#124;CF_ProcessClose&#124;%Windy_CurWin_Pid%|
|13|CF_restartexplorer|CF_restartexplorer()|强制重新打开资源管理器|[动作1124](/Actions/1124.md): canfunc&#124;CF_restartexplorer|
|14|CF_WinKill|CF_WinKill(WinId := "")|强制结束指定进程|[动作1243](/Actions/1243.md): canfunc&#124;CF_WinKill&#124;%Windy_CurWin_id%|
|15|CF_WinMinimizeAll|CF_WinMinimizeAll(mode := 1)|最小化所有窗口或还原|[动作1361](/Actions/1361.md): canfunc&#124;CF_WinMinimizeAll|
|16|CF_WinRemoveTaskbarButton|CF_WinRemoveTaskbarButton(WinId := "")|移除或恢复指定窗口在任务栏的按钮|[动作1241](/Actions/1241.md): canfunc&#124;CF_WinRemoveTaskbarButton&#124;%Windy_CurWin_id%|



