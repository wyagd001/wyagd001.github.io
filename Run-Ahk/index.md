---
layout: default
---

[返回主页](http://wyagd001.github.io)

# [](#header-2) 自用脚本介绍

**运行-Ahk**: 这是一个方便自己使用的 AutoHotkey 脚本，看到对自己有用的代码就添加进来。所以代码很乱，功能很杂，重复的功能也比较多。
**关键词**: AutoHotkey [快捷键](#hotkey) [Candy](#Candy) [Windy](#Windy) [音频播放器](#AhkPlayer) [资源管理器右键菜单](#7plus) [FolderMenu](#FolderMenu) [自动激活](#AutoRaise) [定时提醒](#Naozhong) [局域网控制](#Rc) [文件预览](#FilePrew) [剪贴板记录](#Clip) [脚本管理器](#Sm) [鼠标手势](#mouse) [增加自定义托盘图标](#TrayIcon)  

### [](#header-3)功能介绍
 - <span id="hotkey">快捷键</span>, 80 多个快捷键实现不同的功能
  - Ctrl+F2 Candy
  - Ctrl+F3 Windy
  - Alt + 鼠标左键 移动窗口位置
  - 空格预览
  - Win + J 一键打开文件, 文件夹, 注册表
  - Alt + F1 有道翻译选中的英语单词
 - <span id="Candy">Candy</span>, 针对选中的内容(文本、文件、文件夹), 弹出不同右键菜单
  - 分区快速更改盘符
  - 文件移动到指定文件夹(配置中只指定了音频文件,指定文件夹按需更改)
 - <span id="Windy">Windy</span>, 针对窗口弹出不同的菜单
  - 打开窗口进程所在目录
  - 关闭同名所有窗口
  - 引入 TTlib 管理控制窗口任务栏按钮分组
 - <span id="AhkPlayer">音频播放器</span>
  - 播放指定音乐文件夹下的音频文件
  - 可显示 Lrc 格式格式
 - <span id="7plus">7plus右键菜单</span>, 引入 ShellExtension.dll 文件, 添加自定义资源管理器右键菜单
  - 记事本打开
  - cmd 目录
  - MD5
  - 移动文件到同名目录
 - <span id="FolderMenu">FolderMenu</span> 文件夹快速跳转的(右键菜单)
 - <span id="AutoRaise">自动激活</span>
  - 鼠标移动到其他窗口后自动激活
  - 浏览器标签页自动点击
 - <span id="Naozhong">定时提醒</span>(只有一个简单的对话框来提醒)
  - 节日提醒(农历, 公历节日)
  - 闹钟
 - <span id="Rc">局域网控制</span>, 测试网址: 127.0.0.1:2525 手机访问: 192.168.0.100:2525 (电脑IP按需更改)
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
 - <span id="Sm">脚本管理器</span>, 脚本管理器文件夹下的脚本随主脚本自启动, 文件名以 **!** 开头的脚本不会
  - 鼠标手势
 - <span id="mouse">鼠标手势</span>, 按住鼠标右键后移动鼠标, 执行不同的命令
  - 运行
  - 发送按键
  - 预设的其他动作
 - <span id="TrayIcon">自定义托盘图标</span>, 添加额外的托盘图标(最多添加两个)
  - 自定义图标动作







