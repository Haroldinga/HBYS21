LPARAMETERS pcFile

LOCAL lnHandle, lcRecCnt, laFile[5], lcRecSize, lcFirstRec, ;
	lnRecCnt, lnRecSize, lnFirstRec, lnRes, lnFileSize, ;
	lnActRecCnt, llReturn, lcReturn

STORE "" TO lcReturn
STORE .T. TO llReturn

IF EMPTY(JUSTEXT(pcFile))
	pcFile = pcFile + ".dbf"
ENDIF

*-- Get details about the file into an array
IF ADIR(laFile, pcFile) = 0
	llReturn = .F.
	lcReturn = "File not found."
ENDIF


IF llReturn
	*-- Take note of the size of the file
	lnFileSize = laFile[2]

	*-- Open the file
	lnHandle = FOPEN(pcFile)

	IF lnHandle = 0
		llReturn = .F.
		lcReturn = "Unable to open file"
	ENDIF
ENDIF

IF llReturn

	*-- Get the record size details from the file
	TRY
		FSEEK(lnHandle, 4, 0) && Record Count is bytes 4-7 in dbf header (0 offset)
		lcRecCnt = FREAD(lnHandle, 4)
		FSEEK(lnHandle, 8, 0) && First Record Pos is bytes 8-9 in dbf header (0 offset)
		lcFirstRec = FREAD(lnHandle, 2)
		FSEEK(lnHandle, 10, 0) && Record Size is bytes 10-11 in dbf header (0 offset)
		lcRecSize = FREAD(lnHandle, 2)
		FCLOSE(lnHandle)

	CATCH
		llReturn = .F.
		lcReturn = "Error reading file header."

	ENDTRY

	IF llReturn
		*-- Convert the record details into integers
		lnRecCnt	= BinStrToInt( lcRecCnt )
		lnFirstRec	= BinStrToInt( lcFirstRec )
		lnRecSize	= BinStrToInt( lcRecSize )
		lnActRecCnt	= ROUND(((lnFileSize - lnFirstRec - 1) / lnRecSize), 0)

		*-- If the record count in the header is different to the actual
		*-- # of records then fix the count in the header
		IF lnActRecCnt <> lnRecCnt
			lnHandle = FOPEN(pcFile, 12) && Open file R/W, Unbuffered
			FSEEK(lnHandle, 4, 0) && Record Count is bytes 4-7 in dbf header (0 offset)
			FWRITE( lnHandle, Num2DWord(lnActRecCnt) )
			FCLOSE(lnHandle)
			lcReturn = "Record count fixed from " + ;
				TRANSFORM(lnRecCnt) + ;
				" to " + ;
				TRANSFORM(lnActRecCnt)
		ELSE
			lcReturn = "Record count correct : " + TRANSFORM(lnRecCnt)
		ENDIF
	ENDIF
ENDIF

RETURN lcReturn

FUNCTION BinStrToInt( pcStr )
	LOCAL lnTot, lnI
	lnTot = 0
	FOR lnI = 1 TO LEN(pcStr)
		lnTot = lnTot + ASC(SUBSTR(pcStr, lnI)) * 256^(lnI - 1)
	ENDFOR
	RETURN lnTot
ENDFUNC

FUNCTION Num2DWord( lnValue )
	#DEFINE m0 256
	#DEFINE m1 65536
	#DEFINE m2 16777216
	LOCAL b0, b1, b2, b3
	b3 = INT(lnValue / m2)
	b2 = INT((lnValue - b3 * m2) / m1)
	b1 = INT((lnValue - b3 * m2 - b2 * m1) / m0)
	b0 = MOD(lnValue, m0)
	RETURN CHR(b0) + CHR(b1) + CHR(b2) + CHR(b3)
ENDFUNC