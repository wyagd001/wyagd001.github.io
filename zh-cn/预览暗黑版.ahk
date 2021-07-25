/*
删除 ucbrowser 的方法：
  1.用 emeditor 搜 <script type="text/javascript">$(function(){0<=window.navigator.userAgent.toLowerCase().indexOf("ucbrowser")&&CaoNiMaDeUc()})</script> 全删
  2.继续搜 ucbrowser 手动删除，此时大概还有2个文件。

search.htm 需要添加的内容：
  添加以下内容可以让 “预览暗黑版.ahk” 使用 WB.Navigate(A_ScriptDir "\docs\search.htm?q=exce&m=1") 调用搜索结果。
  <link href="static/theme.css" rel="stylesheet" type="text/css" />

data_index.js 内容意义解析：
  ["FileRead"                   ; 关键词
  ,"commands/FileRead.htm"      ; 页面
  ,6                            ; 分类 (0=指令 1=内置变量 2=内置函数 3=控制流语句 4=运算符 5=声明 6=命令 99=编译器)
  ,"OS"]                        ; 参数类型 (O=output S=string E=expressions I=inputVar)

优点：
  1.不用打包 .chm 。
  2.不使用坐标操作，更加稳定可靠。
  3.方便直接从 github 更新最新的帮助。
  4.可以自己往 htm 里添加内容心得等等。

存在的问题：
  1.打开页面的速度比直接在页面中点击链接要慢很多。
  2.ComObjConnect(WB, WB_events) 会降低速度，哪怕没有对里面的事件做任何处理。
  3.无法ctrl+f。
  4.Send, {Enter} 没有反应。
*/

#NoEnv
#SingleInstance Force
SetBatchLines, -1

Gui, +hWndh预览
Gui, Add, ActiveX, x0 y0 w1050 h800 vWB, %A_ScriptDir%\docs\AutoHotkey.htm

WB.silent := true ; Surpress JS Error boxes
; ComObjConnect(WB, WB_events)  ; Connect WB's events to the WB_events class object.

IOleInPlaceActiveObject_Interface := "{00000117-0000-0000-C000-000000000046}"
pipa := ComObjQuery( WB, IOleInPlaceActiveObject_Interface )
TranslateAccelerator := NumGet( NumGet( pipa+0 ) + 5*A_PtrSize )

OnMessage( 0x0100, "WM_KeyPress" ) ; WM_KEYDOWN
OnMessage( 0x0101, "WM_KeyPress" ) ; WM_KEYUP

Gui, Show, w1050 h800
WB.document.getElementsByTagName("BUTTON")[10].click()

MsgBox, 按 F8 测试直接出搜索结果.
return

; 直接出搜索结果
~F8::
  ; https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752093(v=vs.85)
  ; q=关键词（可以不完整） m=模式（1=index 2=search）
  ; WB.Navigate(A_ScriptDir "\docs\search.htm?q=call&m=1",,"_blank")
  WB.Navigate(A_ScriptDir "\docs\search.htm?q=exce&m=2",,"_top")
return

; 为 目录、索引、搜索 增加快捷键
#If WinActive("ahk_id " h预览)
!c::
!n::
!s::
  map := {"!c":1, "!n":2, "!s":3}
  WB.document.getElementsByTagName("BUTTON")[map[A_ThisHotkey]].click()
return
#If

class WB_events
{
	; for more events and other, see http://msdn.microsoft.com/en-us/library/aa752085

	NavigateComplete2(WB) {
    ; MsgBox, 1
    ; WB.Stop() ;blocked all navigation, we want our own stuff happening
	}
	DownloadComplete(WB, NewURL) {
    ; MsgBox, 2
    ; WB.Stop() ;blocked all navigation, we want our own stuff happening
	}
	DocumentComplete(WB, NewURL) {
    ; MsgBox, 3 %NewURL%
    ; WB.Stop() ;blocked all navigation, we want our own stuff happening
	}
}

GuiClose:
ObjRelease( pipa )
  ExitApp
return

WM_KeyPress( wParam, lParam, nMsg, hWnd )
{
  global WB, pipa, TranslateAccelerator
  static Vars := ["hWnd", "nMsg", "wParam", "lParam", "A_EventInfo", "A_GuiX", "A_GuiY"]

  WinGetClass, ClassName, ahk_id %hWnd%
  if ( ClassName = "Internet Explorer_Server" )
  {
    VarSetCapacity( MSG, 28, 0 )                    ; MSG STructure    http://goo.gl/4bHD9Z
    for k, v in Vars
      NumPut( %v%, MSG, ( A_Index-1 ) * A_PtrSize )

    loop, 2  ; IOleInPlaceActiveObject::TranslateAccelerator method    http://goo.gl/XkGZYt
      r := DllCall( TranslateAccelerator, "UInt", pipa, "UInt", &MSG )
    until, (wParam != 9 or WB.document.activeElement != "")

    if (r = 0)
      return, 0  ; S_OK: the message was translated to an accelerator.
  }
}