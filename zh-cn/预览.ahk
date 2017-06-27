#NoEnv
#Warn
#Warn, LocalSameAsGlobal, Off
#Warn, UseUnsetLocal, StdOut

global Gs_IsDebug := true
, gs_version := 0.1
, gs_author := "Fonny"
, gs_public := "2015"
, gs_setting_ini := SubStr(A_ScriptName, 1, -4) ".ini"

Gui Add, ActiveX, w1050 h800 vWB, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
WB.silent := true ;Surpress JS Error boxes
ComObjConnect(WB, WB_events)  ; Connect WB's events to the WB_events class object.
Gui Show
WB.Navigate("file://N:\资料\autohotkey中文帮助\编译工具\index.html")
return

class WB_events
{
	;for more events and other, see http://msdn.microsoft.com/en-us/library/aa752085

	NavigateComplete2(wb) {
		;~ wb.Stop() ;blocked all navigation, we want our own stuff happening
	}
	DownloadComplete(wb, NewURL) {
		;~ wb.Stop() ;blocked all navigation, we want our own stuff happening
	}
	DocumentComplete(wb, NewURL) {
		;~ wb.Stop() ;blocked all navigation, we want our own stuff happening
	}
}

GuiClose:
ExitApp