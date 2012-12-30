#INCLUDE WCONNECT.h

SET CLASSLIB TO WWXML ADDITIVE
SET CLASSLIB TO WWSQL ADDITIVE
SET PROCEDURE TO WWUTILS ADDITIVE
#IF wwVFPVersion < 8
   SET PROCEDURE TO WWEVAL ADDITIVE
#ENDIF

*** Only required if returning VFP data nTransportMode=2
SET PROCEDURE TO WWHTTP ADDITIVE

*************************************************************
DEFINE CLASS wwHTTPSQLServer AS RELATION
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001-2004
*:Contact: http://www.west-wind.com
*:Created: 10/30/2001
*:Updated: 03/05/2004
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHTTPSQLServer

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

cRequestXML = ""
cResponseXML = ""

*** Custom Properties
lError = .F.
cErrorMsg = ""
nResultMode = 0

*** Optional SQL Object to use - if set this
*** overrides any connection settings passed
*** in by the client
oSQL = .NULL.
cConnectString = "NOACCESS"
cAllowedCommands = ",select,insert,update,delete,execute,method,"
cSkipFieldsForUpdates = ""
lUTF8 = .F.
nSchema = 1  

nMaxBufferSize = 0
oXML = .NULL.
oDom = .NULL.

*** 0 - XML   2 - EncodeDbf()
nTransportMode = 0

*** Internally used properties
cCursorName = ""
cCommand = ""
cFullSQL = ""
nResultCursors = 0
cReturnValueXML = ""


************************************************************************
* wwHttpSqlServer :: Init
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init
THIS.oXML = CREATEOBJECT("wwXML")
ENDFUNC

************************************************************************
* wwHttpSqlServer :: S_Execute
*********************************
***  Function: Generic Execute request handler routine that can
***            be used to pull data from the wire.
***            Typically called from a wwHTTPData client in VFP
***    Assume: Requires Web Connection server request (loProcess)
***      Pass: lcXML   -    XML string or XMLDOM object with input XML
***    Return: .t. or .f.
************************************************************************
FUNCTION S_Execute(lcXML)

IF THIS.ParseXML(lcXML)
   IF THIS.ExecuteSQL()
      IF THIS.CreateXML()
         *** all steps worked so we're good
         RETURN .T.
      ENDIF
   ENDIF
ENDIF      

*** one of the steps failed
RETURN .F.


************************************************************************
* wwHTTPSQLServer :: ParseXML
****************************************
***  Function: Parses the incoming XML into local properties of this
***            object. Also checks for allowed commands.
***      Pass: lcXML  -  XML string or XMLDOM object with client XML
***    Return: .t. or .f.
************************************************************************
FUNCTION ParseXML(lcXML)
local loXML, ;
   lcFullSQL, ;
   lcSQL, ;
   lcCursorName, ;
   lnAt, ;
   lcCommand

THIS.lError = .F.
THIS.cErrorMsg = ""

loXML = THIS.oXML

IF VARTYPE(lcXML) = "O"
   THIS.oDOM = lcXML
   THIS.oDOM.Async = .F. 
   this.cRequestXml =   this.oDom.Xml
ELSE
   IF EMPTY(lcXML)
     lcXML = REQUEST.FormXML()
   ENDIF
   THIS.cRequestXML = lcXML
   
   THIS.ODOM = loXML.LoadXML(lcXML)
   IF ISNULL(THIS.oDom)
      THIS.S_ReturnError("Invalid XML input provided.")
      RETURN .F.
   enDIF
ENDIF

lcFullSQL = THIS.GetXMLValue("sql")
lcFullSQL = STRTRAN(lcFullSQL,CHR(13)," ")
lcFullSQL = STRTRAN(lcFullSQL,CHR(10),"")

lcSQL = LOWER(LEFT(lcFullSQL,10))
this.nMaxBufferSize = VAL( THIS.GetXMLValue("maxbuffersize") )
IF this.nMaxBufferSize = 0
   this.nMaxBufferSize = 999999999
ENDIF

lcCursorName = THIS.GetXMLValue("sqlcursor")
IF EMPTY(lcCursorName)
   lcCursorName = "THTTPSQL"
ENDIF 

THIS.nTransportmode = VAL(THIS.GetXMLValue("transportmode"))
IF THIS.GetXMLValue("noschema") = "1"
   THIS.nSchema = 0
ENDIF
IF THIS.GetXMLValue("utf8") = "1"
   THIS.lUtf8 = .T.
ENDIF

THIS.cSkipFieldsForUpdates = THIS.GetXMLValue("skipfieldsforupdates")
 
IF EMPTY(lcSQL)
   THIS.S_ReturnError("No SQL statement to process.")
   RETURN .F.
ENDIF

*** Check for illegal commands
lnAt = AT(" ",lcSQL)
lcCommand = LOWER(LEFT(lcSQL,lnAt - 1))
IF ATC(","+lcCommand+",","," + THIS.cAllowedCommands+",") = 0
   THIS.S_ReturnError(lcCommand + " is not allowed or invalid.")
   RETURN .F.
ENDIF


IF lcSQL # "select" AND lcSQL # "insert" AND lcSQL # "update" AND ;
      lcSQL # "delete" AND lcSQL # "create" AND lcSQL # "execute" AND lcSQL # "method"
   THIS.S_ReturnError("Only SQL commands are allowed.")
   RETURN .F.
ENDIF

THIS.cCommand = lcCommand
THIS.cCursorName = lcCursorName
THIS.cFullSQL = lcFullSQL

IF THIS.cConnectString # "NOACCESS" 
   *** Only allow access if the connection string is not set in
   *** the server code already!
   IF EMPTY(THIS.cConnectString)
     THIS.cConnectString = THIS.GetXMLValue("connectstring")
   ENDIF
ENDIF  

RETURN .T.
ENDFUNC


************************************************************************
*  ParseJSON
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseJSON(lcJSON)



ENDFUNC
*   ParseJSON

************************************************************************
* wwHTTPSQLServer :: ExecuteSQL
****************************************
***  Function: Function that executes the actual SQL command
************************************************************************
FUNCTION ExecuteSQL()
LOCAL llError, ;
   lcReturnVar, ;
   loSqlParameters, ;
   loType, ;
   lcType, ;
   lvValue, ;
   lcMacro, ;
   lcCursorName, ;
   lcFullSQL, ;
   lcMethodCall, ;
   loEval, ;
   lcError, ;
   lnResultCursors, ;
   loSQL, ;
   lcCommand 
   
lcReturnVar = ""
loSQLParameters = THIS.GetXMLValue("sqlparameters",2)

*** Check for named parameters
IF !ISNULL(loSQLParameters)
   *** Create the variables and assign the value to it
   FOR EACH oParm IN loSQLParameters.ChildNodes
      loType = oParm.Attributes.GetNamedItem("type")
      IF !ISNULL(loType)
        lcType = loType.Text
      ELSE
        lcType = "C"
      ENDIF
      loReturn =oParm.Attributes.GetNamedItem("return")
      IF !ISNULL(loReturn)
         lcReturnVar = oParm.NodeName
      ENDIF
      
      DO CASE
         CASE lcType = "C"
            lvValue = oParm.text     &&REPLACE VALUE WITH oParm.TEXT
         CASE lcType = "N"
            lvValue = VAL(oParm.Text)
         CASE lcType = "D"
            lvValue = CTOD(oParm.Text)
         CASE lcType = "T"
            lvValue = CTOT(oParm.Text)
         CASE lcType = "L"
            lvValue = INLIST(LOWER(oParm.Text),"1","true","on")
     ENDCASE       

     lcMacro = oParm.NodeName + "= lvValue"
     &lcMacro   && Create the variable as a PRIVATE
   ENDFOR

   *** Once created they can be used as named parameter via ODBC ?Parm
   *** or as plain variables in straight Fox Queries
ENDIF

lcCommand = THIS.cCommand
lcCursorName = THIS.cCursorName
lcFullSQL = THIS.cFullSql

* SET STEP ON 

SYS(2335,0) && Disallow any UI access in COM

DO CASE
CASE lcCommand = "method"
  lcMethodCall = STRTRANC(THIS.cFullSql,"method ","")

   *** Select a new empty workarea
   SELECT 0

   llError = .F.   
   #if wwVFPVersion < 8
      poThis = THIS
      loEval = CREATEOBJECT("wwEval")
      MethodResult = loEval.Evaluate("poThis." + lcMethodCall)
      llError = loEval.lError
      lcError = loEval.cErrorMessage
   #else
      TRY 
         MethodResult = EVALUATE( "this." + lcMethodCall)
      CATCH
         llError = .t.
         lcError = MESSAGE()
      ENDTRY
   #endif

   lcReturnVar = "MethodResult"
      
   *** Check for an error
   IF llError
      SYS(2335,1) && Disallow any UI access in COM
      THIS.S_ReturnError(lcError)
      RETURN .F.
   ENDIF

   *** IF a cursor is now open here we need to return it
   lnResultCursors=0
   IF !EMPTY( ALIAS() )
      SELECT * FROM (ALIAS()) INTO CURSOR (lcCursorName)
      THIS.nResultCursors = 1
   ENDIF
   
*** Access ODBC connection   
CASE !ISNULL(THIS.oSQL) OR (THIS.cConnectString # "NOACCESS" AND ;
     !EMPTY(THIS.cConnectString) )
   *** If we don't have a connection object
   *** we have to create and tear down one
   IF ISNULL(THIS.oSQL)
      loSQL = CREATE("wwSQL")
      loSQL.cSQLCursor = THIS.cCursorName
      IF !loSQL.CONNECT(THIS.cConnectString)
         THIS.S_ReturnError(loSQL.cErrorMsg)
         SYS(2335,1) && Disallow any UI access in COM
         RETURN .F.
      ENDIF
   ELSE
      *** Otherwise use passed in connection
      *** which can be reused
      loSQL = THIS.oSQL
      loSQL.cSQLCursor = lcCursorName
   ENDIF

   loSQL.cSkipFieldsForUpdates = THIS.cSkipFieldsForUpdates
   
   THIS.nResultCursors = loSQL.Execute(lcFullSQL)

   loSQL.cSkipFieldsForUpdates = ""
      
   IF loSQL.lError
      THIS.S_ReturnError(loSQL.cErrorMsg)
      SYS(2335,1) && Disallow any UI access in COM
      RETURN .F.
   ENDIF
OTHERWISE  && Fox Data
   IF lcCommand = "select"
      lcFullSQL = lcFullSQL + " INTO CURSOR " + lcCursorName + " NOFILTER"
   ENDIF
   
   *** Try to map stored procedures to Fox methods of this
   *** class with the same name 
   IF lcCommand = "execute"
      poTHIS = THIS
      lcFullSQL =  "poTHIS." + ParseSQLSPToFoxFunction(lcFullSQL)  
   endif

   THIS.nResultCursors = 1


  TRY 
     &lcFullSql
  CATCH
     llError = .t.
  ENDTRY
   
   IF llError
      THIS.S_ReturnError("SQL statement caused an error." + CHR(13) + lcFullSQL)
      SYS(2335,1)
      RETURN .F.
   ENDIF
ENDCASE

SYS(2335,1)

*** Add the return value if used 
IF !EMPTY(lcReturnVar)
   THIS.cReturnValueXML = "<returnvalue>"  + CRLF + ;
           THIS.oXML.AddElement(lcReturnVar,&lcReturnVar,1) +;
           "</returnvalue>" +CRLF
ENDIF


RETURN .T.


************************************************************************
* wwHTTPSQLServer :: CreateXML
****************************************
***  Function: Creates the result XML from the currently active result
***            cursor or command. 
***    Assume: Works based on the command.
***      Pass:
***    Return: .t. or .f.
************************************************************************
FUNCTION CreateXML()
LOCAL lcFileText, lcFileName, loHTTP, lcDBF

IF !INLIST(THIS.cCommand,"select","create","execute","method")
   *** If no cursor is returned nothing needs to be returned
   THIS.S_ReturnOK()
   RETURN .t.
ENDIF

lcFileText = ""

IF USED(THIS.cCursorName)
   *** Now create the cursor etc.
   SELECT(THIS.cCursorName)

   DO CASE 
   CASE THIS.nTransportMode = 0
      THIS.oXML.cDocRootName = "wwhttpsql"
      THIS.oXML.nCreateDataStructure = THIS.nSchema  && Schema

      *** wwXML Result Cursor
      IF THIS.nResultCursors = 1
         lcFileText = THIS.oXML.CURSORTOXML(THIS.cCursorName)
      ELSE
         lcFileText = THIS.oXML.MultiCursorToXML(THIS.cCursorName,THIS.nResultCursors)
      ENDIF
      IF THIS.lUtf8
         lcFileText = THIS.oXML.EncodeXML(@lcFileText)
      ENDIF

   CASE THIS.nTransportMode = 1
      *** VFP CursorToXML
      lcFileText = ""
      CURSORTOXML(ALIAS(),"lcFileText",1,IIF(THIS.lUTF8,48,32),0,IIF(THIS.nSchema=1,"1","0"))

   CASE THIS.nTransportMode = 2
      *** EncodeDBF() cursor
      loHTTP = CREATEOBJECT("wwHTTP")
      
      lcFileName = SYS(2023)+"\wwd"+SYS(2015)+".dbf"

      SELECT * FROM (THIS.cCursorName) INTO DBF (lcFileName)
      USE

      lcFileText= EncodeDBF(lcFileName,.T.)

      THIS.cResponseXML = lcFileText

      *** Clean up
      ERASE (lcFileName)

      *** Close the cursor created in query
      IF USED(THIS.cCursorName)
        USE IN (THIS.cCursorName)
      ENDIF
      
      RETURN .T.
   CASE this.nTransportMode = 4
   	*** JSON
   	LOCAL loJson
    loJson = CREATEOBJECT("wwJsonSerializer")    
    this.cResponseXml = loJson.Serialize("cursor:" + this.cCursorName)
    lcFileText = this.cResponseXml  
   OTHERWISE
      THIS.S_RETURNError("Invalid Transportmode: " + TRANSFORM(THIS.nTransportmode))
      RETURN .F.   
   ENDCASE
ELSE
   *** Force an empty cursor
   lcFileText = THIS.oXML.cXMLHeader + ;
                     "<wwhttpsql>" + CRLF + ;
                     "</wwhttpsql>" + CRLF
ENDIF
 

IF !EMPTY(THIS.cReturnValueXML)
   lcFileText = STRTRAN(lcFileText,"</wwhttpsql>",THIS.cReturnValueXML + "</wwhttpsql>")
ENDIF

IF USED(THIS.cCursorName)
  USE IN (THIS.cCursorName)
ENDIF

THIS.cResponseXML = lcFileText

RETURN .T.
ENDFUNC
*  wwHTTPSQLServer :: ReturnXML


************************************************************************
* wwHTTPSQLServer :: GetXMLValue
****************************************
***  Function:
***    Assume:
***      Pass: lnMode -  0     Text
***                      1     XML String
***                      2     XML DOM node
***    Return:
************************************************************************
FUNCTION GetXMLValue(lcValue,lnMode)
local loNode

loNode = THIS.oDom.DocumentElement.SelectSingleNode(lcValue)
IF ISNULL(loNode)
   DO CASE
      CASE EMPTY(lnMode)
        RETURN ""   
      CASE lnMode = 2
         RETURN .NULL.
      OTHERWISE 
         RETURN ""   
   ENDCASE
ENDIF

DO CASE
  CASE EMPTY(lnMode)
     RETURN loNode.Text
  CASE lnMode = 1
     RETURN loNode.XML
  CASE lnMode = 2
     RETURN loNode
ENDCASE


ENDFUNC
*  wwHTTPSQLServer :: GetXMLValue


************************************************************************
* wwHTTPSQLServer :: S_ReturnError
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION S_ReturnError(lcError)
LOCAL loXML

THIS.lError = .T.
THIS.cErrorMsg = lcError

loXML = CREATE("wwXML")
THIS.cResponseXML = loXML.cXMLHeader + "<wwhttpsql>" + CRLF + ;
                          loXML.CreateErrorXML(lcERror) + CRLF +;
                          "</wwhttpsql>" + CRLF
ENDFUNC

************************************************************************
* wwHTTPSQLServer :: S_ReturnError
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION S_ReturnOk()
LOCAL loXML

loXML = CREATE("wwXML")
THIS.cResponseXML = loXML.cXMLHeader + ;
                          "<wwhttpdata>" + CRLF + ;
                          "<result>OK</result>" + CRLF +;
                          "</wwhttpdata>" + CRLF
ENDFUNC


*** wwBusiness Specific Methods
*** used on Fox code

************************************************************************
* wwHTTPSQLServer :: NewId
****************************************
***  Function: NewID routine so we can generate New Ids on the server
***            like a stored proc.
************************************************************************
FUNCTION sp_ww_NewId(lcTable,pnId)

oBus = CREATEOBJECT("wwBusiness")
oBus.cFileName = lcTable
oBus.cAlias = lcTable

*** Vars passed up from the client SQL Parameters
*** will exist as PRIVATE vars
oBus.cIDTable = pcIDTable
oBus.cPKField = pcPKField

pnId = oBus.CreateNewID()
ENDFUNC
*  wwHTTPSQLServer :: NewId


ENDDEFINE
*EOC wwHTTPSQLServer 


************************************************************************
* ParseSQLSPToFoxFunction
****************************************
***  Function: Translates a SQL SP call into a Fox Function
***            call so you can simulate an SP with Fox code.
***            Used in this class to call a method of the class
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseSQLSPToFoxFunction(lcFullSQL)
LOCAL lcMethod, lnAt, lcMethod, lcParms

lcFullSQL = STRTRANC(lcFullSQL,"execute ","")

lnAt = AT(" ",lcFullSQL)
IF lnAT = 0
   lcMethod = lcFullSQL
ELSE
   lcMethod = SUBSTR(lcFullSQL,1,lnAt-1)
ENDIF

lcParms = STRTRAN(ALLTRIM( SUBSTR(lcFullSQL,lnAt)),"?","")


RETURN lcMethod + "(" + lcParms + ")"
ENDFUNC
*  ParseSQLSPToFoxFunction

