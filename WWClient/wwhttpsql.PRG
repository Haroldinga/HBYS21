#INCLUDE WCONNECT.H

*** Load Libraries
SET PROCEDURE TO wwHTTPSQL ADDITIVE
SET PROCEDURE TO wwHTTP ADDITIVE
SET CLASSLIB TO wwXML ADDITIVE
SET PROCEDURE TO wwUtils ADDITIVE

#IF .F.
CLEAR
LOCAL o as wwHTTPSQLXML 

o = CREATEOBJECT("wwHTTPSQLXML")
o.cServerUrl = "http://localhost/wwdeveloper/"
? o.Execute()
BROWSE
RETURN


o.cServerUrl = "http://localhost/wconnect/wc.dll?http~HTTPSQL"
o.cSQLCursor = "TQuery"

o.nResultMode = 0   
o.cSQLConnectString = "driver={sql server};server=(local);database=wwDeveloper;uid=sa;pwd=;"

o.AddSQLParameter("pcompany","B%")

IF !o.Execute("select * from wwdevregistry where company like ?pcompany")
   ? o.cRequestXML
   ? o.cErrorMsg
   RETURN
ENDIF

? o.cRequestXML


BROWSE nowait

#ENDIF

RETURN

*************************************************************
DEFINE CLASS wwHTTPSQL AS wwHTTP
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 10/29/2001
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHTTPSQL

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
lError = .F.

*** The Url that will run the remote SQL request
cServerUrl = ""

*** The SQL command that is passed to the server
cSQL = ""

*** Name of the result cursor to return
cSQLCursor = "TSQLQuery"

*** ODBC connection string that is passed and executed on the server
cSQLConnectString = ""

*** 0 - VFP Cursor  2 - XML only
nResultMode = 0   

*** 0 - wwXML   1 - VFP's CURSORTOXML  2 -  EncodeDbf()
nTransportMode = 1

*** Determines whether a schema is to be returned - 0 no 1 - yes
nSchema = 1

*** Determines whether the result is UTF 8 encoded
*** not needed for VFP to VFP communication but required
*** for non VFP clients of the server data.
lUTF8 = .F.

*** Returns the size of the resulting XML string
nResultSize = 0

*** Determines the fields that should not be updated
*** for automatic Update generation
cSkipfieldsForUpdates = ""

*** The generated Request XML string
cRequestXML = ""

*** The server response XML
cResponseXML = ""

*** The return value from a function that returns a value or OUT parameter
*** Only 1 vaule can be returned and this value is only set if no
*** cursor data is returned from the server.
vReturnValue = .NULL.

*** Max size of the result set to accept
nMaxBufferSize = 0

*** Internal string of SQL parameters
PROTECTED cSQLParameters
cSQLParameters = ""

oXML = .NULL.
oDOM = .NULL.

************************************************************************
* wwHTTPSQL :: Init
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init(lcPath)

#IF .F.
WAIT WINDOW NOWAIT ;
  "Welcome to West Wind Client Tools..." + CHR(13) + ;
  "This is a shareware copy of wwHTTPSQL." + CHR(13)+ CHR(13) +;
  "Please register your copy."
#ENDIF

THIS.oXML = CREATEOBJECT("wwXML")

*** This code is copied from wwHTTP
lcPath=IIF(VARTYPE(lcPath)="C",lcPath,"")

THIS.cdllpath=lcPath+"wwIPStuff.dll"

DECLARE INTEGER GetLastError;
   IN WIN32API

DO PATH WITH lcPath
ENDFUNC
*  wwHTTPSQL :: Init



************************************************************************
* wwHTTPSQL :: CreateRequestXML
****************************************
***  Function: Creates the XML required to send to the server
***            from the local properties
***    Return: XML string
************************************************************************
FUNCTION CreateRequestXML()
LOCAL lcXML

loXML = THIS.oXML
lcXML = ;
"<wwhttpsql>" + CRLF + ;
loXML.AddElement("sql",THIS.cSQL,1) + ;
loXML.AddElement("sqlcursor",THIS.cSQLCursor,1) + ;
IIF(!EMPTY(THIS.cSQLConnectString),;
    loXML.AddElement("connectstring",THIS.cSQLConnectString,1),[])  +;
IIF(!EMPTY(THIS.cSkipFieldsForUpdates),loXML.AddElement("skipfieldsforupdates",THIS.cSkipFieldsForUpdates,1) +CRLF,[]) + ;    
IIF(THIS.nTransportMode # 0,loXML.AddElement("transportmode",THIS.nTransportMode,1),[]) +;
IIF(THIS.nSchema = 0,loXML.AddElement("noschema",1),[]) +;
IIF(!EMPTY(THIS.cSQLParameters),CHR(9) + "<sqlparameters>" + CRLF + ;
                                THIS.cSQLParameters + ;
                                CHR(9) + "</sqlparameters>" + CRLF,"") 

IF THIS.nMaxBufferSize > 0
  lcXML = lcXML + loXML.AddElement("maxbuffersize",THIS.nMaxBufferSize,1) 
ENDIF
IF THIS.lUTF8
   lcXML = lcXML + loXML.AddElement("utf8","1",1)
ENDIF
                                
lcXML = lcXML + ;                                
"</wwhttpsql>" 

THIS.cRequestXML = lcXML

RETURN lcXML

************************************************************************
* wwHTTPSQL :: Execute
****************************************
***  Function:
***    Assume:
***      Pass: record count or -1 on error
***    Return:
************************************************************************
FUNCTION Execute(lcSQL)
LOCAL lnSize, lnBuffer, lnResult, llNoResultSet, lcXML

lcSQL=IIF(VARTYPE(lcSQL)="C",lcSQL,THIS.cSQL)
THIS.cSQL = lcSQL

THIS.lError = .F.
THIS.cErrorMsg = ""

IF !INLIST(LOWER(lcSQL),"select","create","execute")
   llNoResultSet = .T.
ELSE
   llNoResultSet = .F.
ENDIF

*** Create the XML to send to the server
lcXML = THIS.CreateRequestXML()

THIS.nHTTPPostMode = 4 && Raw XML
THIS.AddPostKey("",lcXML)

THIS.cResponseXML = THIS.HTTPGet(THIS.cServerUrl,;
                                 THIS.cUserName,THIS.cPassword)

*** Clear the SQL Parameters (for next request)
THIS.AddSqlParameter()  

IF THIS.nError # 0
   THIS.lError = .T.
   RETURN -1
ENDIF

THIS.nResultSize = LEN(THIS.cResponseXML)

IF EMPTY(THIS.cResponseXML)
      THIS.cErrorMsg = "No data was returned from this request."
      THIS.nError = -1
      THIS.lError = .T.
      RETURN -1
ENDIF

RETURN this.ParseResponseXml()


************************************************************************
* wwHttpSql :: ParseResponseXml
****************************************
***  Function: Parses the content of cResponseXml into a cursor
***            or the various message and error properties.
************************************************************************
FUNCTION ParseResponseXml()
local lcFileName, loDOM, loRetVal, cResult, ;
      loError, loSchema, loXML

loXML = this.oXml

IF LEFT(THIS.cResponseXML,5) = "wwDBF"
   *** EncodeDbf() style return cursor
   *** Retrieve the file name from the buffer
   lcFileName = FORCEEXT(SYS(2023)+"\" + TRIM( SUBSTR(THIS.cResponseXML,6,40) ),"dbf")

   IF !DecodeDbf( THIS.cResponseXML,lcFileName )
      THIS.cErrorMsg = "Error Decoding the downloaded file"
      THIS.nError = -1
      THIS.lError = .T.
      RETURN - 1
   ENDIF

   USE (lcFileName) ALIAS THTTPImport IN 0

   #IF wwVFPVersion < 7 
      SELECT * FROM THTTPImport INTO CURSOR THTTPImport2
      WrCursor(THIS.cSQLCursor)  && Make ReadWrite
      USE IN THTTPImport2
      USE IN THTTPImport
   #ELSE
      SELECT * FROM THTTPImport INTO CURSOR ( THIS.cSQLCursor ) READWRITE
   #ENDIF
     
   USE IN THTTPImport

   ERASE (FORCEEXT(lcFileName,"*"))
ELSE
   loDOM = loXML.LoadXML(THIS.cResponseXML)
   THIS.oDOM = loDOM

   *** Check for valid XML
   IF ISNULL(loDom)
         THIS.cErrorMsg = "Invalid XML returned from server" +;
                          loXML.cErrorMsg
         THIS.nError = -1
         THIS.lError = .T.
         RETURN -1
   ENDIF

   *** Check for return value
   loRetVal = loDom.documentElement.selectSingleNode("returnvalue")
   IF !ISNULL(loRetval)
      THIS.vReturnValue = loRetVal.childnodes(0).Text
   ENDIF

   *** Check for results that don't return a cursor
   lcResult = Extract(THIS.cResponseXML,"<result>","</result>")
   IF lcResult = "OK"
      RETURN 0
   ENDIF

   *** Check for server errors returned to the client
   loError = loDom.documentElement.selectSingleNode("error")
   IF !ISNULL(loError)
      THIS.cErrorMsg = loError.selectSingleNode("errormessage").text
      THIS.nError = -1
      THIS.lError = .T.
      RETURN -1
   ENDIF

   *** OK we have an embedded cursor

   *** Force new table instead of appending
   IF USED(THIS.cSQLCursor)
      SELE (THIS.cSQLCursor)
      USE
   ENDIF

   IF "<VFPData>" $ LEFT(THIS.cResponseXML,100)
      *** Use VFP 7's XMLTOCURSOR natively (faster)
      XMLTOCURSOR(THIS.cResponseXML,THIS.cSQLCursor)
   ELSE
      *** Otherwise use wwXML
      loSchema = loDom.documentElement.selectSingleNode("Schema")
      IF !ISNULL(loSchema)
         IF THIS.nResultMode=0
            *** If the data mode is to return Fox Data do that!
            *** Otherwise no conversion is required
            *** and cResponseXML will contain the XML resultset
            loXML.XMLToCursor(loDOM,THIS.cSQLCursor)
            IF loXML.lError
               THIS.cErrorMsg = "XML conversion failed: " +loXML.cErrorMsg
               RETURN -1
            ENDIF
         ENDIF
      ELSE
         *** No cursor to return
         RETURN 0   
      ENDIF
   ENDIF
ENDIF

RETURN RECCOUNT()



************************************************************************
* wwHTTPSQL :: AddSQLParameter
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddSQLParameter
LPARAMETER lcName, lcValue, lcType, llReturnValue

*** If no parms are passed clear string
IF PCOUNT() = 0
   THIS.cSQLParameters = ""
   RETURN
ENDIF   

lcName=lower(lcName)

lcType = VARTYPE(lcValue)
   
THIS.cSQLParameters = THIS.cSQLParameters  + ;
                      THIS.oXML.AddElement(lcName,lcValue,2,[type="]+lcType +["]+IIF(llReturnValue,[ return="1"],[]))
ENDFUNC
*  wwHTTPSQL :: AddSQLParameter

************************************************************************
* wwHTTPSQL :: GetSQLReturnValue
****************************************
***  Function: Returns a return value from a store procedure
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetSQLReturnValue(lcVariable)
LOCAL loXML, loDom, loRetval, lcType

IF ISNULL(THIS.oDOM)
   loXML = THIS.oXML
   loDom = loXML.LoadXML(THIS.cResponseXML)
ELSE
   loDom = THIS.oDOM
ENDIF

loRetval = loDom.DocumentElement.SelectSingleNode("returnvalue/" + LOWER(lcVariable))
IF !ISNULL(loRetval)
   lcType = TYPE(lcVariable)
   lcValue = loRetval.Text
   DO CASE
      CASE lcType = "C"
         RETURN lcValue
      CASE lcType = "N"
         RETURN VAL(lcValue)
      CASE lcType = "D"
         RETURN loXML.XmlValueToFoxValue(lcValue,"date")
      CASE lcType = "T"
         RETURN loXML.XmlValueToFoxValue(lcValue,"dateTime")
   ENDCASE

   RETURN TRANSFORM(lcValue)
ENDIF

RETURN .F.   
*  wwHTTPSQL :: GetSQLReturnValue

ENDDEFINE
*EOC wwHTTPSQL 
