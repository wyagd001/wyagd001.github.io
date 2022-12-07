---
layout: default
---

[返回主页](http://wyagd001.github.io)

# [](#header-2) 运行-Ahk 简介

**运行-Ahk**: 这是一个自己日常使用的 AutoHotkey 脚本，看到有用的代码就添加进来。所以代码很乱，功能很杂，重复的功能也比较多。  

**脚本源码**: [https://github.com/wyagd001/MyScript](https://github.com/wyagd001/MyScript)  

**关键词及目录**: AutoHotkey [快捷键](#hotkey) [热字串](#hotstring) [Candy](#Candy) [Windy](#Windy) [音频播放器](#AhkPlayer) [资源管理器右键菜单](#7plus) [FolderMenu](#FolderMenu) [自动激活](#AutoRaise) [定时提醒](#Naozhong) [局域网控制](#RC) [文件预览](#FilePrew) [剪贴板记录](#Clip) [脚本管理器](#SM) [鼠标手势](#MG) [增加自定义托盘图标](#TrayIcon)  [左键增强](#click) [中键增强](#middle) [其他脚本](#other)

### [](#header-3)功能介绍
- <span id="hotkey">快捷键</span>, 90 多个快捷键(可自定义) 实现不同的功能
  - Ctrl+F2 Candy
  - Ctrl+F3 Windy
  - Alt + 鼠标左键 移动窗口位置
  - Alt + 鼠标中键, 资源管理器: 左 Alt 打开窗口进程所在目录, 右 Alt 打开窗口文档所在目录
  - 空格预览
  - Win + J 一键打开文件, 文件夹, 注册表
  - Alt + F1 有道翻译选中的英语单词
  - F6 查看文件(文本、图片、音频)
  - ` 一键替换选中的文本(利用单词本来做翻译)
- <span id="hotstring">热字串</span>
  - == 计算公式结果
  - @zhushi 根据窗口标题输入单行注释符号
- <span id="Candy">Candy</span>, 针对选中的内容(文本、文件、文件夹), 弹出不同右键菜单
  - 选中分区快速更改盘符
  - 文件移动到指定文件夹(配置中只指定了音频文件, 指定文件夹按需更改)
  - 字符查看编码
  - 文本文件转换编码
  - 文本比较(小文件, 大文件速度慢, 可能会卡死)
  - 其他多种功能菜单
- <span id="Windy">Windy</span>, 针对窗口弹出不同的菜单
  - 打开窗口进程所在目录
  - 关闭同名所有窗口
  - 引入 TTlib 管理控制窗口任务栏按钮分组
  - 调用执行 WPS 中的vba的函数
- <span id="AhkPlayer">音频播放器</span>
  - 播放指定音乐文件夹下的音频文件
  - 可显示 Lrc 格式歌词
- <span id="7plus">7plus右键菜单</span>, 引入 ShellExtension.dll 文件, 添加自定义资源管理器右键菜单
  - 记事本打开
  - cmd 目录
  - MD5
  - 移动文件到同名目录
  - 智能解压 解压到当前文件夹(压缩文件中只有一个文件(夹)时, 以该文件(夹)为名, 多个文件或多个文件夹或文件夹和文件都有, 以压缩文件名为名)
- <span id="FolderMenu">FolderMenu</span> 文件夹快速跳转(右键菜单)
  - 支持在自定义的软件中跳转(资源管理器, WinRar, 7-Zip, TC, 文件选择对话框)
- <span id="AutoRaise">自动激活</span>
  - 鼠标移动到其他窗口后自动激活
  - 浏览器标签页自动点击
  - 任务栏位置自动点击
- <span id="Naozhong">定时提醒</span>(只有一个简单的对话框来提醒)
  - 节日提醒(农历, 公历节日)
  - 闹钟
- <span id="RC">局域网控制</span>, 测试网址: 127.0.0.1:2525 手机访问: 192.168.0.100(电脑的IP):2525(电脑的IP按需更改)
  - 控制主机(音频播放器, 音量, 关机, 查看电脑屏幕, 自定义命令)
  - 文件上传(测试)
  - 下载指定的文件
- <span id="FilePrew">文件预览</span>, 资源管理器按下空格预览文件, 支持的文件:
  - 普通图片
  - 文本文件
  - 音视频文件(wmp 能打开的文件)
  - 压缩文件(须7z), 查看注释须 WinRar
  - IE组件(pdf(须网络), html, md)
  - doc/docx(引入 xd2txlib 库)
  - xls
- <span id="Clip">剪贴板</span>
  - Ctrl +V 粘贴最近三次的剪贴板(连续按下快捷键)
  - 历史记录, 每次的文本都会保存在 db 库中
  - Ctrl+ ` 剪贴板上屏
  - Alt + ` 剪贴板收藏夹管理
- <span id="SM">脚本管理器</span>, 脚本管理器文件夹下的脚本随主脚本自启动, 文件名以 **!** 开头的脚本不会
  - 鼠标手势
- <span id="MG">鼠标手势</span>, 按住鼠标右键后移动鼠标, 执行不同的命令
  - 动作自定义(默认为下右打开)
  - 运行(函数)
  - 发送按键(函数)
  - 预设的其他动作(标签)
- <span id="TrayIcon">自定义托盘图标</span>, 添加额外的托盘图标(最多添加两个)
  - 自定义图标动作
- <span id="click">左键增强</span>, 添加额外的左键动作
  - 屏幕右下角边缘启动任务管理器
  - Chrome 双击便签页关闭
  - 双击 WinRar 空白处返回上一级(白色空白处)
- <span id="middle">中键增强</span>, 添加额外的中键动作
  - 窗口标题栏关闭窗口
  - 桌面空白处隐藏窗口图标
  - 任务栏按钮关闭窗口
  - 托盘处退出程序
- <span id="other">其他脚本</span>, 独立的小脚本
  - 搜索指定文件夹中文本文件中的内容
  - 脚本管理器
  - 迅雷开放引擎下载
  - HashCalc
  - IP 设置
  - Runz, 另一款快速启动脚本
  - 屏幕截图
  - LnkEditor, 快捷方式编辑器