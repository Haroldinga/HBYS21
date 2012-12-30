**************************************************
*-- Class Library:  c:\vfpprojects\hbys14\wwclient\wwxml.vcx
**************************************************


**************************************************
*-- Class:        wwlight (c:\vfpprojects\hbys14\wwclient\wwxml.vcx)
*-- ParentClass:  custom
*-- BaseClass:    custom
*-- Time Stamp:   08/13/11 01:27:05 PM
*-- A lightweight object that has as many properties and methods as possible hidden. You can use AddProperty on this object to build objects on the fly. Used by wwXML for object generation.
*
#INCLUDE "wconnect.h"
*
DEFINE CLASS wwlight AS custom


	Name = "wwlight"
	HIDDEN addobject
	HIDDEN cloneobject
	HIDDEN comment
	HIDDEN controlcount
	HIDDEN controls
	HIDDEN height
	HIDDEN newobject
	HIDDEN objects
	HIDDEN picture
	HIDDEN readexpression
	HIDDEN readmethod
	HIDDEN removeobject
	HIDDEN resettodefault
	HIDDEN saveasclass
	HIDDEN showwhatsthis
	HIDDEN tag
	HIDDEN whatsthishelpid
	HIDDEN width
	HIDDEN writeexpression
	HIDDEN writemethod
	HIDDEN name
	HIDDEN classlibrary
	HIDDEN helpcontextid
	HIDDEN parent
	HIDDEN parentclass
	HIDDEN class
	HIDDEN baseclass


ENDDEFINE
*
*-- EndDefine: wwlight
**************************************************


**************************************************
*-- Class:        wwxml (c:\vfpprojects\hbys14\wwclient\wwxml.vcx)
*-- ParentClass:  custom
*-- BaseClass:    custom
*-- Time Stamp:   08/13/11 01:29:12 PM
*-- XML conversion object that handles translation of FoxPro object and cursors to and from XML.
*
#INCLUDE "c:\vfpprojects\hbys14\wwclient\wconnect.h"
*
DEFINE CLASS wwxml AS custom


	Height = 18
	Width = 99
	*-- Internal buffer that is used to hold XML text. If a document is to be parsed (simple) body will hold the full document including the header.
	cbody = ""
	*-- The default XML document header. By default this is just the plain XML header without DTD. Used only when creating a document - not set when writing. You may add additional headers to the default or overwrite it .
	cxmlheader = ([<?xml version="1.0"?>] + CHR(13)+CHR(10))
	*-- List of properties that are not included in the XML document. This property is preset to strip out most VFP properties used for Custom objects. You can add to this property to filter out additional properties. Lower case values separated by commas.
	cpropertyexclusionlist = "-- Override in code. Set in Init() --"
	*-- Flag describes if header was output already
	lxmlheadersent = .F.
	*-- Flag that specifies whether CursorToXML creates a DTD for the data definition. The DTD can be used to recreate a table on the other end of an XML connection.
	lcreatedatastructure = .F.
	*-- The XML DTD for the document. This property is empty by default and is prepended to any XML that's output.
	cdtd = ""
	*-- Last Error message
	cerrormsg = ""
	*-- By default all types are generated using XML types which can be converted to Fox types and back. If you use Fox on both ends of the connection exclusively you can set this flag to .T. to allow the use of native Fox types.
	lusefoxtypes = .F.
	*-- Flag to determine whether objects are expanded into XML.
	lrecurseobjects = .F.
	*-- The class that is used to create a new object with XMLToObject. The default is wwLight which hides all but a few properties of custom. If you want other object properties specify that class here and make sure the class is available.
	cobjectclass = "wwLight"
	*-- The name of the Root document tag.
	cdocrootname = "xdoc"
	*-- MS XMLDom reference used by LoadXML.
	oxml = .NULL.
	*-- Holds error flag after a failed method call.
	lerror = .F.
	*-- Version number of the wwXML class.
	cversion = 4.55
	*-- If an element is 'empty' no value is written.
	lskipemptyelements = .F.
	*-- This flag is specific to importing object properties from XML. If .t. objects are parsed using Fox code instead of the XML parser. NOTE: This will only work if you actually supply an object reference, not if the object is to be created from the DTD.
	luseparserforobjectimport = .F.
	*-- Strips the 1 character type prefix from object properties when generating output XML from objects.
	lstriptypeprefix = .F.
	*-- ODBC/OleDB connect string used to connect to a remote data source.
	csqlconnectstring = ""
	*-- 0 - none, 1 - Schema, 2 - DTD
	ncreatedatastructure = 0
	*-- Name of the schema to embed
	cschemaname = "Schema"
	*-- Url to an external or internal schema
	cschemaurl = ""
	*-- Encoding types for the XML document content. 0 - no encoding (Windows Codepage), 1 - UTF8 Encoding.
	nencoding = 0
	Name = "wwxml"

	*-- Determines whether a SQL connection is to be kept alive internally
	lsqlpersistconnection = .F.


	*-- Converts a live reference of an object to XML. All variables are converted to text and stored. Optionally can walk nested objects.
	PROCEDURE objecttoxml
		LPARAMETER loObject, lcName, lnIndent, llNoHeader
		LOCAL lnX, lnCount, lcOutput, lcField, lcType, lvValue, lcSchemaurl
		LOCAL ARRAY laFields[1]
		 
		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF EMPTY(lnIndent)
		   lnIndent=0
		ENDIF

		IF EMPTY(lcName)
		   IF TYPE("loObject.BaseClass") # "U" AND TYPE("loObject.Class") # "U"
		      lcName = LOWER(loObject.CLASS)
		   ELSE
		      lcName = "class"
		   ENDIF
		ENDIF

		*** Check if we need to add the XML header
		IF !llNoHeader
		   *** Standard header or the one you've set!
		   lcOutput = THIS.cXMLHeader
		ELSE
		   lcOutput = ""
		ENDIF


		IF ISNULL(loObject)
		   RETURN lcOutput + "<"+lcName+">NULL</"+lcName+">" +CRLF + "</" + THIS.cDocRootName + ">"
		ENDIF

		*** Backwards compatibility
		IF THIS.lcreatedatastructure
		   THIS.ncreatedatastructure = 2
		ENDIF

		DO CASE
		   *** DTD code
		   CASE THIS.ncreatedatastructure = 2
		      lcOutput = lcOutput +  ;
		         "<!DOCTYPE " + THIS.cDocRootName + " [" + CRLF + ;
		         "<!ELEMENT " + THIS.cDocRootName + " (" + lcName + ")>" + CRLF + ;
		         THIS.CreateObjectStructureDTD(loObject,lcName) + CRLF + ;
		         "]>" + CRLF + ;
		         "<" + THIS.cDocRootName + ">" + CRLF
		   *** Schema Code
		   CASE THIS.ncreatedatastructure = 1
		      lcOutput =  lcOutput +  "<" + THIS.cDocRootName + ">" + CRLF + ;
		         THIS.createobjectstructureschema(loObject,lcName,THIS.cSchemaName)
		   OTHERWISE
		      *** No Data structure
		      lcOutput = lcOutput +  "<" + THIS.cDocRootName + ">" + CRLF
		ENDCASE

		IF THIS.ncreatedatastructure = 1
		   *** Generating embedded schema - make sure name and link match
		   lcSchemaUrl = "#" + THIS.cschemaname
		ELSE   
		   *** Otherwise use the external schema specified
		   lcSchemaUrl = THIS.cSchemaUrl
		ENDIF   

		THIS.cBody = lcOutput + THIS.CreateObjectXML(loObject,lcName,lnIndent + 1, lcSchemaURL) +  ;
		   "</" + THIS.cDocRootName + ">" + CRLF

		RETURN THIS.cBody
	ENDPROC


	*-- Assumes the XML document is a simple single 'record' object. In this case native code extracts the value of an XML item. Note: Only a single entry should exist.
	PROCEDURE getobjvar
		LPARAMETER lcItem, lcXMLDoc
		LOCAL lcValue
		IF EMPTY(lcXMLDoc)
		  lcValue = Extract(THIS.cBody,"<"+lcItem+">","</"+lcItem+">")
		ELSE
		  lcValue =  Extract(@lcXMLDoc,"<"+lcItem+">","</"+lcItem+">")
		ENDIF

		IF AT("<![CDATA[",lcValue) > 0
		   lcValue = Extract(lcValue,"<![CDATA[","]]>")  
		ENDIF
		   
		RETURN lcValue
	ENDPROC


	*-- Converts a cursor into an XML representation.
	PROCEDURE cursortoxml
		LPARAMETER lcName, lcRowName, lnIndent, llNoHeader
		LOCAL lcOutput, lnFields,lnX

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF !llNoHeader
		   lcOutput = THIS.cXMLHeader
		ELSE
		   lcOutput = ""
		ENDIF

		IF EMPTY(lcName)
		   lcName = LOWER(ALIAS())
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF
		IF EMPTY(lnIndent)
		   lnIndent = 0
		ENDIF


		IF THIS.lCreateDatastructure
		   THIS.nCreateDatastructure = 2
		ENDIF

		DO CASE
		   CASE THIS.nCreateDataStructure = 0
		       lcOutput = lcOutput + REPLICATE(CHR(9) , lnIndent) + "<" + THIS.cDocRootname + ">" + CRLF
		   CASE THIS.nCreateDatastructure = 1  && Schema
		      lcOutput = lcOutput + "<" + THIS.cdocrootname + ">" + CRLF + ;
		                 THIS.createdatastructureschema(lcName,lcRowName,,THIS.cSchemaName) 
		                 
		   CASE THIS.nCreateDatastructure = 2  && DTD
		      lcOutput = lcOutput + ;
		         "<!DOCTYPE " + THIS.cDocRootName + " [" + CRLF + ;
		         "<!ELEMENT " + THIS.cDocRootName + " (" + lcName + ")>" + CRLF + ;
		         THIS.CreateDataStructureDTD(lcName, lcRowName) + CRLF + ;
		         "]>" + CRLF + CRLF

		       lcOutput = lcOutput + REPLICATE(CHR(9), lnIndent) + "<" + THIS.cDocRootName + ">" + CRLF
		ENDCASE

		*** Add a Schema link
		lcSchemaUrl = ""
		IF THIS.ncreatedatastructure = 1
		   lcSchemaUrl = "#" + THIS.cSchemaName
		ELSE
		   lcSchemaUrl = THIS.cSchemaUrl   
		ENDIF
		   
		lcOutput = lcOutput + THIS.CreateCursorXML(lcName, lcRowName, lnIndent,lcSchemaUrl)

		RETURN lcOutput + CRLF +;
		   REPLICATE(CHR(9) , lnIndent) + "</" + THIS.cDocRootName + ">" + CRLF
	ENDPROC


	*-- Converts an XML document created with CursorToXML back into a cursor.
	PROCEDURE xmltocursor
		LPARAMETER lvXML, lcAlias, lnTableRootLevel
		LOCAL loXML, lnX, lnSize, lcCreate, loCursor, loData

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF  VARTYPE(lvXML) = "C"
		   IF EMPTY(lvXML)  
		      THIS.lError = .T.
		      THIS.cErrorMsg = "No XML input passed."
		      RETURN .F.
		   ENDIF

		   *** Stupid ass parser can't differentiate UTF-8 from ASCII
		   *** Note: Parser will properly encode ASCII/ANSI doc without
		   ***       the header.
		   lvXML = STRTRAN(lvXML,[encoding="UTF-8"],"")
		ELSE
		   IF TYPE("lvXML.Async") # "L"
		      THIS.lError = .T.
		      THIS.cErrorMsg = "No XML input passed."
		      RETURN .F.
		   ENDIF
		ENDIF

		IF EMPTY(lcAlias)
		   lcAlias = "__wwXML"
		ENDIF

		IF VARTYPE(lvXML) # "O"
		   loXML = CREATEOBJECT(XML_XMLDOM_PROGID)
		   loXML.LoadXML( lvXML )
		ELSE
		   *** Input object must be IE 5 XML object
		   loXML = lvXML
		ENDIF

		*** Required to preserve leading spaces
		loXML.PreserveWhiteSpace = .T.

		*** Check for parsing error
		IF !EMPTY(loXML.ParseError.reason)
		   THIS.lerror = .T.
		   THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		      "Line: " + TRANSFORM(loXML.ParseError.LINE) + CRLF +;
		      loXML.ParseError.SrcText
		   RETURN .F.
		ENDIF


		*** get the root element node
		loDocRoot = loXML.DocumentElement
		IF ISNULL(loDocRoot)
		   THIS.lError = .T.
		   THIS.cErrorMsg = "Invalid XML Doc root. Data must be in child of document root."
		   RETURN .F.
		ENDIF

		IF !EMPTY(lnTableRootLevel)
		   *** Level 1 is Docroot
		   loCursor = loDocRoot
		   FOR lnX=2 TO lnTableRootLevel
		      loCursor = loCursor.ChildNodes(0)
		      IF ISNULL(loCursor)
		         THIS.cErrorMsg = "Invalid XML Structure"
		         RETURN .F.
		      ENDIF

		      *** Handle Schemas - schema is embedded and thus is an XML node/fragment
		      *** that we need to skip over
		      IF loCursor.NodeName = "Schema"
		         loCursor = loCursor.nextSibling
		      ENDIF
		   ENDFOR
		ELSE
		   loCursor = loDocRoot.ChildNodes(0)
		   IF ISNULL(loCursor)
		      THIS.lError = .T.
		      THIS.cErrorMsg = "Invalid XML Structure"
		      RETURN .F.
		   ENDIF

		   *** Handle Schemas - schema is embedded and thus is an XML node/fragment
		   *** that we need to skip over
		   IF loCursor.NodeName = "Schema"
		      loCursor = loCursor.nextSibling
		   ENDIF
		ENDIF
		 
		IF !USED(lcAlias)
		   *** Assume <?xml..><root><schema>*<table>*<row><columns>
		   IF !THIS.BuildCursorFromXML(loCursor,lcAlias)
		      RETURN .F.
		   ENDIF
		ELSE
		   SELE (lcAlias)
		ENDIF

		*** Now append the data from the XML
		*** Assume <?xml..><root><schema>*<table>*<row><columns>
		RETURN THIS.ParseXMLToCursor(loCursor)
	ENDPROC


	*-- Creates a data DTD into THIS.cDTD property. This property contains the structure of a CursorToXML table.
	PROCEDURE createdatastructurexml
		LPARAMETER lcName, lnIndent
		LOCAL lcOutput, lnX, lcRow

		IF EMPTY(lnIndent)
		  lnIndent = 0
		ENDIF

		lcOutput = ""

		lnFields = AFIELDS(laFields)
		FOR lnX=1 to lnFields
		   lcRow = ""
		   lcRow = lcRow + ;
		              REPLICATE(CHR(9),lnIndent+1) + "<field" +  ;
		              [ name="] + lower(laFields[lnX,1]) + ["] + ;
		              [ type="] + THIS.FoxTypeToXMLType(laFields[lnX,2]) + ["]  + ;
		              [ size="] + TRANSF(laFields[lnX,3]) + ["]  

		   IF !EMPTY(laFields[lnX,4])              
		      lcRow = lcRow +  [ precision="] + TRANSF(laFields[lnX,4]) + ["] 
		   ENDIF
		   lcOutput = lcOutput + lcRow +;
		                         "/>" + CRLF 
		ENDFOR

		RETURN  REPLICATE(CHR(9),lnIndent) + "<datastructure" + ;
		        IIF(!EMPTY(lcName),[ Name="]+  lcName + ["],"")+">" + CRLF + ;
		        lcOutput + ;
		        REPLICATE(CHR(9),lnIndent) + "</datastructure>" + CRLF            
	ENDPROC


	PROCEDURE createcursorxml
		PARAMETER lcName, lcRowName, lnIndent, lcSchema
		LOCAL lcOutput, lnFields, lnX, lvValue, lcValue, lcFieldName, lcFieldType
		LOCAL lcOldCentury, lcTime, lcOldHours, lcOldDate, lcOldMark, lnEncoding
		LOCAL lcXML

		IF EMPTY(lcName)
		   lcName = LOWER( ALIAS() )
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF
		IF EMPTY(lnIndent)
		   lnIndent = 0
		ENDIF
		IF EMPTY(lcSchema)
		   lcSchema = ""
		ENDIF

		*** Use VFP's internal XML creation and fix up for wwXML formatting
		IF wwVFPVersion > 6
		   lcXML = ""
		   lnEncoding = 32  && none
		   IF THIS.nEncoding = 1
		      lnEncoding = 48
		   ENDIF
		   lcAlias = LOWER( ALIAS() )
		   CURSORTOXML(lcAlias,"lcxml",1,lnEncoding,0)

		   lcXML = STRTRAN(lcXML,;
		      [<?xml version = "1.0" encoding="UTF-8" standalone="yes"?>] + CHR(13)+CHR(10),;
		      [])
		   lcXML = STRTRAN(STRTRAN(lcXML,"<" + lcAlias + ">","<" + lcRowName + ">"),;
		      "</" + lcAlias + ">","</" + lcRowName  + ">")

		   lcXML = STRTRAN(lcXML,[<VFPData>],[<] + lcName + ;
		      IIF(!EMPTY(lcSchema),[ xmlns="x-schema:] + lcSchema  + ["],[]) + ;
		      [>])

		   lcXML = STRTRAN(lcXML,[VFPData>], lcName + [>])

		   *** Fix up for XDR schema from XSD
		   RETURN  STRTRAN(STRTRAN(lcXML,">true<",">1<"),">false<",">0<")
		ENDIF


		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lcOldMark = SET("MARK")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET MARK TO "-"

		lnFields = AFIELDS(laFieldList)

		lcOutput = REPLICATE(CHR(9),lnIndent) + [<] + lcName + ;
		   IIF(!EMPTY(lcSchema),[ xmlns="x-schema:] + lcSchema  + ["],[]) +[>] + CRLF

		*** Now loop through table
		SCAN
		   *** Build a Field String
		   lcValue=""

		   lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcRowName + ">"+CRLF
		   FOR lnX=1 TO lnFields
		      lcFieldName=LOWER(laFieldList[lnX,1])
		      lcFieldType=laFieldList[lnX,2]

		      *** Skip Memo fields
		      IF lcFieldType = "G"
		         LOOP
		      ENDIF

		      lvValue=EVAL(lcFieldName)

		      DO CASE
		         CASE ISNULL(lvValue)
		            lcValue="NULL"
		         CASE lcFieldType = "C" OR lcFieldType = "M" OR lcFieldType="V"
		            IF EMPTY(lvValue)
		               lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcFieldName + "/>" + CRLF
		               LOOP
		            ELSE
		               IF "&" $ lvValue
		                  lvValue = STRTRAN(TRIM(lvValue),"&","&amp;")
		               ENDIF
		               IF  ">" $ lvValue
		                  lvValue = STRTRAN(lvValue,">","&gt;")
		               ENDIF
		               IF "<" $ lvValue
		                  lvValue = STRTRAN(lvValue, "<", "&lt;")
		               ENDIF
		               lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcFieldName + ">" + ;
		                  TRIM(lvValue) + ;
		                  "</" + lcFieldName + ">" + CRLF
		               LOOP
		            ENDIF
		         CASE lcFieldType="L"
		            IF THIS.lUseFoxTypes
		               lcValue=IIF(lvValue,".T.",".F.")
		            ELSE
		               lcValue=IIF(lvValue,"1","0")
		            ENDIF
		         CASE lcFieldType = "D"
		            IF EMPTY(lvValue)
		               lcValue =""
		            ELSE
		               lcValue = DTOC(lvValue)
		            ENDIF
		         CASE lcFieldType = "T"

		            IF !EMPTY(lvValue)
		               lcValue = STRTRAN(TTOC(lvValue)," ","T")
		               *lcValue = TTOC(lvValue)
		               *lcTime = TTOC(lvValue)
		               *lcValue = DTOS(lvValue) + "T" + SUBSTR(lcTime,AT(" ",lcTime)+1)
		            ELSE
		               lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcFieldName + "/>" + CRLF
		               LOOP
		            ENDIF
		         CASE lcFieldType = "Y"
		            lcValue = LTRIM(TRANSFORM(lvValue,""))
		         OTHERWISE
		            lcValue = TRANSFORM(lvValue)
		      ENDCASE

		      lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcFieldName + ">" +;
		         lcValue + "</" + lcFieldName + ">" + CRLF
		   ENDFOR && lnX=1 TO lnFields

		   lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "</" + lcRowName + ">"+CRLF
		ENDSCAN

		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET MARK TO (lcOldMark)

		IF THIS.nEncoding = 1
		   RETURN THIS.EncodeXML(lcOutput + REPLICATE(CHR(9),lnIndent) + "</"+ lcName + ">" + CRLF)
		ENDIF

		RETURN lcOutput + REPLICATE(CHR(9),lnIndent) + "</"+ lcName + ">" + CRLF
	ENDPROC


	*-- Creates XML for  the type interface about the object data.
	PROCEDURE createobjectstructurexml
		LPARAMETER loObject, lcName, lnIndent
		LOCAL lnPropCount, lnX, lcProperty, lcOutput


		IF EMPTY(lcName)
		   IF VARTYPE(loObject.CLASS) = "C"
		      lcName = loObject.CLASS
		   ELSE
		      lcName = "object"
		   ENDIF
		ENDIF
		IF EMPTY(lnIndent)
		   lnIndent = 0
		ENDIF

		lcOutput = ""
		lnPropCount = AMEMBERS(laProperties,loObject)
		FOR lnX = 1 TO lnPropCount
		   lcProperty = lower(laProperties[lnX])
		   IF  "'" + lcProperty + "," $ "," + THIS.cPropertyExclusionList + ","
		      LOOP
		   ENDIF
		   lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent+1) + ;
		      [<property name="] + lcProperty + [" type="] + ;
		      THIS.FoxTypeToXMLType(TYPE("loObject." + lcProperty)) + ["/>] + CRLF
		ENDFOR

		RETURN REPLICATE(CHR(9),lnIndent) + [<objectstructure name="] + lcName + [">] + CRLF +;
		   lcOutput + ;
		   REPLICATE(CHR(9),lnIndent) + [</objectstructure>] + CRLF
	ENDPROC


	*-- Creates XML for a single object
	PROCEDURE createobjectxml
		LPARAMETER loObject, lcName, lnIndent, lcSchema
		LOCAL lcOutput, lnX, lnCount, laFields(1), lcField, lcType, lcOldDate, lnOldHours,;
		      lcOldCentury, lcOldMark, lcTemp, lcDispField, lcBaseClass, llIsEmptyObject, lcClass

		LOCAL ARRAY laArray(1)
		EXTERNAL ARRAY la_array

		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lcOldMark = SET("MARK")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET MARK TO "-"

		IF VARTYPE(lnIndent) # "N"
		  lnIndent = 0
		ENDIF
		IF EMPTY(lcSchema)
		   lcSchema = ""
		ENDIF

		*** Empty or SCATTER name objects should never be filtered
		lcClass=""
		if wwVFPVersion > 7
		   IF TYPE("loObject.BaseClass") = "C"
		      llIsEmptyObject = .F.
		      lcClass = [ type="object" class="] + LOWER(loObject.Class) + ["]
		   ELSE 
		      llIsEmptyObject = .T.
		      lcClass = [ type="object" class="empty"]
		   ENDIF   
		ENDIF

		lnCount = AMEMBERS(laFields, loObject)


		lcOutput = REPLICATE(CHR(9),lnIndent) + [<] + lcName + ;
		   IIF(!EMPTY(lcSchema),[ xmlns="x-schema:] + lcSchema  +["],[]) + ;
		   lcClass + [>] + CRLF

		FOR lnX=1 TO lnCount
		   lcField = LOWER(laFields[lnX])

		   *** Handle property exclusions
		   IF AT("," + lcField + ",","," + THIS.cPropertyExclusionList + ",")>0
		      LOOP
		   ENDIF

		   *** Get single type and field values
		   lcType = TYPE("loObject."+lcField)
		   lvValue =  EVAL("loObject."+lcField)

		   IF THIS.lStripTypePrefix
		      lcDispField = SUBSTR(lcField,2)
		   ELSE
		      lcDispField = lcField
		   ENDIF

		   DO CASE
		         *** Funky check for array (Aaargh, I hate this slow code!!!!
		         *** and it has to fire first!
		      CASE TYPE([ALEN(loObject.] + lcField + [)]) = "N"
		         IF THIS.lRecurseObjects
		            DIMENSION la_array[1]
		            ACOPY(loObject.&lcField,la_array)
		            
		            *** THIS CODE MUST BE ON 2 lines of VFP gets confused
		            lcTemp = THIS.CreateArrayXML(@la_array,lcDispField,,lnIndent+1)
		            lcOutput = lcOutput + lcTemp
		         ELSE
		            lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcDispField + ">(array)</" + lcDispField + ">" + CRLF
		         ENDIF
		      CASE ISNULL(lvValue)
		         IF THIS.lSkipEmptyElements
		            LOOP
		         ENDIF
		         lcOutput = lcOutput +  REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">NULL</"+lcDispField+">" + CRLF
		      CASE lcType = "C"
		         IF EMPTY(lvValue) AND THIS.lSkipEmptyElements
		            LOOP
		         ENDIF
		         IF "&" $ lvValue
		            lvValue = STRTRAN(TRIM(lvValue),"&","&amp;")
		         ENDIF
		         IF  ">" $ lvValue
		            lvValue = STRTRAN(lvValue,">","&gt;")
		         ENDIF
		         IF "<" $ lvValue
		            lvValue = STRTRAN(lvValue, "<", "&lt;")
		         ENDIF
		         lcOutput = lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">" + ;
		            TRIM(lvValue) +"</"+lcDispField+">" + CRLF
		         LOOP
		   CASE lcType = "D"
		      IF EMPTY(lvValue)
		         IF THIS.lSkipEmptyElements
		            LOOP
		         ENDIF
		         lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + "></"+lcDispField+">" + CRLF
		      ELSE
		         lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">"  +;
		            TRANSFORM(lvValue) + "</"+lcDispField+">" + CRLF
		      ENDIF
		   CASE lcType = "T"
		      IF EMPTY(lvValue)
		         IF THIS.lSkipEmptyElements
		            LOOP
		         ENDIF
		         lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + "></"+lcDispField+">" + CRLF
		      ELSE
		         lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">"  + STRTRAN(TRANSFORM(lvValue)," ","T") + "</"+lcDispField+">" + CRLF
		      ENDIF
		   CASE lcType = "L"
		      lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcDispField + ">" +;
		         IIF( lvValue, "1","0") + "</" + lcDispField + ">" + CRLF

		   CASE lcType = "O"
		      IF THIS.lRecurseObjects
		         *** The following *MUST* be separate line or else VFP gets confused
		         *** in the recursion levels and generates invalid fields
		         IF TYPE("lvValue.BaseClass")="C" AND lvValue.BaseClass = "Collection"
		    	     lcTemp = THIS.CreateCollectionXML(lvValue,lcDispField,"item",lnIndent +1)
		         ELSE
			         lcTemp= THIS.CreateObjectXML( lvValue,lcDispField,lnIndent+1)
			     ENDIF
		         lcOutput = lcOutput + lcTemp
		      ELSE
		         lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent+1) + "<" +lcDispField + ">(Object)</"+lcDispField+">" + CRLF
		      ENDIF
		   CASE lcType = "Y"
		      lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">"  + TRANSFORM(lvValue,"") + "</"+lcDispField+">" + CRLF
		   CASE lcType = "U" 
		      lcOutput = lcOutput +  REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">NULL</"+lcDispField+">" + CRLF
		   OTHERWISE
		      lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent+ 1) + "<" +lcDispField + ">"  + TRANSFORM(lvValue) + "</"+lcDispField+">" + CRLF
		ENDCASE
		ENDFOR

		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET MARK TO (lcOldMark)

		IF THIS.nEncoding = 1
		   RETURN THIS.EncodeXML(lcOutput + ;
		      REPLICATE(CHR(9),lnIndent) + "</" + lcName + ">" + CRLF)
		ENDIF

		RETURN lcOutput + ;
		   REPLICATE(CHR(9),lnIndent) + "</" + lcName + ">" + CRLF
	ENDPROC


	*-- Creates an object from an XML structure.
	PROCEDURE xmltoobject
		LPARAMETER lvXML, loObject, llParseCaseInsensitive
		LOCAL loXML, loNode, loDocroot

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF NOT INLIST(VARTYPE(lvXML),"O","C")
		    THIS.lError = .T.
		    THIS.cErrorMsg = "No XML input passed."
			RETURN .NULL.
		ENDIF

		IF VARTYPE(lvXML) # "O"
		  loXML = CREATEOBJECT(XML_XMLDOM_PROGID)
		  loXML.LoadXML( lvXML )
		ELSE
		  *** Input object must be IE 5 XML object
		  loXML = lvXML  
		ENDIF

		*** Check for parsing error
		IF !EMPTY(loXML.ParseError.reason) 
		   THIS.lError = .T.
		   THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		                    "Line: " + TRANSFORM(loXML.ParseError.Line) + CRLF +;
		                    loXML.ParseError.SrcText
		   RETURN .NULL.
		ENDIF

		*** Make sure spaces are returned properly
		loXML.PreserveWhiteSpace = .T.

		*** get the Document root element node - <objects>
		*loXMLObjects = loXML.ChildNodes(1)

		*** get the root element node
		loDocRoot = loXML.DocumentElement
		IF ISNULL(loDocRoot)
		    THIS.lError = .T.
		   THIS.cErrorMsg = "Invalid data root. Data must be in child of document root."
		   RETURN .NULL.
		ENDIF

		IF VARTYPE(loObject) # "O"
			loNode = loDocRoot.ChildNodes(0)
		   IF loNode.NodeName = "Schema"
		      loNode = loNode.NextSibling
		   ENDIF
		   
		   loObject = THIS.BuildObjectFromXML(loNode)
		   IF ISNULL(loObject)
		      RETURN NULL
		   ENDIF
		ENDIF

		loNode = loDocRoot.ChildNodes(0)
		IF loNode.NodeName = "Schema"
		   loNode = loNode.NextSibling
		ENDIF

		RETURN THIS.ParseXMLToObject( loNode,loObject, llParseCaseInsensitive )
	ENDPROC


	*-- Changes FoxPro types to XML types
	PROCEDURE foxtypetoxmltype
		LPARAMETER lcFoxType

		IF THIS.lUseFoxTypes
		   RETURN lcFoxType
		ENDIF

		DO CASE
		   CASE lcFoxType = "C" OR lcFoxType = "M"
		      lcType = "string"
		   CASE lcFoxType $ "N" or lcFoxType $ "F" 
		      lcType = "float"
		   case lcFoxType $ "YB"
		      lcType = "number"
		   CASE lcFoxType = "L"
		      lcType = "boolean"
		   CASE lcFoxType = "I"
		      lcType = "i4"
		   CASE lcFoxType = "D"
		      lcType = "date"
		   CASE lcFoxType = "T"
		      lcType = "dateTime"
		   CASE lcFoxType = "O"
		      lcType = "object"

		   OTHERWISE
		      lcType = lcFoxType
		ENDCASE

		RETURN lcType
	ENDPROC


	*-- Changes XML Types to Fox Types.
	PROCEDURE xmltypetofoxtype
		LPARAMETER lcXMLtype

		*** Data is in Fox format already - just return it
		IF THIS.lUseFoxTypes
		   RETURN lcXMLType
		ENDIF   

		*** Strip off any namespace
		lcXMLType = LOWER(SUBSTR(lcXMLType,AT(":",lcXMLType) + 1))

		DO CASE
		   CASE lcXMLType $ "string,char,uri,uuid"
		      lcType = "C"
		   CASE lcXMLType $ "number,decimal,single,double,r4,r8,float,fixed.14.4,float.IEEE.754.32,float.IEEE.754.64" 
		      lcType = "N"
		   CASE lcXMLType $ "integer,i4,i1,i2,i8,ui2,ui4,ui8"
		      lcType = "I"
		   CASE lcXMLType = "boolean"
		      lcType = "L"
		   CASE lcXMLType = "object"
		      lcType = "O"
		   CASE lcXMLType $ "date,date.tz"
		      lcType = "D"
		   CASE lcXMLType $ "datetime,datetime.tz"
		      lcType = "T"
		   CASE lcXMLType = "record" 
		      lcType = "O"
		   CASE lcXMLType $ "base64Binary,bin.hex,base64binary"
		      lcType = "B"  && Binary types may need different handling
		   OTHERWISE
		*      lcType = "C"
		      lcType = "O"
		ENDCASE

		RETURN lcType
	ENDPROC


	*-- Process method that parses an XML object into an existing object
	PROCEDURE parsexmltoobject
		LPARAMETER loXMLObject, loObject, llParseCaseInsensitive
		LOCAL lnSize, lnX, loObject, lcField, lcType, lnProperties, loProperty,laProperties[1]
		LOCAL lcOldDate, lcOldHours, lcOldCentury, lnOldStrictDate, loProperty

		IF ISNULL(loXMLObject)
		   THIS.cErrorMsg = "No data provided for element"
		   RETURN .NULL.
		ENDIF
		IF VARTYPE(loObject) # "O"
		   THIS.cErrorMsg = "No input object provided"
		   RETURN .NULL.
		ENDIF

		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lnOldStrictDate = SET("STRICTDATE")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET STRICTDATE TO 0

		*** Walk the object and then pull properties 
		*** from the XML to repopulate it
		lnProperties = AMEMBERS(laProperties,loObject)

		lnX=0
		FOR lnX=1 TO lnProperties
		   *** Get field name and type info
		   lcField = lower(laProperties[lnX])
		   IF THIS.lStripTypePrefix
		      lcXMLField = SUBSTR(lcField,2)
		   ELSE
		      lcXMLField = lcField
		   ENDIF

		   IF "," + lcField + "," $ this.cPropertyexclusionlist 
		      LOOP
		   ENDIF

		   lcType = TYPE("loObject." + lcField)
		    
		   *** Retrieve the XML node for the item
		   loProperty = loXMLObject.SelectSingleNode(lcXMLField)
		   
		   IF ISNULL(loProperty)
			  *** Parse Case Sensitively - NOTE THIS IS SLOW!
			  IF llParseCaseInsensitive
			  	 FOR EACH Tnode IN loXMLObject.ChildNodes
					 IF LOWER(TNode.nodeName) = lcXMLField
					 	loProperty = TNode
					 	EXIT
					 ENDIF
			  	 ENDFOR
			  	 IF ISNULL(loProperty)
			  	    LOOP
			  	 ENDIF
			  ELSE
			  	LOOP	  	 
			  ENDIF
		   ENDIF
		   lcValue = loProperty.TEXT

		   DO CASE
		   	  CASE lcValue == "NULL"   	  
		   	  	  STORE .null. TO ("loObject." + lcField)
		   	     
		      *** Arrays only support object arrays
		      *** Object must already exist in first element
		      CASE THIS.lRecurseObjects AND ;
		              TYPE("ALEN(loObject." + lcField + ")") == "N"        
		            DIMENSION laArray[1]
		            laArray[1] = EVAL("loObject." + lcField + "[1]")
		            THIS.ParseXMLToArray(loProperty,@laArray,llParseCaseInsensitive)
		            ACOPY(laArray,loObject.&lcField)
		            
		      CASE lcType $ "CM"
		         *loObject.&lcField =  STRTRAN(lcValue,"&#00;",CHR(0))
		         STORE STRTRAN(lcValue,"&#00;",CHR(0)) TO ("loObject." + lcField)
		      CASE lcType $ "NIFY"
		         *loObject.&lcField = VAL(lcValue)
		         STORE VAL(lcValue) TO ("loObject." + lcField)
		      CASE lcType = "T"
		         *loObject.&lcField = CTOT(STRTRAN(lcValue,"T"," "))
				 IF wwVFPVersion > 6
		            STORE CTOT(lcValue) TO ("loObject." + lcField)
		         ELSE
		            STORE CTOT(STRTRAN(lcValue,"T"," ")) TO ("loObject." + lcField)
		         ENDIF
		      CASE lcType = "D"
				  IF wwVFPVersion > 6
		            STORE TTOD(CTOT(lcValue)) TO ("loObject." + lcField)
		         ELSE
		            STORE TTOD(CTOT(STRTRAN(lcValue,"T"," "))) TO ("loObject." + lcField)
		         ENDIF         *loObject.&lcField = CTOD(lcValue)
		         *STORE CTOD(lcValue) TO ("loObject." + lcField)
		         *STORE TTOD(CTOT(STRTRAN(lcValue,"T"," "))) TO ("loObject." + lcField)
		      CASE lcType = "L"
		         IF lcValue = "1" or lcValue = "true"
		            STORE .T. TO ("loObject." + lcField)
		         ELSE
		            STORE .F. TO ("loObject." + lcField)
		         ENDIF
		      CASE THIS.lRecurseObjects and lcType = "O"
		      	   loTObject = EVAL("loObject." + lcField)
		            
		      	   IF TYPE("loTObject.BaseClass") = "C" AND loTObject.Baseclass = "Collection"
		      	   	   THIS.ParseXmlToCollection(loProperty,loTObject)
		      	   ELSE
			           THIS.ParseXMLToObject(loProperty, loTObject, llParseCaseInsensitive )
			       ENDIF
		      OTHERWISE
		         *** If we have an object
		         loObject.&lcField = .NULL.
		         STORE .NULL. TO ("loObject." + lcField)
		         *** OTHERWISE  && Do nothing
		   ENDCASE
		ENDFOR


		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET STRICTDATE TO lnOldStrictDate

		RETURN loObject
	ENDPROC


	*-- Uses the structure information of to build an object on the fly.
	PROCEDURE buildobjectfromxml
		LPARAMETER loObjectStructure
		LOCAL loObject, llFirstPass

		loObject = .NULL.

		IF wwVFPVersion > 7
		   IF THIS.cObjectClass = "wwLight"
		      this.cObjectClass = "Empty"
		   ENDIF
		ENDIF

		loObject = CREATE(THIS.cObjectClass)

		llFirstPass = .T.
		FOR EACH loField IN loObjectStructure.ChildNodes
		   loAttributes = loField.ATTRIBUTES
		   lcField = loField.NodeName
		   
		   IF llFirstPass
		      IF ISNULL(loAttributes.GetNamedItem("type"))
		         this.cErrorMsg = "Can't build object without a schema or DTD."
		         RETURN NULL
		      ENDIF
		      llFirstPass=.F.
		   ENDIF
		   
		   #IF wwVFPVersion > 7
		       ADDPROPERTY(loObject,lcField)
		   #ELSE
		      loObject.ADDPROPERTY(lcField)
		   #ENDIF
		   
		   lcType = THIS.XMLTypeToFoxType(loAttributes.GetNamedItem("type").TEXT)
		   DO CASE
		      CASE lcType = "C"
		         loObject.&lcField = ""
		      CASE lcType = "N"
		         loObject.&lcField = 0
		      CASE lcType = "L"
		         loObject.&lcField = .F.
		      CASE lcType $ "D"
		         loObject.&lcField = {}
		      CASE lcType $ "T"
		         loObject.&lcField = {  /  /  :  }
		      CASE lcType = "U"
		         loObject.&lcField = .NULL.
		*      CASE lcType = "O"
		*         loObject.&lcField = .NULL.
		      OTHERWISE 
		         *** Must create an object first then set to .NULL.         
		         *** to get Fox to read the type right
		         loObject.&lcField = CREATE("Relation")
		         loObject.&lcField = .NULL.
		   ENDCASE
		ENDFOR

		RETURN loObject
	ENDPROC


	*-- Parses an XML cursor into the cursor using an XML element base node as input.
	PROCEDURE parsexmltocursor
		LPARAMETER loData, llNodeList
		LOCAL lnFields, laFields(1),lnX, lcType, lcField, loValue
		LOCAL lcOldDate, lcOldHours, lcOldCentury, lnOldStrictDate

		#IF WWXML_USE_VFP_XMLTOCURSOR
		   *** Use the XML 
		   *** THIS CODE REQUIRES VFP7 SP1 or later!
		   LOCAL lcXML
		   lcXML = loData.XML

		   *** Have to strip namespace first to get rid
		   *** of wwXML schema   
		   IF ("xmlns=" $ LEFT(lcXML,40) )
		      lcXML = STRTRAN(lcXML,"xmlns=","_noxmlns=",1,1)
		   ENDIF
		   
		   XMLTOCURSOR( lcXML ,ALIAS(),8192)
		   RETURN .T.
		#ENDIF

		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lnOldStrictDate = SET("STRICTDATE")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET STRICTDATE TO 0

		lnFields = AFIELDS(laFields)

		IF llNodeList
		   *** Use the table level node <cursor><row><fields></row><row>...</row></table>
		   loRows = loData
		ELSE
		   *** Directly work with the rows   <row><fields></row><row>...</row>
		   loRows = loData.ChildNodes
		ENDIF

		FOR EACH loRow IN loRows
		   APPEND BLANK
		   FOR lnX = 1 TO lnFields
		      lcField = LOWER(laFields[lnX,1])
		      lcType  = laFields[lnX,2]

		      *** This code uses the parser for individual fields
		      loValue = loRow.SelectSingleNode(lcField)
		      IF ISNULL(loValue)
		         LOOP
		      ENDIF
		      lcValue = loValue.TEXT
		      loValue = 0
		      
		      DO CASE
		*!*            CASE lcValue = "NULL"
		*!*               lcValue = .null.
		         CASE lcType $ "CM"
		            *lcValue =
		         CASE lcType $ "NIF"
		            lcValue = VAL(lcValue)
		         CASE lcType = "T"
		            IF wwVFPVERSION >= 8
		               lcValue = CTOT(lcValue)  && VFP 7 includes native conversion routines
		            ELSE
		               lcValue = CTOT(SUBSTR(CHRTRAN(lcValue,"TZ"," "),1,16))
		            ENDIF
		         CASE lcType = "D"
		            lcValue = CTOD(STRTRAN(lcValue,"TZ"," "))
		         CASE lcType = "L"
		            IF THIS.lUseFoxTypes
		               lcValue = EVAL(lcValue)
		            ELSE
		               IF lcValue = "true" OR lcValue = "1"
		                  lcValue = .T.
		               ELSE
		                  lcValue = .F.
		               ENDIF
		            ENDIF
		         CASE lcType = "G"
		            *** Ignore 
		            LOOP
		         OTHERWISE
		            lcValue = EVAL(lcValue)
		      ENDCASE
		      REPLACE (lcField) WITH lcValue
		   ENDFOR
		ENDFOR

		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET STRICTDATE TO lnOldStrictDate

		RETURN .T.
	ENDPROC


	*-- Builds a cursor from the XML datastructure tags. Pass in the datastructure XML DOM element object.
	PROCEDURE buildcursorfromxml
		LPARAMETER loDataStructure, lcAlias
		LOCAL lnX, lnSize, laFields(1), loRecord, loSize

		IF !ISNULL(loDataStructure)
		   IF loDataStructure.ChildNodes.Length = 0
		      *** Try to read the schema instead
		      loSchema =loDataStructure.ownerDocument.DocumentElement.selectSingleNode("Schema")
		      IF !ISNULL(loSchema) AND ;
		         THIS.CreateCursorfromschema(loSchema,lcAlias)
		         RETURN .T.
		      ENDIF
		      THIS.cErrorMsg = "No rows available or schema missing."
		      THIS.lerror = .T.
		      RETURN .F.
		   ENDIF
		   
		   loRecord = loDataStructure.ChildNodes(0)
		   
		   *** Skip over Schema Record (SQL 2000 schema)
		   IF loRecord.nodeName="Schema"
		      loRecord = loRecord.nextSibling
		   ENDIF
		   
		   lnSize = loRecord.childnodes.LENGTH
		   DIMENSION laFields[lnSize,4]
		   lnX=0
		   FOR EACH loField IN loRecord.ChildNodes
		      lnX=lnX+1
		      loAttributes = loField.ATTRIBUTES
		      laFields[lnX,1] = loField.NodeName
		      loType = loAttributes.GetNamedItem("type")
		      IF ISNULL(loType)
		         loType = loAttributes.GetNamedItem("dt:type")
		      ENDIF
		      
		      laFields[lnX,2] = THIS.XMLTypeToFoxType(loType.TEXT)
		      
		      loSize = loAttributes.GetNamedItem("size")
		      IF !ISNULL(loSize)
		         laFields[lnX,3] = INT(VAL(loSize.TEXT))
		      ENDIF
		      
		      IF laFields[lnX,3] = XML_SCHEMA_MEMOSIZE
		      	 laFields[lnX,2] = "M"
		      	 laFields[lnX,3] = 0
		      ENDIF
		      
		      loPrecision = loAttributes.GetNamedItem("precision")
		      IF !ISNULL(loPrecision)
		         laFields[lnX,4] = VAL(loPrecision.TEXT)
		      ELSE
		         laFields[lnX,4] = 0
		      ENDIF
		      
		      *** Must check for memos by checking size
		      IF laFields[lnX,2] = "C" and laFields[lnX,3] = XML_SCHEMA_MEMOSIZE
		         laFields[lnX,2] = "M"
		         laFields[lnX,3] = "4"
		      ENDIF
		   ENDFOR

		   CREATE CURSOR (lcAlias) FROM ARRAY laFields
		ELSE
		   SELE (lcAlias)
		ENDIF
		RETURN .T.
	ENDPROC


	*-- Creates the DTD for a data definition. The definition is created only the data definition not a complete DTD. It's missing the DTD header and end as well as the root doc entity.
	PROCEDURE createdatastructuredtd
		LPARAMETER lcName, lcRowName, loRS
		LOCAL lcOutput, lnX, lcRow, lnSize, lnPrecision, lcType

		IF EMPTY(lcName)
		   lcName = lower(Alias())
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF

		lcSpace = SPACE(10)

		lcOutput = "<!ELEMENT " + lcName + " (" + lcRowName + ")*>" + CRLF

		IF VARTYPE(loRS) = "O"
		   DIMENSION laFields[1]
		   lnFields = THIS.ADOFields(loRS,@laFields)
		ELSE 
		   lnFields = AFIELDS(laFields)
		ENDIF

		lcOutput = lcOutput + "<!ELEMENT " + lcRowName + " (" 
		FOR lnX=1 to lnFields
		     laFields[lnX,1] = lower(laFields[lnX,1]) 
		     IF lnX < lnFields
		       lcOutput = lcOutput + laFields[lnX,1] + "," 
		     ELSE
		       lcOutput = lcOutput + laFields[lnX,1]
		     ENDIF
		ENDFOR
		lcOutput = lcOutput + ")>" + CRLF

		FOR lnX=1 to lnFields
		   lcType = laFields[lnX,2]
		   
		   *** Override length and precision
		   DO CASE
		      CASE lcType = "M"
		         lnSize = XML_SCHEMA_MEMOSIZE
		         lnPrecision = 0
		      CASE lcType = "Y"
		         lnSize = 20
		         lnPrecision = 4
		      CASE lcType = "G"
		         LOOP && Skip General Fields
		      OTHERWISE
		         lnSize = laFields[lnX,3]
		         lnPrecision = laFields[lnX,4]
		   ENDCASE

		   lcRow = ;
		           "<!ELEMENT " + laFields[lnX,1] + " (#PCDATA)>" + CRLF +;
		           "<!ATTLIST " + laFields[lnX,1] + CRLF + ;
		           lcSpace + 'type CDATA #FIXED "' + THIS.FoxTypeToXMLType(lcType) + '"' + CRLF+;
		           lcSpace + 'size CDATA #FIXED "' + TRANSF(lnSize) + '"' + CRLF 
		           
		   IF !EMPTY(lnPrecision)              
		      lcRow = lcRow +  ;
		           lcSpace + 'precision CDATA #FIXED "' + TRANSF(lnPrecision) + '"' + CRLF 
		   ENDIF
		   lcOutput = lcOutput + lcRow +;
		           '>' + CRLF
		ENDFOR

		RETURN  lcOutput
	ENDPROC


	*-- Creates the DTD portion of the Object. The definition is created only the data definition not a complete DTD. It's missing the DTD header and end as well as the root doc entity.
	PROCEDURE createobjectstructuredtd
		LPARAMETER loObject, lcName
		LOCAL lnPropCount, lnX, lcProperty, lcOutput, laFields(1)

		IF EMPTY(lcName)
		   IF VARTYPE(loObject.CLASS) = "C"
		      lcName = loObject.CLASS
		   ELSE
		      lcName = "object"
		   ENDIF
		ENDIF

		lcOutput = ""
		lnPropCount = AMEMBERS(laFields,loObject)

		lcSpace = SPACE(10)

		lcOutput = lcOutput + "<!ELEMENT " + lcName + " (" 
		FOR lnX=1 to lnPropCount
		     laFields[lnX] = lower(laFields[lnX]) 
		     lcProperty = laFields[lnX]
		     IF "," + lcProperty +  "," $ "'" + THIS.cPropertyExclusionList
		        LOOP
		     ENDIF
		     lcOutput = lcOutput + lcProperty + "," 
		ENDFOR
		lcOutput = LEFT(lcOutput,LEN(lcOutput)-1) + ")>" + CRLF

		FOR lnX=1 to lnPropCount
		   lcProperty = laFields[lnX]
		   IF "," + lcProperty +  "," $ "," + THIS.cPropertyExclusionList
		      LOOP
		   ENDIF
		   
		   lcType = TYPE("loObject." + lcProperty)
		   IF lcType = "O" and THIS.lRecurseObjects
		      lcOutput = THIS.CreateObjectStructureDTD(EVAL("loObject." + lcProperty),lcProperty) 
		      loop
		   ENDIF
		   lcOutput = lcOutput + ;
		           "<!ELEMENT " + lcProperty + " (#PCDATA)>" + CRLF +;
		           "<!ATTLIST " + lcProperty + " " + ;
		           'type CDATA #FIXED "' + THIS.FoxTypeToXMLType(lcType) + '" >' + CRLF           
		ENDFOR

		RETURN  lcOutput
	ENDPROC


	*-- Loads an XML string, assigns it to an instance of MS XML and returns a reference to the XML document object.
	PROCEDURE loadxml
		LPARAMETER lcXML, llAsync, llPreserveWhiteSpace
		LOCAL loXML

		THIS.lError = .f.
		THIS.cErrorMsg = ""

		this.oXml = null

		IF VARTYPE(lcXML) = "O"
		   *** Use existing ref if passed in
		   loXML = lcXML
		ELSE
		   lcXML=IIF(EMPTY(lcXML),"",lcXML)

		   IF VARTYPE(THIS.oXML) # "O"
		      *** Create if it doesn't exist already
		      loXML =  CREATE(XML_XMLDOM_PROGID)
		      loXML.Async = llAsync
		   ELSE
		      *** If we have one already - reuse it!
		      loXML = THIS.oXML
		      loXML.Async = llAsync
		   ENDIF
		   loXML.LoadXML(lcXML)
		ENDIF

		*** Check for parsing error
		IF TYPE("loxml.parseerror.reason")="C" AND ;
		   !EMPTY(loXML.ParseError.reason)
		      THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		         "Line: " + TRANSFORM(loXML.ParseError.LINE) + CRLF +;
		         loXML.ParseError.SrcText
		      THIS.lError = .T.
		      RETURN .NULL.
		ENDIF

		loXML.PreserveWhiteSpace = .T.

		this.oXML = loXML

		RETURN loXML
	ENDPROC


	*-- Converts the currently selected  VFP cursor to an ADO compatible XML document.
	PROCEDURE cursortoadoxml
		LPARAMETER lcName, lcRowName, lnIndent, llNoHeader
		*** all parameters are ignored here since this is a fixed proprietary format
		LOCAL lnX, lcOldDate, lnOldHours, lcOldCentury, lcXML, lnFields, lcT, lcType

		*** Must handle date formatting to force YMD ANSI format
		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		*** Standard ADO XML header - always the same
		lcXML = ;
		   [<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'] + CRLF + ;
		   [	xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'] + CRLF + ;
		   [	xmlns:rs='urn:schemas-microsoft-com:rowset'] + CRLF + ;
		   [	xmlns:z='#RowsetSchema'>] + CRLF + ;
		   [<s:Schema id='RowsetSchema'>] + CRLF + ;
		   [	<s:ElementType name='row' content='eltOnly'>] + CRLF

		*** Now add the Field name attribute types
		lnFields = AFIELDS(laFields)
		FOR lnX=1 TO lnFields
		   laFields[lnX,1] = LOWER(laFields[lnX,1])
		   lcXML = lcXML + [		<s:attribute type=']+laFields[lnX,1] + ['/>] + CRLF
		ENDFOR

		lcXML = lcXML + [		<s:extends type='rs:rowbase'/>] + CRLF + ;
		   [	</s:ElementType>] + CRLF

		*** Now add the actual field type information attributes
		FOR lnX=1 TO lnFields
		   lcType = laFields[lnX,2]
		   lcRecno = TRANS(lnX)
		   DO CASE
		      CASE lcType = "C"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + lcRecno + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='string' dt:maxLength=']+TRANSFORM(laFields[lnX,3])+[' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "M"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1]  + [' rs:NUMBER='] + lcRecno + [' rs:maydefer='true' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='string' dt:maxLength='] + TRANSFORM(XML_SCHEMA_MEMOSIZE) +[' rs:long='true' rs:maybenull='false'/>] + CRLF

		      CASE lcType = "N"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + lcRecno + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='number' dt:maxLength='] + TRANSF(laFields[lnX,3]) + [' rs:scale=']+ TRANSF(laFields[lnX,4]) + [' rs:precision='10' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "L"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + lcRecno + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='boolean' dt:maxLength='2' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "D"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + lcRecno + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='date' dt:maxLength='6' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "T"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + lcRecno + [' rs:writeunknown='true'>] + CRLF +;
		            [		<s:datatype dt:type='dateTime' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true' rs:maybenull='false'/>] +CRLF

		      *** Special Types
		      CASE lcType = "I"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + TRANS(lnX) + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='int' dt:maxLength='4' rs:precision='10' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "Y"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER=']+ trans(lnX) + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='i8' dt:maxLength='8' rs:precision='15' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "F"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + trans(lnX) + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='number' dt:maxLength='19' rs:scale='5' rs:precision='8' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF
		      CASE lcType = "B"
		         lcT = ;
		            [	<s:AttributeType NAME='] + laFields[lnX,1] + [' rs:NUMBER='] + trans(lnX) + [' rs:writeunknown='true'>] + CRLF + ;
		            [		<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true' rs:maybenull='false'/>] + CRLF

		      OTHERWISE
		         *** skip other fields for now
		         *** only General
		   ENDCASE

		   lcXML = lcXML +  lcT + [	</s:AttributeType>] + CRLF

		ENDFOR

		lcXML = lcXML + [</s:Schema>] + CRLF + ;
		   [<rs:data>]+ CRLF


		*** And now we can add the actual records 
		*** this is a single XML row with multiple attributes
		SCAN
		   lcXML = lcXML + [<z:row ]

		   FOR lnX=1 TO lnFields
		      lcXML =  lcXML + ;
		         laFields[lnX,1] + "='"

		      lvValue = EVAL( laFields[lnX,1] )
		      lcType = laFields[lnX,2]

		      DO CASE
		         CASE lcType="C" OR lcType = "M"
		            lcT = lvValue
		            lcT = STRTRAN(lcT,"#","&#x23;")
		            lcT = STRTRAN(lcT,"&","&#x26;")
		            lcT = STRTRAN(lcT,"'","&#x27;")
		            lcT = STRTRAN(lcT,"<","&#x3c;")
		            lcT = STRTRAN(lcT,">","&#x3e;")
		            lcT = STRTRAN(lcT,CHR(0),"&#x00;")
		         CASE lcType = "L"
		            lcT = IIF( lvValue, "True", "False")
		         CASE lcType = "Y"
		            lcT = LTRIM(STR(lvValue,15,4))
		         CASE lcType = "D"
		            IF EMPTY(lvValue)
		               lcT = "1899-12-30"  && Don't ask, but this is how ADO does it!
		            ELSE
		               lcT = TRANSFORM(lvValue)
		            ENDIF
		         CASE lcType = "T"
		            IF EMPTY(lvValue)
		               lcT = "1889-12-30T00:00:00"
		            ELSE
		               lcT = STRTRAN( TRANSFORM(lvValue)," ","T") 
		            ENDIF
		         OTHERWISE
		            lcT = TRANSF( lvValue )
		      ENDCASE

		      lcXML = lcXML + lcT + "' "
		   ENDFOR

		   lcXML = lcXML + "/>" + CRLF
		ENDSCAN

		*** Finish up the XML doc
		lcXML = lcXML + [</rs:data>] + CRLF + [</xml>] + CRLF


		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury

		RETURN lcXML
	ENDPROC


	*-- Creates an error structure block of XML. This block is not a free standing document, but meant to be embedded at any level.
	PROCEDURE createerrorxml
		LPARAMETER lcErrorMsg, lnErrorNumber, lnIndent
		LOCAL lcXML

		IF VARTYPE(lcErrorMsg) # "C"
		   RETURN ""
		ENDIF

		IF VARTYPE(lnIndent) # "N"
		   lnIndent = 1
		ENDIF

		lcXML = ;
		   REPL(CHR(9),lnIndent) + "<error>" + CRLF 

		lcXML = lcXML + THIS.AddElement("errormessage",TRIM(lcErrorMsg),lnIndent+1)

		IF VARTYPE(lnErrorNumber) = "N"
		   lcXML = lcXML + THIS.AddElement("errornumber",lnErrorNumber,lnIndent+1)
		ENDIF

		RETURN lcXML + REPL(CHR(9),lnIndent) + "</error>"
	ENDPROC


	*-- Special method that can parse XML into an existing object's properties. This method is provided to avoid the IE parser requirement on the client for object parsing. Note: The object must exist - no auto creation from the DTD is supported
	PROCEDURE xmltoobjectnoparser
		LPARAMETER lcXML, loObject
		LOCAL lnProperties, lnX, lcXMLField, lcField, lcType, lcValue 
		LOCAL laProperties[1]

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF EMPTY(lcXML)
		    THIS.cErrorMsg = "No XML input passed."
			RETURN .NULL.
		ENDIF
		IF VARTYPE(loObject) # "O"
		   THIS.cErrorMsg = "No input object passed."
		   RETURN .NULL.
		ENDIF


		*** Walk the object and then pull properties 
		*** from the XML to repopulate it
		lnProperties = AMEMBERS(laProperties,loObject)

		lnX=0
		FOR lnX=1 TO lnProperties
		   lcField = lower(laProperties[lnX])
		   IF AT("," + lcField + ",","," + THIS.cPropertyExclusionList)>0
		       LOOP
		   ENDIF
		   
		   IF THIS.lStripTypePrefix
		      lcXMLField = SUBSTR(lcField,2)
		   ELSE
		      lcXMLField = lcField
		   ENDIF
		   
		   IF ATC("<" + lcXMLField + ">",lcXML) = 0
		      LOOP
		   ENDIF
		   
		   lcType = TYPE("loObject."+lcField)
		   lcValue = THIS.GetObjVar(lcXMLField,lcXML)

		   DO CASE
		      CASE lcType $ "CM"
		         loObject.&lcField =  STRTRAN(lcValue,"&#00",CHR(0))
		      CASE lcType $ "NIF"
		         loObject.&lcField = VAL(lcValue)
		      CASE lcType = "T"
		         loObject.&lcField = CTOT(lcValue)
		      CASE lcType = "D"
		         loObject.&lcField = CTOD(lcValue)
		      CASE lcType = "L"
		         IF lcValue = "True"
		            loObject.&lcField = .T.
		         ELSE
		            loObject.&lcField = .F.
		         ENDIF
		      CASE lcType = "O" AND THIS.lRecurseObjects
		         lcObjXML = Extract(lcXML,"<"+lcXMLField+">","</"+lcXMLField+">")
		         THIS.XMLToObjectNoParser(lcObjXML,loObject.&lcField)
		      OTHERWISE
		         *** If we have an object
		         loObject.&lcField = .NULL.
		         *** OTHERWISE  && Do nothing
		   ENDCASE
		ENDFOR

		RETURN loObject
	ENDPROC


	*-- Creates inner XML fragment from an array.
	PROCEDURE createarrayxml
		LPARAMETER laArray, lcName, lcRow, lnIndent
		LOCAL lcOutput, lnX, lnY, lnRows, lnCols, lcField, lcType,  lvValue, lcTemp

		EXTERNAL ARRAY laArray
		lcRow=IIF(EMPTY(lcRow),lcName+ "_item",lcRow)
		lnIndent=IIF(vartype(lnIndent) # "N",1,lnIndent)

		lnRows = ALEN(laArray,1)
		lnCols = ALEN(laArray,2)
		IF lnCols=0
		  lnCols=1
		ENDIF

		IF lnCols = 1
		 lcOutput = REPLICATE(CHR(9),lnIndent) + [<] + lcName + [>] + CRLF
		ELSE
		 lcOutput = REPLICATE(CHR(9),lnIndent) + [<] + lcName + ;
		            [ dim='] + TRANSFORM(lnCols) +['>] + CRLF
		ENDIF

		FOR lnX=1 TO lnRows

		   IF lnCols = 1
		      lvValue = laArray[lnX]
		      lcType = VARTYPE(lvValue)

		      *** Must use separate var or VFP gets confused!!!
		      lcTemp = this.AddElement(lcRow,@lvValue,lnIndent + 1,;
		     									 IIF(lcType # "O",[type="] + lcType + ["],[]))
		   ELSE
		      lcTemp = ""
		      FOR lnY = 1 TO lnCols
		         *** Must use separate var or VFP gets confused!!!
		         lvValue = laArray[lnX,lnY]
		         lcType = VARTYPE(lvValue)
		         lcTemp = lcTemp + ;
		                  this.AddElement(lcRow,@lvValue,lnIndent + 1,;
		                                      IIF(lcType # "O",[type="] + lcType + ["],[]))
		      ENDFOR
		   ENDIF
		      
		   lcOutput = lcOutput + lcTemp
		ENDFOR

		RETURN lcOutput + ;
		   REPLICATE(CHR(9),lnIndent) + "</" + lcName + ">" + CRLF
	ENDPROC


	*-- Executes an ODBC/OleDB backend operation. Works like CursorToXML but takes additional parameters for SQL and connection strings.
	PROCEDURE sqlcursortoxml
		LPARAMETER lcSQL, lcConnectString, lcName, lcRowName, lnIndent, llNoHeader
		LOCAL loSQL, lnX, lnSQLHandle

		lnIndent=IIF(EMPTY(lnIndent),0,lnIndent)

		IF EMPTY(lcSQL)
		   THIS.cErrorMsg = "No SQL statement provided"
		   THIS.lerror = .T.
		   RETURN .F.
		ENDIF

		IF EMPTY(lcConnectString)
		   lcConnectString = THIS.cSQLConnectString
		   IF EMPTY(lcConnectString)
		     THIS.cErrorMsg = "Unable to connect to datasource"
		     THIS.lerror = .T.
		     RETURN .F.
		   ENDIF
		ENDIF

		lnSQLHandle = SQLStringConnect(lcConnectString)
		IF lnSQLHandle < 1
		   THIS.cErrorMsg = "Unable to connect to datasource"
		   THIS.lerror = .T.
		   RETURN .F.
		ENDIF

		IF EMPTY(lcName)
		  lcName = "TXMLSQLQuery"  
		ENDIF

		lnResult = SQLExec(lnSQLHandle,lcSQL)
		IF lnResult = -1
		   lnCount = AERROR(laError)
		   THIS.cErrorMsg = EXTRACT(laError[2],"Server]",".",,.T.) + "."
		   THIS.lError = .T.
		   SQLDisconnect(lnSQLHandle)
		   RETURN .F.
		ENDIF   

		SQLDisconnect(lnSQLHandle)

		IF lnResult = 1
		   *** Only one cursor was returned so let's just render it
		   RETURN THIS.CursorToXML(lcName, lcRowName, lnIndent, llNoHeader)
		ENDIF

		RETURN THIS.MultiCursorToXML(lcName,lnResult)
	ENDPROC


	*-- Handles creating a single XML document of multiple cursors named in SQL Passthrough Execute mult-result fasion.
	PROCEDURE multicursortoxml
		LPARAMETER lcCursorName, lnCount, lcRowName, lnIndent
		LOCAL lnX

		IF EMPTY(lcCursorName)
		  lcCursorName = lower(ALias())
		ENDIF
		IF EMPTY(lnCount)
		  lnCount = 0
		ENDIF
		IF EMPTY(lcRowName)
		  lcRowName = "row"
		ENDIF
		IF EMPTY(lnIndent)
		  lnIndent = 0
		ENDIF

		lcSchema = ""
		lcXML = ""

		*** Encode each cursor and concat
		FOR lnX=1 to lnCount
		   IF lnX=1
		     lcTCursor = lcCursorName
		   ELSE
		     lcTCursor = lcCursorName + TRANSFORM(lnX-1)
		   ENDIF
		   
		   SELE (lcTCursor) 
		   IF THIS.nCreateDataStructure = 1
		        lcSchema = lcSchema + THIS.CreateDataStructureSchema(lcTCursor,lcRowName,,lcTCursor)
		   ENDIF

		   lcXML = lcXML + THIS.CreateCursorXML(lcTCursor, lcRowName, lnIndent+1,;
		                                      IIF(THIS.nCreateDataStructure=1,"#" + lcTCursor,""))
		ENDFOR


		RETURN ;
		   THIS.cXMLHeader +;
		   REPLICATE(CHR(9), lnIndent) + "<" + THIS.cDocRootName + ">" + CRLF + ;
		   lcSchema + ;
		   lcXML + ;
		   REPLICATE(CHR(9), lnIndent) + "</" + THIS.cDocRootName + ">" + CRLF
	ENDPROC


	*-- Takes an ADO Recordset and converts it to XML.
	PROCEDURE adotoxml
		LPARAMETER loRS, lcName, lcRowName, lnIndent, llNoHeader
		LOCAL lcOutput, lnFields,lnX

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF VARTYPE(loRS) # "O"
		   THIS.lError = .T.
		   THIS.cErrorMsg = "No Recordset Object passed to ADOToXML()."
		   RETURN ""
		ENDIF
		IF !llNoHeader
		   lcOutput = THIS.cXMLHeader
		ELSE
		   lcOutput = ""
		ENDIF

		IF EMPTY(lcName)
		   lcName = LOWER(ALIAS())
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF
		IF EMPTY(lnIndent)
		   lnIndent = 0
		ENDIF

		IF THIS.lCreateDataStructure
		   lcOutput = lcOutput + ;
		               "<!DOCTYPE " + THIS.cDocRootName + " [" + CRLF + ;
		               "<!ELEMENT " + THIS.cDocRootName + " (" + lcName + ")>" + CRLF + ;
		               THIS.CreateDataStructureDTD(lcName, lcRowName, loRS) + CRLF + ;
		               "]>" + CRLF + CRLF
		               
		ENDIF

		lcOutput = lcOutput + REPLICATE(CHR(9), lnIndent) + "<" + THIS.cDocRootName + ">" + CRLF


		RETURN lcOutput + THIS.CreateADOXML(loRS, lcName, lcRowName, lnIndent) +;
		       REPLICATE(CHR(9) , lnIndent) + "</" + THIS.cDocRootName + ">" + CRLF
	ENDPROC


	*-- Creates XML from an ADO RecordSet. Low Level function that creates only an XML fragment without a header.
	PROCEDURE createadoxml
		LPARAMETER loRS, lcName, lcRowName, lnIndent
		LOCAL lcOutput, lnFields, lnX, lvValue, lcValue, lcFieldName, lcFieldType
		LOCAL lcOldCentury, lcTime, lcOldHours, lcOldDate, lcOldMark

		IF EMPTY(lcName)
		   lcName = "table"
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF
		IF EMPTY(lnIndent)
		   lnIndent = 1
		ENDIF   

		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lcOldMark = SET("MARK")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET MARK TO "-"

		DIMENSION laFieldList[1]
		lnFields = THIS.ADOFields(loRS,@laFieldList)

		lcOutput = REPLICATE(CHR(9),lnIndent) + [<] + lcName + [>] + CRLF

		*** Now loop through table
		DO WHILE !loRS.Eof
		   *** Build a Field String
		   lcValue=""

		   lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcRowName + ">"+CRLF
		   FOR lnX=1 TO lnFields
		      lcfieldname=LOWER(laFieldList[lnX,1])
		      lcfieldtype=laFieldList[lnX,2]

		      lvValue=loRS.Fields(lnX-1).value

		      DO CASE
		         CASE ISNULL(lvValue)
		            lcValue="NULL"
		         CASE lcfieldtype = "C" or lcFieldType = "M"
		            IF EMPTY(lvValue)
		               lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcfieldname + "/>" + CRLF
		               LOOP
		            ELSE
		               IF CHR(13) $ lvValue OR  ">" $ lvValue OR "<" $ lvValue OR "&" $ lvValue or CHR(0) $ lvValue
		                  lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcfieldname + "><![CDATA[" +;
		                     TRIM(STRTRAN(lvValue,CHR(0),"&#00;")) + "]]></" + lcfieldname + ">" + CRLF
		                  LOOP
		               ELSE
		                  lcValue = TRIM(lvValue)
		               ENDIF
		            ENDIF
		          CASE lcfieldtype="L"
		            IF THIS.lUseFoxTypes
		                lcValue=IIF(lvValue,".T.",".F.")
		            ELSE
		                lcValue=IIF(lvValue,"1","0")
		            ENDIF
		          CASE lcFieldType = "D"
		             IF EMPTY(lvValue)
		                lcValue = ""
		             ELSE
		                lcValue = DTOC(lvValue)
		             ENDIF
		          CASE lcFieldType = "T"
		             *lcTime = TTOC(lvValue)
		             IF !EMPTY(lvValue)
		               lcValue = STRTRAN(TTOC(lvValue)," ","T")
		               *lcValue = DTOS(lvValue) + "T" + SUBSTR(lcTime,AT(" ",lcTime)+1)
		             ELSE
		               lcValue = ""
		             ENDIF
		             
		           CASE lcFieldType = "G"
		             LOOP  &&& General fields are not supported 
		         OTHERWISE
		            lcValue = TRANSFORM(lvValue)
		      ENDCASE

		      lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 2) + "<" + lcfieldname + ">" +;
		         lcValue + "</" + lcfieldname + ">" + CRLF
		   ENDFOR && lnX=1 TO lnFields

		   lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "</" + lcRowName + ">"+CRLF

		   loRS.MoveNext()
		ENDDO

		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET MARK TO (lcOldMark)

		RETURN lcOutput + REPLICATE(CHR(9),lnIndent) + "</"+ lcName + ">" + CRLF 
	ENDPROC


	*-- Creates an array of fields in VFP compatible format.
	PROTECTED PROCEDURE adofields
		LPARAMETER loRS, laFieldList
		LOCAL lnX

		lnFields = loRS.Fields.Count
		DIMENSION laFieldList[lnFields,4]

		FOR lnX=0 to lnFields-1
		   laFieldList(lnX+1,1)= loRS.Fields(lnX).Name
		   laFieldList(lnX+1,3) = loRS.Fields(lnX).DefinedSize
		   laFieldList(lnX+1,4) = loRS.Fields(lnX).NumericScale
		   lnfieldtype=loRS.Fields(lnX).Type
		   
		   DO CASE
		      CASE INLIST(lnFieldType,ADCHAR,ADBSTR)
		         laFieldList(lnX+1,2) = "C"
		      CASE INLIST(lnFieldType,ADVARCHAR,ADLONGVARCHAR,;
		                  ADWCHAR,ADVARWCHAR,ADLONGVARWCHAR,;
		                  ADBINARY,ADVARBINARY,ADLONGVARBINARY)
		         laFieldList(lnX+1,2) = "M"
		      CASE lnFieldType = adBoolean
		         laFieldList(lnX+1,2) = "L"
		      CASE INLIST(lnFieldType,adDate, adDBDate)
		         laFieldList(lnX+1,2) = "D"
		      CASE INLIST(lnFieldType,adDBTime, adDBTimeStamp)
		         laFieldList(lnX+1,2) = "T"
		      CASE lnFieldType = ADNUMERIC
		         laFieldList(lnX+1,2) = "N"
		         laFieldList(lnX+1,3) = loRS.Fields(lnX).Precision
		      CASE INLIST(lnFieldType,adInteger,adSmallInt,adTinyInt,adUnsignedInt,;
		                              adUnsignedTinyInt,adUnsignedSmallInt,adUnsignedBigInt)
		         laFieldList(lnX+1,2) = "I"
		      CASE INLIST(lnFieldType,adCurrency)
		         laFieldList(lnX+1,2) = "Y"
		      CASE lnFieldType =  adDouble   
		         laFieldList(lnX+1,2) = "B"
		         laFieldList(lnX+1,3) = loRS.Fields(lnX).Precision
		      CASE lnFieldType = adSingle
		         laFieldList(lnX+1,2) = "F"
		         laFieldList(lnX+1,3) = loRS.Fields(lnX).Precision
		      OTHERWISE
		         ERROR "Unknown Ado field type: " + TRANS(lnFieldType)
		   ENDCASE

		*   ? lnX,lnFieldType,laFieldList(lnX+1,1),laFieldList(lnX+1,2),laFieldList(lnX+1,3),laFieldList(lnX+1,4)
		ENDFOR

		RETURN lnFields
	ENDPROC


	*-- Parses XML into an array. Low Level function only.
	PROCEDURE parsexmltoarray
		LPARAMETER loXMLObject, laArray, llParseCaseInsensitive
		LOCAL lnSize, lnX, loObject, lcField, lcType, lnProperties, loProperty
		LOCAL laProperties[1], loProperty, lcValue, lnDimensions

		IF ISNULL(loXMLObject)
		   THIS.cErrorMsg = "No data provided for element"
		   RETURN .F.
		ENDIF

		loDim = loXmlObject.Attributes.GetNamedItem("dim")
		IF !ISNULL(loDim)
		   lnDimensions =    VAL( loDim.Value )
		   IF lnDimensions = 0
		     lnDimensions = 1
		   ENDIF
		ELSE,,
		   lnDimensions=1
		ENDIF

		*** Walk the object and then pull properties 
		*** from the XML to repopulate it
		lcName = loXMLObject.NodeName
		loRows = loXMLObject.ChildNodes    &&SelectNodes(loXMLObject.NodeName + "_item")
		lnRows = loRows.length

		lcValue = laArray[1]
		lcType = VARTYPE(laArray[1])

		IF lcType = "O"
		   DIMENSION laArray[lnRows]
		   FOR lnX = 1 to lnRows
		      laArray[lnX] = CopyObject(lcValue)   && New Obj ref created
		   ENDFOR
		   lcValue = 0 
		ELSE
		   DIMENSION laArray[lnRows]
		ENDIF   

		lnX=0
		FOR EACH oRow in loRows
		   lnX= lnX + 1

		   *** If array item one is an object assume Object Array
		   *** NO TYPE CHECKS OCCUR
		   IF lcType = "O"
			   *** First element MUST CONTAIN object
			   THIS.ParseXMLToObject(oRow,laArray[lnX],llParseCaseInsensitive)
			   LOOP
		   ENDIF

		   loType = oRow.attributes.getNamedItem("type")
		   IF !ISNULL(loType)
		      lcType = lotype.Text
		   ENDIF
		   
		   lcValue = oRow.TEXT
		   
		   DO CASE
		      CASE lcType $ "CM"
		         laArray[lnX] =  STRTRAN(lcValue,"&#00;",CHR(0))
		      CASE lcType $ "NIF"
		         laArray[lnX] = VAL(lcValue)
		      CASE lcType = "T"
		         laArray[lnX] = CTOT(lcValue)
		      CASE lcType = "D"
		         laArray[lnX] = CTOD(lcValue)
		      CASE lcType = "L"
		         IF lcValue = "True" OR lcValue = "1"
		            laArray[lnX] = .T.
		         ELSE
		            laArray[lnX] = .F.
		         ENDIF
		      OTHERWISE
		         *** If we have an object
		         laArray[lnX] = .NULL.
		         *** OTHERWISE  && Do nothing
		   ENDCASE
		ENDFOR

		*** Create the multidimensional array
		*** through redimensioning
		IF lnDimensions > 1
		   lnElems = ALEN(laArray,0) / lnDimensions
		   DIMENSION laArray[lnElems,lnDimensions]
		ENDIF

		RETURN .T.
	ENDPROC


	*-- Creates an Element node line with XML tag delimiters and line break.
	PROCEDURE addelement
		LPARAMETER lcDispField, lvValue, lnIndent, lcAttributes, lcFoxType
		LOCAL lcOldData, lnOldHours, lcOldCentury,lcOldMark,lcOutput, lcResult

		lnIndent=IIF(VARTYPE(lnIndent) # "N",2,lnIndent)
		IF EMPTY(lcAttributes)
		   lcAttributes = ""
		ELSE
		   lcAttributes = " " + lcAttributes
		ENDIF

		IF EMPTY(lcFoxType)
		   lcFoxType = VARTYPE(lvValue)
		ENDIF

		lcOutput = ""

		DO CASE
		      CASE TYPE([ALEN(lvValue)]) = "N"
		         IF THIS.lRecurseObjects
		            *** THIS CODE MUST BE ON 2 lines of VFP gets confused
		            lcResult = THIS.CreateArrayXML(@lvValue,lcDispField,,lnIndent+1)
		            lcAttributes = lcAttributes + [ count="] + TRANSFORM(ALEN(lvValue)) + ["]
		            IF !EMPTY(lcAttributes)
			          lcResult = STRTRAN(lcResult,"<" + lcDispField ,"<" + lcDispField + lcAttributes,1,1 )
			        ENDIF
		            lcOutput = lcOutput + lcResult
		         ELSE
		            lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcDispField + ">(array)</" + lcDispField + ">" + CRLF
		         ENDIF
		   CASE ISNULL(lvValue)
		      IF THIS.lSkipEmptyElements
		         RETURN ""
		      ENDIF
		      lcOutput = lcOutput +  REPLICATE(CHR(9),lnIndent) + "<" +lcDispField +  lcAttributes + " />" + CRLF &&NULL</"+lcDispField+">" + CRLF
		   CASE lcFoxType = "C"
		      IF THIS.lSkipEmptyElements AND EMPTY(lvValue)
		         RETURN ""
		      ENDIF

		      IF EMPTY(lvValue)
		         RETURN  REPLICATE(CHR(9),lnIndent ) + "<" + lcDispField + lcAttributes + "/>" + CRLF
		      ELSE
		         IF "&" $ lvValue
		            lvValue = STRTRAN(TRIM(lvValue),"&","&amp;")
		         ENDIF
		         IF  ">" $ lvValue
		            lvValue = STRTRAN(lvValue,">","&gt;")
		         ENDIF
		         IF "<" $ lvValue
		            lvValue = STRTRAN(lvValue, "<", "&lt;")
		         ENDIF
		         RETURN REPLICATE(CHR(9),lnIndent ) + "<" + lcDispField + lcAttributes +  ">" + ;
		            TRIM(lvValue) + ;
		            "</" + lcDispField + ">" + CRLF
		      ENDIF
		   CASE lcFoxType = "D" OR lcFoxType = "T"
		      IF THIS.lSkipEmptyElements AND EMPTY(lvValue)
		         RETURN ""
		      ENDIF

			  LOCAL lcDate as Datetime
			  lcDate = ""
			  IF !EMPTY(lvValue)
					#IF wwVFPVersion > 8
						  lcDate = TTOC(lvValue,3) + ".00000"
					#ELSE

					      lcOldDate = SET("DATE")
					      lnOldHours = SET("HOURS")
					      lcOldCentury = SET("CENTURY")
					      lcOldMark = SET("MARK")

					      SET HOURS TO 24
					      SET DATE TO YMD
					      SET CENTURY ON
					      SET MARK TO "-"

						  lcDate =  STRTRAN( TRANSFORM(lvValue) + ".00000"," ","T" )

					      SET DATE TO &lcOldDate
					      SET HOURS TO lnOldHours
					      SET CENTURY &lcOldCentury
					      SET MARK TO (lcOldMark)
					   #ENDIF

			   lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent) + ;
		                              "<" +lcDispField + lcAttributes +  ">"  + ;
		                              lcDate + ;
		                              "</"+lcDispField+">" + CRLF
		      ELSE
		      		   lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent) + ;
		                              "<" +lcDispField + lcAttributes +  " />"  + CRLF
		      ENDIF


		   CASE lcFoxType = "L"
		      lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent) + "<" + lcDispField + lcAttributes +  ">" +;
		         IIF( lvValue, "1","0") + "</" + lcDispField + ">" + CRLF
		   CASE lcFoxType = "B" OR lcFoxType = "Q"
		         lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent) + "<" + lcDispField + lcAttributes +  ">" +;
		         STRCONV(lvValue,13) + "</" + lcDispField + ">" + CRLF
		   CASE lcFoxType = "O"
		         *** The following *MUST* be separate line or else VFP gets confused
		         *** in the recursion levels and generates invalid fields
		         DO CASE 
		         *** Deal with Collections
		         CASE TYPE("lvValue.BaseClass")="C" AND lvValue.BaseClass = "Collection"
		    	     lcResult = THIS.CreateCollectionXML(lvValue,lcDispField,"item",lnIndent )

		         *** Check for XML DOM nodes - embed XML directly
		         CASE TYPE("lvValue.NodeType") = "N" 
		             lcResult="<" + lcDispField + lcAttributes +  ">" + lvValue.Xml  + "</" + lcDispField + ">"  && Embed Raw XML    
		         OTHERWISE
		            *** FoxPro object
			         lcResult = THIS.CreateObjectXML( lvValue,lcDispField,lnIndent)
			     ENDCASE

		*!*         IF !EMPTY(lcAttributes)
		*!*            lcResult = STRTRAN(lcResult,"<" + lcDispField ,"<" + lcDispField + lcAttributes,1,1 )
		*!*         ENDIF
		      RETURN lcResult
		   OTHERWISE
		      lcOutput =  lcOutput  + REPLICATE(CHR(9),lnIndent) + "<" +lcDispField + lcAttributes + ">"  + TRANSFORM(lvValue) + "</"+lcDispField+">" + CRLF
		ENDCASE

		RETURN lcOutput
	ENDPROC


	*-- Simplistic method that sets an element value. This method works only on simple XML structures that have a single tag of each kind only. Won't work on hierarchical structures where tag names can be duplicated.
	PROCEDURE setelement
		LPARAMETER lcElement, lcValue, lcXMLDoc

		IF EMPTY(lcXMLDoc)
		   lcXMLDoc = THIS.cBody
		ENDIF   

		lnLoc = AT("<" + lcElement + ">",lcXMLDoc)
		lnLoc2 = AT("</" + lcElement +  ">",lcXMLDoc)

		IF lnLoc = 0 
		   *** Possibly add a new tag?
		   RETURN .F.
		ENDIF   
	ENDPROC


	*-- Converts an ADO generated XML Recordset into a cursor.
	PROCEDURE adoxmltocursor
		LPARAMETER lvXML, lcAlias
		LOCAL loXML, lnX, lnSize, lcCreate

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF NOT INLIST(VARTYPE(lvXML),"O","C") OR EMPTY(lvXML)
		   THIS.cErrorMsg = "No XML input passed."
		   RETURN .F.
		ENDIF

		IF EMPTY(lcAlias)
		   lcAlias = "__wwXML"
		ENDIF

		IF VARTYPE(lvXML) # "O"
		   loXML = CREATEOBJECT(XML_XMLDOM_PROGID)
		   loXML.LoadXML( lvXML )
		ELSE
		   *** Input object must be IE 5 XML object
		   loXML = lvXML
		ENDIF

		*** Check for parsing error
		IF !EMPTY(loXML.ParseError.reason) 
		   THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		                    "Line: " + TRANSFORM(loXML.ParseError.Line) + CRLF +;
		                    loXML.ParseError.SrcText
		   RETURN .F.
		ENDIF

		*** Make sure spaces are returned properly
		loXML.PreserveWhiteSpace = .T.

		*** get the root element node
		loDocRoot = loXML.DocumentElement
		IF ISNULL(loDocRoot)
		   THIS.cErrorMsg = "Invalid data root. Data must be in child of document root."
		   RETURN .F.
		ENDIF


		IF !USED(lcAlias)
		  *** Assume <?xml..><root><table><row>
		  THIS.BuildCursorFromXML(loDocRoot.ChildNodes(0).ChildNodes(0),lcAlias)
		ELSE
		   SELE (lcAlias)
		ENDIF

		*** Now append the data from the XML

		*** Get the Data root element - ie. the cursor name or 'cursor'
		loData = loDocRoot.SelectNodes("rs:data/z:row") && SelectSingleNode("cursor")
		IF ISNULL(loData)
		   THIS.cErrorMsg = "No data provided for element"
		   RETURN .F.
		ENDIF

		RETURN THIS.ParseADOXMLToCursor(loData)
	ENDPROC


	PROCEDURE parseadoxmltocursor
		LPARAMETER loData
		LOCAL lnFields, laFields(1),lnX, lcType, lcField, loRow

		lcOldDate = SET("DATE")
		lnOldHours = SET("HOURS")
		lcOldCentury = SET("CENTURY")
		lnOldStrictDate = SET("STRICTDATE")

		SET HOURS TO 24
		SET DATE TO YMD
		SET CENTURY ON
		SET STRICTDATE TO 0

		lnFields = AFIELDS(laFields)

		FOR EACH loRow IN loData
		   APPEND BLANK
		   _lcXML = loRow.XML
		   FOR lnX = 1 TO lnFields
		      lcField = LOWER(laFields[lnX,1])
		      lcType  = laFields[lnX,2]

		      *** This code uses the parser for individual fields
		      loValue = loRow.Attributes.getnameditem(lcField)
		      IF ISNULL(loValue)
		         LOOP
		      ENDIF
		      lcValue = loValue.TEXT
		      loValue = 0
		            
		      DO CASE
		         CASE lcValue = "NULL"
		            lcValue = .NULL.
		         CASE lcType $ "CM"
		            *lcValue =
		         CASE lcType $ "NIF"
		            lcValue = VAL(lcValue)
		         CASE lcType = "T"
		            lcValue = CTOT(lcValue)
		         CASE lcType = "D"
		            lcValue = CTOD(lcValue)
		         CASE lcType = "L"
		            IF THIS.lUseFoxTypes
		               lcValue = EVAL(lcValue)
		            ELSE
		               IF lcValue = "True"
		                  lcValue = .T.
		               ELSE
		                  lcValue = .F.
		               ENDIF
		            ENDIF
		         CASE lcType = "G"
		            LOOP
		         OTHERWISE
		            lcValue = EVAL(lcValue)
		      ENDCASE
		      REPLACE (lcField) WITH lcValue
		   ENDFOR
		ENDFOR

		SET DATE TO &lcOldDate
		SET HOURS TO lnOldHours
		SET CENTURY &lcOldCentury
		SET STRICTDATE TO lnStrictDate

		RETURN .T.
	ENDPROC


	*-- Encodes an XML string into full UTF-8 format.
	PROCEDURE encodexml
		LPARAMETERS lcXML
		#DEFINE USE_API .T.

		IF wwVFPVersion > 6
		    RETURN STRCONV(lcXML,9)
		ELSE
		    LOCAL oXML,lcFile, lcUTF, lnSize, lnResult

		    #IF USE_API

		        #DEFINE CP_ACP     0
		        #DEFINE CP_UTF8    65001

		        DECLARE INTEGER MultiByteToWideChar IN Win32API ;
		            INTEGER nflag,;
		            INTEGER reserverd, ;
		            STRING INPUT,;
		            INTEGER inSize,;
		            STRING@ OUTPUT,;
		            INTEGER SIZE


		        *** Presize our buffer
		        lnWCSize = LEN(lcXML) * 2 + 2
		        lcWide = SPACE(lnWCSize)

		        lnResult =  MultiByteToWideChar(CP_ACP, 0, lcXML, LEN(lcXML),@lcWide, lnWCSize )
		        IF lnResult = 0
		            RETURN ""
		        ENDIF


		        DECLARE INTEGER WideCharToMultiByte IN WIN32API ;
		            INTEGER,;
		            INTEGER,;
		            STRING,;
		            INTEGER,;
		            STRING @,;
		            INTEGER,;
		            INTEGER,;
		            STRING

		        lnSize = LEN(lcXML)
		        lcUTF = SPACE(lnSize *2 + 2)
		        *lcWide = STRCONV(lcXML,5)     && Fails with large strings (over 450k)
		        lnResult = WideCharToMultiByte( CP_UTF8,0,lcWide,lnSize,@lcUTF,lnSize * 2 + 2,0,NULL)
		        IF lnResult = 0
		            RETURN ""
		        ELSE
		            RETURN LEFT(lcUTF,lnResult)
		        ENDIF

		    #ELSE
		        DECLARE INTEGER UTF8Encode ;
		            IN wwIPStuff.DLL ;
		            STRING lcText,;
		            STRING @lcUTF
		    #ENDIF

		    lcUTF = SPACE(LEN(lcXML) * 2 + 2)

		    #IF !USE_API
		        lnLength = UTF8Encode(lcXML,@lcUTF)
		    #ENDIF
		    IF lnLength = 0
		        RETURN ""
		    ENDIF

		    RETURN LEFT(lcUTF,lnLength)

		    #UNDEFINE USE_API

		ENDIF
	ENDPROC


	*-- This method provides conversion from a VFP Cursor to an ADO recordset. It's provided as part of this class because it uses XML output and requires proper encoding.
	PROCEDURE cursortors
		lcXML = THIS.CursorToADOXML()

		lcFile = SYS(2023) + "\" + SYS(2015) + ".xml"
		File2Var(lcFile,THIS.EncodeXML(lcXML))

		oRS = CREATEOBJECT("AdoDB.RecordSet")
		oRS.OPEN(lcFile)  && Load as XML document

		ERASE (lcFile)

		RETURN oRS
	ENDPROC


	*-- Loads an XML string from an HTTP based URL with an optional post buffer and optional username and password info.
	PROCEDURE loadurl
		LPARAMETER lcUrl, lcPostBuffer, lcUserName, lcPassword, lnTimeout
		LOCAL lnSize, lcData, lnResult, llHTTPS, loIP

		THIS.cErrorMsg = ""
		THIS.lError = .F.


		loIP = CREATE("wwHTTP")
		IF VARTYPE(lnTimeout) = "N"
		  loIP.nConnectTimeout = lnTimeout
		ENDIF

		IF !EMPTY(lcPostBuffer)
		   *** Raw buffer post - XML Data only
		   loIP.nHTTPPostMode = 4 && XML
		   loIP.AddPostKey("",lcPostBuffer)
		ENDIF   

		*** Now call new HTTPGet to pull the actual data
		lcResult = loIP.HTTPGet(lcUrl,lcUserName,lcPassword)
		IF !EMPTY(lcResult) 
		   RETURN lcResult
		ELSE
		   IF loIP.nError # 0
		      THIS.lError = .T.
		      THIS.cErrorMsg = loIP.cErrorMsg
		   ENDIF
		ENDIF

		RETURN ""
	ENDPROC


	*-- Checks to see if this version of the parser is bugged.
	PROCEDURE ismsxmlbug
		LPARAMETER llNoUI,llForceFail,lnType
		PRIVATE oXML

		IF EMPTY(lnType)
		   lnType = 0
		ENDIF
		DO CASE
		   CASE lnType = 2
		      *** Check for MSXML 2
		      loEval = CREATEOBJECT("wwEval")
		      loMSXML = loEval.EVALUATE([ CREATEOBJECT("MSXML2.DOMDocument") ])
		      IF loEval.lError OR llForceFail
		         IF !llNoUI AND ;
		               MESSAGEBOX("You have an old version of MSXML installed.  It is" + CHR(13) + ;
		               "recommended that you update MSXML to a newer version." + CHR(13) + CHR(13) +;
		               "Would you like more information from the Web?",32+4,"msXML Version") = 6
		            GoUrl("http://msdn.microsoft.com/downloads/default.asp?URL=/downloads/sample.asp?url=/msdn-files/027/001/596/msdncompositedoc.xml")
		         ENDIF
		         RETURN .T.
		      ENDIF

		   OTHERWISE
		      oXML=CREATEOBJECT(XML_XMLDOM_PROGID)

		      loEval = CREATE("wwEval")
		      loEval.EVALUATE([ oXML.LoadXML("<?XML?>") ])

		      IF loEval.lError OR llForceFail
		         IF !llNoUI AND ;
		               MESSAGEBOX("The version of MSXML.DLL on your system contains" + CHR(13) +;
		               "a bug that causes undocumented COM errors. It is" + CHR(13) + ;
		               "recommended that you update MSXML to a newer version." + CHR(13) + CHR(13) +;
		               "Would you like more information from the Web?",32+4,"msXML Bug") = 6
		            GoUrl("http://www.west-wind.com/webconnection/msxml.asp")
		         ENDIF
		         RETURN .T.
		      ENDIF
		ENDCASE

		RETURN .F.
	ENDPROC


	*-- Creates a schema for the data structure of the document.
	PROCEDURE createdatastructureschema
		LPARAMETER lcName, lcRowName, loRS, lcSchemaID
		LOCAL lcOutput, lnX, lcRow, lcType, lnFields, lcSpace, loRS, lcAttributes, lcRowName, lnSize, lnPrecision

		IF EMPTY(lcName)
		   lcName = lower(Alias())
		ENDIF
		IF EMPTY(lcRowName)
		   lcRowName = "row"
		ENDIF
		IF EMPTY(lcSchemaId)
		  lcSchemaId = "Schema"
		ENDIF

		lcSpace = SPACE(10)

		lcOutput = ;
		[<Schema name="]+ lcSchemaId +[" xmlns="urn:schemas-microsoft-com:xml-data" xmlns:dt="urn:schemas-microsoft-com:datatypes">] + CRLF +;
		[   <ElementType name="] + lcName + + [" content="eltOnly" model="closed" order="many">] + CRLF +;
		[		<element type="] + lcRowName + [" />] + CRLF +; 
		[	</ElementType>] +CRLF + ;
		[	<ElementType name="] + lcRowName + [" content="eltOnly" model="closed" order="many">] + CRLF 
		  
		IF VARTYPE(loRS) = "O"
		   DIMENSION laFields[1]
		   lnFields = THIS.ADOFields(loRS,@laFields)
		ELSE 
		   lnFields = AFIELDS(laFields)
		ENDIF

		FOR lnX=1 to lnFields
		 lcOutput = lcOutput + [		<element type="] +LOWER(laFields[lnX,1]) + ["/>]  + CRLF
		ENDFOR

		lcOutput = lcOutput + [	</ElementType>] + CRLF
		lcAttributes = ""

		FOR lnX=1 to lnFields
		   lcType = laFields[lnX,2]
		   *** Override length and precision
		   DO CASE
		      CASE lcType = "M"
		         lnSize = XML_SCHEMA_MEMOSIZE
		         lnPrecision = 0
		      CASE lcType = "Y"
		         lnSize = 20
		         lnPrecision = 4
		      CASE lcType = "G"
		         LOOP && Skip General Fields
		      OTHERWISE
		         lnSize = laFields[lnX,3]
		         lnPrecision = laFields[lnX,4]
		   ENDCASE
		   
		   lcType = THIS.FoxTypeToXMLType(lcType)
		   
		   lcOutput = lcOutput + ;
		       [	<ElementType name="] + LOWER(laFields[lnX,1]) + [" content="textOnly" model="closed" dt:type="]+ lcType + [">] + CRLF +;
		       [		<AttributeType name="type"/>] + CRLF +;
		       [		<attribute type="type" default="]+ lcType +["/>] + CRLF +;
		       [		<AttributeType name="size"/>] + CRLF + ;
		       [		<attribute type="size" default="]+TRANSFORM(lnSize)+["/>] + CRLF +;
		       IIF(lnPrecision # 0,;
		       [		<AttributeType name="precision"/>] + CRLF + ;
		       [		<attribute type="precision" default="]+TRANSFORM(lnPrecision)+["/>] + CRLF,;
		       []) +;
			   [	</ElementType>] + CRLF     
		ENDFOR


		RETURN lcOutput + "</Schema>" + CRLF
	ENDPROC


	*-- Creates a XData schema for the object passed in.
	PROCEDURE createobjectstructureschema
		LPARAMETER loObject, lcName,  lcSchemaID, lnRecurseType
		LOCAL lnPropCount, lnX, lcProperty, lcType, lcOutput, laFields(1), lcObjectHeaders, lcObjectProperties, lcDispField

		IF EMPTY(lcName)
		   IF VARTYPE(loObject.CLASS) = "C"
		      lcName = loObject.CLASS
		   ELSE
		      lcName = "object"
		   ENDIF
		ENDIF


		IF EMPTY(lnRecurseType)
		   lnRecurseType = 0
		ENDIF
		IF EMPTY(lcSchemaID)
		   lcSchemaID = "Schema"
		ENDIF

		IF lnRecurseType = 0
		   lcOutput = ;
		      [<Schema name="] + lcSchemaID + [" xmlns="urn:schemas-microsoft-com:xml-data" xmlns:dt="urn:schemas-microsoft-com:datatypes">] + CRLF +;
		      [	<ElementType name="] + lcName + [" content="eltOnly" model="closed" order="many">] + CRLF
		ELSE
		   lcOutput = ""
		ENDIF

		lnPropCount = AMEMBERS(laFields,loObject)

		lcObjectHeaders = ""      && Top level objects
		lcObjectProperties = ""   && Properties/Attribute descripts


		IF lnRecurseType = 0 OR lnRecurseType = 1
		   FOR lnX=1 TO lnPropCount
		      lcProperty = LOWER(laFields[lnX])
		      IF "," + lcProperty + "," $ "," + THIS.cpropertyexclusionlist + ","
		         LOOP
		      ENDIF

		      IF THIS.lStripTypePrefix
		         lcDispField = SUBSTR(lcProperty,2)
		      ELSE
		         lcDispField = lcProperty
		      ENDIF

		      IF THIS.lRecurseObjects
		         IF TYPE("loObject." + lcProperty) = "O"
		            lcObjectHeaders = lcObjectHeaders + ;
		               [	<ElementType name="] + lcDispField +  [" content="eltOnly" model="closed" order="many">] + CRLF +;
		               THIS.createobjectstructureschema(EVALUATE("loObject." + lcProperty),lcDispField,,1)
		            lcOutput = lcOutput + [		<element type="] + lcDispField + ["/>] + CRLF
		            LOOP
		         ENDIF
		      ENDIF

		      lcOutput = lcOutput + [		<element type="] + lcDispField + ["/>]  + CRLF
		   ENDFOR
		   
		   lcOutput = lcOutput + [      <AttributeType name="type"/>] + CRLF +;
		                         [      <attribute type="type" default="object" />]+ CRLF +;
		                         [      <AttributeType name="class"/>] + CRLF +;
		                         [      <attribute type="class" default="empty" />] + CRLF
		                         
		   lcOutput = lcOutput + [	</ElementType>] + CRLF  + lcObjectHeaders
		ENDIF

		IF lnRecurseType = 1
		   RETURN lcOutput + lcObjectHeaders
		ENDIF

		FOR lnX=1 TO lnPropCount
		   lcProperty = LOWER(laFields[lnX])
		   IF "," + lcProperty + "," $ "," + THIS.cpropertyexclusionlist + ","
		      LOOP
		   ENDIF
		   lcType = THIS.FoxTypeToXMLType(TYPE("loObject." + lcProperty))

		   IF THIS.lStripTypePrefix
		      lcDispField = SUBSTR(lcProperty,2)
		   ELSE
		      lcDispField = lcProperty
		   ENDIF

		   IF THIS.lRecurseObjects AND lcType = "object"
		      lcObjectProperties = lcObjectProperties + THIS.createobjectstructureschema(EVALUATE("loObject." + lcProperty),lcDispField,,2)
		      LOOP
		   ENDIF

		   lcObjectProperties = lcObjectProperties + ;
		      [	<ElementType name="] + LOWER(lcDispField) + [" content="textOnly" model="closed" dt:type="]+ lcType + [">] + CRLF +;
		      [		<AttributeType name="type"/>] + CRLF +;
		      [		<attribute type="type" default="]+ lcType +["/>] + CRLF +;
		      [	</ElementType>] + CRLF
		ENDFOR

		lcOutput = lcOutput + lcObjectProperties

		IF lnRecurseType = 2
		   RETURN lcObjectProperties
		ENDIF

		RETURN lcOutput + "</Schema>" + CRLF
	ENDPROC


	*-- Converts an XML typed string value into a Fox type value. Requires XML type to be passed.
	PROCEDURE xmlvaluetofoxvalue
		LPARAMETER lcXMLValue, lcXMLType, lvStore
		LOCAL  lcType, lcOldDate, lnOldHours, lnOldCentury, lnOldStrictDate

		lcType = THIS.xmltypetofoxtype(lcXMLType)
		 
		IF lcType $ "TD"
		   lcOldDate = SET("DATE")
		   lnOldHours = SET("HOURS")
		   lcOldCentury = SET("CENTURY")
		   lnOldStrictDate = SET("STRICTDATE")

		   SET HOURS TO 24
		   SET DATE TO YMD
		   SET CENTURY ON
		   SET STRICTDATE TO 0
		ENDIF

		DO CASE
		   CASE UPPER(lcXMLValue) = "NULL"
		      lcXMLValue = .NULL.
		   CASE lcType $ "CM"   
		      *** Do nothing - value is Ok
		   CASE lcType $ "NIF"
		      lcXMLValue = VAL(lcXMLValue)
		   CASE lcType = "T"
			  lcXmlValue = CTOT(lcXmlValue)
		      * lcXMLValue = CTOT(SUBSTR(CHRTRAN(lcXMLValue,"TZ"," "),1,16))
		   CASE lcType = "D"
			  lcXmlValue = TTOD(CTOT(lcXmlValue))
		      *lcXMLValue = CTOD(CHRTRAN(lcXMLValue,"TZ"," "))
		   CASE lcType = "L"
		      IF THIS.lUseFoxTypes
		         lcXMLValue = EVAL(lcXMLValue)
		      ELSE
		         IF lcXMLValue = "1" OR LOWER(lcXMLValue) = "true" 
		            lcXMLValue = .T.
		         ELSE
		            lcXMLValue = .F.
		         ENDIF
		      ENDIF
		   CASE lcType = "G"
		      LOOP
		   CASE lcType = "B"  && Binary
		      IF wwVFPVersion > 7
		         lcXMLValue = STRCONV(lcXMLValue,14)
		      ELSE
		         lvResult = lcXMLValue
		      ENDIF
		   CASE lcType = "O"
		       IF VARTYPE(lvStore) = "O"
		          *** If we have an object passed as input - try to parse it
		          
		          *** Add Extra Node to XML to get complete document
		          lcXMLDoc = THIS.cXMLHeader   + "<xdoc>" + lcXMLValue + "</xdoc>"
		          
		          *** Just convert
		          lvResult = THIS.XMLToObject(lcXMLDoc,lvStore)
		          RETURN lvResult
		        ENDIF
		        IF ISNULL(lvStore)  && Create object on the fly
		          *** If we have an object passed as input - try to parse it
		          lcXMLDoc = THIS.cXMLHeader   +  "<xdoc>" + lcXMLValue + "</xdoc>"
		          lvResult = THIS.XMLToObject(lcXMLDoc)
		          RETURN lvResult
		        ENDIF
		   OTHERWISE
		      lcXMLValue = EVAL(lcXMLValue)
		ENDCASE

		IF lcType $ "TD"
		   SET DATE TO &lcOldDate
		   SET HOURS TO lnOldHours
		   SET CENTURY &lcOldCentury
		   SET STRICTDATE TO lnOldStrictDate
		ENDIF

		RETURN lcXMLValue
		 
	ENDPROC


	*-- Creates a cursor from an XML Dataset. Creates one cursor at a time and requires that the cursor pre-exist.
	PROCEDURE datasetxmltocursor
		LPARAMETER lvXML, lcAlias, lcDataSetTableName
		LOCAL loXML, x, lnSize, lcCreate, loCursor, loData

		THIS.lError = .F.
		THIS.cErrorMsg = ""

		IF  VARTYPE(lvXML) = "C"
		   IF EMPTY(lvXML)  
		      THIS.lError = .T.
		      THIS.cErrorMsg = "No XML input passed."
		      RETURN .F.
		   ENDIF

		   *** Note: Parser will properly encode ASCII/ANSI doc without
		   ***       the header.
		   lvXML = STRTRAN(lvXML,[encoding="utf-8"],"")
		ELSE
		   IF TYPE("lvXML.async") # "L"
		      THIS.lError = .T.
		      THIS.cErrorMsg = "No XML input passed."
		      RETURN .F.
		   ENDIF
		ENDIF

		IF EMPTY(lcAlias)
		   lcAlias = "__wwXML"
		ENDIF

		IF VARTYPE(lvXML) # "O"
		   loXML = CREATEOBJECT(XML_XMLDOM_PROGID)
		   loXML.LoadXML( lvXML )
		ELSE
		   *** Input object must be IE 5 XML object
		   loXML = lvXML
		ENDIF

		*** Required to preserve leading spaces
		loXML.PreserveWhiteSpace = .T.

		*** Check for parsing error
		IF !EMPTY(loXML.ParseError.reason)
		   THIS.lerror = .T.
		   THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		      "Line: " + TRANSFORM(loXML.ParseError.LINE) + CRLF +;
		      loXML.ParseError.SrcText
		   RETURN .F.
		ENDIF


		*** get the root element node
		loDocRoot = loXML.DocumentElement
		IF ISNULL(loDocRoot)
		   THIS.lError = .T.
		   THIS.cErrorMsg = "Invalid XML Doc root. Data must be in child of document root."
		   RETURN .F.
		ENDIF

		*** Parse Schemas
		*!*   loTableSchemas = loDocRoot.SelectNodes("xsd:schema/xsd:element/xsd:complextype/xsd:choice/xsd:element")
		*!*   IF ISNULL(loTableSchemas)
		*!*      THIS.lError = .T.
		*!*      THIS.cErrorMsg = "No Schemas found"
		*!*      RETURN .F.
		*!*   ENDIF

		loDiffGr = loDocRoot.SelectSingleNode("diffgr:diffgram/NewDataSet")
		IF !ISNULL(loDiffGr)
		   IF !EMPTY(lcDataSetTableName)
		      loCursor = loDocRoot.SelectNodes("diffgr:diffgram/NewDataSet/" + lcDataSetTableName)
		      IF ISNULL(loCursor)
		         RETURN ""
		      ENDIF
		      RETURN THIS.ParseXMLToCursor(loCursor.Item(0).ParentNode,.T.)  && Hand off a node list
		   ELSE
		      loCursor = loDocRoot.SelectSingleNode("diffgr:diffgram/NewDataSet")
		      IF ISNULL(loCursor)
		         RETURN ""
		      ENDIF
		      RETURN THIS.ParseXMLToCursor(loCursor)
		   ENDIF   
		ELSE
		   *** Nodes are directly under the root node
		   IF !EMPTY(lcDataSetTableName)
		      loCursor = loDocRoot.SelectNodes(lcDataSetTableName)
		      IF ISNULL(loCursor)
		         RETURN ""
		      ENDIF
		      RETURN THIS.ParseXMLToCursor(loCursor.item(0).ParentNode,.T.)  && Hand off a node list
		   ELSE
		      RETURN ""
		   ENDIF   
		ENDIF
	ENDPROC


	*-- Creates a cursor by parsing the Schema
	PROCEDURE createcursorfromschema
		LPARAMETER loSchema, lcAlias
		LOCAL lcSchemaXML, loFields, lnFields, lcCursor, lcRow, lcXML, lnX, lcName, loXML

		IF ISNULL(loSchema)
		   RETURN .F.
		ENDIF

		lcSchemaXML = loSchema.XML
		 
		loFields = loSchema.selectNodes("ElementType")
		IF ISNULL(loFields)
		   RETURN .F.
		ENDIF

		lnFields = loFields.length 
		IF lnFields < 3
		   RETURN .F.
		ENDIF

		lcCursor = loFields.item(0).Attributes.GetNamedItem("name").Text
		lcRow = loFields.item(1).Attributes.GetNamedItem("name").Text

		*** Create a new XML document with a single record that contains
		*** contains the structure and then parse that

		lcXML = ;
		[<root>] + ;
		  lcSchemaxml + ;
		 [<] + lcCursor + [ xmlns="x-schema:#Schema"><] + lcRow + [>] + CRLF 


		*** Skip over table and row level nodes
		FOR lnX = 2 TO lnFields -1
		   lcName = loFields.item(lnX).attributes.GetNamedItem("name").text
		   lcXML = lcXML + ;
		           [<] +lcName + [/>] + CRLF
		ENDFOR

		lcXML = lcXML + [</] + lcrow + [></] + lccursor + [></root>]

		loXML = CREATEOBJECT("wwXML")
		loDom = loXML.LoadXML(lcXML)
		IF !EMPTY(loDom.ParseError.Reason)
		   THIS.cErrorMsg = loDom.ParseError.Reason
		   THIS.lError = .T.
		   RETURN .F.
		ENDIF

		THIS.BuildCursorFromXML(loDOM.DocumentElement.SelectSingleNode(lcCursor),;
		                        lcAlias)

		IF THIS.lError
		   RETURN .F.
		ENDIF

		RETURN .T.
	ENDPROC


	PROCEDURE xpathvaluetofoxvalue
		LPARAMETERS loRootNode, lcXPath, lcType, lvStore

		loValue = loRootNode.SelectSingleNode(lcXPath)
		IF ISNULL(loValue)
		   RETURN this.xmlvaluetofoxvalue("",lcType,@lvStore)   
		ENDIF   

		lcValue = loValue.Text

		IF EMPTY(lcType)
		   RETURN lcValue
		ENDIF

		RETURN this.xmlvaluetofoxvalue(lcValue,lcType,@lvStore)   
	ENDPROC


	PROCEDURE buildandupdateobjectfromxml
		LPARAMETER loObjectStructure, loType
		LOCAL loObject,lnIndex,llUseCustomTypes, ;
		   lcType, ;
		   loAttributes, ;
		   lcField, ;
		   lcFoxType

		loObject = .NULL.

		llUseCustomTypes = VARTYPE(loType.aProperties) # "U"

		*** Create the new object   
		loObject = CREATE(THIS.cObjectClass)

		*** Loop through the XML document to read each property
		*** and populate property from it
		FOR EACH loField IN loObjectStructure.ChildNodes
		   loAttributes = loField.ATTRIBUTES
		   lcField = loField.NodeName

		   loObject.ADDPROPERTY(lcField)
		   IF llUseCustomTypes
		   	  #IF wwVFPVersion < 7
		    	    lnIndex = ASCAN(loType.aProperties,lcField,-1,-1)
		   	  #ELSE
			       lnIndex = ASCAN(loType.aProperties,lcField,-1,-1,1)
		        #ENDIF
		      
		      IF lnIndex > 0
		         lcType = loType.aProperties[lnIndex + 1]
		      ELSE
		         lcType = "string"
		      ENDIF
		   ELSE
		      lcType = loAttributes.GetNamedItem("type").TEXT
		   ENDIF

		*** We have to check the type for objects
		lcFoxType = THIS.xmltypetofoxtype(lcType)
		IF lcFoxType = "O"
		   *** Build the child object and attach it!
		   loTemp = this.BuildAndUpdateObjectFromXML(loField,poSDL.aTypes[2])
		   loObject.&lcField = loTemp  
		ELSE
		   *** Just convert and return
		   loObject.&lcField = this.XMLValueToFoxValue(loField.Text,lcType)
		ENDIF   
		   
		*!*      DO CASE
		*!*         CASE lcType = "C"
		*!*         CASE lcType = "N"
		*!*            loObject.&lcField = lvValue
		*!*         CASE lcType = "L"
		*!*            loObject.&lcField = 
		*!*         CASE lcType $ "D"
		*!*            loObject.&lcField = {}
		*!*         CASE lcType $ "T"
		*!*            loObject.&lcField = {  /  /  :  }
		*!*         CASE lcType = "U"
		*!*            loObject.&lcField = .NULL.
		*!*   *      CASE lcType = "O"
		*!*   *         loObject.&lcField = .NULL.
		*!*         OTHERWISE 
		*!*            *** Must create an object first then set to .NULL.         
		*!*            *** to get Fox to read the type right
		*!*            loObject.&lcField = CREATE("Relation")
		*!*            loObject.&lcField = .NULL.
		*!*      ENDCASE
		ENDFOR

		RETURN loObject
	ENDPROC


	*-- Creates an XML snippet for a Collection. This is a low level method
	PROCEDURE createcollectionxml
		LPARAMETER loCollection, lcName, lcRow, lnIndent
		LOCAL lcOutput, lnItem, lnX, lvValue, lcType, lcField

		lnItems = loCollection.Count

		*** Loop through the collection fields first (Count, KeySort)
		lcOutput = this.CreateobjectXml(loCollection,lcName,lnIndent)

		*** Strip off ending tags
		lcOutput = STRTRAN(lcOutput,[</] + lcName + [>] + CRLF,[]) + ;
		           CHR(9) + [<items>] + CRLF


		FOR lnX=1 TO lnItems
		   lvValue = loCollection.Item[lnX]
		   lcType = VARTYPE(lvValue)
		   lcField = lcRow

		   lcOutput = lcOutput + this.AddElement(lcRow,@lvValue,lnIndent + 2,;
		    									 IIF(lcType # "O",[key="] + loCollection.GetKey(lnX) +[" type="] + lcType + ["],;
		    									                  [key="] + loCollection.GetKey(lnX)+ ["]))
		ENDFOR


		RETURN lcOutput + ;
		   REPLICATE(CHR(9),lnIndent + 1) + "</items>" + CRLF  + ; 
		   REPLICATE(CHR(9),lnIndent) + "</" + lcName + ">" + CRLF
	ENDPROC


	*-- Parses XML snippet to a collection
	PROCEDURE parsexmltocollection
		LPARAMETER loXMLObject, loCollection as Collection
		LOCAL lnX, lcName, loRows, lnRows, loITem

		IF ISNULL(loXMLObject)
		   THIS.cErrorMsg = "No data provided for element"
		   RETURN .f.
		ENDIF

		*** Walk the object and then pull properties 
		*** from the XML to repopulate it
		*lcName = loXMLObject.NodeName
		loRows = loXMLObject.SelectNodes("items/item")
		loCollection.KeySort =  VAL(loXmlObject.SelectSingleNode("keysort").text)
		lnRows = loRows.length

		*** If there's already an item in there assume it's the 'match' type
		IF loCollection.Count = 1 
		   lvTemplate = loCollection.item(1)
		   lcTemplateType = VARTYPE(lvTemplate)
		   IF lcTemplateType = "O"
		      lvTemplate = CopyObject(loCollection.Item(1))
		      loCollection.Remove(1)
		   ENDIF
		ELSE
		   lvTemplate = null
		   lcTemplateType = ""
		ENDIF   


		lnX = 0
		FOR EACH oRow in loRows
		   lnX= lnX + 1
		   
		   lcValue = oRow.TEXT
		   LOCAL loT
		   loT = oRow.Attributes.GetNamedItem("key")
		   IF !ISNULL(loT)
		      lcKey = loT.TEXT   
		   ELSE
		      lcKey = ""
		   ENDIF
		   loT = oRow.Attributes.GetNamedItem("type")
		   IF !ISNULL(lot)
		      lcType = loT.TEXT
		   ELSE
		      lcType = "C"
		   ENDIF

		   
		   DO CASE
		      CASE lcType $ "CM"
				 IF (EMPTY(lcKey))
			      	 loCollection.Add(STRTRAN(lcValue,"&#00;",CHR(0)))
		      	 ELSE
		    	   	 loCollection.Add(STRTRAN(lcValue,"&#00;",CHR(0)),lcKey)
		       	 ENDIF

		      CASE lcType = "O" OR lcType="object"
				 IF lcTemplateType="O"
				    *** Create new element by copying the template
		          IF !EMPTY(lcKey)
		   		 	loItem = loCollection.Add(CopyObject(lvTemplate),lcKey)
		          ELSE
		             loItem = loCollection.Add(CopyObject(lvTemplate))
		          ENDIF
				 	this.Parsexmltoobject(oRow,loCollection.Item(lnX))
				 ENDIF
		      CASE lcType $ "NIFY"
		         loCollection.Add( VAL(lcValue),lcKey)
		      CASE lcType = "T"
		         loCollection.Add( CTOT(lcValue),lcKey)
		      CASE lcType = "D"
		         loCollection.Add( CTOD(lcValue),lcKey)
		      CASE lcType = "L"
		         IF lcValue = "True"
		           loCollection.Add(.T.,lcKey)
		         ELSE
		           loCollection.Add(.F.,lcKey)
		         ENDIF
		      OTHERWISE
		         *** If we have an object
		         loCollection.Add(.NULL.,lcKey)
		   ENDCASE
		ENDFOR

		RETURN .T.
	ENDPROC


	*-- Creates XML from a one dimensional array.
	PROCEDURE arraytoxml
		LPARAMETER laArray, lcName, lcRow, lnIndent

		RETURN "<" + this.cDocrootname + ">" + CRLF +;
		        this.CreateArrayXml(@laArray,lcName,lcRow,lnIndent) +;
		        "</" + this.cDocrootname + ">" + CRLF
	ENDPROC


	*-- Parses XML created by ArrayToXML back into an array.
	PROCEDURE xmltoarray
		LPARAMETER loXMLObject, laArray

		Doc = this.LoadXML(lcXML)

		IF TYPE("Doc.DocumentElement.ChildNodes(0)") # "O"
		   THIS.cErrorMsg = "Invalid XML format for array."
		   RETURN .F.
		ENDIF

		RETURN this.ParseXmlToArray(Doc.DocumentElement.ChildNodes(0),@laArray)
	ENDPROC


	*-- Converts a FoxPro value to an XML value
	PROCEDURE foxvaluetoxmlvalue
		LPARAMETERS lvValue
		LOCAL lcFoxType

		lcFoxType = VARTYPE(lvValue)

		DO CASE
		*!*	      CASE TYPE([ALEN(lvValue)]) = "N"
		*!*	         IF THIS.lRecurseObjects
		*!*	            *** THIS CODE MUST BE ON 2 lines of VFP gets confused
		*!*	            lcResult = THIS.CreateArrayXML(@lvValue,lcDispField,,lnIndent+1)
		*!*	            lcAttributes = lcAttributes + [ count="] + TRANSFORM(ALEN(lvValue)) + ["]
		*!*	            IF !EMPTY(lcAttributes)
		*!*		          lcResult = STRTRAN(lcResult,"<" + lcDispField ,"<" + lcDispField + lcAttributes,1,1 )
		*!*		        ENDIF
		*!*	            lcOutput = lcOutput + lcResult
		*!*	         ELSE
		*!*	            lcOutput = lcOutput + REPLICATE(CHR(9),lnIndent + 1) + "<" + lcDispField + ">(array)</" + lcDispField + ">" + CRLF
		*!*	         ENDIF
		   CASE ISNULL(lvValue)
		         RETURN ""      
		   CASE lcFoxType = "C"
		      IF EMPTY(lvValue)
		         RETURN  ""
		      ELSE
		         lvValue = STRTRAN(TRIM(lvValue),"&","&amp;")
		         lvValue = STRTRAN(lvValue,">","&gt;")
		         lvValue = STRTRAN(lvValue, "<", "&lt;")
		         RETURN lvValue
		      ENDIF
		   CASE lcFoxType = "D" OR lcFoxType = "T"
		      IF EMPTY(lvValue)
		      	 lvValue = {^1900-01-01 00:00}
		      ENDIF

			  LOCAL lcDate as Datetime
			  lcDate = ""
				#IF wwVFPVersion > 8
					  lcDate = TTOC(lvValue,3) + ".00000"
				#ELSE

				      lcOldDate = SET("DATE")
				      lnOldHours = SET("HOURS")
				      lcOldCentury = SET("CENTURY")
				      lcOldMark = SET("MARK")

				      SET HOURS TO 24
				      SET DATE TO YMD
				      SET CENTURY ON
				      SET MARK TO "-"

					  lcDate =  STRTRAN( TRANSFORM(lvValue) + ".00000"," ","T" )

				      SET DATE TO &lcOldDate
				      SET HOURS TO lnOldHours
				      SET CENTURY &lcOldCentury
				      SET MARK TO (lcOldMark)
			   #ENDIF
			   
			   RETURN lcDate
		   CASE lcFoxType = "L"
		         RETURN IIF( lvValue, "1","0")
		   CASE lcFoxType = "Q" 
		         RETURN  STRCONV(lvValue,13)
		*!*	   CASE lcFoxType = "O"
		*!*	         *** The following *MUST* be separate line or else VFP gets confused
		*!*	         *** in the recursion levels and generates invalid fields
		*!*	         DO CASE 
		*!*	         *** Deal with Collections
		*!*	         CASE TYPE("lvValue.BaseClass")="C" AND lvValue.BaseClass = "Collection"
		*!*	    	     lcResult = THIS.CreateCollectionXML(lvValue,lcDispField,"item",lnIndent )

		*!*	         *** Check for XML DOM nodes - embed XML directly
		*!*	         CASE TYPE("lvValue.NodeType") = "N" 
		*!*	             lcResult="<" + lcDispField + lcAttributes +  ">" + lvValue.Xml  + "</" + lcDispField + ">"  && Embed Raw XML    
		*!*	         OTHERWISE
		*!*	            *** FoxPro object
		*!*		         lcResult = THIS.CreateObjectXML( lvValue,lcDispField,lnIndent)
		*!*		     ENDCASE

		*!*	*!*         IF !EMPTY(lcAttributes)
		*!*	*!*            lcResult = STRTRAN(lcResult,"<" + lcDispField ,"<" + lcDispField + lcAttributes,1,1 )
		*!*	*!*         ENDIF
		*!*	      RETURN lcResult
		ENDCASE

		RETURN TRANSFORM(lvValue)
	ENDPROC


	*-- Adds a child Dom node to an XML document
	PROCEDURE adddomnode
		LPARAMETERS loNode, lcName, lcValue, lcNameSpace
		LOCAL loNewNode

		IF EMPTY(lcNameSpace)
		 lcNameSpace = ""
		ENDIF

		IF EMPTY(lcNameSpace)
		   loNewNode = this.oXml.CreateElement(lcName)
		ELSE
		   loNewNode = this.oXml.createNode(1,lcName,lcNameSpace)    
		ENDIF

		lcType = VARTYPE(lcValue) 
		DO CASE
			CASE lcType = "C"
				loNewNode.Text = lcValue
		ENDCASE

		loNode.AppendChild(loNewNode)

		RETURN loNewNode
	ENDPROC


	*-- Adds an Attribute to a DOM node
	PROCEDURE adddomattribute
		LPARAMETERS loNode, lcName, lcValue, lcNameSpace

		IF EMPTY(lcNameSpace)
		  lcNameSpace = ""
		ENDIF

		loAttr = this.oXml.createNode(2,lcName,lcNameSpace)
		loAttr.Text=lcValue
		loNode.attributes.setNamedItem(loAttr) 

		RETURN loNode
		    
	ENDPROC


	*-- Loads an XML document from a file
	PROCEDURE load
		LPARAMETER lcFile, llAsync, llPreserveWhiteSpace
		LOCAL loXML

		THIS.lError = .f.
		THIS.cErrorMsg = ""

		this.oXml = null

		IF VARTYPE(lcXML) = "O"
		   *** Use existing ref if passed in
		   loXML = lcXML
		ELSE
		   IF EMPTY(lcFile)
		      this.cErrormsg = "No filename passed to load XML document."      
		   	  RETURN NULL
		   ENDIF
		   IF VARTYPE(THIS.oXML) # "O"
		      *** Create if it doesn't exist already
		      loXML =  CREATE(XML_XMLDOM_PROGID)
		      loXML.Async = llAsync
		   ELSE
		      *** If we have one already - reuse it!
		      loXML = THIS.oXML
		      loXML.Async = llAsync
		   ENDIF
		   loXML.Load(lcFile)
		ENDIF

		*** Check for parsing error
		IF TYPE("loxml.parseerror.reason")="C" AND ;
		   !EMPTY(loXML.ParseError.reason)
		      THIS.cErrorMsg = loXML.ParseError.reason + CRLF + ;
		         "Line: " + TRANSFORM(loXML.ParseError.LINE) + CRLF +;
		         loXML.ParseError.SrcText
		      THIS.lError = .T.
		      RETURN .NULL.
		ENDIF
		loXML.PreserveWhiteSpace = .T.

		this.oXML = loXML

		RETURN loXML
	ENDPROC


	*-- Adds a linebreak to the bottom of a node's content list along with indenting for the next line. Text element is inserted at the end of the node's content.
	PROCEDURE adddomlinebreak
		LPARAMETERS loNode, lnIndent

		IF EMPTY(lnIndent) 
		   lnIndent = 0
		ENDIF
		  
		lcText = CHR(10) + REPLICATE(CHR(9),lnIndent)

		LOCAL loText 
		loText = loNode.OwnerDocument.createTextNode(lcText)
		RETURN loNode.appendChild(loText)
	ENDPROC


	PROCEDURE Init
		*** Exclude Custom Property Exclusions
		THIS.cPropertyExclusionList = ;
		 ",activecontrol,classlibrary,baseclass,comment,docked,dockposition,controls,objects,controlcount,"+;
		 "class,name,parent,parentalias,parentclass,helpcontextid,whatsthishelpid," +;
		 "width,height,top,left,tag,picture,onetomany,childalias,childorder,relationalexpr,timestamp_column," 
	ENDPROC


ENDDEFINE
*
*-- EndDefine: wwxml
**************************************************
