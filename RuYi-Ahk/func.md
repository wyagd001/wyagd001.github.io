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
|1|CF_AlwaysOnTop|CF_AlwaysOnTop(WinId)|传入窗口句柄, 使窗口置顶|canfunc|CF_AlwaysOnTop&#124;%Windy_CurWin_id%|
|2|CF_CloseScreen|CF_CloseScreen()|关闭显示器, 使其黑屏|canfunc&#124;CF_CloseScreen|
|3|CF_FileDelete|CF_FileDelete(sfile)|传入文件路径, 删除该文件, FileDelete 命令函数化|canfunc&#124;CF_FileDelete&#124;%CandySel%|
|4|CF_FileGetShortcut|CF_FileGetShortcut(LinkFile, OutValue := 1, clip := 1)|FileGetShortcut 命令函数化, OutValue 为要得到值的序号(1-7)|Canfunc&#124;CF_FileGetShortcut&#124;%CandySel%|


