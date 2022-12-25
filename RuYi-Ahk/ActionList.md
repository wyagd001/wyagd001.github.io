---
layout: default
---

[返回主页](http://wyagd001.github.io)

# [](#header-2) 如意百宝箱-Ahk 内置动作列表

| 动作编号 | 图标码 | 按钮名称 | 动作对象 | 描述 | 动作 |
| ----------- | ----------- | ----------- | ----------- | ----------- |----------- |
|1001|E703|电脑图标|无条件|设置我的电脑中显示的图标(视频, 图片等六个文件夹..)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\此电脑图标设置.ahk"|
|1002|EE3F|桌面图标|无条件|设置桌面中显示的图标(此电脑, 回收站, 网络..)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\桌面图标设置.ahk"|
|1003|E71D|导航栏|无条件|资源管理器左侧导航栏中项目的设置(收藏夹, 库, 快速启动..)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\导航栏项目设置.ahk"|
|1004|E7AC|打开方式|无条件|查看扩展名的打开方式, 更改图标|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\文件打开方式查看.ahk"|
|1005|E703|电脑桌面图标|无条件|我的电脑和桌面添加自定义的链接图标|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\我的电脑和桌面添加特殊链接.ahk"|
|1006|E8AD|快捷方式|无条件|设置快捷方式的小箭头图标和快捷方式字样|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\快捷方式箭头图标设置.ahk"|
|1007|f19d|显隐文件扩展名|菜单||menu&#124;资源管理器|
|1008|F8B0|注册表相关|子面板||gui&#124;系统优化|
|1009|e16d|复制路径|资源管理器|复制资源管理器当前窗口路径|setclip&#124;%Windy_CurWin_FolderPath%|
|1010|EDE3|通用菜单|菜单||menu&#124;文件默认|
|1011|E70F|记事本打开|选定文件|使用记事本打开选定文件|openwith&#124;F:\Program Files\Editor\Notepad2\Notepad2.exe|
|1012|E756|CMD|资源管理器|打开cmd, 并跳转到当前资源管理器窗口路径|run&#124;cmd.exe /k cd /d "%Windy_CurWin_FolderPath%"|
|1013|f0b2|程序和功能|无条件|打开系统的程序管理删除界面|run&#124;appwiz.cpl|
|1014|ea6c|计算机管理|无条件|打开计算机管理|run&#124;compmgmt.msc|
|1015|e9f5|服务管理|无条件|打开服务管理|run&#124;services.msc|
|1016|e9f9|任务管理器|无条件|打开任务管理器|run&#124;taskmgr.exe|
|1017|E70F|记事本|无条件|打开系统记事本|run&#124;notepad.exe|
|1018|EC7A|系统工具|子面板||gui&#124;系统工具|
|1019|E8EF|计算器|无条件|打开计算器|run&#124;calc.exe|
|1020|EF16|主策略|无条件|打开主策略|run&#124;gpedit.msc|
|1021|e835|启动配置|无条件|打开启动配置|run&#124;msconfig.exe|
|1022|EF58|注册表|无条件|打开注册表|run&#124;regedit.exe|
|1023|EA1F|系统信息|无条件|打开系统信息|run&#124;msinfo32.exe|
|1024|ee92|事件查看|无条件|打开事件|run&#124;eventvwr.exe|
|1025|ef58|系统属性|无条件|打开系统属性|run&#124;control.exe system|
|1026|E756|cmd|无条件|打开 CMD|run&#124;cmd.exe|
|1027|EF16|安全策略|无条件|打开安全策略|run&#124;secpol.msc|
|1028|ebc4|磁盘清理|无条件|打开磁盘清理|run&#124;cleanmgr.exe|
|1029|e121|任务管理|无条件|打开任务管理|run&#124;taskschd.msc|
|1030|e728|收藏夹|菜单||menu&#124;收藏夹_新窗口|
|1031|ed25|主脚本目录|无条件|使用资源管理器以新窗口方式打开动作中指定目录|run&#124;F:\Program Files\运行\win 7|
|1032|ed25|帮助目录|无条件|使用资源管理器以新窗口方式打开动作中指定目录|run&#124;D:\资料\autohotkey 帮助|
|1033|ed25|脚本收集|无条件|使用资源管理器以新窗口方式打开动作中指定目录|run&#124;G:\资料\脚本收集|
|1034|ed25|git目录|无条件|使用资源管理器以新窗口方式打开动作中指定目录|run&#124;F:\Program Files\运行\git|
|1035|ed25|如意|无条件|使用资源管理器以新窗口方式打开动作中指定目录|run&#124;C:\Users\Administrator\Desktop\Ahk\如意百宝箱|
|1036|E734|收藏夹|子面板||GUI&#124;收藏夹_新窗口|
|1037|f87e|打开选中|选中对象|运行选中的文本(路径(程序, 文件, 目录), 网址, 注册表地址)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\运行选中的文本.ahk" "%CandySel%"|
|1038|E70F|编辑|选中文件|编辑选中的lnk快捷方式文件|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\LnkEditor.ahk" "%CandySel%"|
|1039|e896|放入同名|选中文件|将选中的文件放入同名的文件夹中(自动创建目录)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\放入同名文件夹.ahk" "%CandySel%"|
|1040|E8DE|解散目录|选中文件|将选中文件夹中的文件移动到当前目录后, 删除选中文件夹|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\解散文件夹.ahk" "%CandySel%"|
|1041|E735|收藏夹|子面板|以当前窗口打开指定文件夹|GUI&#124;收藏夹_当前窗口|
|1042|E838|主脚本目录|资源管理器|在当前资源管理器窗口打开动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "F:\Program Files\运行\win 7"|
|1043|E838|帮助目录|资源管理器|在当前资源管理器窗口打开动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "D:\资料\autohotkey 帮助"|
|1044|E838|脚本收集|资源管理器|在当前资源管理器窗口打开动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "G:\资料\脚本收集"|
|1045|E838|git目录|资源管理器|在当前资源管理器窗口打开动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "F:\Program Files\运行\git"|
|1046|E838|如意|资源管理器|在当前资源管理器窗口打开动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "C:\Users\Administrator\Desktop\Ahk\如意百宝箱"|
|1047|e7ad|运行窗口进程|任意窗口|运行一次窗口同名的进程|run&#124;%Windy_CurWin_Fullpath%|
|1048|f71c|窗口进程目录|任意窗口|打开窗口进程文件所在的目录|run&#124;explorer.exe /select,%Windy_CurWin_Fullpath%|
|1049|E70E|窗口置顶|任意窗口|将当前窗口置顶|canfunc&#124;CF_AlwaysOnTop&#124;%Windy_CurWin_id%|
|1050|F413|复制标题|任意窗口|复制窗口的标题栏文字|setclip&#124;%Windy_CurWin_Title%|
|1051|E894|结束同名所有|任意窗口|强制结束所有窗口同名进程|run&#124;%ComSpec% /c taskkill /im %Windy_CurWin_ProcName%.exe /F&#124;&#124;hide|
|1052|e16d|复制路径|选中对象|将选中文件的路径/选中文字放入剪贴板|setclip&#124;%CandySel%|
|1053|e1d1|所在目录|选中文件|打开选中的lnk快捷方式文件目标所在目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\链接目标文件所在目录.ahk" "%CandySel%"|
|1054|e977|我的电脑|无条件|使用资源管理器以新窗口方式打开我的电脑|run&#124;::{20D04FE0-3AEA-1069-A2D8-08002B30309D}|
|1055|E107|回收站|无条件|使用资源管理器以新窗口方式打开回收站|run&#124;::{645FF040-5081-101B-9F08-00AA002F954E}|
|1056|ed25|桌面|无条件|使用资源管理器以新窗口方式打开桌面|run&#124;%A_Desktop%|
|1057|ed25|我的文档|无条件|使用资源管理器以新窗口方式打开我的文档|run&#124;%A_MyDocuments%|
|1058|e703|网络|无条件|使用资源管理器以新窗口方式打开网络|run&#124;::{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}|
|1059|E839|网络适配器|无条件|使用资源管理器以新窗口方式打开网络适配器|run&#124;::{21EC2020-3AEA-1069-A2DD-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}|
|1060|ed25|上帝模式|无条件|使用资源管理器以新窗口方式打开上帝模式文件夹|run&#124;shell:::{ED7BA470-8E54-465E-825C-99712043E01C}|
|1061|e1d1|文档所在目录|特定窗口|使用资源管理器以新窗口方式打开窗口编辑的文件所在的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\窗口处理\打开的文件.ahk"|
|1070|ef3b|预览文件|选中文件|使用ahk预览选中的文件(文本, 图片, 压缩包...)|run&#124;"%A_WorkingDir%\引用程序\AnyToAhk.exe" 5000 "%CandySel%".|
|1071|e929|打开方式|选中文件|弹出选中文件的打开方式菜单|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件打开方式.ahk" "%CandySel%"|
|1072|EDE3|窗口默认|菜单||menu&#124;窗口默认|
|1073|E107|永久删除|选中文件|永久删除选中的文件, 无确认提示|canfunc&#124;CF_FileDelete&#124;%CandySel%|
|1074|e193|画图|无条件|打开系统自带画图程序|run&#124;mspaint|
|1075|f69e|常用工具|子面板||Gui&#124;常用工具|
|1076|ea39|隐藏图标|无条件|隐藏或恢复桌面图标|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\窗口处理\隐藏桌面所有图标.ahk"|
|1077|E107|删空目录|资源管理器|删除资源管理器窗口当前文件夹中的所有空目录|canfunc&#124;CF_FileRemoveBlankDir&#124;%Windy_CurWin_FolderPath%|
|1078|f608|1h后关机|无条件|1 小时后强制关机|run&#124;shutdown -s -t 3600|
|1079|f608|取消关机|无条件|取消强制关机|run&#124;shutdown -a|
|1080|f14a|MD5|选中文件|计算选中文件的MD5值|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\MD5_File.ahk" "%CandySel%"|
|1081|e8b1|交换文件名|选中文件|将当前选中的两个文件交换文件名|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\两个文件交换文件名.ahk" "%CandySel%"|
|1082|eb41|Ahk论坛|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.autohotkey.com/boards/viewforum.php?f|
|1083|eb41|Bing|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.bing.com|
|1084|e774|B站|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.bilibili.com/|
|1085|eb41|Github|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://github.com/|
|1086|eb41|foobar|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe http://foobar2000.xrea.jp/index.php?更新状況|
|1087|eb41|我的github|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.github.com/wyagd001|
|1088|eb41|Lexikos|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.github.com/Lexikos|
|1089|eb41|网易云|无条件|以当前浏览器打开动作中指定的网址|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://music.163.com/|
|1090|E734|网址收藏夹|子面板||gui&#124;网址收藏夹|
|1091|e728|网址收藏夹|菜单||menu&#124;网址收藏夹|
|1092|e8c1|查看编码|选中文本|查看选中文本的编码|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文本处理\查看字符编码.ahk" "%CandySel%"|
|1093|e8a3|搜索文件夹|资源管理器|使用文件名搜索资源管理器窗口当前文件夹中的文件|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\文件夹中搜索文件.ahk" "%Windy_CurWin_FolderPath%"|
|1094|ec27|IP设置|无条件|网络适配器的IP设置|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\系统设置\网络连接IP设置.ahk"|
|1095|e928|Hash|选中文件|计算选中文件的Hash值|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\HashCalc.ahk" "%CandySel%"|
|1096|ede4|搜索文件内容|资源管理器|搜索资源管理器窗口当前文件夹中文本文件中的内容|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文件夹处理\文本文件中查找字符.ahk" "%Windy_CurWin_FolderPath%"|
|1097|f6fa|百度搜索|选中文本|百度搜索选中文本|run&#124;%A_WorkingDir%\引用程序\AnyToAhk.exe https://www.baidu.com/s?wd|
|1098|f5a5|文本比较1|选中文件|将选中对象放入文本对比的左侧界面|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\文本比较.ahk" "%CandySel%"|
|1099|e768|自定义运行|无条件|自定义注册表中注册的exe文件|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\自定义运行命令.ahk"|
|1100|f5a6|文本比较2|选中文件|将选中对象放入文本对比的右侧界面|canfunc&#124;ExecSend&#124;%CandySel%&#124;文本比较|
|1101|f14a|MD5对比1|选中文件|将选中文件放入MD5计算界面的上部编辑框|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\MD5.ahk" "%CandySel%"|
|1102|f14a|MD5对比2|选中文件|将选中文件放入MD5计算界面的下部编辑框|canfunc&#124;ExecSend&#124;%CandySel%&#124;MD5验证|
|1103|e928|Hash2|选中文件|计算选中文件的Hash值|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\Hash_File.ahk" "%CandySel%"|
|1104|e124|缩小50%|选中文件|将选中的图形文件尺寸缩小50%|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\图像缩小一半.ahk" "%CandySel%"|
|1105|e19b|灰度图像|选中文件|将选中的图形文件转换为灰度图像|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\图像变灰度.ahk" "%CandySel%"|
|1106|e16d|放入剪贴板|选中文件|将选中的图形文件内容放入剪贴板|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\图像内容放入剪贴板.ahk" "%CandySel%"|
|1107|e124|品质压缩|选中文件|将选中的图形文件品质缩小50%|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\图像质量压缩一半.ahk" "%CandySel%"|
|1108|e126|移动到Music|选中文件|移动选中的文件到动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\移动文件到指定文件夹.ahk" "%CandySel%" "G:\Music"|
|1109|e8c8|复制/移动到打开的|选中文件|复制/移动选中文件到当前打开的目录|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\选中文件到打开的文件夹.ahk" "%CandySel%"|
|1110|f093|搜索帮助|选中文本|打开ahk中文帮助文件并跳转到选中的文本|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文本处理\Ahk脚本查帮助.ahk" "%CandySel%"|
|1111|f093|搜索v2帮助|选中文本|打开ahkv2中文帮助文件并跳转到选中的文本|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文本处理\Ahk2脚本查帮助.ahk" "%CandySel%"|
|1112|e982|有道翻译|选中文本|使用有道翻译选中的文本|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文本处理\有道翻译.ahk" "%CandySel%"|
|1113|E839|网络适配器|无条件|使用资源管理器以新窗口方式打开网络适配器|run&#124;rundll32.exe shell32.dll,Control_RunDLL ncpa.cpl|
|1114|E756|环境变量|无条件|打开系统环境变量设置|run&#124;rundll32 sysdm.cpl,EditEnvironmentVariables|
|1115|f19d|显示隐藏|无条件|资源管理器显示隐藏文件(需手动刷新, 或按F5后生效)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\显示隐藏文件.ahk"|
|1116|f56f|隐藏文件|无条件|资源管理器隐藏文件|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\不显示隐藏文件.ahk"|
|1117|ea49|显示扩展名|无条件|资源管理器显示文件的扩展名(需手动刷新, 或按F5后生效)|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\显示扩展名.ahk"|
|1118|e89f|隐藏扩展名|无条件|资源管理器隐藏文件的扩展名|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\注册表\不显示扩展名.ahk"|
|1119|e16d|多文件名|选中文件|将选中的多个文件的文件名放入剪贴板|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\多文件仅复制文件名.ahk" "%CandySel%"|
|1120|f17f|剪贴板至文件|资源管理器|剪贴板保存为文件到当前文件夹|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\文件处理\剪贴板保存为文件到当前文件夹.ahk" "%Windy_CurWin_FolderPath%"|
|1121|f19d|最近打开|特定窗口|显示系统最近打开的文档的菜单|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\窗口处理\最近使用的文档.ahk"|
|1122|f093|无线调试|无条件|开启手机无线adb调试|run&#124;%A_WorkingDir%\引用程序\adb.exe tcpip 5555|
|1123|f095|开启黑域|无条件|开启手机黑域|run&#124;%A_WorkingDir%\引用程序\adb.exe shell sh /data/data/me.piebridge.brevent/brevent.sh|
|1124|ef3b|重启桌面|无条件|强制关闭所有资源管理器后重新打开|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\窗口处理\重启桌面.ahk"|
|1125|f781|窗口静音|任意窗口|任意窗口静音, 再次运行恢复|run&#124;"%B_Autohotkey%" "%A_WorkingDir%\外部脚本\窗口处理\窗口静音.ahk"|
|1126|ec4f|FooBar|无条件|打开Foobar2000播放器|run&#124;D:\Program Files\foobar2000\foobar2000.exe|
|1127|e16d|复制进程路径|任意窗口|赋值当前窗口的进程路径|setclip&#124;%Windy_CurWin_Fullpath%|



 