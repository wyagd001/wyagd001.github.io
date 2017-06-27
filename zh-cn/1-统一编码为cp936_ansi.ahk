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
delHead()

SetWorkingDir, %A_ScriptDir%
FileCopy, _forReplace\content.js, docs\static\, 1
FileCopy, _forReplace\content.chm.js, docs\static\, 1
FileCopy, _forReplace\data_toc.js, docs\static\source\, 1
FileCopy, _forReplace\CreateFiles4Help.ahkl, docs\static\source\, 1
ExitApp
return

delHead()
{
   Loop, %A_ScriptDir%\*.htm, , 1
   {
      _fEncoding := File_GetEncoding(A_LoopFileFullPath)

      ;~ a to b
      if (_fEncoding = 1)
      {
         File_CpTransform(A_LoopFileFullPath, "a", "b")
      }
      ;~ u to b
      else if (_fEncoding = 6)
      {
         File_CpTransform(A_LoopFileFullPath, "u", "b")
      }

      FileRead, content, % A_LoopFileFullPath
      FileDelete, % A_LoopFileFullPath

      _newContent := ""

      ;~ 解析内容
      loop, Parse, % content, `n, `r
      {
         _line := A_LoopField

         if (A_Index < 10)
         {
            if (_line ~= "i)\<meta.+?iso-8859-1")
            {
               _line := RegExReplace(_line, "i)iso-8859-1", "gb2312")
            }
            if (_line ~= "i)\<meta.+?UTF-8")
            {
               _line := RegExReplace(_line, "i)UTF-8", "gb2312")
            }
         }
         _newContent .= _line "`n"
      }
      ;~ 删除最后的换行符
      _newContent := SubStr(_newContent, 1 , -1)
      FileAppend, % _newContent, % A_LoopFileFullPath
      ToolTip, %A_Index% %A_LoopFileFullPath% 完成
   }
   Trace("替换头部完成", 3)
   return
}

go_change1()
{
   ;~ 新版的js引用位置变化
   _replaceStr1 =
   (`"
   static/jquery.js" type="text/javascript"></script>
   )

   _replaceStr2=
   (`"
   static/tree.jquery.js" type="text/javascript"></script>
   )

   Loop, %A_ScriptDir%\*.htm, , 1
   {
       FileRead, content, % A_LoopFileFullPath
       FileDelete, % A_LoopFileFullPath

      _newContent := ""
      Loop, parse, content, `n, `r
      {
         _line := Trim(A_LoopField)
         if (A_Index < 20)
         && ((_line ~= _replaceStr1) || (_line ~= _replaceStr2))
         {
            continue
         }
         _newContent .= A_LoopField "`n"
      }

      ;~ 删除最后的换行符
      _newContent := SubStr(_newContent, 1 , -1)

      FileAppend, % _newContent, % A_LoopFileFullPath
   }
   Trace("第一步完成")
   Sleep, 500
   return
}
