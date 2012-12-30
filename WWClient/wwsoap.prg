#INCLUDE WCONNECT.h

SET PROCEDURE TO wwSoap ADDITIVE

*** Dependencies
SET PROCEDURE TO wwUtils additive
SET PROCEDURE TO wwHTTP Additive
*SET PROCEDURE TO wwXML Additive
SET CLASSLIB TO wwXML Additive

*************************************************************
DEFINE CLASS wwSoap AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2000
*:Contact: http://www.west-wind.com
*:Created: 08/12/2000
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwSoap

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Class Definition Properties
cMethod = ""
vResult = ""
cResultName = "return"

*** Attributes that can be added to the envelope - use to add namespaces for example
cExtraEnvelopeAttributes = ""

*** Xml used for headers and other code
cExtraEnvelopeXML = ""

cServerUrl = ""
cUserName = ""
cPassword = ""

*** Input parameters Name, Value, Type
DIMENSION aParameters(1,3) 
nParameterCount = 0

*** Return value plus any In/Out parameters
DIMENSION aReturnValues(1,2)
nReturnValueCount = 0

DIMENSION aHeaders(1,2)
nHeaderCount = 0

*** Input SOAP Request
cRequestXML = ""

*** Output SOAP Response 
cResponseXML = ""

*** Operational Properties
lRecurseObjects = .F.

*** Determines whether wwSOAP tries to parse object return values
*** based on teh WSDL description
lParseReturnedObjects = .T.

*** Include data types for SOAP parameters and returns
lIncludeDataTypes = .F.

*** Determines how data is returned
*** 0 -  as string or type if available
*** 1 -  XML String    (return value node)
*** 2 -  XML DOM Node  (return value node)
nReturnMode = 0

*-- Allows to specify how the connection is opened: 1 - Direct*, 3 - Proxy (IE 4 and later) and 0 - PreConfig (using IE settings)
nHttpConnectType = 0

*** Connection timeout in seconds
nhttpConnectTimeout = 30

*** Name and port of the Proxy Server
cHttpProxy = ""

*** pre-configured wwHTTP or wwIPStuff object can be passed in
*** to allow fine tuning of all the connection properties.
oHTTP = .NULL.

*** Namespace for SOAP envelope. This can vary with SOAP implemenations (IBM: SOAP-ENV:)
cSOAPNameSpace = "soap"

cMethodNameSpace = ""
cMethodNameSpaceUri = ""
cMethodExtraTags = ""
lSkipMethodTag = .F.

*** Specific SOAPAction to generate
cSOAPAction=""

oXML = .NULL.
oDOM = .NULL.

cErrorMsg = ""
lError = .F.

*** Stored object reference of the last SDL file loaded
oSDL = .NULL.
cSDLUrl = ""

*** The currently active WSDL method per WSDL description
*PROTECTED oWSDLMethod
oWSDLMethod = null

PROTECTED cXMLTypes
cXMLTypes = ",string,char,uri,uuid,bin.hex,number,decimal,single,double,r4,r8,float,fixed.14.4,float.IEEE.754.32,float.IEEE.754.64,"+;
            "integer,int,i4,i1,i2,i8,ui2,ui4,ui8,boolean,datetime,datetime.tz,date,date.tz,object,record,base64Binary,"

*** Properties that get automatically renamed to avoid naming conflicts
#IF wwVFPVersion < 8
cRenameProperties = ",error,class,"
#ELSE
cRenameProperties = ","
#ENDIF

************************************************************************
* wwSOAP :: Init
****************************************
FUNCTION Init
THIS.oXML = CREATEOBJECT("wwXML")
ENDFUNC

************************************************************************
* wwSOAP :: AddParameter
****************************************
***  Function: Adds parameters to the method call.
***      Pass: lcName    -  Parameter Name
***                         RESET resets the array or you can
***                         set nParameterCount to 0
***            lvValue   -  Value of the parameter 
***            lcXMLType -  Optional - XML type of the value
***                         If not passed VFP type is converted to XML type
***    Return: Number of parameters in use
************************************************************************
FUNCTION AddParameter
LPARAMETERS lcName, lvValue,lcXMLType

IF UPPER(lcName) = "RESET" 
   THIS.nParameterCount = 0
   DIMENSION THIS.aParameters(1,2)
   RETURN 0
ENDIF

IF EMPTY(lcXMLType)
  lcXMLType = THIS.FoxTypeToXMLType(VARTYPE(lvValue))
ENDIF


THIS.nParameterCount = THIS.nParameterCount + 1
DIMENSION THIS.aParameters[THIS.nParameterCount,3]

THIS.aParameters[THIS.nParameterCount,1] = lcName
THIS.aParameters[THIS.nParameterCount,2] = lvValue
THIS.aParameters[THIS.nParameterCount,3] = lcXMLType

RETURN THIS.nParameterCount
ENDFUNC
*  wwSOAP :: AddParameter


************************************************************************
* wwSOAP :: CallWSDLMethod
****************************************
***  Function: Calls a method using a WSDL file for service information
***      Pass: lcMethod  -  The Method to call
***            lcWSDLUrl -  URL to WSDL document for this service
***                         Can also pass an loSDL object
***                         created with ParseServiceWSDL to cache
***                         the WSDL parsing
***            lvResult  -  A template object with the structure
***                         that is to be filled. Note Arrays must
***                         have their first item set.
***    Return: Method return value or .F. on failure (like VFP)
***            Check .lError and cErrorMsg for errors
************************************************************************
FUNCTION CallWSDLMethod
LPARAMETERS lcMethod,lcWSDLUrl, lvResult
LOCAL loSD
 
THIS.SetError()

IF ISNULL(this.oSDL)
	IF VARTYPE(lcWSDLUrl) # "O"
	   loSD = null
	   IF EMPTY(lcWSDLURL)
	      *** Nothing passed - does it exist already?
	      loSD = THIS.oSDL
	   ENDIF
	   IF ISNULL( loSD )
	      loSD = THIS.ParseServiceWSDL(lcWSDLUrl,.T.)
	      IF ISNULL(loSD)
	         RETURN .F.
	      ENDIF
	   ENDIF
	   THIS.oSDL = loSD
	ELSE
	   loSD = lcWSDLUrl
	   THIS.oSDL = loSD
	ENDIF
ELSE
	loSD = this.oSDL	
ENDIF

THIS.oWSDLMethod = loSD.GetMethod(lcMethod)
IF ISNULL(THIS.oWSDLMethod)
   THIS.SetError("Invalid Method")
   RETURN .F.
ENDIF

THIS.cSOAPAction = THIS.oWSDLMethod.cSoapAction
THIS.cMethodNameSpaceUri = THIS.oWSDLMethod.cMethodNameSpaceUri
*!*   IF !EMPTY(THIS.cMethodNameSpaceUri)
*!*      THIS.cMethodNameSpace = "m"
*!*   ENDIF
THIS.lIncludeDataTypes = .F.  && Getting it from WSDL
THIS.cServerUrl = loSD.cServerUrl

RETURN THIS.CallMethod(lcMethod,,@lvResult)
ENDFUNC
*  wwSOAP :: CallWSDLMethod


************************************************************************
* wwSoap :: CallMethod
****************************************
***  Function: High Level SOAP Method call.
***    Assume: Call AddParameter to add parameters to the call
***      Pass: lcMethod      -   Method name to call (.cMethod)
***            lcUrl         -   Server URL to call  (.cServerUrl)
***            lvResult      -   Value that is to be set with result
***                              (optional - use for objects)
***    Return: Variant - typed result or string if no type returned 
***                      by SOAP. Failure returns .F. 
************************************************************************
FUNCTION CallMethod
LPARAMETERS lcMethod, lcUrl, lvResult

IF EMPTY(lcMethod)
   lcMethod = THIS.cMethod
ENDIF
IF EMPTY(lcUrl)
   lcUrl = THIS.cServerUrl
ELSE
   THIS.cServerUrl = lcUrl
ENDIF

THIS.CreateSoapRequestXML(lcMethod)
IF THIS.lError
   THIS.AddParameter("RESET")
   RETURN .F.
ENDIF

THIS.CallSoapServer()
IF THIS.lError
    THIS.AddParameter("RESET")
   RETURN .F.
ENDIF   

lvResult = THIS.ParseSoapResponse(THIS.cResponseXML,lvResult)
IF THIS.lError
   RETURN .F.
ENDIF   

THIS.AddParameter("RESET")

RETURN lvResult
ENDFUNC
*  wwSoap :: CallMethod

************************************************************************
* wwSoap :: CreateSoapRequestXML
****************************************
***  Function: Creates a SOAP method request XML string
***      Pass: lcMethod    -   Method name to call
***    Return: XML string of the SOAP request
************************************************************************
FUNCTION CreateSoapRequestXML
LPARAMETERS lcMethod
LOCAL lcType, lcTypeInfo, lnX, lnParms


IF EMPTY(lcMethod)
  lcMethod = THIS.cMethod
ELSE
  THIS.cMethod = lcMethod  
ENDIF

lcText = ;
 [<?xml version="1.0"?>]  + CRLF +  ;
 [<] + THIS.cSOAPNameSpace + [:Envelope xmlns:] + THIS.cSOAPNameSpace + [="http://schemas.xmlsoap.org/soap/envelope/"] + CRLF +;
 [ ] +THIS.cSOAPNameSpace + [:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" ] + ;
 IIF(THIS.lIncludeDataTypes,CRLF + [ xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance" xmlns:xsd="http://www.w3.org/1999/XMLSchema"],[]) + ;
 [ ] + this.cExtraEnvelopeAttributes + ;
 [>]  + CRLF +  ;
 THIS.cExtraEnvelopeXML + ;
 [<] + THIS.cSOAPNameSpace + [:Body>]  + CRLF 

* IIF(THIS.lIncludeDataTypes,CRLF + [ xmlns:dt="urn:schemas-microsoft-com:datatypes"],[]) + ;

if !this.lSkipMethodTag
	IF !EMPTY(THIS.cMethodNameSpaceUri)
	  lcText = lcText + ;
	  [<] + IIF(!EMPTY(THIS.cMethodNameSpace),THIS.cMethodNameSpace + ":","") + lcMethod + ;
	  [ xmlns] + IIF(!EMPTY(THIS.cMethodNameSpace),":" + THIS.cMethodNameSpace,"") + [="]+ THIS.cMethodNameSpaceUri + [" ]   +;
	  THIS.cMethodExtraTags + [>] +CRLF 
	ELSE
	  lcText = lcText + ;
	  [<] + lcMethod + [>]  + CRLF 
	ENDIF
ENDIF

loXML = THIS.oXML
loXML.lRecurseObjects = THIS.lRecurseObjects

lcTypeInfo = ""    

*** Walk through each of the parameter pairs
FOR lnX = 1 to THIS.nParameterCount
    lcField =  THIS.aParameters[lnX,1]
    lvValue = THIS.aParameters[lnX,2]
    lcType = VARTYPE(lvValue)
    lcXMLType = This.aParameters[lnX,3]

	IF THIS.lIncludeDataTypes
	    IF lcType = "O"

          IF !EMPTY(lcXMLType)
	          lcText = lcText + ;
	               loXML.AddElement( lcField,lvValue,1,[xsi:type="] + lcXmlType + ["]) 
          ELSE
	          *** Special handling for objects
	          lcText = lcText + ;
	            	loXML.AddElement( lcField,lvValue,1,[xsi:type="object"]) 
          ENDIF
          LOOP 
	    ELSE 
        	lcTypeInfo = [xsi:type="xsd:] + lcXmlType + ["]
    	ENDIF
    ENDIF

   DO CASE
   
   *** Handle common types here so we can bypass more complex checks below
   CASE lcXmlType = "string" OR ;
        lcXMLType = "i4" OR lcXmlType = "number" OR ;
        lcXMLType = "dateTime" OR ;
        lcXmlType = "boolean" 
     lcText = lcText + ;
        loXML.AddElement( lcField,lvValue,1,lcTypeInfo)
   
   CASE lcXmlType = "base64Binary"
      lcText = lcText + loXML.AddElement(lcField,STRCONV(lvValue,13),1,lcTypeInfo)

   CASE LOWER(lcXMLType) = "xml"
   	  *** Embed wrapped in the field name
      lcText = lcText + "<"+lcField + ">" + lvValue + "</" + lcField + ">" 
      
   CASE LOWER(lcXmlType) = "rawxml"
      *** Embed Raw HTML without any fixup for field names
      *** this allows us to 
      lcText = lcText +  lvValue 
      
   CASE LOWER(lcXmlType) = "nodelist"
      *** XML NodeList embedded below the field name
      lcXML = "<" + lcField + ">" 
      FOR EACH loNode IN lvValue
         lcXML = lcXML + loNode.Xml
      ENDFOR
      lcText = lcText + lcXml + "</" + lcField +">"
      
   *** Object exists in WSDL description - attempt to parse it
   CASE this.IsWSDLObject( lcXmlType  )
      lcText = lcText + this.CreateObjectXmlFromSchema( lvValue, lcXmlType, lcField,1 )
      
   *** Everything else just gets directly converted      
	OTHERWISE
	  lcText = lcText + ;
        loXML.AddElement( lcField,lvValue,1,lcTypeInfo)
    ENDCASE
ENDFOR

IF !this.lSkipMethodTag
	lcText = lctext + ;
		[</] + IIF(!EMPTY(THIS.cMethodNameSpace),THIS.cMethodNameSpace + ":","") + lcMethod + [>]  
ENDIF

THIS.cRequestXML = lcText + ;
	[</] + THIS.cSOAPNameSpace + [:Body>]  + CRLF +  ;
	[</] + THIS.cSOAPNameSpace + [:Envelope>]  + CRLF 

RETURN THIS.cRequestXML
ENDFUNC
*  wwSoap :: CreateSoapRequestXML



************************************************************************
* wwSOAP :: CreateSoapResponseXML
****************************************
***  Function: Creates a SOAP XML response from an input value
***      Pass: lcMethod      -  The Method that was called
***            lvValue       -  The result value (native type)
***            lcResultName  -  Name of the result ("return")
***    Return: XML of the SOAP Response
************************************************************************
FUNCTION CreateSoapResponseXML
LPARAMETERS lcMethod, lvValue, lcResultName

IF EMPTY(lcResultName)
   lcResultName = THIS.cResultName
ELSE
   THIS.cResultName = lcResultName   
ENDIF   

llUseaReturnValues = .F.
IF PCOUNT() < 2
   *** Assume that you want to use aReturnValues
   llUseaReturnValues = .T.
ENDIF

lcText = ;
   [<?xml version="1.0"?>]  + CRLF +  ;
	[<] + THIS.cSOAPNameSpace + [:Envelope xmlns:] +  THIS.cSOAPNameSpace + [="http://schemas.xmlsoap.org/soap/envelope/" ] + CRLF +;
   [ ] + THIS.cSOAPNameSpace + [:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" ]  + ;
   IIF(THIS.lIncludeDataTypes,CRLF + [ xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance" xmlns:xsd="http://www.w3.org/1999/XMLSchema"],[]) + ;
	[>]  + CRLF +  ;
	[<] + THIS.cSOAPNameSpace + [:Body>]  + CRLF +  ;
	[<] + lcMethod +[Response>]  + CRLF

*	IIF(THIS.lIncludeDataTypes,CRLF + [ xmlns:dt="urn:schemas-microsoft-com:datatypes"],[]) +;

*** Now embed the value inside
loXML = THIS.oXML

IF !llUseaReturnValues
   *** Single result value returned - no by ref values
   lcType = VARTYPE(lvValue)
   
   IF THIS.lIncludeDataTypes
      IF lcType = "O"
          *** Special handling for objects
          *lcName = IIF(VARTYPE(lvValue.name)="C",lvValue.Name,"object")
          loXML.lRecurseObjects=.T.
             *** ??? Not SOAP SPEC COMPLIANT DUE TO LACK OF NAMESPACE TYPING
             *** Special handling for objects
             *** <return xsi:type="record">
             ***   <prop1>value</prop1>
             ***   <prop2>value</prop2>
             *** </return>
             *LOCAL lcName
             *lcName = IIF(VARTYPE(lvValue.class)="C",LOWER(lvValue.CLass),THIS.cResultName)
             RETURN  lcText  + ;
                     THIS.oXML.AddElement(THIS.cResultName,lvValue,1,[xsi:type="object"]) + ;
                  	[</]+ lcMethod  + [Response>] +CRLF +;
                  	[</] + THIS.cSOAPNameSpace + [:Body>] + CRLF + ;
                  	[</] + THIS.cSOAPNameSpace + [:Envelope>] + CRLF
                     
*!*             RETURN lcText + ;
*!*                  "<" + THIS.cResultName + [ xsi:type="record">] +CRLF +;
*!*               	loXML.AddElement( lcName,lvValue,1) + ;
*!*                  "</" + THIS.cResultName + ">" +CRLF +;
*!*                  	[</]+ lcMethod  + [Response>] +CRLF +;
*!*                  	[</] + THIS.cSOAPNameSpace + [:Body>] + CRLF + ;
*!*                  	[</] + THIS.cSOAPNameSpace + [:Envelope>] + CRLF
      ELSE
          lcTypeInfo = [xsi:type="xsd:] + loXML.FoxTypeToXMLType( lcType ) + ["]
      ENDIF
   ELSE
     lcTypeInfo = ""
   ENDIF

   RETURN lcText + ;
      	CHR(9) + loXML.AddElement( lcResultName,lvValue,0,lcTypeInfo) + ;
      	[</]+ lcMethod  + [Response>] +CRLF +;
      	[</] + THIS.cSOAPNameSpace + [:Body>] + CRLF + ;
      	[</] + THIS.cSOAPNameSpace + [:Envelope>] + CRLF
ELSE
   THIS.SetError("Multiple return values are currently not supported")
   RETURN ""
 
   *** Multiple rreturn values - 
   *** return value and byref parrameters from aReturnValues
   FOR lnX=1 to THIS.nReturnValueCount
      lvValue = THIS.aReturnValues[lnX,2]
      lcType = VARTYPE(lvValue)

  
      IF THIS.lIncludeDataTypes
         IF lcType = "O"
             *** ??? Not SOAP SPEC COMPLIANT DUE TO LACK OF NAMESPACE TYPING
             *** Special handling for objects
             *** <return xsi:type="record">
             ***   <prop1>value</prop1>
             ***   <prop2>value</prop2>
             *** </return>
             RETURN  lcText  + ;
                     THIS.oXML.AddElement(THIS.cResultName,lvValue,1,[xsi:type="record"]) + ;
                  	[</]+ lcMethod  + [Response>] +CRLF +;
                  	[</] + THIS.cSOAPNameSpace + [:Body>] + CRLF + ;
                  	[</] + THIS.cSOAPNameSpace + [:Envelope>] + CRLF
*!*                lcText + ;
*!*                     "<" + THIS.cResultName + [ xsi:type="record">] +CRLF +;
*!*                  	loXML.AddElement( lvValue.name,lvValue,1) + ;
*!*                     "</" + THIS.aReturnValues[lnX,1] + ">" +CRLF 

         ELSE
             lcTypeInfo = [xsi:type="] + loXML.FoxTypeToXMLType( lcType ) + ["]
         ENDIF
      ELSE
        lcTypeInfo = ""
      ENDIF

      RETURN lcText + ;
         	CHR(9) + loXML.AddElement( lcResultName,lvValue,0,lcTypeInfo) + ;
         	[</]+ lcMethod  + [Response>] +CRLF +;
         	[</] + THIS.cSOAPNameSpace + [:Body>] + CRLF + ;
         	[</] + THIS.cSOAPNameSpace + [:Envelope>] + CRLF
   ENDFOR
ENDIF

ENDFUNC
*  wwSOAP :: CreateSoapResponseXML 


************************************************************************
* wwSOAP :: AddReturnValue
****************************************
***  Function: Adds return value to a SOAP response
***            Call before CreateSoapResponseXML. Note
***            you don't need to call this method if you
***            return a single value. Only call it when 
***            returning multiple (By Ref) returns.
***      Pass: lcName    -  Parameter Name
***                         RESET resets the array or you can
***                         set nParameterCount to 0
***            lvValue   -  Value of the parameter 
***            lcXMLType -  Optional - XML type of the value
***                         If not passed VFP type is converted to XML type
***    Return: Number of parameters in use
************************************************************************
FUNCTION AddReturnValue
LPARAMETERS lcName, lvValue,lcXMLType

IF UPPER(lcName) = "RESET" 
   THIS.nReturnValueCount = 0
   DIMENSION THIS.aReturnValues(1,2)
   RETURN 0
ENDIF
IF EMPTY(lcXMLType)
  lcXMLType = THIS.FoxTypeToXMLType(VARTYPE(lvValue))
ENDIF

THIS.nReturnValueCount = THIS.nReturnValueCount + 1
DIMENSION THIS.aReturnValues[THIS.nReturnValueCount,3]

THIS.aReturnValues[THIS.nReturnValueCount,1] = lcName
THIS.aReturnValues[THIS.nReturnValueCount,2] = lvValue
THIS.aReturnValues[THIS.nReturnValueCount,3] = lcXMLType

RETURN THIS.nReturnValueCount
ENDFUNC
*  wwSOAP :: AddReturnValue


************************************************************************
* wwSOAP :: CallSoapServer
****************************************
***  Function: Calls the remote server sends request and retrieves
***            result.
***      Pass: lcSoapRequestXML   -  SOAP XML for request (optional)
***    Return: XML Soap Response
************************************************************************
FUNCTION CallSoapServer
LPARAMETERS lcSOAPRequestXML
LOCAL lnSize, lcData, lnResult, llHTTP, loURl, loHTTP

IF EMPTY(lcSoapRequestXML)
  lcSOAPRequestXML = THIS.cRequestXML
ELSE
  THIS.cRequestXML = lcSOAPRequestXML  
ENDIF

IF EMPTY( THIS.cSoapAction )
   THIS.cSoapAction = "SOAPAction: " + THIS.cServerUrl + "." + THIS.cMethod
ELSE
   THIS.cSoapAction = "SOAPAction: " + THIS.cSoapAction
ENDIF

IF ISNULL(THIS.oHTTP)
   this.CreateHttpObject()
   loHTTP = THIS.oHTTP
ELSE
   loHTTP = THIS.oHTTP
ENDIF

loHTTP.nHTTPPostMode = 4   && XML

*** POST data is the SOAP request XML
loHTTP.AddPostKey("",lcSOAPRequestXML)

loHTTP.cEXTRAHEADERS = THIS.cSoapAction + CRLF

lcData = loHTTP.HttpGet(this.cServerUrl)
IF loHTTP.nError # 0
   THIS.lError = .T.
   THIS.cerrormsg = loHTTP.cerrormsg
   RETURN ""
ENDIF

*** Break the URL into components
*!* loURl = loHTTP.InternetCrackUrl(THIS.cServerUrl)
*!*   IF ISNULL(loURl)
*!*      THIS.lError =  .T.
*!*      THIS.cerrormsg = "Invalid URL passed."
*!*      RETURN ""
*!*   ENDIF


*!*   loHTTP.nHTTPPort = VAL(loUrl.cPort)

*!*   lnResult = loHTTP.HTTPConnect(loURl.cserver)
*!*   IF lnResult # 0
*!*      THIS.lError = .T.
*!*      THIS.cerrormsg = loHTTP.cerrormsg
*!*      RETURN ""
*!*   ENDIF

*!*   lnSize=0
*!*   lcData=""

*!*   lnResult = loHTTP.HTTPGetEx(loURl.cPath + loURl.cQueryString,@lcData,@lnSize,;
*!*                               THIS.cSoapAction)

*!*   IF lnResult # 0
*!*      THIS.lError = .T.
*!*      THIS.cerrormsg = loHTTP.cerrormsg
*!*      loHTTP.HTTPClose()   && Force the connection to close *always*
*!*      RETURN ""
*!*   ENDIF

*!*   loHTTP.HTTPClose()   && Force the connection to close *always*

*** For now strip off the UTF 8 byte encoding marks
#DEFINE UTF8_FILE_SIGNATURE CHR(239) + CHR(187) + CHR(191)
IF lcData =   UTF8_FILE_SIGNATURE   && "﻿"   && 
   lcData = SUBSTR(lcData,4)
ENDIF

THIS.cResponseXML = lcData

*!*	IF THIS.cResponseXML != "<?xml"
*!*	   THIS.lError = .T.
*!*	   THIS.cerrormsg = "Non XML result returned"
*!*	   RETURN ""
*!*	ENDIF

RETURN lcData
ENDFUNC
*  wwSOAP :: CallSoapServer


************************************************************************
* wwSOAP :: SoapErrorResponse
****************************************
***  Function: Creates a SOAP XML error response 
***    Assume:
***      Pass: lcError  -   Error Message
***            lnError  -   Error number
***    Return:
************************************************************************
FUNCTION SoapErrorResponse
LPARAMETERS lcError, lnErrorCode

IF EMPTY(lnErrorCode)
   lnErrorCode = 1098
ENDIF
IF EMPTY(lcError)
  lcError = "Unknown Error"
ENDIF

THIS.cResponseXML = ;
[<?xml version="1.0"?>]  + CRLF +  ;
[<] + THIS.cSOAPNameSpace + [:Envelope xmlns:] + THIS.cSOAPNameSpace +[="http://schemas.xmlsoap.org/soap/envelope/"]  + CRLF +  ;
[ ] + THIS.cSOAPNameSpace + [:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">]  + CRLF +  ;
[<] + THIS.cSOAPNameSpace + [:Body>]  + CRLF +  ;
[<] + THIS.cSOAPNameSpace + [:Fault>]  + CRLF +  ;
this.oXML.AddElement("faultcode",lnErrorCode,1) +;
this.oXML.AddElement("faultstring",lcError,1) + ;
this.oXML.AddElement("faultfactor",lnErrorCode,1) +;
this.oXML.AddElement("detail",lcError,1) + ;
[</] + THIS.cSOAPNameSpace + [:Fault>]  + CRLF +  ;
[</] + THIS.cSOAPNameSpace + [:Body>]  + CRLF +  ;
[</] + THIS.cSOAPNameSpace + [:Envelope>] 

RETURN THIS.cResponseXML
ENDFUNC
*  wwSOAP :: SoapErrorResponse




************************************************************************
* wwSOAP :: ParseSOAPParameters
****************************************
***  Function: Retrieves parameters from the SOAP XML
***      Pass: lcRequestXML 
***            @aParameters    1 - name 2 - value 3 - type
***            lvStore         Object reference for objects to be filled
***    Return: count of parameters  (aParameters is set)
************************************************************************
FUNCTION ParseSOAPParameters
LPARAMETERS lcRequestXML, aParameters
LOCAL lnParmCount, loT, loMethod, lcXMLType, loAttributes, loType, lcMethod, oDOM

lnParmCount = 0

IF ISNULL(THIS.oDOM)
   oDOM = CREATEOBJECT(XML_XMLDOM_PROGID)
   oDOM.async = .F.
   THIS.oDOM = oDOM
ELSE
   oDOM = THIS.oDOM
ENDIF

oDOM.LoadXML(lcRequestXML)
IF !EMPTY(oDom.parseError.reason)
   THIS.lError = .T.
   THIS.cErrorMsg = oDOM.parseError.Reason
   RETURN 0
ENDIF

*** Grab the namespace prefix (SOAP, SOAP-ENV, S)
THIS.cSoapNameSpace = oDOM.documentElement.prefix 

loT = oDOM.SelectSingleNode([/] + THIS.cSOAPNameSpace + [:Envelope/] + THIS.cSOAPNameSpace + ":Body")
IF ISNULL(loT)
   THIS.SetError("Invalid Soap Request for parsing parameters")  
   RETURN 0
ENDIF 

*** Find the method name dynamically  
loMethod = loT.Childnodes.item(0)
IF ISNULL(loMethod)
   THIS.SetError("Invalid Soap Request for parsing parameters")  
   RETURN 0
ENDIF   

lcMethod = loMethod.baseName
THIS.cMethod = lcMethod

loSDL = .NULL.

*** Now get each of the parameters 
FOR EACH oParm in loMethod.ChildNodes
   lnParmCount = lnParmCount + 1
   DIMENSION aParameters[lnParmCount,3]

   lcXMLType = "string" && default the type to string if it can't be retrieved

   aParameters[lnParmCount,1] =  oParm.NodeName
 
   loAttributes = oParm.ATTRIBUTES
   IF !ISNULL(loAttributes)
      loType = loAttributes.GetNamedItem("xsi:type")
      IF !ISNULL(loType)
         *** Use the embedded type
         lcXMLType = loType.Text
      ELSE
         *** Read the type from the WSDL 
         IF !EMPTY(THIS.cSDLURL)
            IF ISNULL(THIS.oSDL)
               THIS.oSDL = THIS.ParseServiceWSDL(THIS.cSDLUrl)
            ENDIF
            IF !ISNULL(THIS.oSDL)
               loSDLMethod = THIS.oSDL.GetMethod(lcMethod)
               IF !ISNULL(loSDLMethod)
                  lcXMLType = loSDLMethod.aParameters[lnParmCount,2]
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF

   *** Store the type
   aparameters[lnParmCount,3] =  THIS.oXML.XMLTypeToFoxType(lcXMLType)
   
   IF aparameters[lnParmCount,3] = "O"    &&"record" OR lcXType = "object"
      aParameters[lnParmCount,2] = oParm.XML
   ELSE
      aParameters[lnParmCount,2] =  THIS.oXML.XMLValueToFoxValue(oParm.Text,lcXMLType)
   ENDIF
ENDFOR            

IF lnParmCount > 0
   DIMENSION THIS.aParameters[lnParmCount,3]
   ACOPY(aParameters,THIS.aParameters)                         
ENDIF

RETURN lnParmCount
ENDFUNC
*  wwSOAP :: ParseSOAPParameters

************************************************************************
* wwSOAP :: ParseSoapResponse
*************************************
***  Function: Parses SOAP response into vResult property. If an error
***            occurs lError is set to .t.
***    Assume: Typically used by the client
***      Pass: lcSoapResponse
***    Return: Variant - result value
************************************************************************
FUNCTION ParseSoapResponse
LPARAMETERS lcSoapResponse, lvStore
LOCAL loResult, lvResult, lcOldDate,lnOldHours, lnOldCentury, lnOldMark, ;
      loType, loBody, loReturn, lcXMLType, lcValue, lnX

IF EMPTY(lcSOAPResponse)
   lcSoapResponse = THIS.cResponseXML
ENDIF   

IF ISNULL(THIS.oDOM)
   loDOM = CREATEOBJECT(XML_XMLDOM_PROGID)
   loDOM.async = .F.
   THIS.oDOM = loDOM
ELSE
   loDOM = THIS.oDOM
ENDIF

loDom.LoadXML(lcSoapResponse)
IF !EMPTY(loDom.parseError.Reason)
   THIS.SetError(loDOM.parseError.Reason)
   RETURN .F.
ENDIF

*** Grab the namespace prefix (SOAP, SOAP-ENV, S)
THIS.cSOAPNameSpace = loDOM.DocumentElement.Prefix 
IF !EMPTY(THIS.cSoapNameSpace)
   lcSoapNameSpace = THIS.cSoapNameSpace + ":"
ELSE
   lcSoapNameSpace = ""   
ENDIF   

loBody = loDOM.SelectSingleNode([/] + lcSOAPNameSpace + [Envelope/] + ;
         lcSOAPNameSpace + "Body")
         
IF ISNULL(loBody)
      THIS.SetError("Error: Error in XML result. SOAP envelope doesn't include SOAP response.")
      RETURN .f.
ENDIF      

loReturn = loBody.ChildNodes(0)

IF ISNULL(loReturn)
   THIS.SetError("Error: Error in XML result. SOAP envelope doesn't include SOAP response.")
   RETURN .f.
ENDIF   


*** Check for errors in body
loError = loDOM.SelectSingleNode([/] + lcSOAPNameSpace + [Envelope/] + lcSOAPNameSpace + "Body/" + ;
                     lcSOAPNameSpace + "Fault")
IF !ISNULL(loError)
   *THIS.SetError(loError.SelectSingleNode(lcSOAPNameSpace + "faultstring").text)
   THIS.SetError(loError.SelectSingleNode( "faultstring").text)
   RETURN .f.   
ENDIF

*** If the node is empty the return value is null
IF loReturn.ChildNodes.Length = 0
   *** No return value
   RETURN .Null.
ENDIF

FOR lnX=0 to loReturn.ChildNodes.length-1
   *** Grab each Return Value Node
   loResult = loReturn.ChildNodes.item(lnX)

   *** Try to get the type 
   IF !ISNULL(THIS.oWSDLMethod)
      lcType = THIS.oWSDLMethod.cResultType
      lnAt = AT(":",lcType)
      lcType = SUBSTR(lcType,lnAt+1)
   ELSE
      loType = loResult.Attributes.GetNamedItem("xsi:type")
      IF ISNULL(loType)
         lcType = ""
      ELSE
         lcType = loType.Text
         lnAt = AT(":",lcType)
         lcType = SUBSTR(lcType,lnAt+1)

      ENDIF
   ENDIF

   *** Do type conversion  
   lcXMLType = lcType

   DO CASE 
   **** Return XML String result
   CASE THIS.nReturnMode = 1
      lvResult = loResult.XML
   
   *** Return DOM node of the Method Return 
   CASE THIS.nReturnMode = 2
      lvResult = loResult

   CASE EMPTY(lcType) OR lcType = "string"
      lvResult = loResult.Text
      
   *** Object was passed in - parse the XML to it
   *** NOTE: this will only work if all properties are lower case in the XML!!!!
   CASE VARTYPE(lvStore) = "O"
      this.oXML.lRecurseObjects = .t.
      lvResult = THIS.oXML.ParseXmlToObject(loResult,@lvStore,.T.)

   *** Generic object - no type info
   *** can't do anything with this except return the XML
   CASE lcXMLType = "record" or lcXMLType="object" 
       lvResult = loResult.XML
   
   *** If it's a 'custom' type use the WSDL type definition 
   *** to create an object on the fly
   CASE ATC("," + lcXMLType + ",",this.cXMLTypes) < 1 
     *** Parse the XML node into a generic object 
     IF THIS.lParseReturnedObjects 
         IF (lcXmlType = "Unknown")
            lvResult = loResult
         ELSE
	           lvResult = this.ParseObject(loResult,lcXMLType)
	           IF ISNULL(lvResult)
	              lvResult = loResult
	           ENDIF
         ENDIF
     ELSE
        *** Otherwise just return the DOM node to the result
        lvResult = loResult
     ENDIF
     
   *** Just a straight type - convert it
   OTHERWISE
      lvResult = THIS.oXML.XMLValueToFoxValue(loResult.Text,lcXMLType,@lvStore)
   ENDCASE

   DIMENSION THIS.aReturnValues[lnX+1,2]
   THIS.aReturnValues[lnX+1,1] = loResult.nodeName
   THIS.aReturnValues[lnX+1,2] = lvResult
ENDFOR

THIS.nReturnValueCount = lnX

IF lnX = 0
   RETURN .F.
ENDIF

RETURN THIS.aReturnValues[1,2]
ENDFUNC
*  wwSOAP :: ParseSoapResponse


************************************************************************
* wwSOAP :: GetNamedParameter
****************************************
***  Function:
***    Assume: ParseSOAPParameters has been called
***            ParseSOAPResponse has been called (llReturn)
***      Pass: lcParm         - Parameter to retrieve
***            llReturnValues - Retrieve return value 
***    Return: value or .NULL.  Check lError and cErrorMsg
************************************************************************
FUNCTION GetNamedParameter
LPARAMETERS lcParm, llReturnValues
LOCAL lnX, lnCount

DIMENSION laParms[1]

lcParm = LOWER(lcParm)

IF !llReturnValues
  lnCount = THIS.nParameterCount
	FOR lnX=1 TO lnCount
	  IF LOWER(THIS.aParameters[lnX,1]) == lcParm
	     RETURN THIS.aParameters[lnX,2]
	  ENDIF
	ENDFOR
ELSE
  laParms = THIS.nReturnValueCount
	FOR lnX=1 TO lnCount
	  IF LOWER(THIS.aReturnValues[lnX,1]) == lcParm
	     RETURN THIS.aReturnValues[lnX,2]
	  ENDIF
	ENDFOR
ENDIF  

THIS.SetError("Parameter not found.")

RETURN .NULL.
ENDFUNC
*  wwSOAP :: GetNamedParameter



************************************************************************
* wwSOAP :: ParseServiceWSDL
****************************************
***  Function: Parses an MS SOAP SDL file into an easily accessed object
***    Assume: 
***      Pass:lcSDLUrl or an XMLDOM object loaded with the doc
***    Return: object
************************************************************************
FUNCTION ParseServiceWSDL
LPARAMETERS lcSDLUrl, llParseTypes
LOCAL lnX, lnY, lnAt, loSD, loDOM, lcCLass, loAddress, lcCall, lcResponse, loWSDLMethods
LOCAL loMethods, loClass, loSD, loResponse, loParms, lnWSDLMethodsCount, loMethod
LOCAL loDocRoot, loType,	lcPrefix, loRoot

THIS.SetError()
THIS.oSDL = .F.

IF ISNULL(THIS.oDOM)
   loDOM = CREATEOBJECT(XML_XMLDOM_PROGID)
   loDOM.async = .F.
   THIS.oDOM = loDOM
ELSE
   loDOM = THIS.oDOM
ENDIF

*** Load either from URL or XML string
IF lcSDLUrl = "<?xml"
   loDOM.LoadXML(lcSDLUrl)  
ELSE
   IF ISNULL(lcSDLUrl)
      RETURN .NULL.
   ENDIF

   THIS.cSdlUrl = lcSDLUrl
   
   IF LOWER(lcSdlUrl) = "http"
      
      LOCAL  lcXML, llOldCacheRequet
      IF ISNULL(this.oHttp)
         this.CreateHttpObject()
      ENDIF

      llOldCacheRequest = THIS.oHTTP.lCacheRequest
      THIS.oHTTP.lCacheRequest = .T. && Allow caching on WSDL

      lcXML = this.oHttp.HttpGet(lcSDLUrl) 
      
      this.oHttp.lCacheRequest = llOldCacheRequest

      IF THIS.oHttp.nError > 0
         this.SetError(this.oHttp.cErrorMsg)
         RETURN .null.
      ENDIF
      IF EMPTY(lcXML )
         THIS.SetError("Unable to retrieve WSDL Document")
         RETURN .NULL.
      ENDIF
    ELSE 
       *** Assume it's a file or some other protocol
       lcXML = FILETOSTR(lcSdlUrl)
    ENDIF
   
   loDOM.LoadXML(lcXML)
ENDIF   

IF !EMPTY(loDom.ParseError.Reason)
   THIS.SetError(loDom.ParseError.Reason)
   RETURN .NULL.
ENDIF

loRoot = loDom.DocumentElement
lcPrefix = loRoot.Prefix
IF !EMPTY(lcPrefix)
  lcPrefix = lcPrefix + ":"
ENDIF


*** Load the class level properties
loClass = loRoot.SelectSingleNode(lcPrefix + "service")
IF ISNULL(loClass)
   THIS.SetError("Can't find service definition in WSDL")
   RETURN .f.
ENDIF 

lcClass = loClass.Attributes.GetNamedItem("name").text

*** Load the method nodes to parse
loWSDLMethods = loRoot.selectNodes(lcPrefix + "portType[@name='" + lcClass + "Soap']/" + lcPrefix + "operation")
IF ISNULL(loWSDLMethods) OR loWSDLMethods.Length = 0
   loWSDLMethods = loRoot.SelectNodes(lcPrefix + "portType/" + lcPrefix + "operation")
   IF ISNULL(loWSDLMethods)
      THIS.SetError("No Method list found in Service Description")    
      RETURN .NULL.
   ENDIF
ENDI
lnWSDLMethodsCount = loWSDLMethods.Length

IF lnWSDLMethodsCount = 0
   this.SetError("Couldn't find any methods in Service Description")
   RETURN .NULL.
ENDIF

DIMENSION laWSDLMethods[lnWSDLMethodsCount,3]
FOR lnX=1 to lnWSDLMethodsCount
    loMethod = loWSDLMethods.item(lnX-1)
    laWSDLMethods[lnX,1]  = loMethod.Attributes.GetNamedItem("name").Text    
    
    *** Input messages
    laWSDLMethods[lnX,2]  = loMethod.selectSingleNode(lcPrefix + "input").Attributes.GetNamedItem("message").Text
    
    *** Output messages = can be null meaning no output (void)
    TRY 
	    laWSDLMethods[lnX,3]  = loMethod.SelectSingleNode(lcPrefix + "output").Attributes.GetNamedItem("message").Text
    CATCH
	    laWSDLMethods[lnX,3] = null
    ENDTRY
ENDFOR


*** Load the method nodes to parse
loMethods = loRoot.selectNodes(lcPrefix + "binding[@name='" + lcClass + "Soap']/" + lcPrefix + "operation")
IF ISNULL(loMethods) OR loMethods.Length = 0
   loMethods = loRoot.SelectNodes(lcPrefix + "binding/" + lcPrefix + "operation")
   IF ISNULL(loMethods)
      THIS.SetError("No Method list found in Service Description")    
      RETURN .NULL.
   ENDIF
ENDIF

loSD = CREATEOBJECT("cSDLInterface")
loSD.cInterface=lcClass

*** Get the description if there
loWork = loClass.selectSingleNode(lcPrefix + "documentation")
IF !ISNULL(loWork)
  loSD.cDescription = loWork.text
ENDIF  

*** Get the URL location of the Web Service 
loPort = loClass.SelectSingleNode(lcPrefix+"port")
IF ISNULL(loPort)
   this.SetError("Unable to parse server Url")
   RETURN .NULL.
ENDIF
 
loSD.cServerUrl=loPort.ChildNodes(0).Attributes.GetNamedItem("location").text

lcTargetNameSpace = ""
loWork = loDOM.DocumentElement.Attributes.GetNamedItem("targetNamespace")
IF !ISNULL(loWork)
   lcTargetNameSpace = loWork.Text
ENDIF

DIMENSION loSD.aMethods[loMethods.Length]

*** Now parse through each of the methods
FOR lnX=0 to loMethods.length-1
   loSMethod = loMethods.item(lnX)
   lcMethod = loSMethod.Attributes.GetNamedItem("name").text
   
   loRequest = loRoot.selectSingleNode(lcPrefix + "message[@name='" + ;
                SUBSTR(laWSDLMethods[lnX+1,2], AT(":",laWSDLMethods[lnX+1,2])+1) + "']")
   IF ISNULL(loRequest)
      LOOP
   ENDIF
   IF ISNULL(laWSDLMethods[lnX+1,3] )
   	   loResponse = NULL
   ELSE
	   loResponse = loRoot.selectSingleNode(lcPrefix + "message[@name='" + ;
	                SUBSTR(laWSDLMethods[lnX+1,3], AT(":",laWSDLMethods[lnX+1,3])+1) + "']")
	   IF ISNULL(loResponse)
	      LOOP
	   ENDIF
   ENDIF
      
   lcDescription = ""
   loMethodOperation = loRoot.SelectSingleNode(lcPrefix + "portType/" + lcPrefix + "operation[@name='" + lcMethod + "']")
   IF !ISNULL(loMethodOperation)
      loDescription = loMethodOperation.selectSingleNode(lcPrefix + "documentation")
      IF !ISNULL(loDescription)
         lcDescription = loDescription.Text
      ENDIF
      loDescription = .f.
   ENDIF

   *** Now loop through the parameters
   loParms = loRequest.selectNodes(lcPrefix + "part")

   llDotNet = .F.
   IF loParms.Length > 0
      *** Dot Net requires parsing the data type structures separately
      loElement = loParms.item(0).Attributes.GetNamedItem("element")
      IF !ISNULL(loElement)
         llDotNet = .T.
         lcElement = loElement.text 
         lcElement = SUBSTR(lcElement,AT(":",lcElement) + 1)
         loParms = loRoot.SelectNodes( lcPrefix+;
                   "types/s:schema/s:element[@name='" + lcElement + "']" + ;
                   "/s:complexType/s:sequence/s:element")
         IF ISNULL(loParms)
            LOOP  && Invalid WSDL
         ENDIF
      ENDIF
   ENDIF

   *** Create new method object for each method
   loMethod = CREATEOBJECT("Relation")
   loMethod.AddProperty("cName",lcMethod)
   loMethod.AddProperty("cDescription",lcDescription)
   loMethod.AddProperty("aParameters(1)")
   loMethod.AddProperty("nCount",loParms.Length)
   loMethod.AddProperty("cResultName","")
   loMethod.AddProperty("cResultType","")
   loMethod.AddProperty("cSoapAction","")
   loMethod.AddProperty("cMethodNameSpaceUri","")
   loMethod.AddProperty("cMethodNameSpace","")
  
   IF loParms.Length > 0      
      DIMENSION loMethod.aParameters[loParms.Length,2]
      FOR lnY=0 to loParms.Length-1
      
      	    loWork = loParms.item(lnY).Attributes.GetNamedItem("name")
      	    IF ISNULL(loWork)
      	       *** Check for Reference Parameters
    	       loWork = loParms.item(lnY).Attributes.GetNamedItem("ref")
			   IF ISNULL(loWork)
    	    	  loMethod.aParameters[lnY+1,1] = "unknown"
				  loMethod.aParameters[lnY+1,2] = "unknown"
               ELSE
    	    	  loMethod.aParameters[lnY+1,1] = SUBSTR(loWork.Text,AT(":",loWork.Text) + 1)
				  loMethod.aParameters[lnY+1,2] = "unknown"
               ENDIF
               LOOP
    	    ENDIF

           loMethod.aParameters[lnY+1,1] = loWork.text

           loType = loParms.item(lnY).Attributes.GetNamedItem("type")
           IF VARTYPE(loType) = "O"
              loMethod.aParameters[lnY+1,2] = loParms.item(lnY).Attributes.GetNamedItem("type").text
           ELSE
              loMethod.aParameters[lnY+1,2] = "complex"
           ENDIF
      ENDFOR
   ENDIF
   
   *** No result value
   IF ISNULL(loResponse)
	 loReturn = null
   ENDIF

   IF !ISNULL(loResponse)
	   loReturn = loResponse.selectSingleNode(lcPrefix + "part")
	   IF ISNULL(loReturn)
		 loMethod.cResultName = loMethod.cName + "Response"
		 loMethod.cResultType = "void"
	   ENDIF
   ENDIF
         
   IF llDotNet AND !ISNULL(loReturn)
      loElement = loReturn.Attributes.GetNamedItem("element")
      IF !ISNULL(loElement)
         llDotNet = .T.
         lcElement = loElement.text 
         lcElement = SUBSTR(lcElement,AT(":",lcElement) + 1)
         loReturn = loRoot.SelectSingleNode(lcPrefix + "types/s:schema/s:element[@name='" + lcElement + "']/s:complexType/s:sequence/s:element")
      ENDIF
   ENDIF
   
   *** Void result types may not have a Result node
   IF ISNULL(loReturn)
      loMethod.cResultName = loMethod.cName + "Response"
      loMethod.cResultType = "void"
   ELSE
	  loWork = loReturn.Attributes.GetNamedItem("name")
	  IF ISNULL(loWork)
	  	  *** If a reference - use that value
		  loWork = loReturn.Attributes.GetNamedItem("ref")
		  IF !ISNULL(loWork)
			  loMethod.cResultName = SUBSTR(loWork.Text,AT(":",loWork.Text) + 1)
			  loMethod.cResultType = loMethod.cResultName
		  ELSE
		  	loMethod.cResultName = "unknown"
		  	loMethod.cResultType = "unknown"
		  ENDIF
	  ELSE
		  loMethod.cResultName = loWork.text
		        loType = loReturn.Attributes.GetNamedItem("type")
    	  IF !ISNULL(loType) 
	    	   loMethod.cResultType = loType.text
	      ELSE
    	     loMethod.cResultType = "Unknown Proprietary Type"
	      ENDIF
	  ENDIF
	  
   ENDIF

   *loMethod.cSoapAction = loRoot.selectSingleNode(lcPrefix + "binding/" + lcPrefix + "operation[@name='" +lcMethod + "']/soap:operation").Attributes.GetNamedItem("soapAction").text
   loMethodOperation = loRoot.selectSingleNode(lcPrefix + "binding/" + lcPrefix + "operation[@name='" +lcMethod + "']")
   IF !ISNULL(loMethodOperation) 
      loSoapActionNode = loMethodOperation.selectSingleNode(this.cSoapNameSpace + ":operation")
      IF !ISNULL(loSoapActionNode)
         loMethod.cSoapAction = loSoapActionNode.Attributes.GetNamedItem("soapAction").text      
         loSoapActionNode = null
      ELSE
         *** Try looking through the nodes if the namespace doesn't match
         FOR EACH loTNode IN loMethodOperation.ChildNodes
            loTNodeAttr = loTNode.Attributes.GetNamedItem("soapAction")
            IF !ISNULL(loTNodeAttr)
               loMethod.cSoapAction = loTNodeAttr.text
               EXIT
            ENDIF
         ENDFOR
         loTNodeAttr = null
         loTNode = null
      ENDIF
   ENDIF

   loWord = null
   loTNode = loRoot.selectSingleNode(lcPrefix + "binding/" + lcPrefix + "operation[@name='" +lcMethod + "']/" + ;
                                    lcPrefix + "input/" + THIS.cSoapNameSpace + ":body")
   IF !ISNULL(loTNode)                                      
      loWord = loTNode.Attributes.GetNamedItem("namespace")
   ENDIF
   IF !ISNULL(loWord)
       loMethod.cMethodNameSpaceUri  = loWord.text
   ELSE
       loMethod.cMethodNameSpaceUri = lcTargetNameSpace
   ENDIF
      
   loSD.aMethods[lnX+1] = loMethod
ENDFOR   

*** Number of methods  
loSD.nCount=lnX

THIS.oSDL = loSD

IF llParseTypes
   *** Try parsing complex types
   loType = loRoot.SelectSingleNode("types")
   IF ISNULL(loType)
      loType = loRoot.SelectSingleNode("wsdl:types")
      IF ISNULL(loType)
         RETURN loSD
      ENDIF
   ENDIF
   
   lcPrefix = loType.childNodes.item(0).Prefix + ":"
   IF lcPrefix = ":"
     lcPrefix = ""
   ENDIF 
   
   loTypes = loType.SelectNodes(lcPrefix + "schema/" + ;
                                lcPrefix +"complexType")
   
   lnTypeCount = 0
   IF !ISNULL(loTypes) AND loTypes.Length > 0
	   loSD.nTypeCount = loTypes.Length
	   lnTypeCount = loSD.nTypeCount
	   DIMENSION loSD.aTypes[loSD.nTypeCount]


	   *** Loop through all the types
	   FOR lnX=1 TO loSD.nTypeCount
		  LOCAL loItemType
	      loItemType = CREATEOBJECT("Relation")
	      
	      loItemType.AddProperty("cName",loTypes.item(lnX-1).Attributes.GetnamedItem("name").text)
	      
	      loItemType.AddProperty("cInherits","")
	      loInherits = loTypes.Item(lnX-1).SelectSingleNode(".//" +lcPrefix + "extension")
	      IF !ISNULL(loInherits)
	         loItemType.cInherits = loInherits.Attributes.GetnamedItem("base").text
	      ENDIF

	      loItemType.AddProperty("nCount",0)
	      loItemType.AddProperty("aProperties(1)")
	      loItemType.AddProperty("cSimpleType","")

	      loTMember = loTypes.item(lnX-1)
	      IF loTMember.ChildNodes.Length < 1
	          *** No members - invalid type or placeholder
	          loSD.aTypes[lnX] = null
	          LOOP
	      ENDIF
	   
	      *** Read in all the properties   
	      DIMENSION laProps[1,2]
	      loItemType.nCount = this.ParseTypeElementList(loTMember,lcPrefix,@laProps)
	            
	      IF loItemType.nCount > 0
	         ACOPY(laProps,loItemType.aProperties)
	      ENDIF

	      loSD.aTypes[lnX] = loItemType
	   ENDFOR
	ENDIF

   *** Find enum types
   loTypes = loType.SelectNodes(lcPrefix + "schema/" + ;
                                lcPrefix +"simpleType/" +;
                                lcPrefix + "restriction")

   IF ISNULL(loTypes) OR loTypes.Length < 1
      RETURN loSD
   ENDIF
   
   DIMENSION loSD.aTypes[lnTypeCount + loTypes.Length]
   loSd.nTypeCount = lnTypeCount + loTypes.Length

   *** Loop through all the types
   FOR lnX=1 TO loTypes.Length
      loItemType = CREATEOBJECT("Relation")
      
      loItemType.AddProperty("cName",loTypes.item(lnX-1).parentNode.Attributes.GetnamedItem("name").text)
	  loItemType.AddProperty("cSimpleType","string")
      
      loItemType.AddProperty("cInherits","")
      loItemType.AddProperty("nCount",0)
      loItemType.AddProperty("aProperties(1)")
	  
      loSD.aTypes[lnTypeCount + lnX] = loItemType
   ENDFOR
ENDIF

RETURN loSD
ENDFUNC
*  wwSOAP :: ParseSDL




************************************************************************
* wwSOAP :: ParseTypeElementList
****************************************
***  Function: Parse parameters or type names into a Name Type array
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION ParseTypeElementList(loBase,lcPrefix,laElements)
LOCAL loNodes, x, y, lnCount, loTNode, loTypeATtrib, loNode

loNodes = loBase.SelectNodes(".//" + lcPrefix + "element")
IF ISNULL(loNodes)
   RETURN 0
ENDIF

lnCount = 0
FOR EACH loNode IN loNodes
   loTNode = loNode.Attributes.GetNamedItem("name")
   
   *** Probably inner nodes for types like DataSet     
   IF ISNULL(loTNode)  
      LOOP
   ENDIF
   
   lnCount = lnCount + 1 
   DIMENSION laElements[lnCount,2]
   
   laElements[lnCount,1] = loTNode.Text
   
   loTypeAttrib = loNode.Attributes.GetNamedItem("type")
   IF ISNULL(loTypeAttrib)
      laElements[lnCount,2]="Unknown Type"
   ELSE
      laElements[lnCount,2] = loTypeAttrib.Text
   ENDIF

ENDFOR
     
RETURN lnCount     
ENDFUNC


************************************************************************
* wwSOAP :: ParseObjectXml
****************************************
***  Function: Parses an XML DOM node pointed at the object parent
***            node into an object. Object must exist with all properties
***            properly filled in. Arrays and Collections must be presented
***            as arrays and must be properly filled with at least one 
***            item of the proper type!
***      Pass: loRoot     -     XML DOM node pointing at object root
***            loObjectTemplate  -  Object used as 'schema'
***    Return: filled object or null
************************************************************************
FUNCTION ParseObjectIntoTemplateObject(loRoot,loObjectTemplate)
LOCAL loXML

loXML = CREATEOBJECT("wwXML")
loXML.lRecurseObjects = .t.
loXML.ParseXmlToObject(loRoot,loObjectTemplate,.t.)
IF loXML.lError
   this.SetError(loXml.cErrorMsg)
   RETURN null
ENDIF
   
RETURN loObjectTemplate
ENDFUNC
*  wwSOAP :: ParseObjectXml

************************************************************************
* wwSOAP :: ParseObject
****************************************
***  Function: Parses an embedded XML Object Element to a Fox Object
***    Assume: Type must exist in WSDL definition. Type cannot have
***           
***      Pass: loObjectStructure  - DOM node of the object root node
***            lcTypeName         - Name of the Type as defined in the
***                                 WSDL file.
***    Return: Object or .NULL.
************************************************************************
FUNCTION ParseObject(loObjectStructure, lcTypeName)
LOCAL loObject,lnIndex,llUseCustomTypes, ;
   lcType, lnX,;
   loAttributes, ;
   lcField, ;
   lcFoxType,;
   loType, loField, lcFieldName 

LOCAL ARRAY laProperties[1,2]
LOCAL ARRAY laItems[1]

loTypeInfo = null

loObject = null

IF !EMPTY(lcTypeName)
   *** Get all the properties of this object including subclasses into a single array
   lnCount = this.AGetTypeProperties(@laProperties,lcTypeName) 
   IF lnCount < 1
      llUseCustomTypes = .F.
   ELSE
      llUseCustomTypes = .T.
      loTypeInfo = this.aGetType(lcTypeName)
      
	  *** Check for raw response and just send that back instead of object
	  *** Occurs for enums among others
      IF !ISNULL(loTypeInfo) AND loTypeInfo.cSimpleType = "string"
      	 RETURN loObjectStructure.text
      ENDIF
   ENDIF
ELSE
  llUseCustomTypes = .F.
ENDIF

*** Create the new object   
IF VARTYPE(loObject) != "O"
   loObject = CREATEOBJECT("EMPTY")   
ENDIF

IF loObjectStructure.ChildNodes.Length = 0
   RETURN .NULL.
ENDIF

*** Unhandled type
IF loObjectStructure.ChildNodes.item(0).NodeName = "#text"
   RETURN .NULL.
ENDIF

*** Loop through the XML document to read each property
*** and populate property from it
FOR lnX = 0 TO loObjectStructure.ChildNodes.Length &&loField IN loObjectStructure.ChildNodes
   loField = loObjectStructure.ChildNodes[lnX]
   IF ISNULL(loFIeld)
      LOOP
   ENDIF
   
   
   loAttributes = loField.ATTRIBUTES
   lcField = loField.NodeName
   
   *** OVerride property name conflicts if the property is one
   *** that is not allowed by VFP
   IF ATC("," + lcField + ",",this.cRenameProperties) > 0
      lcFieldName = "_" + lcField
   ELSE
      lcFieldName = lcField      
   ENDIF

   IF llUseCustomTypes
      *** Find the Type 
      SET EXACT ON
   	  lnIndex = ASCAN(laProperties,lcField,-1,-1,1)
      SET EXACT OFF
      IF lnIndex > 0
         lcType = laProperties[lnIndex + 1]
         lcType = this.StripNameSpace(lcType)
      ELSE
         lcType = "string"
      ENDIF
   ELSE
      loTemp = loAttributes.GetNamedItem("type")
      lcType = "string"
      IF !ISNULL(loTemp)
         lcType = loTemp.TEXT
      ENDIF
   ENDIF

   *** We have to check the type for objects
   lcFoxType = THIS.oXML.xmltypetofoxtype(lcType)

   * loObject.ADDPROPERTY(lcField) - must do below to handle array

   DO CASE
   CASE ATC("array",lcType) > 0
      lcChildType = this.RetrieveChildClassFromWSDLObject(lcType)
      DIMENSION laItems[1]
      lnCount = this.ParseObjectArray(@laItems,lcChildType,loField) 
      ADDPROPERTY(loObject,lcFieldName+"[1]")
      ACOPY(laItems,loObject.&lcFieldName)
   CASE lcFoxType = "O"
      *** Build the child object and attach it!
      ADDPROPERTY(loObject,lcFieldName)
      loObject.&lcFieldName = this.ParseObject(loField,lcType)
      lcType = ""
   *** DataSet or XMLDOM node content
   *** return as RAW HTML
   CASE lcField = "xs:schema"  
      loObject  = loField.parentNode.Xml  
      RETURN loObject   
   OTHERWISE
      *** Just convert and return
      ADDPROPERTY(loObject,lcFieldName)
      loObject.&lcFieldName = this.oXML.XMLValueToFoxValue(loField.Text,lcType)
   ENDCASE   
ENDFOR


RETURN loObject


************************************************************************
* wwSOAP :: ParseObjectArray
****************************************
***  Function: Parses an XML response 
***    Assume:
***      Pass:  @laObjects     - Empty array object passed by reference
***             loNodes header - the root node above the Object nodes
***             lcObjectName   - Name of the object type of the array
***    Return:  
************************************************************************
FUNCTION ParseObjectArray(laObjects, lcObjectType, loNodeHeader)
LOCAL x, lnCount, loNodes, loObjectNode

IF VARTYPE(loNodeHeader) # "O"
   loReturnValue = THIS.aReturnValues[1,2]
   lcReturnType = VARTYPE(loReturnValue) 
   DO CASE 
   CASE lcReturnType = "O"
      loNodes = loReturnValue.ChildNodes()
   CASE lcReturnType = "C"
      oXML = CREATEOBJECT("wwxml")
      loNodeHeader = oXML.LoadXML(loReturnValue)
      loNodes = loNodeHeader.DocumentElement.ChildNodes()
   OTHERWISE
      this.cErrorMsg = "No return value to parse"
      RETURN -1           
   ENDCASE
ELSE
   loNodes = loNodeHeader.ChildNodes()
ENDIF

lnCount = loNodes.Length

DIMENSION laObjects[lnCount]

FOR x = 1 TO lnCount
   loObjectNode = loNodes.item(x-1)
   laObjects[x] = THIS.ParseObject(loObjectNode,lcObjectType)
ENDFOR

RETURN lnCount
ENDFUNC
*  wwSOAP :: ParseObjectArray


************************************************************************
* wwSOAP :: CreateObjectXmlFromSchema
****************************************
***  Function: Creates XML from an object using the schema to 
***            create the nodes.
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateObjectXmlFromSchema(loObject,lcTypeName,;
                                   lcPropertyName,lnIndent)
LOCAL lcXML, lnCount, x, lcFieldName, lcFoxType

IF EMPTY(lcPropertyName)
   lcPropertyName = lcTypeName
ENDIF
IF EMPTY(lnIndent)
   lnIndent = 0
ENDIF

LOCAL ARRAY laTypeProperties[1]
lnCount = this.aGetTypeProperties(@laTypeProperties,lcTypeName)
IF lnCount = 0
   DO CASE
   	  CASE lcTypeName = "string"
   	      RETURN REPLICATE(CHR(9),lnIndent) + ;
   	             "<string>" + TRANSFORM(loObject) + "</string>" + CRLF
   ENDCASE
   RETURN ""
ENDIF

LOCAL loXML as wwXML 
loXML = CREATEOBJECT("wwXML")

lcXML = REPLICATE(CHR(9),lnIndent) + "<" + lcPropertyName + ">" + CRLF
FOR x = 1 TO lnCount
   lcFieldName = laTypeProperties[x,1]   
   
   lcFoxType = TYPE("loObject." + lcFieldName)
   IF lcFoxType = "U"
      LOOP
   ENDIF
   
   DO CASE
   *** Array Checking first
   #IF wwVFPVERSION < 9
   CASE  TYPE([ALEN(loObject.] + lcFieldName + [)]) = "N"
   #ELSE
   CASE TYPE("loObject." + lcFieldName,1) = "A"
   #ENDIF
      LOCAL y, lnSize, lvValue, lcFieldType, lcChildType
      
      *** Must copy the array
      DIMENSION la_array[1]
      ACOPY(loObject.&lcFieldname,la_array)
      lcChildType = THIS.RetrieveChildClassFromWSDLObject(laTypeProperties[x,2])
      
      IF EMPTY(lcChildType)
         lcXML = lcXML + REPLICATE(CHR(9) ,lnIndent+1) + "<" + lcFieldName + "/>" + CRLF
      ELSE
         lnSize = ALEN(la_array,1)
         lcXML = lcXML + REPLICATE(CHR(9) ,lnIndent+1) + "<" + lcFieldName + ">" + CRLF
         FOR y = 1 TO lnSize
            lcXML = lcXML +  this.CreateObjectXmlFromSchema( la_Array[y],lcChildType,lcChildType,lnIndent+3 )         
         ENDFOR
         lcXML = lcXML +  REPLICATE(CHR(9) ,lnIndent+1) + "</" + lcFieldName + ">" + CRLF
      ENDIF

   *** Check for Collections
   CASE TYPE("loObject." + lcFieldName + ".KeySort") = "N"      
         lcChildType = THIS.RetrieveChildClassFromWSDLObject(laTypeProperties[x,2])
      
         loCol = EVALUATE("loObject." + lcFieldName)
         lnSize = loCol.Count
         
         lcXML = lcXML + REPLICATE(CHR(9) ,lnIndent+1) + "<" + lcFieldName + ">" + CRLF
         FOR y = 1 TO lnSize
            lcXML = lcXML +  this.CreateObjectXmlFromSchema( loCol.Item[y],lcChildType,lcChildType,lnIndent+3 )         
         ENDFOR
         lcXML = lcXML +  REPLICATE(CHR(9) ,lnIndent+1) + "</" + lcFieldName + ">" + CRLF
   
   *** Objects: Recurse into the object
   CASE lcFoxType = "O"
      lcXML = lcXML + this.CreateObjectXmlFromSchema( EVALUATE("loObject." + lcFieldName),;
                             this.StripNameSpace(laTypeProperties[x,2]),lcFieldName,lnIndent+1 )
   OTHERWISE
      lcXML = lcXML + loXML.Addelement(lcFieldName,EVALUATE("loObject." + lcFieldName),lnIndent+1,"",lcFoxType)
   ENDCASE
ENDFOR
lcXML = lcXML + REPLICATE(CHR(9),lnIndent) + "</" + lcPropertyName + ">"  + CRLF

RETURN lcXML
ENDFUNC
*  wwSOAP :: CreateObjectXmlFromSchema

************************************************************************
* wwSoap ::  CreateObjectFromSchema
***********************************
***  Function: Creates an instance of an object from the WSDL schema
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateObjectFromSchema(lcTypeName,llNoRecursion)
LOCAL loInst, x, lnCount, lvValue, lcType, lcFieldName, lvValue

LOCAL ARRAY laTypeProperties[1]
lnCount = this.aGetTypeProperties(@laTypeProperties,lcTypeName)
IF lnCount = 0
   RETURN null
ENDIF

loInst = CREATEOBJECT("EMPTY")

FOR x = 1 TO lnCount
   lcFieldName = laTypeProperties[x,1]   
   lcFullType = laTypeProperties[x,2]
   lcType = LOWER(this.StripNameSpace(lcFullType))

   lvValue = .F.
   
   DO CASE
      CASE lcType = "string"
         lvValue = ""
      CASE lcType = "decimal" OR lcType = "int" OR lcType = "number"
         lvValue = 0
      CASE lcType = "boolean"
         lvValue = .F.
      CASE lcType = "datetime" or lcType = "date" or lctype = "time"
         lvValue = {^1900-01-01}
      CASE lcType = "base64binary"
         lvValue = null
      CASE lcType = "arrayof"
         lvValue = CREATEOBJECT("Collection")
         lvObj = this.CreateObjectFromSchema(lcType)
      OTHERWISE 
		 LOCAL ARRAY laChildProperties[1]
		 IF llNoRecursion
		    lvValue = null
		 ELSE
	      	 lnChildProps = this.aGetTypeProperties(@laChildProperties,lcType)
	      	 IF lnChildProps <1
		         lvValue = null
		     ELSE	     
		     	 lvValue = this.CreateObjectFromSchema(lcType)
		     ENDIF
		 ENDIF
   ENDCASE
   
   ADDPROPERTY(loInst,lcFieldName,lvValue)   
ENDFOR

RETURN loInst
ENDFUNC
*  wwSoap ::  CreateObjectFromSchema

************************************************************************
* wwSOAP :: RetrieveChildClassFromWSDLObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION RetrieveChildClassFromWSDLObject
LPARAMETERS lcParentType
LOCAL ARRAY laTypeProperties[1]
lcFieldType = this.StripNameSpace(lcParentType)
IF EMPTY(lcFieldType)
   RETURN ""
ENDIF
this.aGetTypeProperties(@laTypeProperties,lcFieldType)
RETURN  this.StripNameSpace( laTypeProperties[1,2] )
ENDFUNC

************************************************************************
* wwSOAP :: AGetTypeProperties
****************************************
***  Function: Gets all properties for a given type including any
***            base class implementations.
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION AGetTypeProperties
LPARAMETERS laProperties,lcTypeName
LOCAL lnAt, loType

loType = .NULL.
FOR lnX = 1 TO this.oSDL.nTypeCount
   IF !ISNULL(THIS.oSDL.aTypes[lnX]) AND LOWER(THIS.oSDL.aTypes[lnX].cName) == LOWER(lcTypeName)
      loType = this.oSDL.aTypes[lnX]
      EXIT
   ENDIF
ENDFOR

IF ISNULL(loType)
  RETURN 0
ENDIF 

IF VARTYPE(laProperties)="L"
   DIMENSION laProperties[ ALEN(loType.aProperties,1),2 ]
   lnSize = 0
ELSE
   lnSize = ALEN(laProperties)
   DIMENSION laProperties[ ALEN(laProperties,1) + ALEN(loType.aProperties,1),2 ]
ENDIF

ACOPY(loType.aProperties,laProperties,1,ALEN(loType.aProperties),lnSize + 1 )

IF !EMPTY(loType.cInherits)
   this.aGetTypeProperties(@laProperties,this.StripNamespace(loType.cInherits))
ENDIF

IF TYPE("laProperties[1]") = "L"
   *** Empty array
   RETURN 0
ENDIF   
          
RETURN ALEN(laProperties,1)

************************************************************************
* wwSoap ::  aGetType
****************************************
***  Function: Retrieves a type that was previously parsed by WSDL parsing
***    Assume: ParseServiceWsdl must have been called
***      Pass: lcTypeName - the name of the type without the prefix
***    Return: Type object or .NULL.
************************************************************************
FUNCTION aGetType(lcTypename)
LOCAL loType

loType = .NULL.
FOR lnX = 1 TO this.oSDL.nTypeCount
   IF !ISNULL(THIS.oSDL.aTypes[lnX]) AND LOWER(THIS.oSDL.aTypes[lnX].cName) == LOWER(lcTypeName)
      loType = this.oSDL.aTypes[lnX]
      EXIT
   ENDIF
ENDFOR

RETURN loType
ENDFUNC
*  wwSoap ::  aGetType


************************************************************************
* wwSOAP :: IsWSDLObject
****************************************
***  Function: Determines whether an object exists inside of the 
***            WSDL definition.
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION IsWSDLObject(lcTypeName)

IF VARTYPE(this.oSDL) # "O" 
   RETURN .f.
ENDIF
   
FOR lnX = 1 TO this.oSDL.nTypeCount
   IF !ISNULL(THIS.oSDL.aTypes[lnX]) AND ;
      THIS.oSDL.aTypes[lnX].cName == lcTypeName
      RETURN .t.
   ENDIF
ENDFOR

RETURN .F.
ENDFUNC
*  wwSOAP :: IsWSDLObject

************************************************************************
* wwSOAP :: ParseDataSet
****************************************
***  Function: Parses a DataSet into an XMLAdapter
***    Assume:
***      Pass: DOM Node where the DataSet
***    Return:
************************************************************************
FUNCTION ParseDataSet(loObjectStructure)

   LOCAL loXA as XMLAdapter
   loXA = CREATEOBJECT("XMLAdapter")
   loXA.LoadXML(loObjectStructure.XML)
   RETURN loXA

ENDFUNC
*  wwSOAP :: ParseDataSet



************************************************************************
* wwSoap :: CreateHttpObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateHttpObject()

THIS.oHttp = CREATEOBJECT([WWC_WWHTTP])
this.oHttp.cUsername = this.cUsername
this.oHttp.cPassword = this.cPassword

this.oHTTP.nHTTPConnectType = THIS.nHTTPConnectType
this.oHTTP.nConnectTimeout = THIS.nHTTPConnectTimeout
this.oHTTP.cHttpProxyName = this.cHttpProxy

ENDFUNC
*  wwSoap :: CreateHttpObject

************************************************************************
* wwSOAP :: FoxTypeToXMLType
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION FoxTypeToXMLType
LPARAMETER lcFoxType

DO CASE
   CASE lcFoxType = "C" or lcFoxType = "M"
      lcType = "string"
   CASE lcFoxType $ "N" or lcFoxType $ "F" 
      lcType = "double"
   case lcFoxType $ "YB"
      lcType = "number"
   CASE lcFoxType = "L"
      lcType = "boolean"
   CASE lcFoxType = "O"
      lcType = "object"
   CASE lcFoxType = "I"
      lcType = "i4"
   CASE lcFoxType = "D"
      lcType = "date"
   CASE lcFoxType = "T"
      lcType = "dateTime"
   CASE lcFoxType = "Q" OR lcFoxType = "W"
      lcType = "base64Binary"
   OTHERWISE
      lcType = lcFoxType
ENDCASE

RETURN lcType
ENDFUNC
*  wwSOAP :: FoxTypeToXMLType


************************************************************************
* wwSOAP :: XMLTypeToFoxType
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION XMLTypeToFoxTypeXXX
LPARAMETER lcXMLtype

*** strip off type prefixes dt namespace - MS SOAP bullshit
lcXMLType = this.StripNamespace(lcXmlType)

DO CASE
   CASE lcXMLType $ "string,char,uri,uuid,bin.hex,base64binary"
      lcType = "C"
*!*      CASE lcXMLType = "bin.hex"
*!*         lcType = "M"
   CASE lcXMLType $ "number,single,decimal,double,r4,r8,float,fixed.14.4,float.IEEE.754.32,float.IEEE.754.64" 
      lcType = "N"
   CASE lcXMLType $ "integer,i4,i1,i2,i8,ui2,ui4,ui8"
      lcType = "I"
   CASE lcXMLType = "boolean"
      lcType = "L"
   CASE lcXMLType $ "date,date.tz"
      lcType = "D"
   CASE lcXMLType $ "datetime,datetime.tz"
      lcType = "T"
   CASE lcXMLType = "record" or lcXMLType="object"
      lcType = "O"
   OTHERWISE
      lcType = "string"
ENDCASE

RETURN lcType
ENDFUNC
*  wwSOAP :: XMLTypeToFoxType

************************************************************************
* wwSOAP :: StripNamespace
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION StripNameSpace(lcName)
RETURN SUBSTR(lcName,AT(":",lcName)+1)
ENDFUNC


************************************************************************
* wwSOAP :: SetError
****************************************
***  Function: Internal method used to set error information
***    Assume:
***      Pass: lcError  -  Error string to set
***    Return: nothing
************************************************************************
PROTECTED FUNCTION SetError
LPARAMETERS lcError

IF EMPTY(lcError)
  THIS.cErrormsg = ""
  THIS.lError = .F.
  RETURN
ENDIF

THIS.lError = .T.
THIS.cErrorMsg = lcError 

ENDFUNC
*  wwSOAP :: SetError

ENDDEFINE
*EOC wwSoap 



DEFINE CLASS cSDLInterface AS Relation

cInterface = ""
cServerUrl = ""
cDescription = ""

DIMENSION aMethods(1)
nCount = 0

DIMENSION aTypes(1)
nTypeCount = 0


************************************************************************
* cSDLInterface :: GetMethod
****************************************
***  Function: Returns an individual method from the aMethods array
***            by name.
***      Pass: lcMethod = The method to be returned
***    Return: Object or NULL if not found
************************************************************************
FUNCTION GetMethod
LPARAMETERS lcMethod
LOCAL lnX

lcMethod = LOWER(lcMethod)
FOR lnX=1 TO THIS.nCount 
   loMethod = THIS.aMethods[lnX]
   IF LOWER(loMethod.cName)==lcMethod
      RETURN loMethod
   ENDIF
ENDFOR

RETURN .NULL.
ENDFUNC

************************************************************************
* wwSOAP :: SDLReturnType
****************************************
***  Function: Returns the 
***    Assume: ParseServiceDescription was called previously
***      Pass:
***    Return:
************************************************************************
FUNCTION ConvertSDLReturn
LPARAMETERS lcMethod, lcValue, lvStore
LOCAL loMethod, lcXML, lcType

loMethod = THIS.GetMethod(lcMethod)
IF ISNULL(lcMethod)
   RETURN lcValue
ENDIF

lcType = loMethod.cResultType
loXML = CREATEOBJECT("wwXML")
RETURN loXML.XMLValueToFoxValue(lcValue,lcType,lvStore)
ENDFUNC
*  wwSOAP :: SDLReturnType

ENDDEFINE


*************************************************************
DEFINE CLASS wwSOAPProxy AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 04/14/2001
*************************************************************

*** Custom Properties
oSOAP = .NULL.

cErrorMsg = ""
lError = .F.

*** 0 - wwSOAP - 1 MSSOAPV2
nClientMode = 0

PROTECTED cWSDLFile, oSDL
oSDL = .NULL.
cWSDLURl = ""

cUserName = ""
cPassword = ""

cProxy = ""
nTimeout = 15


************************************************************************
* wwSOAPProxy :: Init
****************************************
FUNCTION Init
LPARAMETERS lnClientMode,llNoLoadWSDL

IF VARTYPE(lnClientMode) # "N"
   lnClientMode = THIS.nClientMode
ELSE
   THIS.nClientMode = lnClientMode   
ENDIF   

DO CASE
CASE lnClientMode = 0
   THIS.oSOAP = CREATEOBJECT("wwSOAP")
ENDCASE   

IF !llNoLoadWSDL AND !EMPTY(THIS.cWSDLUrl) 
   THIS.LoadWSDL(THIS.cWSDLUrl)
ENDIF

ENDFUNC
*  wwSOAPProxy :: Init


************************************************************************
* wwSOAPProxy :: LoadWSDL
****************************************
***  Function: Loads the WSDL file and holds it in a local
***            reference
***      Pass: lcUrl - URL to the WSDL file
***    Return:  nothing 
************************************************************************
FUNCTION LoadWSDL
LPARAMETERS lcUrl

IF !EMPTY(lcUrl)
   THIS.cWSDLUrl = lcUrl
ENDIF   

DO CASE
   CASE THIS.nClientMode = 0
	 THIS.oSOAP.cUserName = THIS.cUsername
	 THIS.oSOAP.cPassWord = THIS.cPassword
     THIS.oSOAP.nHttpConnectTimeout = this.nTimeout
     THIS.oSOAP.cHttpProxy = this.cProxy

     THIS.oSDL = THIS.oSOAP.ParseServiceWSDL(THIS.cWSDLUrl,.t.)
     IF ISNULL(THIS.oSDL)
        RETURN .F.
     ENDIF
     
   CASE THIS.nClientMode = 1
     TRY
        THIS.oSOAP = CREATEOBJECT(MSSOAP_PROGID)
        LOCAL lcUrl
        
        lcUrl = TRIM(this.cWSDLUrl) 
        *** Fix up Url to include username and password 
        *** How freaking lame is this???
        IF !EMPTY(this.cUsername)
           lcUrl = STRTRAN(lcUrl,"http://","http://" + this.cUsername + ":" + this.cPassword + "@",1,1,1)
           IF lcUrl = this.cWsdlUrl
              lcUrl = STRTRAN(this.cWSDLUrl,"https://","https://" + this.cUsername + ":" + this.cPassword + "@",1,1,1)
           ENDIF
        ENDIF
        THIS.oSOAP.mssoapinit(lcUrl)
     CATCH
        THIS.lError = .t.
        THIS.cErrorMSg = MESSAGE()
     ENDTRY
     IF this.lError
        RETURN .F.
     ENDIF
     this.SetMSSOAPConnectionProperties()       
ENDCASE

ENDFUNC
*  wwSOAPProxy :: LoadWSDL

PROTECTED FUNCTION SetMSSOAPConnectionProperties()

      IF !EMPTY(THIS.cUserName)
          THIS.oSOAP.ConnectorProperty("AuthUser") = this.cUserName
          THIS.oSOAP.ConnectorProperty("AuthPassword") = this.cPassword 
       ENDIF
       this.oSOAP.ConnectorProperty("ConnectTimeout") = this.nTimeout * 1000
       this.oSOAP.ConnectorProperty("Timeout") = this.nTimeout * 1000

       IF !EMPTY(THIS.cProxy)
          this.oSOAP.ConnectorProperty("ProxyServer") = this.cProxy
       ELSE 
          this.oSOAP.ConnectorProperty("ProxyServer") = "<CURRENT_USER>"          
       ENDIF
ENDFUNC

************************************************************************
* wwSOAP :: SetError
****************************************
***  Function: Internal method used to set error information
***    Assume:
***      Pass: lcError  -  Error string to set
***    Return: nothing
************************************************************************
PROTECTED FUNCTION SetError
LPARAMETERS lcError

IF EMPTY(lcError)
  THIS.cErrormsg = ""
  THIS.lError = .F.
  RETURN
ENDIF

THIS.lError = .T.
THIS.cErrorMsg = lcError 

ENDFUNC
*  wwSOAP :: SetError

ENDDEFINE
*EOC wwSOAPProxy 