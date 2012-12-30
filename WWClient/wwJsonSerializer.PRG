#INCLUDE wconnect.h
SET PROCEDURE TO wwJsonSerializer Additive
SET PROCEDURE TO wwUtils Additive
SET PROCEDURE TO wwAPI Additive

*************************************************************
DEFINE CLASS wwJsonSerializer AS Custom
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2006
*:Contact: http://www.west-wind.com
*:Created: 09/19/2006
*************************************************************

PROTECTED cOutput
cOutput = ""

TrimStringValues = .T.
JsonFormat = "ISO"  && MSAJAX

*** Exclude Custom Property Exclusions
PropertyExclusionList = ;
 ",activecontrol,classlibrary,baseclass,comment,docked,dockposition,controls,objects,controlcount,"+;
 "class,parent,parentalias,parentclass,helpcontextid,whatsthishelpid," +;
 "width,height,top,left,tag,picture,onetomany,childalias,childorder,relationalexpr,timestamp_column," 


FUNCTION Init
DECLARE INTEGER JsonEncodeString IN wwipstuff.dll string  json,string@  output
ENDFUNC

************************************************************************
* wwJSONSerializer ::  Serialize
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Serialize(lvValue)
this.cOutput = ""
RETURN this.WriteValue(@lvValue)
ENDFUNC
*  wwJSONSerializer ::  Serialize

************************************************************************
* wwJSONSerializer ::  WriteValue
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteValue(lvValue)
LOCAL lcType
LOCAL ARRAY la_array[1]

lcType = TYPE([lvValue])
		
DO CASE
	CASE TYPE([ALEN(lvValue)]) = "N"
		this.WriteArray(@lvValue)		
	CASE ISNULL(lvValue)		
		this.cOutput = this.cOutput + "null"
	CASE INLIST(lcType,"C","M","V")
		DO CASE
		 CASE lvValue = "cursor:" OR lvValue ="cursor_rawarray:"
			this.WriteCursor(lvValue)
		OTHERWISE
			this.WriteString(lvValue)
		ENDCASE
	CASE INLIST(lcType,"I","N","F","Y")
		this.cOutput = this.cOutput + TRANSFORM(lvValue)
	CASE lcType = "L"
		IF lvValue 
			this.cOutput = this.cOutput + "true"
		ELSE
			this.cOutput = this.cOutput + "false"
		ENDIF
	CASE INLIST(lcType,"D","T")
		this.WriteDate(@lvValue)
	CASE lcType = "O"
		*** Special Object - wwCollection: Serialize as array
		DO CASE
		CASE TYPE([lvValue.Class]) = "C" AND lvValue.Class= [WWC_COLLECTION]
			DIMENSION la_array[1]
			ACOPY(lvValue.aItems,la_array)
			this.WriteArray( @la_array)
		OTHERWISE
			this.WriteObject(lvValue)
		ENDCASE
	OTHERWISE 
	    this.cOutput = this.cOutput + "null"
ENDCASE

RETURN this.cOutput
ENDFUNC
*  wwJSONSerializer ::  WriteValue


************************************************************************
* wwJSONSerializer ::  WriteString
****************************************
***  Function: serializes string
***    Assume: Thanks to Lauren Clarke for his help in 
***            optimization.
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteString(lcValue)
LOCAL lnK, lcResult, lcValue,lcOutput

IF THIS.TrimStringValues
   lcValue = TRIM(m.lcValue)
ENDIF

IF EMPTY(lcValue)
	this.cOutput = this.cOutput + [""]
	RETURN 
ENDIF	

*** Optimized for perf with C code in wwIPStuff.dll
*** JsonEncodeString
LOCAL lcOutput 
lcOutput = REPLICATE(CHR(0),LEN(lcValue) * 6 + 3)
lnPointer = JsonEncodeString(lcValue,@lcOutput)
this.cOutput = this.cOutput +  WinApi_NullString(@lcOutput)

RETURN
* WriteString

************************************************************************
* wwJsonSerializer ::  WriteDate
****************************************
***  Function: Turns a date into an ISO formatted date value string
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteDate(lvValue)


IF VARTYPE(lvValue) = "D"
	lvValue = DTOT(lvValue)
ENDIF	

*** turn into UTC date
lvValue = lvValue + GetTimeZone() * 60

IF EMPTY(lvValue)
	lvValue = {^1970-1-1 :}
ENDIF

#IF wwVFPVersion > 8
	this.cOutput = this.cOutput + '"' + TTOC(lvValue,3) + 'Z"'
	RETURN
#ENDIF


*** ISO Format
this.cOutput = this.cOutput + ;
       '"' + TRANSFORM(YEAR(ldDateVal)) + "-" + ;
       PADL(TRANSFORM(MONTH(ldDateVal)),2,"0") + "-" +;
       PADL(TRANSFORM(Day(ldDateVal)),2,"0") + "T" +;
       PADL(TRANSFORM(Hour(ldDateVal)),2,"0") + ":" +;
       PADL(TRANSFORM(Minute(ldDateVal)),2,"0") + ":" +;
       PADL(TRANSFORM(Sec(ldDateVal)),2,"0") + 'Z"'

*!*	this.cOutput = this.cOutput + [new Date("]  + MimeDateTime(lvValue) + [")]

*!*	*** Generate MS AJax style format: "\/Date(012312312)\/"  seconds since 1/1/1970 UTC
*!*	IF EMPTY(lvValue)
*!*		this.cOutput = this.cOutput + ["\/Date(0)\/"]
*!*	ELSE
*!*		lnSeconds = lvValue - {^1970/01/01  00:00 }  
*!*		lnSeconds = lnSeconds + GetTimeZone() * 60
*!*		this.cOutput = this.cOutput + ["\/Date(] + TRANSFORM(INT(lnSeconds * 1000)) + [)\/"]
*!*	ENDIF

RETURN
ENDFUNC
*  wwJsonSerializer ::  WriteDate


************************************************************************
* wwJsonSerializer ::  SerializeArray
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteArray(laItems)
LOCAL lnRows, lnX, lvItem
EXTERNAL ARRAY laItems

lnRows = ALEN(laItems,1)
this.cOutput = this.cOutput + "["
FOR lnX = 1 TO lnRows
	lvItem = laItems[lnX]
	
	this.WriteValue( lvItem ) 
	this.cOutput = this.cOutput + ","	
ENDFOR

this.cOutput = TrimWhiteSpace(this.cOutput,",")

this.cOutput = this.cOutput + "]"
RETURN this.cOutput
ENDFUNC
*  wwJsonSerializer ::  SerializeArray

*!*	*** Note: order matters here
*!*	lcValue = STRTRAN( m.lcValue,[\],[\\])
*!*	lcValue = STRTRAN( m.lcValue,["],[\"])
*!*	lcValue = STRTRAN( m.lcValue,CHR(10),[\n])
*!*	lcValue = STRTRAN( m.lcValue,CHR(13),[\r])
*!*	lcValue = STRTRAN( m.lcValue,CHR(9),[\t])
*!*	lcValue = STRTRAN( m.lcValue,CHR(127),[\b])

*!*	*** Find any extended characters left and expand into \u0023 Unicode Hex format
*!*	FOR lnK= 0 TO 31
*!*	    IF AT(CHR(lnK),lcValue) > 0
*!*	        lcValue = STRTRAN( lcValue,CHR(lnK),"\u" + RIGHT(TRANSFORM(lnK,"@0"),4))
*!*	    ENDIF
*!*	ENDFOR

*!*	*** Find any extended characters and expand into \u0023 Unicode Hex format
*!*	FOR lnK= 128 TO 255
*!*	    IF AT(CHR(lnK),m.lcValue) > 0
*!*	        lcValue = STRTRAN( lcValue,CHR(lnK),"\u" + RIGHT(TRANSFORM(lnK,"@0"),4))
*!*	    ENDIF
*!*	ENDFOR

*!*	this.cOutput = this.cOutput + ["] + m.lcValue + ["]
*!*	ENDFUNC
* wwJSONSerializer :: WriteString


*!*	FUNCTION WriteStringX(lcValue)
*!*	LOCAL lnX, lcResult, lcVal

*!*	lcResult = STRTRAN(lcValue,"\","\\")
*!*	lcResult = STRTRAN(lcResult,["],[\"])
*!*	lcResult = STRTRAN(lcResult,CHR(10),[\n])
*!*	lcResult = STRTRAN(lcResult,CHR(13),[\r])
*!*	lcResult = STRTRAN(lcResult,CHR(9),[\t])
*!*	lcResult = STRTRAN(lcResult,CHR(127),[\b])

*!*	lcResult = ["]

*!*	FOR lnX = 1 TO LEN(lcValue)
*!*		lcVal = SUBSTR(lcValue,lnX,1)
*!*		lnVal = ASC(lcVal)
*!*		
*!*		DO CASE
*!*			CASE lcVal = "\"
*!*				lcVal = "\\"
*!*		    CASE lcVal = ["]
*!*		    	lcVal =  [\"]
*!*			CASE lnVal = 10
*!*				lcVal = [\n]
*!*			CASE lnVal = 13
*!*				lcVal = [\r]
*!*			CASE lnVal = 9
*!*				lcVal = [\t]
*!*			CASE lnVal= 127
*!*				lcVal = [\b]
*!*			CASE lnVal < 32 OR lnVal > 127
*!*				lcVal = [\u] + RIGHT(TRANSFORM(lnVal,"@0"),4) 
*!*		ENDCASE
*!*		
*!*		lcResult = lcResult + lcVal
*!*	ENDFOR

*!*	this.cOutput = this.cOutput + lcResult + ["]
*!*	RETURN 
*!*	ENDFUNC
*!*	*  wwJSONSerializer ::  WriteString

************************************************************************
* wwJSONSerializer ::  WriteObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteObject()
PARAMETERS loObject
LOCAL lnX, lnProperties, lcFieldName, lcFieldType, lvValue
LOCAL ARRAY laMembers[1], la_array[1]

lnProperties = AMEMBERS(laMembers,loObject)

this.cOutput = this.cOutput + [{]

FOR lnX = 1 TO lnProperties
	  lcFieldName=LOWER(laMembers[lnX])
      
	   *** Handle property exclusions
	   IF AT("," + lcFieldName + ",","," + THIS.PropertyExclusionList + ",")>0
	      LOOP
	   ENDIF

      this.cOutput = this.cOutput + ["] + lcFieldName + [":]
      
	  IF TYPE([ALEN(loObject.] + lcFieldName + [)]) = "N"
	     *** Special Array handling - have to copy it to var first so we can pass by ref
         DIMENSION la_array[1]
         ACOPY(loObject.&lcFieldName,la_array)
	  	this.WriteArray( @la_Array )
	  ELSE  
        lvValue =  EVAL("loObject."+lcFieldName)

	    this.WriteValue(lvValue)
	  ENDIF
	  
	  this.cOutput = this.cOutput + ","
ENDFOR

#IF wwVFPVersion > 8
	this.cOutput = RTRIM(this.cOutput,0,",")
#ELSE
	this.cOutput = TrimWhiteSpace(this.cOutput," ,")
#ENDIF


this.cOutput = this.cOutput + [}]
ENDFUNC
*  wwJSONSerializer ::  WriteObject

************************************************************************
* wwJSONSerializer ::  WriteCursor
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteCursor(lcCursor)
LOCAL lnFieldCount, lnX, lcOldCursor, lcField, llNoRows

llNoRows = .F.
IF AT("cursor_rawarray:",lcCursor) > 0
   llNoRows = .T.
   lcCursor = STRTRAN(lcCursor,"cursor_rawarray:","")
ELSE
   lcCursor = STRTRAN(lcCursor,"cursor:","")
ENDIF

lcOldCursor = ALIAS()

IF EMPTY(lcCursor)
	lcCursor = ALIAS()
ENDIF
IF EMPTY(lcCursor)
   this.cOutput = this.cOutput + "null"	
   RETURN
ENDIF

IF USED(lcCursor)
   SELECT (lcCursor)
ELSE
   RETURN   
ENDIF   

lnFieldCount = AFIELDS(laFields,lcCursor)

*** Note: Inconsistency Exception here - 
***       use upper case so it works with the script library
***       for automatic databinding.
IF !llNoRows
	this.cOutput = this.cOutput +  '{"Rows":'
ENDIF

this.cOutput = this.cOutput + "["

SCAN
	this.cOutput = this.cOutput + [{]	
	
	FOR lnX = 1 TO lnFieldCount
		lcField = LOWER(laFields[lnX,1])
		this.cOutput = this.cOutput + ["] +  lcField+ [":]
		this.WriteValue( EVALUATE( lcField ) )
		
		IF lnX < lnFieldCount
			this.cOutput = this.cOutput + ","
		ENDIF
	ENDFOR

	this.cOutput = this.cOutput + [},]
ENDSCAN

IF USED(lcOldCursor)
	SELECT (lcOldCursor)
ENDIF	

#IF wwVFPVersion > 8
	this.cOutput = RTRIM(this.cOutput,0,",") +  "]"
#ELSE
	this.cOutput = TrimWhiteSpace(this.cOutput,",") +  "]"
#ENDIF

IF !llNoRows
  this.cOutput = this.cOutput + "}"
ENDIF

ENDFUNC
*  wwJSONSerializer ::  WriteCursor

************************************************************************
* wwJSONSerializer ::  WriteRow
****************************************
***  Function:
***    Assume: Record is loaded and ready to go
***      Pass:
***    Return:
************************************************************************
FUNCTION WriteRow(lvValue)
LOCAL lnFieldCount, lnX, lcOldCursor, lcField

lcCursor = STRTRAN(lcCursor,"cursorrow:","")

lcOldCursor = ALIAS()

IF EMPTY(lcCursor)
	lcCursor = ALIAS()
ENDIF
IF EMPTY(lcCursor)
   this.cOutput = this.cOutput + "null"	
   RETURN
ENDIF

IF USED(lcCursor)
   SELECT (lcCursor)
ELSE
   RETURN   
ENDIF   

lnFieldCount = AFIELDS(laFields,lcCursor)
this.cOutput = this.cOutput +  '{'

FOR lnX = 1 TO lnFieldCount
	lcField = laFields[lnX,1]	
	this.cOutput = this.cOutput + ["] +  lcField+ [":]
	this.WriteValue( EVALUATE( lcField ) )
	this.cOutput = this.cOutput + ","
ENDFOR

#IF wwVFPVersion > 8
	this.cOutput = RTRIM(this.cOutput,0,",") +  "}"
#ELSE
	this.cOutput = TrimWhiteSpace(this.cOutput,",") +  "}"
#ENDIF

IF USED(lcOldCursor)
	SELECT (lcOldCursor)
ENDIF	

ENDFUNC
*  wwJSONSerializer ::  WriteRow

************************************************************************
* wwJsonSerializer ::  Deserialize
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Deserialize(lcValue)

*** ISO, or MS AJAX dates, \/Date(9999999)\/ or new Date(9999999)
IF (LEN(lcValue) = 22 AND RIGHT(lcValue,2) = 'Z"' AND SUBSTR(lcValue,6,1)="-") OR ;
   lcValue = ["\/Date] OR lcValue = ["\\/Date] OR lcValue = "new Date("
   RETURN this.ParseDate(lcValue)
ENDIF   

lcValue = ALLTRIM(lcValue)

*** Check for string values
IF lcValue = ["]
   RETURN this.ParseString(lcValue)
ENDIF

*** Check for objects - note only limited support
IF lcValue = [{]
   RETURN this.ParseObject(lcValue)
ENDIF

*** Check for Arrays - not supported at this time: returns null
IF lcValue = "["
  RETURN this.ParseArray(lcValue)
ENDIF     

*** Check for boolean values
IF INLIST(lcValue,"true","false")
  RETURN this.ParseLogical(lcValue)
ENDIF

IF lcValue = "null"
   RETURN null
ENDIF   

*** Anything else is a literal numeric
RETURN VAL(lcValue)
ENDFUNC
*  wwJsonSerializer ::  ParseValue

************************************************************************
* wwJsonSerializer ::  ParseString
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseString(lcJsonString)

IF VARTYPE(poJScript) # "O"
	PUBLIC poJScript
	loJScript = CREATEOBJECT("ScriptControl")
	loJScript.Language = "JavaScript"
ENDIF

lcValue = ""
TRY
	lcValue=loJScript.Eval(lcJsonString)
CATCH	
ENDTRY

RETURN lcValue
* wwJsonSerializer :: ParseString

************************************************************************
* wwJsonSerializer ::  ParseNumber
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseNumber(lcNumber)
RETURN VAL(lcNumber)
ENDFUNC
*  wwJsonSerializer ::  ParseNumber

************************************************************************
* wwJsonSerializer ::  ParseLogical
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseLogical(lcLogical)
IF (lcLogical = "true")
	RETURN .t.
ENDIF
RETURN .F.
ENDFUNC
*  wwJsonSerializer ::  ParseLogical

************************************************************************
* wwJsonSerializer ::  ParseDate
****************************************
***  Function: Converts a JSON Date String to a VFP Time Value
***    Assume: 
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseDate(lcDate, llReturnUtcTime)
LOCAL lnCount, lcDate, ldDate
LOCAL ARRAY laNums[1]

IF EMPTY(lcDate)
   RETURN  {/ /  : }
ENDIF

IF LEN(lcDate) != 22
   RETURN {/ / : }
ENDIF   

*** ISO format: 2009-01-03T18:10:00Z
IF RIGHT(lcDate,2) = 'Z"' AND SUBSTR(lcDate,6,1) = "-"
	lcDate = STRTRAN(lcDate,'"',"")
	lcDate = STRTRAN(lcDate,"T"," ")
	lcDate = SUBSTR(lcDate,1,LEN(lcDate)-1)
	lcDate = "{^" + lcDate + "}"
	ldDate = EVALUATE(lcDate)
	
	IF llReturnUtcTime
	   RETURN ldDate
	ENDIF   	
	
	*** Subtract TimeZone Offset in Minutes
	ldDate = ldDate - (GetTimeZone() * 60)	
	RETURN ldDate
ENDIF

*** MS AJAX Date Format: "\/Date(1012341)\/"
IF lcDate = ["\/] OR lcDate = ["\\/]
   lnMSecs = VAL(STREXTRACT(lcDate,"Date(",")"))
   RETURN {^1970/01/01 0:0} - (GetTimeZone() * 60) +  (lnMSecs/1000) 
ENDIF

** Input: new Date(2007,0,2,9,58,17,254)
lcDateNums = STREXTRACT(lcDate,"new Date(",")")

lnCount = ALINES(laNums,lcDateNums,1,",")

** String Output:  "{^2007-01-01 22:15:10}"
lcDate = "{^" + laNums[1] + "-" + TRANSFORM(VAL(laNums[2]) + 1) + "-" + laNums[3] +;
		 " " + laNums[4] + ":" + laNums[5] + ":" + laNums[6] + "}"

ldDate = EVALUATE(lcDate)

IF llReturnUtcTime
   RETURN ldDate
ENDIF   

*** Subtract TimeZone Offset in Minutes
ldDate = ldDate - (GetTimeZone() * 60)

RETURN ldDate
ENDFUNC
*  wwJsonSerializer ::  ParseDate

************************************************************************
* wwJsonSerializer ::  ParseObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseObject(lcObjectString,loObject)
LOCAL lnCurPos,lnAt,lnAt2, lcProperty, lcObject, lcValue
* {"x":10,"y":20,"Entered":new Date(2007,0,2,10,23,57,663),"Name":"Rick Strahl"}
* {"x":10,"y":20,"Entered":new Date(2007,0,2,10,27,40,798),"Name":"Rick Strahl","Address":{"Street":"32 Kaiea","City":"Pai}a,","Entered":new Date()}}
IF LEN(lcObjectString) < 3
	RETURN null
ENDIF
	
lcObject = SUBSTR(lcObjectString,3,LEN(lcObjectString)-3)

IF VARTYPE(loObject) # "O"
	loObject = CREATEOBJECT("EMPTY")
ENDIF	

lnCurPos = 0
llDone = .f.
DO WHILE .T.
	lnAt = AT([":],lcObject)
	IF lnAt = 0
		EXIT
	ENDIF

	lcProperty = SUBSTR(lcObject,1,lnAt-1)
	lcObject = SUBSTR(lcObject,lnAT+2)
	
	lnAt2 = AT([,"],lcObject)
	
	DO CASE 
		CASE lcObject = "{"
			*** NESTED OBJECT		
			lcValue = this.FindMatchingBrace(lcObject,"{","}")
			IF EMPTY(lcObject)
				lcValue = null
			ENDIF
		CASE lcObject = "["
			*** Array
			LOOP && skip for now
		OTHERWISE
			IF lnAt2 = 0
			   lcValue = lcObject
			ELSE
				lcValue = SUBSTR(lcObject,1,lnAt2-1)
			ENDIF
	ENDCASE
		
	ADDPROPERTY(loObject,lcProperty, this.Deserialize(lcValue) )
	
	IF lnAt2 = 0
		EXIT
	ENDIF
	
	lcObject = SUBSTR(lcObject,lnAt2+2)
ENDDO

RETURN loObject
ENDFUNC
*  wwJsonSerializer ::  ParseObject

************************************************************************
* wwJsonSerializer ::  ParseArray
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseArray(lcObjectString)
*** NOT SUPPORTED AT THE MOMENT
*** 
THROW "ParseArray is not supported in wwJsonParser"

*!*	*** minimum length is 3 chars ([1])
*!*	IF LEN(lcObjectString) < 3
*!*		RETURN null
*!*	ENDIF

*!*	*** Strip off [ and ]	
*!*	lcArray = SUBSTR(lcObjectString,2)
*!*	lcArray = SUBSTR(lcObject,1,LEN(lcObject) -1)

*!*	IF VARTYPE(laArray) = "U"
*!*		DIMENSION laArray[1]
*!*	ENDIF	

ENDFUNC
*  wwJsonSerializer ::  ParseArray


************************************************************************
* wwJsonSerializer ::  FindMatchingBrace
****************************************
***  Function: returns a matching brace for a string
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION FindMatchingBrace(lcCode,lcOpenBrace,lcCloseBrace,lcFollows)
LOCAL lnAt, lcSubCode

lnAT = AT(lcCloseBrace,lcCode)
IF lnAt = 0
	RETURN ""
ENDIF	
lcSubCode = SUBSTR(lcCode,1,lnAt)

lnOccurs = OCCURS(lcOpenBrace,lcSubCode)
IF lnOccurs = 0
	RETURN ""
ENDIF
IF lnOccurs = 1
	RETURN SUBSTR(lcCode,1,lnAT) 
ENDIF

lnAt = AT(lcCloseBrace,lcCode,lnOccurs)
IF lnAT = 0
	RETURN ""
ENDIF	

RETURN SUBSTR(lcCode,1,lnAT) 


ENDDEFINE



*************************************************************
DEFINE CLASS wwJsonService AS Custom
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2006
*:Contact: http://www.west-wind.com
*:Created: 09/20/2006
*************************************************************

*** Custom Properties

*** Comma delimited list of methods that are allowed to be
*** called on the Target object
AllowedMethods = ""
ErrorOccurred = .F.

************************************************************************
* wwJsonService ::  CallMethod
****************************************
***  Function: Responsible for actually executing a method on the page
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CallMethod(Request,loTargetObject, lcMethod)
LOCAL lnParms, lcMethod,loSerializer, lcValue, lnX

this.ErrorOccurred = .F.

loSerializer = CREATEOBJECT("wwJSONSerializer")

*** We check for JSON client request data
lcContentType =  LOWER(Request.ServerVariables("CONTENT_TYPE"))

DO CASE

*** If JSON was passed as input use it as raw input for a single parameter   
CASE lcContentType = "application/x-javascript" OR ;
     lcContentType = "application/json"
   IF EMPTY(lcMethod)
      lcMethod  = Request.QueryString("Method")
   ENDIF
   IF EMPTY(lcMethod)
	   	RETURN this.ReturnExceptionObject("No method specified")
   ENDIF	   	
   
   *** If raw JSON is passed we have a single JSON parameter
   lcParms = Request.GetRawFormData()

   *** Parse the parameter into a PRIVATE variable
   IF !EMPTY(lcParms)
   		*** Create a PRIVATE variable on the fly
   		PRIVATE __JsonParm, lcParm
		__JsonParm = loSerializer.Deserialize(lcParms)
		lcParms = "__JsonParm"    			
   ENDIF     

*** Assume it's a post from the AjaxMethodCallback client component   
CASE Request.IsFormVar("CallbackMethod")
	lcParmCount = Request.Form("CallbackParmCount")
	IF EMPTY(lcParmCount)
		RETURN
	ENDIF	

	IF VARTYPE(Request.lUtf8Encoding)="L"
		Request.lUtf8Encoding = .T.
	ENDIF
		
	lnParms = VAL(lcParmCount)
	lcMethod = Request.Form("CallbackMethod");

	*** Ensure that the method is in the allowed list
	*** Note if the list is empty all methods are allowed
	IF !EMPTY(this.AllowedMethods) AND ;
	   ATC("," + lcMethod + "," , "," + this.AllowedMethods + ",") = 0
		RETURN this.ReturnExceptionObject("Method access denied: "  + lcMethod)
	ENDIF

	lcParms = ""

	FOR lnX = 1 TO lnParms
		lcParm = "Parm" + TRANSFORM(lnX)
		lcValue = Request.Form( lcParm )
		&lcParm = loSerializer.Deserialize(lcValue)
		lcParms = lcParms + lcParm  + ","  
		*** &&     "STRCONV(" + lcParm + ",11),"
	ENDFOR

	#IF wwVFPVersion > 8
		lcParms = RTRIM(lcParms,0,",")
	#ELSE
		lcParms = TrimWhiteSpace(lcParms," ,")
	#ENDIF	
*** No content type check for method parameter
*** Just call the method without parameters
OTHERWISE
   IF EMPTY(lcMethod)
      lcMethod  = Request.QueryString("Method")
   ENDIF
   IF EMPTY(lcMethod)
	   	RETURN this.ReturnExceptionObject("No method specified")
   ENDIF	   	   
   lcParms = ""	
ENDCASE

LOCAL llError, loError, lcCmd, loException
llError = .F.
loException = null

TRY
	lcCmd = "loTargetObject." + lcMethod + "(" + lcParms + ")"
	lcResult = EVALUATE( lcCmd )
CATCH TO loException
	llError = .T.
ENDTRY

IF llError
	RETURN this.ReturnExceptionObject(loException.Message)
ENDIF	


RETURN loSerializer.Serialize(lcResult)
ENDFUNC
*  wwMethodCallback ::  CallPageMethod

************************************************************************
* wwMethodCallback ::  ReturnExceptionObject
********************************************
***  Function: Generic way to return an exception
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION ReturnExceptionObject(lcMessage)
LOCAL loError
this.ErrorOccurred = .T.
RETURN [{"isCallbackError":true,"message":"] + lcMessage  + ["}]


ENDDEFINE