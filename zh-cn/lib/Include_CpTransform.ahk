;~ https://msdn.microsoft.com/en-us/library/windows/desktop/dd374085(v=vs.85).aspx
Include_CpTransform()
{
   return true
}

;~ ANSI 环境下
;~ 三种编码格式的文件互相转换
;~ 参数: aToFile - 留空表示替换 aInFile.
;~ 		aInCp, aToCp - 仅接受三种情况的组合:
			;~ a - 表示: ANSI
			;~ u - 表示: UTF-8
			;~ b - 表示: UTF-8 + BOM
;~ 异常:
	;~ > 参数错误
	;~ > 文件读写删出错
	
File_CpTransform(aInFile, aInCp, aToCp, aToFile = "")
{
	if !(FileExist(aInFile))
	|| (aInCp = aToCp)
	|| (aInCp ~= "i)[^aub]")
	|| (aToCp ~= "i)[^aub]")
	{

		throw, {Message:	"参数错误"
				,What  :	(A_ThisLabel ? A_ThisLabel : A_ThisFunc)
				,File  :	A_LineFile
				,Line  :	A_LineNumber}
		return
	}

	if (!aToFile)
	{
		aToFile := aInFile
	}

	_content := fc_FileRead(aInFile)
	if (ErrorLevel)
	{

		throw, {Message:	"读取文件出错"
				,What  :	(A_ThisLabel ? A_ThisLabel : A_ThisFunc)
				,File  :	A_LineFile
				,Line  :	A_LineNumber}
		return
	}

	try
	{
		;~ ANSI
		if (aInCp = "a")
		{
			;~ ansi to utf-8
			if (aToCp = "u")
			{
				_content := Ansi2UTF8(_content)
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile
			}
			;~ ansi to utf-8 + BOM
			else if (aToCp = "b")
			{
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile, UTF-8
			}
		}
		;~ utf-8
		else if (aInCp = "u")
		{
			;~ utf-8 to ansi
			if (aToCp = "a")
			{
				_content := UTF82Ansi(_content)
				
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile
			}
			;~ utf-8 to utf-8 + BOM
			else if (aToCp = "b")
			{
				_content := Unicode2UTF8(_content)
				
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile, UTF-8
			}
		}
		;~ utf-8 + BOM
		else if (aInCp = "b")
		{
			;~ utf-8 + BOM to ansi
			if (aToCp = "a")
			{				
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile, CP936
			}
			;~ utf-8 + BOM to utf-8
			else if (aToCp = "u")
			{
				_content := Ansi2UTF8(_content)
				
				if (FileExist(aToFile))
				{
					FileDelete, % aToFile					
				}
				
				FileAppend, %_content%, % aToFile
			}
		}
		else
			return
	}
	catch, _err
	{
		Debug("Error`:"
		. "`nMessage `:`n"	_err.Message
		. "`nWhat    `:`n"	_err.What
		. "`nFile    `:`n"	_err.File
		. "`nLine    `:`n"	_err.Line)
		return
	}
	return true
}

;~ 将 ANSI 的字符串转换为 utf8 no BOM 的字符串
;~ 注意,如果要将本函数返回的字符串写入文本,
;~ *** 必须在写入时留空 Encoding 设置. ***
Ansi2UTF8(sString)
{
   Ansi2Unicode(sString, wString, 0)
   Unicode2Ansi(wString, zString, 65001)
   Return zString
}

;~ 将 ANSI 的字符串转换为 utf8 + BOM 的字符串,
;~ 注意,如果要将本函数返回的字符串写入文本,
;~ *** 必须在写入时指定 Encoding 为 UTF-8 (或 CP65001). ***
Ansi2UTF8_plus(aStr)
{
   _uStr := Ansi2UTF8(aStr)
   Unicode2UTF8(_uStr)
   return _uStr
}

;~ 将 UTF8 no BOM 的字符串转换为 ANSI 的字符串
UTF82Ansi(zString)
{
   Ansi2Unicode(zString, wString, 65001)
   Unicode2Ansi(wString, sString, 0)
   Return sString
}

;~ 将 UTF8 no BOM 的字符串转换为 UTF8 + BOM 的字符串
Unicode2UTF8(aUStr)
{
   ;~ 备份剪贴板
   _clipBak := ClipboardAll
   Clipboard := ""
   if (aUStr)
   {
	  try
	  {
		 ;~ 将 Unicode 字符在剪贴板中转换一次
		 Transform, Clipboard, Unicode, %aUStr%
	  }
	  catch, _err
	  {
		 Debug("Error`:"
			. "`nMessage `:`n"	_err.Message
			. "`nWhat    `:`n"	_err.What
			. "`nFile    `:`n"	_err.File
			. "`nLine    `:`n"	_err.Line)
		 return
	  }
   }
   _UStr := Clipboard
   ;~ 还原剪贴板
   Clipboard := _clipBak
   return _UStr
}

;~ 将 ANSI 的字符串转换为 Unicode 的字符串
;~ https://msdn.microsoft.com/en-us/library/windows/desktop/dd319072(v=vs.85).aspx
Ansi2Unicode(ByRef sString, ByRef wString, CP = 0)
{
   nSize := DllCall("MultiByteToWideChar"
	  , "Uint", CP
	  , "Uint", 0
	  , "Uint", &sString
	  , "int", -1
	  , "Uint", 0
	  , "int", 0)
   VarSetCapacity(wString, nSize * 2)
   DllCall("MultiByteToWideChar"
	  , "Uint", CP
	  , "Uint", 0
	  , "Uint", &sString
	  , "int", -1
	  , "Uint", &wString
	  , "int", nSize)
}

;~ 将 Unicode 的字符串转换为 ANSI 的字符串
;~ https://msdn.microsoft.com/en-us/library/windows/desktop/dd374130(v=vs.85).aspx
Unicode2Ansi(ByRef wString, ByRef sString, CP = 0)
{
   nSize := DllCall("WideCharToMultiByte"
	  , "Uint", CP
	  , "Uint", 0
	  , "Uint", &wString
	  , "int", -1
	  , "Uint", 0
	  , "int", 0
	  , "Uint", 0
	  , "Uint", 0)
   VarSetCapacity(sString, nSize)
   DllCall("WideCharToMultiByte"
	  , "Uint", CP
	  , "Uint", 0
	  , "Uint", &wString
	  , "int", -1
	  , "str", sString
	  , "int", nSize
	  , "Uint", 0
	  , "Uint", 0)
}