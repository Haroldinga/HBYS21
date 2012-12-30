
SET PROCEDURE TO wwXMLAdapter additive
RETURN CREATEOBJECT("wwXMLAdapter")


*************************************************************
DEFINE CLASS wwXMLAdapter AS XmlAdapter
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2004
*:Contact: http://www.west-wind.com
*:Created: 10/25/2004
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwXMLAdapter

*:Description:
A light wrapper class around the XMLAdapater class that provides
easier access to cursors and XML content.

*:Example:

*:Remarks:
Requires VFP 8.0 or later

*:ENDHELP
#ENDIF

*** Custom Properties

*** Stock Properties

*--- Override to always UTF-8 encode
UTF8Encoded = .t.


************************************************************************
FUNCTION GetTable(lcCursor as String) as XMLTable 
*************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwXMLAdapter :: GetTable

*:Description:
Returns an XMLTable object by name which is not supported
natively in the XML Adapter.

*:Parameters:

*:Returns:
XML Table object or null if it doesn't exist

*:Remarks:

*:SeeAlso:

*:Keywords:

*:ENDHELP
#ENDIF
************************************************************************
lcCursor = LOWER(lcCursor)
FOR EACH loTable in this.Tables
   IF lcCursor == LOWER(loTable.alias)
      RETURN loTable
   ENDIF      
ENDFOR

RETURN .null.
ENDFUNC
*  wwXMLAdapter :: GetTable

************************************************************************
FUNCTION GetCursor(lvCursor as Variant,llAppend as bool) as Boolean
*******************************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwXMLAdapter :: GetCursor

*:Description:
Turns a table into a cursor by name or index

*:Parameters:

*:Returns:

*:Remarks:

*:ENDHELP
#ENDIF
************************************************************************
 
IF VARTYPE(lvCursor) = "N"
   loTable = this.tables[lvCursor]
ELSE
   loTable = this.GetTable(lvCursor)
ENDIF

IF ISNULL(loTable)
   RETURN .f.
ENDIF   

IF !llAppend AND USED(loTable.Alias)
   USE IN (loTable.Alias)
ENDIF
  
loTable.ToCursor(llAppend)

ENDFUNC
*  wwXMLAdapter :: GetCursor


************************************************************************
FUNCTION GetDiffGram(lcCursor as String,llChangesOnly) as String
**************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwXMLAdapter :: GetDiffGram

*:Description:
Returns an XML string for the cursor specified

*:Parameters:
<<B>>lcCursor<</b>>
Name of the cursor to convert. If not passed ALIAS() is used

*:Returns:
XML String or "" on error

*:Remarks:

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lcXML

IF EMPTY(lcCursor)
   lcCursor = ALIAS()
   IF EMPTY(lcCursor)
      RETURN ""
   ENDIF
ENDIF

THIS.AddTableSchema(lcCursor)
THIS.IsDiffgram = .T.

lcXML = ""
THIS.ToXML("lcXML",,.F.,.T.,llChangesOnly)

RETURN lcXML
ENDFUNC
*  wwXMLAdapter :: GetDiffGram

ENDDEFINE