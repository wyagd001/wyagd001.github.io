/*!
	Function: Unicode_GetFileEncoding
		类似 chardet Py库,检测文件的代码页.

	Parameters:
		aFile - 要分析的外部文件路径.

	Remarks:
		请看 Returns 说明.
			> Note:
			- ANSI 版本的 AHK ,推荐对本函数返回值为 4 或者 6 的文件进行转码 CP65001

			> 具体情况如下:
			- 要正确读写 UTF-8 编码的文件(实际上是混杂编码,并不是真正意义上的 Unicode),如果本函数返回值为6,那么应该进行转码为 CP65001.
			- 对于 CP936 和 UTF-8+BOM 编码的文件,无需转换即可正常显示,但是写入 UTF-8+BOM 编码的文件时,必须转码为 CP65001.

	Returns:
		Integer
		0 - Failed 失败返回值.异常情况.
		1 - ANSI (CP936) ,必须带有中文字符串,才能和6区分开.
		2 - Failed 失败返回值,检验的设定参数太小,不足以检查.推荐使用默认值.
		3 - text Utf-16 BE/LE File
		4 - text Utf-8 File (UTF-8 +BOM)
		5 - text Utf-32 BE/LE File
		6 - confirmed utf-8 (UTF-8) UTF-8 无签名,必须带有中文字符串,才能和1区分开.
*/

File_GetEncoding(aFile, aNumBytes = 0, aMinimum = 4, aIsComplexUnicode = true)
{
	_rawBytes := ""
	_hFile := FileOpen(aFile, "r")
	;force position to 0 (zero)
	_hFile.Position := 0

	;~ Fonny Edited 2015-8-25
	;~ 如果未限制读取范围值,则读取整个文件
	_nBytes := (aNumBytes > 0) ? (_hFile.RawRead(_rawBytes, aNumBytes)) : (_hFile.RawRead(_rawBytes, _hFile.length))
	;read _bytesArr
	;~ _nBytes := _hFile.RawRead(_rawBytes, aNumBytes)

	_hFile.Close()

	;recommended 4 aMinimum for unicode detection
	if (_nBytes < aMinimum)
	{
		;asume text _hFile, if too short
		return 2
	}

	;Initialize vars
	_t := 0, _i := 0, _bytesArr := []

	loop % _nBytes ;create c-style _bytesArr array
		_bytesArr[(A_Index - 1)] := Numget(&_rawBytes, (A_Index - 1), "UChar")

	;determine BOM if possible/existant
	if ((_bytesArr[0]=0xFE)
	&& (_bytesArr[1]=0xFF))
	|| ((_bytesArr[0]=0xFF)
	&& (_bytesArr[1]=0xFE))
	{
		;text Utf-16 BE/LE File
		return 3
	}
	if ((_bytesArr[0]=0xEF)	&& (_bytesArr[1]=0xBB) && (_bytesArr[2]=0xBF))
	{
		;text Utf-8 File
		return 4
	}
	if ((_bytesArr[0]=0x00)	&& (_bytesArr[1]=0x00) && (_bytesArr[2]=0xFE) && (_bytesArr[3]=0xFF))
	|| ((_bytesArr[0]=0xFF)	&& (_bytesArr[1]=0xFE) && (_bytesArr[2]=0x00) && (_bytesArr[3]=0x00))
	{
		;text Utf-32 BE/LE File
		return 5
	}

	if (aIsComplexUnicode)
	{
		while(_i < _nBytes)
		{
			;// ASCII
			if (_bytesArr[_i] == 0x09)
			|| (_bytesArr[_i] == 0x0A)
			|| (_bytesArr[_i] == 0x0D)
			|| ((0x20 <= _bytesArr[_i]) && (_bytesArr[_i] <= 0x7E))
			{
				_i += 1
				continue
			}

			;// non-overlong 2-byte
			if (0xC2 <= _bytesArr[_i])
			&& (_bytesArr[_i] <= 0xDF)
			&& (0x80 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0xBF)
			{
				_i += 2
				continue
			}

			;// excluding overlongs, straight 3-byte, excluding surrogates
			if (((_bytesArr[_i] == 0xE0)
			&& ((0xA0 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF)))
			|| ((((0xE1 <= _bytesArr[_i])
			&& (_bytesArr[_i] <= 0xEC))
			|| (_bytesArr[_i] == 0xEE)
			|| (_bytesArr[_i] == 0xEF))
			&& ((0x80 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF)))
			|| ((_bytesArr[_i] == 0xED)
			&& ((0x80 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0x9F))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF))))
			{
				_i += 3
				continue
			}
			;// planes 1-3, planes 4-15, plane 16
			if (((_bytesArr[_i] == 0xF0)
			&& ((0x90 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 3])
			&& (_bytesArr[_i + 3] <= 0xBF)))
			|| (((0xF1 <= _bytesArr[_i])
			&& (_bytesArr[_i] <= 0xF3))
			&& ((0x80 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 3])
			&& (_bytesArr[_i + 3] <= 0xBF)))
			|| ((_bytesArr[_i] == 0xF4)
			&& ((0x80 <= _bytesArr[_i + 1])
			&& (_bytesArr[_i + 1] <= 0x8F))
			&& ((0x80 <= _bytesArr[_i + 2])
			&& (_bytesArr[_i + 2] <= 0xBF))
			&& ((0x80 <= _bytesArr[_i + 3])
			&& (_bytesArr[_i + 3] <= 0xBF))))
			{
				_i += 4
				continue
			}
			_t := 1
			break
		}

		;the while-loop has no fails, then confirmed utf-8
		if (_t = 0)
		{
			return 6
		}
		;else do nothing and check again with the classic method below
	}

	loop, %_nBytes%
	{
		if (_bytesArr[(A_Index - 1)] < 9) 
		|| (_bytesArr[(A_Index - 1)] > 126)
		|| ((_bytesArr[(A_Index - 1)] < 32) && (_bytesArr[(A_Index - 1)] > 13))
		{
			return 1
		}
	}
	return 0
}