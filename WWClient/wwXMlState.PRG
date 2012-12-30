#include wconnect.h

SET PROCEDURE TO wwXmlState.prg ADDITIVE

#IF .F.   && Sample code
CLEAR
oState = CREATEOBJECT("wwXMLState")


oState.LoadXML(FULLPATH( "test.xml"),.T.)
? oState.GetXML()

oState.SetProperty("Test","New Value " + TIME())
oState.SetProperty("Number",123.33)
oState.SetProperty("Bool",.T.)
oState.SetProperty("Bool2",.F.)
oState.SetProperty("date",DATE())
oState.SetProperty("datetime",DATETIME())

? oState.GetXML()
?
? "PRINTING ALL PROPERTIES"
DIMENSION laProps[1]
lnCount =  oState.aGetProperties(@laProps)
? lnCount
FOR x=1 to lnCount
   ?  laProps[x,1], laProps[x,2]
ENDFOR

*_cliptext = oState.GetXML()
? 
? oState.GetProperty("Test")
? oState.GetProperty("Number")
? oState.GetProperty("Number")
? oState.GetProperty("Bool")
? oState.GetProperty("Bool2")
? oState.GetProperty("date")
? oState.GetProperty("datetime")

oState.SaveXML(FULLPATH("Test.xml"))

#ENDIF


********************************************************
DEFINE CLASS wwXMLState AS Relation
********************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2000
*:Contact: http://www.west-wind.com
*:Created: 12/19/2000
********************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwXMLState

*:Description:
Allows storage of properties in a single XML string/object.
This mechanism can be used to easily store state in memo
fields, or files for dynamic application properties or 
uses such as configuration files.

XML is loaded with the LoadXML() method and the SetProperty
and GetProperty methods are used to set and retrieve values
from the current XML state.

*:Example:
SET PROCEDURE TO wwXMLState

USE SomeTable

o = CREATEOBJECT("wwXMLState")

*** Set a value
o.cXML = SomeTable.XMLPropertiesMemo
o.SetProperty("testproperty","new value","string","Testing")
REPLACE SomeTable.XMLPropertiesMemo with o.cXML

*** Retrieve a value
o.cXML = SomeTable.XMLPropertiesMemo
lcValue = o.GetProperty("testproperty")

*:ENDHELP
#ENDIF

*** XML State String
cRootNode = "properties"

*** Reference to the XMLDOM
*** Note: Recommend MSXML3 parser version
PROTECTED oDOM
oDOM = .NULL.

PROTECTED lLoaded
lLoaded = .F.

********************************************************
* wwXMLState :: Init
****************************************
FUNCTION Init
LPARAMETERS loDOM

IF VARTYPE(loDOM) = "O"
   THIS.oDOM = loDOM
ELSE
   THIS.oDOM = CREATEOBJECT(XML_XMLDOM_PROGID)
   THIS.oDOM.Async = .F.
ENDIF

ENDFUNC
*  wwXMLState :: Init


********************************************************
* wwXMLState :: LoadXML
****************************************
***  Function: Loads an XML string into the parser.
***    Assume:
***      Pass: lcXMl   -  XML string to load OR
***                       Filename/URL if llUrl is .T.
***            llUrl   -  .T. if from URL or File
***    Return: .T. or .F.
********************************************************
FUNCTION LoadXML
LPARAMETERS lcXML, llUrl

THIS.lLoaded = .T.

*** Create empty property bag
IF EMPTY(lcXML)
   lcXML = "<" + THIS.cRootNode + "></" + THIS.cRootNode + ">"
   THIS.oDOM.LoadXML( lcXML )  && Initialize empty
   THIS.lLoaded = .T.
   RETURN .T.
ENDIF
  
IF llUrl
   THIS.oDOM.Load(lcXML)
ELSE   
   THIS.oDOM.LoadXML(lcXML)
ENDIF

IF !EMPTY(THIS.oDOM.ParseError.Reason)
   lcXML = "<" + THIS.cRootNode + "></" + THIS.cRootNode + ">"
   THIS.oDOM.LoadXML( lcXML )  && Initialize empty
   THIS.lLoaded = .F.
   RETURN .F.
ENDIF

RETURN .T.
ENDFUNC
*  wwXMLState :: LoadXML

************************************************************************
* wwXMLState :: GetXML
****************************************
***  Function: Returns the entire XML as a string for storage
***    Return: Returns the entire property state as an XML string
************************************************************************
FUNCTION GetXML
RETURN THIS.oDom.XML
ENDFUNC
*  wwXMLState :: GetXML

************************************************************************
* wwXMLState :: SaveXML
****************************************
***  Function: Saves the current XML state to a file
***    Assume:
***      Pass: lcFileName  -   Fully qualified path
***    Return: Nothing
************************************************************************
FUNCTION SaveXML
LPARAMETERS lcFileName
THIS.oDOM.Save(lcFileName)
ENDFUNC
*  wwXMLState :: SaveXML

********************************************************
* wwXMLState :: SetProperty
****************************************
***  Function: Sets a property in the XML content
***    Assume:
***      Pass: lcProperty   -   The property to set
***            lvValue      -   The Value to set prop to
***                             pass .NULL. to delete 
***            lctype       -   (optional) string, float 
***                                integer, boolean
***            lcDescription-   (optional) Description 
***    Return: nothing
********************************************************
FUNCTION SetProperty
LPARAMETERS lcProperty, lcValue, lcType, lcDescription
LOCAL loDOM, lcValue, lcType, loProperty

IF EMPTY(lcType)
   lcType = VARTYPE(lcValue)
   DO CASE
      CASE ISNULL(lcValue) 
      CASE lcType = "C" OR lcType = "V"
         lcType = "string"
      CASE lcType = "N"
         lcType = "float"
      CASE lcType = "L"
         lcType = "boolean"
         IF lcValue
            lcValue = "1"
         ELSE
            lcValue = "0"
         ENDIF
      CASE lcType = "T" or lcType = "D"
         lcType = "datetime"
      CASE lcType = "O"
         RETURN   .F. && Ignore objects
      CASE lcType = "G"
         RETURN .F.
      OTHERWISE
         lcType = "string" 
   ENDCASE
ENDIF

IF !THIS.lLoaded
   THIS.LoadXML()
ENDIF

loDOM = THIS.oDOM

*** Remove Item if NULL was passed for value
IF ISNULL(lcValue)
   loProperties = loDOM.SelectSingleNode("/" + ;
                                 THIS.cRootNode)
   loProperty = loDOM.SelectSingleNode("/" + ;
               THIS.cRootNode + "/" + lcProperty)
                         
   IF !ISNULL(loProperty)
      loProperties.removeChild(loProperty)
   ENDIF
   RETURN
ENDIF

loProperty = loDOM.SelectSingleNode("/" + ;
                  THIS.cRootNode+ "/" + lcProperty)
IF ISNULL(loProperty)
   *** Add the property
   loProperties = loDOM.SelectSingleNode("/" + ;
                                     THIS.cRootNode)
   IF ISNULL(loProperties)
      THIS.oDOM.LoadXML("<" + THIS.cRootNode+ "></" + ;
                        THIS.cRootNode+ ">")
   ENDIF

   loProperty = loDOM.createElement(lcProperty)

   loProperties.appendChild(loProperty)
ENDIF

loProperty.TEXT = lcValue  && Automatic Type Conversion

loType = loDOM.createAttribute("type")
loType.VALUE = lcType
loProperty.ATTRIBUTES.setNamedItem(loType)

IF !EMPTY(lcDescription)
   loType = loDOM.createAttribute("description")
   loType.VALUE = lcDescription
   loProperty.ATTRIBUTES.setNamedItem(loType)
ENDIF

RETURN .t.
ENDFUNC
*  wwXMLState :: SetProperty

********************************************************
* wwXMLState :: GetProperty
****************************************
***  Function: Retrieves a property contained in XML 
***    Assume: 
***      Pass: lcProperty - Property to retrieve
***    Return: Returns typed value of the property
********************************************************
FUNCTION GetProperty
LPARAMETER lcProperty
LOCAL loDOM, lcValue, lcType, loProperty, loValue


IF !THIS.lLoaded
   IF !THIS.LoadXML()
      RETURN 
   ENDIF
ENDIF

loDOM = THIS.oDOM

loValue = loDOM.SelectSingleNode("/" + THIS.cRootNode+ ;
                                 "/" + lcProperty)
IF ISNULL(loValue)
   RETURN .NULL.
ENDIF

lcValue = loValue.Text
lcType = LOWER(;
          loValue.Attributes.GetNamedItem("type").Text)

DO CASE 
CASE INLIST(lcType,"string","xml","url","file")
   RETURN lcValue
CASE lcType = "integer" or lcType="float"
   RETURN VAL(lcValue)
CASE lcType = "boolean"
   RETURN IIF(lcValue = "1",.T.,.F.)
CASE lcType = "datetime"
   RETURN CTOT(lcValue)
ENDCASE

RETURN .NULL.
ENDFUNC
*  wwXMLState :: GetProperty

************************************************************************
* wwXMLState :: AGetProperties
****************************************
***  Function: Returns all properties and values in a 4D array
***    Assume:
***      Pass: @laProperties  -  Array (by reference) to receive 
***                              settings.
***    Return: Count of properties
***            2D Array:  1 - Key   2 - Typed value  3 - Type 4 - Description
************************************************************************
FUNCTION AGetProperties
LPARAMETERS laProperties
LOCAL lnX, loDOM, loValue
IF !THIS.lLoaded
   IF !THIS.LoadXML()
      RETURN 0
   ENDIF
ENDIF
   
loDOM = THIS.oDOM

loProperties = loDOM.DocumentElement.ChildNodes   

FOR lnX=0 to loProperties.length - 1
   DIMENSION laProperties[lnX+1,4]
   loValue = loProperties.item(lnX)
   laProperties[lnX+1,1] = loValue.nodeName
   laProperties[lnX+1,2] = THIS.GetProperty(laProperties[lnX+1,1]) 
   laProperties[lnX+1,3] = loValue.Attributes.GetNamedItem("type").Text
   
   loDescript = loValue.Attributes.GetNamedItem("description")
   IF !ISNULL(loDescript)
      laProperties[lnX+1,4] = loDescript.Text
   ELSE
      laProperties[lnX+1,4] = ""
   ENDIF
ENDFOR

RETURN lnX
ENDFUNC
*  wwXMLState :: AGetProperties

ENDDEFINE
*EOC wwXMLState 
