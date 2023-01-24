---
layout: default
---

[返回主页](http://wyagd001.github.io)

# [](#header-2) 如意百宝箱-Ahk 内置动作列表

| 动作编号 | 图标码 | 按钮名称 | 动作对象 | 描述 | 动作 |
| ----------- | ----------- | ----------- | ----------- | ----------- |----------- |
|999|E710|添加按钮|无条件|为界面的按钮指定要执行的动作|Cando&#124;BAdd|
|1001|E703|电脑图标|无条件|设置我的电脑中显示的图标(视频, 图片等六个文件夹..)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\此电脑图标设置.ahk"|
|1002|EE3F|桌面图标|无条件|设置桌面中显示的图标(此电脑, 回收站, 网络..)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\桌面图标设置.ahk"|
|1003|E71D|导航栏|无条件|资源管理器左侧导航栏中项目的设置(收藏夹, 库, 快速启动..)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\导航栏项目设置.ahk"|
|1004|E7AC|打开方式|无条件|查看扩展名的打开方式, 更改图标|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\文件打开方式查看.ahk"|
|1005|E703|电脑桌面图标|无条件|我的电脑和桌面添加自定义的链接图标|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\我的电脑和桌面添加特殊链接.ahk"|
|1006|E8AD|快捷方式|无条件|设置快捷方式的小箭头图标和快捷方式字样|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\快捷方式箭头图标设置.ahk"|
|1007|f19d|资源管理器|菜单|资源管理器动作面板|menu&#124;资源管理器|
|1008|F8B0|注册表相关|子面板||gui&#124;系统优化|
|1009|e16d|复制路径|资源管理器|复制资源管理器当前窗口路径|setclip&#124;%Windy_CurWin_FolderPath%|
|1010|EDE3|通用菜单|菜单|选中文件的通用动作面板|menu&#124;文件默认|
|1011|E70F|记事本打开|选中文本|使用记事本打开选定文件|openwith&#124;Notepad.exe|
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
|1030|e728|通用目录|菜单|一些通用的目录面板(我的电脑,回收站等)|menu&#124;通用目录|
|1031|E734|通用目录|子面板|一些通用的目录面板(我的电脑,回收站等)|GUI&#124;通用目录|
|1032|E734|收藏夹|子面板|自定义的目录收藏夹|GUI&#124;自定义收藏夹|
|1033|f617|水平最大化|任意窗口|水平最大化|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\窗口移动.ahk" "水平最大化"|
|1034|f616|垂直最大化|任意窗口|垂直最大化|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\窗口移动.ahk" "垂直最大化"|
|1035|e728|通用2|子面板|文件通用|GUI&#124;文件通用|
|1036|efa5|文件改名|选中文件|修改选中的文本文件的名称和扩展名|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件名修改.ahk" "%candysel%"|
|1037|f87e|打开选中|选中对象|运行选中的文本(路径(程序, 文件, 目录), 网址, 注册表地址)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\运行选中的文本.ahk" "%CandySel%"|
|1038|E70F|编辑|选中文件|编辑选中的lnk快捷方式文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\LnkEditor.ahk" "%CandySel%"|
|1039|e896|放入同名|选中文件|将选中的文件放入同名的文件夹中(自动创建目录)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\放入同名文件夹.ahk" "%CandySel%"|
|1040|E8DE|解散目录|选中文件|将选中文件夹中的文件移动到当前目录后, 删除选中文件夹|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件夹处理\解散文件夹.ahk" "%CandySel%"|
|1041|E735|收藏夹|子面板|以当前窗口打开指定文件夹|GUI&#124;收藏夹_当前窗口|
|1042|E838|C:\|资源管理器|在当前资源管理器窗口打开动作中指定的目录 C:\|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件夹处理\当前窗口打开.ahk" "C:\"|
|1043|eb41|百度|无条件|打开百度的网页|run&#124;https://www.baidu.com|
|1044|f17f|转码|选中文件|将选中的文本文件转换编码|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文本文件转码.ahk" "%candysel%"|
|1045|eafc|软硬链接|选中文件|为选中的文件创建软硬链接|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件创建软硬链接.ahk" "%candysel%"|
|1046|ed2b|文件属性|选中文件|修改选中的文件的属性(系统, 隐藏, 修改时间等)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件属性.ahk" "%candysel%"|
|1047|e7ad|运行窗口进程|任意窗口|运行一次窗口同名的进程|run&#124;%Windy_CurWin_Fullpath%|
|1048|f71c|窗口进程目录|任意窗口|打开窗口进程文件所在的目录|run&#124;explorer.exe /select,%Windy_CurWin_Fullpath%|
|1049|E70E|窗口置顶|任意窗口|将当前窗口置顶|canfunc&#124;CF_AlwaysOnTop&#124;%Windy_CurWin_id%|
|1050|F413|复制标题|任意窗口|复制窗口的标题栏文字|setclip&#124;%Windy_CurWin_Title%|
|1051|E894|结束同名所有|任意窗口|强制结束所有窗口同名进程|run&#124;%ComSpec% /c taskkill /im %Windy_CurWin_ProcName%.exe /F&#124;&#124;hide|
|1052|e16d|复制路径|选中对象|将选中文件的路径/选中文字放入剪贴板|setclip&#124;%CandySel%|
|1053|e1d1|目标目录|选中文件|打开选中的lnk快捷方式文件目标所在目录|CanFunc&#124;CF_FileShortcutTarget&#124;%CandySel%|
|1054|e977|我的电脑|无条件|使用资源管理器以新窗口方式打开我的电脑|run&#124;::{20D04FE0-3AEA-1069-A2D8-08002B30309D}|
|1055|E107|回收站|无条件|使用资源管理器以新窗口方式打开回收站|run&#124;::{645FF040-5081-101B-9F08-00AA002F954E}|
|1056|ed25|桌面|无条件|使用资源管理器以新窗口方式打开桌面|run&#124;%A_Desktop%|
|1057|ed25|我的文档|无条件|使用资源管理器以新窗口方式打开我的文档|run&#124;%A_MyDocuments%|
|1058|e703|网络|无条件|使用资源管理器以新窗口方式打开网络|run&#124;::{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}|
|1059|E839|网络适配器|无条件|使用资源管理器以新窗口方式打开网络适配器|run&#124;::{21EC2020-3AEA-1069-A2DD-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}|
|1060|ed25|上帝模式|无条件|使用资源管理器以新窗口方式打开上帝模式文件夹|run&#124;shell:::{ED7BA470-8E54-465E-825C-99712043E01C}|
|1061|e1d1|文档所在目录|特定窗口|使用资源管理器以新窗口方式打开窗口编辑的文件所在的目录|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\打开的文件.ahk"|
|1062|E838|AD_JS|菜单|Chrome 浏览器地址栏运行 JS 脚本|Menu&#124;Chrome_Js|
|1063|f0f9|编辑模式|Chrome|Chrome 浏览器开启网页编辑模式|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "javascript:void((function(){document.body.contentEditable='true'; document.designMode='on'; void 0})())"|
|1064|edb1|!编辑模式|Chrome|Chrome 浏览器关闭网页编辑模式|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "javascript:document.body.contentEditable=false"|
|1065|f0f9|强制复制|Chrome|Chrome 浏览器强制打开网页的右键复制功能|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "javascript:alert(document.onselectstart = document.onbeforecopy = document.oncontextmenu = document.onmousedown = document.onkeydown = function(){return true;});void(document.body.onmousedown='');void(document.body.contextmenu=''); void(document.body.onselectstart=''); void(document.body.onmouseup=''); void(document.body.oncopy='');"|
|1066|f552|获取权限|选中文件|获取选中文件的权限|run&#124;cmd.exe /c takeown /f "{file:fullpath}" && icacls "%CandySel%" /grant administrators:F|
|1067|ed2b|合并文件|选中文件|将选中的多个文本文件合并为一个文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\合并文本文件.ahk" "%candysel%"|
|1068|e907|透明75%|任意窗口|将当前窗口透明度设为75%|canfunc&#124;CF_WinSetTransparent&#124;192|
|1069|e906|透明50%|任意窗口|将当前窗口透明度设为50%|canfunc&#124;CF_WinSetTransparent&#124;128|
|1070|ef3b|预览文件|选中文件|使用ahk预览选中的文件(文本, 图片, 压缩包...)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件预览.ahk" "%CandySel%"|
|1071|e929|打开方式|选中文件|弹出选中文件的打开方式菜单|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件打开方式.ahk" "%CandySel%"|
|1072|EDE3|窗口默认|菜单||menu&#124;窗口默认|
|1073|E107|永久删除|选中文件|永久删除选中的文件, 无确认提示|canfunc&#124;CF_FileDelete&#124;%CandySel%|
|1074|e193|画图|无条件|打开系统自带画图程序|run&#124;mspaint|
|1075|f69e|常用工具|子面板||Gui&#124;常用工具|
|1076|ea39|隐藏图标|无条件|隐藏或恢复桌面图标|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\隐藏桌面所有图标.ahk"|
|1077|E107|删空目录|资源管理器|删除资源管理器窗口当前文件夹中的所有空目录|canfunc&#124;CF_FileRemoveBlankDir&#124;%Windy_CurWin_FolderPath%|
|1078|f608|1h后关机|无条件|1 小时后强制关机|run&#124;shutdown -s -t 3600|
|1079|f608|取消关机|无条件|取消强制关机|run&#124;shutdown -a|
|1080|f14a|MD5|选中文件|计算选中文件的MD5值|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\MD5_File.ahk" "%CandySel%"|
|1081|e8b1|交换文件名|选中文件|将当前选中的两个文件交换文件名|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\两个文件交换文件名.ahk" "%CandySel%"|
|1082|e775|获取文本|任务管理器|获取任务管理器的命令行文本和服务的文本|cando&#124;获取任务管理器文本|
|1083|EDE3|窗口默认2|菜单||Menu&#124;窗口默认2|
|1084|e908|透明关|任意窗口|将当前窗口透明度关闭|canfunc&#124;CF_WinSetTransparent&#124;255|
|1085|e8fc|快捷方式到桌面|选中文件|创建文件快捷方式到桌面|canfunc&#124;CF_FileShortcutToDesk&#124;%CandySel%|
|1086|e126|复制到Music|选中文件|复制选中的文件到动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\复制文件到指定文件夹.ahk" "%CandySel%" "G:\Music"|
|1087|E703|同步文件夹|资源管理器|左侧文件夹同步到右侧(左→右)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\打开的文件夹同步.ahk" %Windy_CurWin_FolderPath%|
|1088|E703|同步文件夹2|资源管理器|左侧文件夹同步到右侧(左→右)|canfunc&#124;ExecSend&#124;%Windy_CurWin_FolderPath%&#124;文件夹同步|
|1089|E703|同步文件夹|无条件|左侧文件夹同步到右侧(左→右)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\打开的文件夹同步.ahk" "C:\Users\Administrator\Desktop\Ahk\如意百宝箱" "C:\Users\Administrator\Desktop\Ahk\如意百宝箱 - 发布版本\RuYi-Ahk"|
|1090|E734|网址收藏夹|子面板||gui&#124;网址收藏夹|
|1091|e728|网址收藏夹|菜单||menu&#124;网址收藏夹|
|1092|e8c1|查看编码|选中文本|查看选中文本的编码|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文本处理\查看字符编码.ahk" "%CandySel%"|
|1093|e8a3|搜索文件夹|资源管理器|使用文件名搜索资源管理器窗口当前文件夹中的文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件夹处理\文件夹中搜索文件.ahk" "%Windy_CurWin_FolderPath%"|
|1094|ec27|IP设置|无条件|网络适配器的IP设置|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\系统设置\网络连接IP设置.ahk"|
|1095|e928|Hash|选中文件|计算选中文件的Hash值|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\HashCalc.ahk" "%CandySel%"|
|1096|ede4|搜索文件内容|资源管理器|搜索资源管理器窗口当前文件夹中文本文件中的内容|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文件夹处理\文本文件中查找字符.ahk" "%Windy_CurWin_FolderPath%"|
|1097|f6fa|百度搜索|选中文本|百度搜索选中文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\当前浏览器打开.ahk" https://www.baidu.com/s?wd=%CandySel%|
|1098|f5a5|文本比较1|选中文件|将选中对象放入文本对比的左侧界面|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\文本比较.ahk" "%CandySel%"|
|1099|e768|自定义运行|无条件|自定义注册表中注册的exe文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\自定义运行命令.ahk"|
|1100|f5a6|文本比较2|选中文件|将选中对象放入文本对比的右侧界面|canfunc&#124;ExecSend&#124;%CandySel%&#124;文本比较|
|1101|f14a|MD5对比1|选中文件|将选中文件放入MD5计算界面的上部编辑框|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\MD5.ahk" "%CandySel%"|
|1102|f14a|MD5对比2|选中文件|将选中文件放入MD5计算界面的下部编辑框|canfunc&#124;ExecSend&#124;%CandySel%&#124;MD5验证|
|1103|e928|Hash2|选中文件|计算选中文件的Hash值|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\Hash_File.ahk" "%CandySel%"|
|1104|e124|缩小50%|选中文件|将选中的图形文件尺寸缩小50%|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\图像缩小一半.ahk" "%CandySel%"|
|1105|e19b|灰度图像|选中文件|将选中的图形文件转换为灰度图像|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\图像变灰度.ahk" "%CandySel%"|
|1106|e16d|放入剪贴板|选中文件|将选中的图形文件内容放入剪贴板|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\图像内容放入剪贴板.ahk" "%CandySel%"|
|1107|e124|品质压缩|选中文件|将选中的图形文件品质缩小50%|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\图像质量压缩一半.ahk" "%CandySel%"|
|1108|e126|移动到Music|选中文件|移动选中的文件到动作中指定的目录|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\移动文件到指定文件夹.ahk" "%CandySel%" "G:\Music"|
|1109|e8c8|发送到打开的|选中文件|复制/移动选中文件到当前打开的目录|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\选中文件到打开的文件夹.ahk" "%CandySel%"|
|1110|f093|搜索帮助|选中文本|打开ahk中文帮助文件并跳转到选中的文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文本处理\Ahk脚本查帮助.ahk" "%CandySel%"|
|1111|f093|搜索v2帮助|选中文本|打开ahkv2中文帮助文件并跳转到选中的文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文本处理\Ahk2脚本查帮助.ahk" "%CandySel%"|
|1112|e982|有道翻译|选中文本|使用有道翻译选中的文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文本处理\有道翻译.ahk" "%CandySel%"|
|1113|E839|网络适配器|无条件|使用资源管理器以新窗口方式打开网络适配器|run&#124;rundll32.exe shell32.dll,Control_RunDLL ncpa.cpl|
|1114|E756|环境变量|无条件|打开系统环境变量设置|run&#124;rundll32 sysdm.cpl,EditEnvironmentVariables|
|1115|f19d|显示隐藏|无条件|资源管理器显示隐藏文件(需手动刷新, 或按F5后生效)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\显示隐藏文件.ahk"|
|1116|f56f|隐藏文件|无条件|资源管理器隐藏文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\不显示隐藏文件.ahk"|
|1117|ea49|显示扩展名|无条件|资源管理器显示文件的扩展名(需手动刷新, 或按F5后生效)|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\显示扩展名.ahk"|
|1118|e89f|隐藏扩展名|无条件|资源管理器隐藏文件的扩展名|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\注册表\不显示扩展名.ahk"|
|1119|e16d|多文件名|选中文件|将选中的多个文件的文件名放入剪贴板|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\多文件仅复制文件名.ahk" "%CandySel%"|
|1120|f17f|剪贴板至文件|资源管理器|剪贴板保存为文件到当前文件夹|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\文件处理\剪贴板保存为文件到当前文件夹.ahk" "%Windy_CurWin_FolderPath%"|
|1121|f19d|最近打开|特定窗口|显示系统最近打开的文档的菜单|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\最近使用的文档.ahk"|
|1122|f093|无线调试|无条件|开启手机无线adb调试|run&#124;%A_ScriptDir%\引用程序\adb.exe tcpip 5555|
|1123|f095|开启黑域|无条件|开启手机黑域|run&#124;%A_ScriptDir%\引用程序\adb.exe shell sh /data/data/me.piebridge.brevent/brevent.sh|
|1124|ef3b|重启桌面|无条件|强制关闭所有资源管理器后重新打开|canfunc&#124;CF_restartexplorer|
|1125|f781|窗口静音|任意窗口|任意窗口静音, 再次运行恢复|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\窗口静音.ahk"|
|1126|E70F|浏览器打开|特定窗口|使用当前浏览器当前窗口打开的文本文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\其他编辑器打开.ahk" "%A_ScriptDir%\引用程序\AnyToAhk.exe"|
|1127|e16d|复制进程路径|任意窗口|复制当前窗口的进程路径到剪贴板|setclip&#124;%Windy_CurWin_Fullpath%|
|1128|e70f|其他编辑|子面板|使用指定的编辑器打开当前窗口打开的文本文件|Gui&#124;编辑器打开|
|1129|E70F|记事本|特定窗口|使用记事本编辑当前窗口打开的文本文件|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\其他编辑器打开.ahk" "notepad.exe"|
|1130|e99a|恐龙彩蛋|Chrome|Chrome 浏览器断网时的恐龙游戏彩蛋|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "chrome://dino/"|
|1131|e12b|Chrome URLs|Chrome|Chrome 浏览器的各种 URLs|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "chrome://about/"|
|1132|f0ae|下载内容|Chrome|按下Ctrl+J, 打开 Chrome 浏览器的下载记录|Keys&#124;^j|
|1133|ee93|历史记录|Chrome|按下Ctrl+H, 打开 Chrome 浏览器的下载记录|Keys&#124;^h|
|1134|ea8d|调试器|Chrome|按下F12,打开 Chrome 浏览器的调试器|Keys&#124;{F12}|
|1135|e845|恢复标签|Chrome|按下Ctrl+Shift+T, 重新打开 Chrome 浏览器关闭的标签页|Keys&#124;^+t|
|1136|ea39|关闭标签|Chrome|按下Ctrl+W, 关闭 Chrome 浏览器当前标签页|Keys&#124;^w|
|1137|e118|至底部|Chrome|按下End, 跳转到 Chrome 浏览器打开网页的底部|Keys&#124;{End}|
|1138|e898|至顶部|Chrome|按下Home, 跳转到 Chrome 浏览器打开网页的顶部|Keys&#124;{home}|
|1139|ecaa|冻结|WPS 表格|Excel, WPS 表格快捷键,冻结到选中单元格|Cando&#124;冻结到单元格|
|1140|e16e|筛选|WPS 表格|Excel, WPS 表格快捷键,按下 Ctrl+Shift+L, 进行筛选|Keys&#124;^+l|
|1141|e16d|复制网址|Chrome|获取 Chrome 浏览器地址栏的网址|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\GetBrowserURL.ahk"|
|1142|e16d|复制全部网址|Chrome|获取 Chrome 浏览器所有打开标签页的网址|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\GetBrowserURL.ahk" "All"|
|1143|f466|IE浏览器打开|Chrome|使用IE浏览器打开 Chrome 浏览器当前标签页的网址|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\其他浏览器打开.ahk" "iexplorer.exe"|
|1144|f73d|快捷键|菜单|Chrome 浏览器的快捷键面板|Menu&#124;Chrome_快捷键|
|1145|e713|Chrome 设置|Chrome|打开 Chrome 浏览器的设置页面|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\Chrome地址栏打开.ahk" "chrome://settings/"|
|1146|E70F|编辑器|子面板|文本编辑器子面板|Gui&#124;文本编辑器|
|1147|e703|控制面板|无条件|打开控制面板|run&#124;::{26EE0668-A00A-44D7-9371-BEB064C98683}\0|
|1148|e703|库|无条件|打开库|run&#124;::{031E4825-7B94-4DC3-B131-E946B44C8DD5}|
|1149|e16d|复制目标路径|选中Lnk文件|复制快捷方式的目标所在路径到剪贴板|Canfunc&#124;CF_FileGetShortcut&#124;%CandySel%|
|1150|E756|PowerShell|无条件|打开 PowerShell|run&#124;powershell|
|1151|e16d|复制命令行|当前窗口|复制窗口进程命令行到剪贴板|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\复制窗口命令行.ahk"|
|1152|f6fa|Bing搜索|选中文本|Bing搜索选中文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\当前浏览器打开.ahk" https://cn.bing.com/search?q=%CandySel%|
|1153|f6fa|Baidu/Bing|Chrome|百度 Bing切换|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\百度Bing切换.ahk"|
|1154|f6fa|京东搜索|选中文本|京东搜索选中文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\当前浏览器打开.ahk" https://search.jd.com/Search?keyword=%CandySel%|
|1155|f6fa|搜索引擎|菜单|打开网页搜索所选文本|Menu&#124;网页搜索|
|1156|f6fa|B站搜索|选中文本|B站搜索选中文本|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\当前浏览器打开.ahk" https://search.bilibili.com/all?keyword=%CandySel%|
|1157|ed25|如意目录|无条件|打开脚本所在目录|run&#124;%A_ScriptDir%|
|1158|ed25|AppData|无条件|打开 AppData 目录|run&#124;shell:AppData|
|1159|ed25|Rencent|无条件|打开 Rencent 目录|run&#124;shell:Rencent|
|1160|E734|收藏夹|子面板|注册表收藏夹, 打开动作中指定的注册表地址|Gui&#124;注册表_收藏夹|
|1161|E71B|开机启动项目|注册表|在注册表窗口打开动作中指定的路径|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\注册表定位.ahk" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"|
|1162|E71B|系统服务|注册表|在注册表窗口打开动作中指定的路径|run&#124;"%B_Autohotkey%" "%A_ScriptDir%\外部脚本\窗口处理\注册表定位.ahk" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services"|
|1163|f73d|快捷键|子面板|Excel, WPS 表格快捷键集合|Gui&#124;Excel_快捷键|
|1164|E80A|全部边框|Excel|Excel, WPS 表格快捷键, 为选中单元格添加四周边框|Cando&#124;全部边框|
|1165|E77F|粘贴为数值|Excel|Excel, WPS 表格快捷键, 将选中单元格粘贴为数值|Cando&#124;粘贴为数值|
|1166|E77F|输入为数值|Excel|Excel, WPS 表格快捷键, 将选中单元格输入为数值|Cando&#124;输入为数值|
|1167|E8FF|打印预览|WPS 表格|Excel, WPS 表格快捷键, 按下 Ctrl+F2, 打印预览|Keys&#124;^{F2}|


