#INCLUDE ..\INCLUDE\VFE.H
*#INCLUDE VFE.H

*==============================================================================
* Procedure:		Util1
* Purpose:			.F.
* Author:			F1 Technologies
* Parameters:		None
* Returns:			None
* Added:			05/26/2011
*==============================================================================

*** Function Null to Blank
FUNCTION N2B
	LPARAMETERS tcValue
	RETURN NVL(ALLTRIM(tcValue), "")


	*==============================================================================
	* Procedure:		NOE
	* Purpose:			Determines if a value ISNULL or EMPTY
	* Author:			F1 Technologies
	* Parameters:		tvValue, Variant, the value to check
	* Returns:			Logical
	* Added:			03/30/2006
	*==============================================================================
FUNCTION NOE(tvValue)
	RETURN NullOrEmpty(tvValue)
ENDFUNC


*==============================================================================
* Procedure:		Döngü
* Purpose:			.F.
* Author:			F1 Technologies
* Parameters:		None
* Returns:			None
* Added:			05/26/2011
*==============================================================================
*lnOk=.NAVIGATE("First")
*DO WHILE lnOk=File_Ok OR lnOk=File_Bof
* execute something
*lnOk=.NAVIGATE("next")
*ENDDO

*==============================================================================
* Program:			ExecuteFile
* Purpose:			Opens a file in the application it's associated with
* Author:			Adapted from the FFC _ShellExecute class by Doug Hennig
* Copyright:		(c) 2001 Stonefield Systems Group Inc.
* Last revision:	01/20/2001
* Parameters:		tcFileName   - the filename to open
*					tcOperation  - the operation to perform (optional: if it
*						isn't specified, "Open" is used)
*					tcWorkDir    - the working directory for the application
*						(optional)
*					tcParameters - other parameters to pass to the application
*						(optional)
* Returns:			-1: if no filename was passed
*					2:  bad association
*					29: failure to load application
*					30: application is busy
*					31: no application association
*					Values over 32 indicate success and return an instance
*						handle for the application
* Environment in:	none
* Environment out:	if a valid value is returned, the application is running
*==============================================================================

FUNCTION ExecuteFile


	LPARAMETERS tcFileName, ;
		tcOperation, ;
		tcWorkDir, ;
		tcParameters

	LOCAL lcFileName, ;
		lcWorkDir, ;
		lcOperation, ;
		lcParameters, ;
		lnShow

	IF EMPTY(tcFileName)
		RETURN - 1
	ENDIF EMPTY(tcFileName)

	lcFileName = ALLTRIM(tcFileName)
	lcWorkDir  = IIF(VARTYPE(tcWorkDir) = 'C', ALLTRIM(tcWorkDir), '')
	lcOperation  = IIF(VARTYPE(tcOperation) = 'C' AND NOT EMPTY(tcOperation), ;
		  ALLTRIM(tcOperation), 'Open')
	lcParameters = IIF(VARTYPE(tcParameters) = 'C', ALLTRIM(tcParameters), '')
	lnShow		 = IIF(UPPER(lcOperation) = 'Print', 0, 1)

	DECLARE INTEGER ShellExecute IN SHELL32.DLL ;
		INTEGER nWinHandle, ;	&& handle of parent window
		STRING cOperation, ;	&& operation to perform
		STRING cFileName, ;		&& filename
		STRING cParameters, ;	&& parameters for the executable
		STRING cDirectory, ;	&& default directory
		INTEGER nShowWindow		&& window state

	RETURN ShellExecute(0, lcOperation, lcFileName, lcParameters, lcWorkDir, ;
		  lnShow)
ENDFUNC


FUNCTION GetSpecialFolder
	PARAMETERS lnFolderType

	*** Define Special Folder Constants
	#DEFINE CSIDL_PROGRAMS                 2   &&Program Groups Folder
	#DEFINE CSIDL_PERSONAL                 5   &&Personal Documents Folder
	#DEFINE CSIDL_FAVORITES                6   &&Favorites Folder
	#DEFINE CSIDL_STARTUP                  7   &&Startup Group Folder
	#DEFINE CSIDL_RECENT                   8   &&Recently Used Documents
	&&Folder
	#DEFINE CSIDL_SENDTO                   9   &&Send To Folder
	#DEFINE CSIDL_STARTMENU                11  &&Start Menu Folder
	#DEFINE CSIDL_DESKTOPDIRECTORY         16  &&Desktop Folder
	#DEFINE CSIDL_NETHOOD                  19  &&Network Neighborhood Folder
	#DEFINE CSIDL_TEMPLATES                21  &&Document Templates Folder
	#DEFINE CSIDL_COMMON_STARTMENU         22  &&Common Start Menu Folder
	#DEFINE CSIDL_COMMON_PROGRAMS          23  &&Common Program Groups
	&&Folder
	#DEFINE CSIDL_COMMON_STARTUP           24  &&Common Startup Group Folder
	#DEFINE CSIDL_COMMON_DESKTOPDIRECTORY  25  &&Common Desktop Folder
	#DEFINE CSIDL_APPDATA                  26  &&Application Data Folder
	#DEFINE CSIDL_PRINTHOOD                27  &&Printers Folder
	#DEFINE CSIDL_COMMON_FAVORITES         31  &&Common Favorites Folder
	#DEFINE CSIDL_INTERNET_CACHE           32  &&Temp. Internet Files Folder
	#DEFINE CSIDL_COOKIES                  33  &&Cookies Folder
	#DEFINE CSIDL_HISTORY                  34  &&History Folder

	*** Initialize variables
	cSpecialFolderPath = SPACE(255)

	*** Declare API's
	DECLARE SHGetSpecialFolderPath IN SHELL32.DLL ;
		LONG hwndOwner, ;
		STRING @cSpecialFolderPath, ;
		LONG  nWhichFolder

	*** Get Special Folder Path

	IF lnFolderType = 16
		SHGetSpecialFolderPath(0, @cSpecialFolderPath, CSIDL_DESKTOPDIRECTORY)
	ELSE
		SHGetSpecialFolderPath(0, @cSpecialFolderPath, CSIDL_DESKTOPDIRECTORY)
	ENDIF

	*** Format Special Folder Path
	cSpecialFolderPath = SUBSTR(RTRIM(cSpecialFolderPath), 1, ;
		  LEN(RTRIM(cSpecialFolderPath)) - 1)

	*** Display Special Folder Path
	*** WAIT WINDOW cSpecialFolderPath
	RETURN cSpecialFolderPath


	*************************************
FUNCTION GetApplicationVersionNumber(tcApplicationPath)
	*************************************
	LOCAL ARRAY laVersion(4)
	LOCAL lnReturn, ;
		lcReturn

	m.laVersion(4) = "00.00"
	m.lnReturn	   = 0.00
	IF FILE(m.tcApplicationPath)
		= AGETFILEVERSION(m.laVersion, m.tcApplicationPath)
		m.lcReturn = ALLTRIM(m.laVersion(4))
		m.lnReturn = VAL(m.laVersion(4)) && version number of the user's application
	ENDIF

	RETURN m.lcReturn
ENDFUNC

*==============================================================================
* Procedure:		Date2StrictDate
* Purpose:			Converts date value to Strict date constant
* Author:			ARPB
* Parameters:		tdDate, date, the date value to convert
* Returns:			Character string
* Added:			08/08/2012
*==============================================================================

FUNCTION Date2StrictDate

	LPARAMETERS tdDate

	LOCAL lcDate

	IF NullOrEmpty(tdDate)
		lcDate = "{^1900/01/01}"
	ELSE
		lcDate = "{^" + TRANSFORM(YEAR(tdDate)) + "/" + ;
			TRANSFORM(MONTH(tdDate)) + "/" + ;
			TRANSFORM(DAY(tdDate)) + ;
			"}"
	ENDIF

	RETURN lcDate



	*==============================================================================
	* Procedure:		Add2Date
	* Purpose:			Add given number of date to a given date with such a way that  
	*                   the result date is not weekend.
	* Author:			ARPB
	* Parameters:		- tdDate 	: Given date
	*					- tnDay		: Number of days to add
	* Returns:			- ldDate 	: Result Date
	* Added:			14/09/2012
	*==============================================================================
FUNCTION Add2Date
	LPARAMETERS tdDate, tnDay

	LOCAL lnDow, ;
		ldDate

	ldDate = tdDate + tnDay
	lnDow  = DOW(ldDate, 2)

	DO CASE
		CASE lnDow = 6
			ldDate = ldDate + 2
		CASE lnDow = 7
			ldDate = ldDate + 1
	ENDCASE

	RETURN ldDate


	*==============================================================================
	* Procedure:		ExtractMailInfo
	* Purpose:			Parse and Extracts the Mail Transmision informatin from a 
	*                   given text if possible  
	* Author:			ARPB
	* Parameters:		- tcText 	 : Text including Mail Information
	* Returns:			- loMailInfo : Result Information
	* Added:			19/09/2012
	*==============================================================================
FUNCTION ExtractMailInfo
	LPARAMETERS tcText

	LOCAL loMailInfo AS "Custom
	LOCAL lcBilgi, ;
		lcKime, ;
		lcKonu, ;
		lcMesaj

	loMailInfo = CREATEOBJECT('Custom')
	= ADDPROPERTY(loMailInfo, "cKime", "")
	= ADDPROPERTY(loMailInfo, "cBilgi", "")
	= ADDPROPERTY(loMailInfo, "cKonu", "")
	= ADDPROPERTY(loMailInfo, "cMesaj", "")

	lcKime = STREXTRACT(tcText, "Kime :", "Bilgi :")
	lcKime = CHRTRAN(CHRTRAN(lcKime, CHR(10), ""), CHR(13), "")

	lcBilgi	= STREXTRACT(tcText, "Bilgi :", "Konu :")
	lcBilgi	= CHRTRAN(CHRTRAN(lcBilgi, CHR(10), ""), CHR(13), "")

	lcKonu = STREXTRACT(tcText, "Konu :", "Mesaj :")
	lcKonu = CHRTRAN(CHRTRAN(lcKonu, CHR(10), ""), CHR(13), "")

	lcMesaj	= STREXTRACT(tcText, "Mesaj :", "", 1, 2)

	WITH loMailInfo
		.cKime	= lcKime
		.cBilgi	= lcBilgi
		.cKonu	= lcKonu
		.cMesaj	= lcMesaj
	ENDWITH

	RETURN loMailInfo




	*==============================================================================
	* Procedure:		Tr2Eng
	* Purpose:			Translates Turkish Characters into English equivalent in a given string 
	*                   
	* Author:			ARPB
	* Parameters:		- tcStr 	 : Text to translate
	* Returns:			- Translated String
	* Added:			26/11/2012
	*==============================================================================

FUNCTION Tr2Eng
	LPARAMETERS lcStr

	IF ISNULL(lcStr)
		lcStr = ""
	ENDIF

	RETURN CHRTRAN(lcStr, 'ÐÜÞÝÖÇðüþýöç', 'GUSIOCgusioc')


	*==============================================================================
	* Procedure:		SetStopPrint
	* Purpose:			Set the private variable 
	*                   
	* Author:			ARPB
	* Returns:			- Translated String
	* Added:			21/02/2013
	*==============================================================================
PROCEDURE SetStopPrint
	plStopPrint = .T.
	RETURN



	*==============================================================================
	* Procedure:		getDistList
	* Purpose:			Searches a list of comma delimited values and drops 
	*                   any duplicate values from the list
	*                   
	* Author:			ARPB
	* Parameters:		- lcList 	 : list of comma delimited values
	* Returns:			- lcDistList : streamlined List
	* Added:			15/04/2013
	*==============================================================================

FUNCTION getDistList
	LPARAMETERS tcList

	DIMENSION lArr(1)
	
	LOCAL lcDistList,;
		  lcList,;
		  lcMember,;
		  lnAdet,;
		  lni		

    lcList=tcList
    lcDistList=''
    lnAdet = ALINES(lArr, lcList, ",")

	FOR lni = 1 TO lnAdet
		lcMember = '*'+ALLTRIM(lArr(lni))+'*'  && yýldizlari ekle sonra çýkar
		
        IF ATC(lcMember,lcDistList)=0   
    		lcDistList=lcDistList+IIF(NullOrEmpty(lcDistList),'',',')+lcMember
        ENDIF 		
	NEXT lni
	
	lcDistList=CHRTRAN(lcDistList,'*','')

	RETURN lcDistList


***********************************************************************
*
* Dec2RGB function: returns separate RGB values from object color value
*
* Usage:
*         RGB = Dec2RGB(<Decimal Color>) && such as _SCREEN.BACKCOLOR
*          ? RGB = "192, 192, 192"       && color is light gray if true
***********************************************************************

FUNCTION dec2rgb
LPARAMETERS tnDec
IF tnDec < 0
     WAIT WINDOW 'Must be a positive value'
     RETURN ""
ENDIF
lTalk=IIF(SET('TALK')='ON',.T.,.F.)
SET TALK OFF

* Determine the hexadecimal equivalent of the decimal parameter passed
lcHex = ""
lnFactor = 24          && set up factor value one exponent greater than used

FOR lnPos = 6 TO 1 STEP -1
     lnFactor = lnFactor - 4     && decrement factorial
     lnExp = 2 ^ lnFactor        && extrapolate next least power of two
     FOR lnOrd = 15 TO 1 STEP -1
          IF tnDec < lnExp            && no value greater than current one,
               lcHex = lcHex + "0"    && so store a zero in this position
               EXIT                   && go back for the next value
          ENDIF
          IF tnDec >= lnExp * lnOrd  && is value greater than or equal to?
               * find the matching hex value from its ordinal position
               lcHex = lcHex + SUBSTR('123456789ABCDEF', lnOrd, 1)
               EXIT
          ENDIF
     ENDFOR
     tnDec = tnDec % lnExp     && leave remainder of exponential division
ENDFOR

* reverse the order of the individual color indicators
lcHex = RIGHT(lcHex, 2) + SUBSTR(lcHex, 3, 2) + LEFT(lcHex, 2)

* convert the pairs into decimal values  
lnPick = 2          && offset to determine which pair to convert
lcRGB = '' &&["]     && start of string delineator

* parse each color indicator and convert to decimal
FOR lnColor = 1 TO 3
     lcHue = SUBSTR(lcHex, (lnPick * lnColor) - 1, 2) && pull out color
     lnMSB = ASC(LEFT(lcHue, 1))     && "Most Significant Bit"
     lnLSB = ASC(RIGHT(lcHue, 1))     && "Least Significant Bit"

     * subtract appropriate value from each to get decimal equivalent
     lnMSB = lnMSB - IIF(lnMSB > 57, 55, 48)
     lnLSB = lnLSB - IIF(lnLSB > 57, 55, 48)

     * then add decimals together
     lcRGB = lcRGB + TRANSFORM( lnMSB * 16 + lnLSB, '999') + ","
ENDFOR
lcRGB = LEFT(lcRGB, LEN(lcRGB) - 2) &&+ ["]  && replace last comma with quote
RETURN lcRGB
		