#NoEnv
#Warn
#Warn, LocalSameAsGlobal, Off
#Warn, UseUnsetLocal, Off

Include_CpTransform()
delHead()

SetWorkingDir, %A_ScriptDir%
FileCopy, _forReplace\content.js, docs\static\, 1
FileCopy, _forReplace\content.chm.js, docs\static\, 1
FileCopy, _forReplace\data_toc.js, docs\static\source\, 1
FileCopy, _forReplace\CreateFiles4Help.ahk, docs\static\source\, 1
ExitApp
return

delHead()
{
   Loop, %A_ScriptDir%\*.htm, , 1
   {
      _fEncoding := File_GetEncoding(A_LoopFileFullPath)

      ;~ 1 = ANSI
      ;~ 4 = UTF-8 +BOM
      ;~ 6 = UTF-8
      if (_fEncoding = 1)
      {
         File_CpTransform(A_LoopFileFullPath, "a", "u")
      }
      else if (_fEncoding = 4)
      {
         File_CpTransform(A_LoopFileFullPath, "b", "u")
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
               _line := RegExReplace(_line, "i)iso-8859-1", "utf-8")
            }
            if (_line ~= "i)\<meta.+?gb2312")
            {
               _line := RegExReplace(_line, "i)gb2312", "utf-8")
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