#INCLUDE WCONNECT.h

SET PROCEDURE TO wwConfig ADDITIVE

*** Dependencies
SET CLASSLIB TO wwXML ADDITIVE
SET PROCEDURE TO wwAPI ADDITIVE
SET PROCEDURE TO wwUtils ADDITIVE

#IF .F.
*** Test/demo code
CLEAR


o=create("MyConfig")
o.cFileName = "Config.xml"
o.cMode = "XML"

IF .F.
    o.cFileName = "Config.ini"
    o.cAppName = "Ini File Test"
    ? o.Save()
ENDIF    
IF .F.
    o.cFileName = "Config.ini"
    ? o.LoadIni()
    ? o.cAppName
    ? o.oTest.cHTMLPagePath
ENDIF
IF .F.
	o.cAppName = "Default Application - Not yet set"
	o.nTimerInterval = 100
	o.cTemplate="cfg_"
	? o.Save() 
	modi comm config.xml
ENDIF
IF .F.
    o.Load()
ENDIF

IF .F.
	o.cAppName = "Test Application"
	o.nTimerInterval = 100

   o.cRegPath = "Software\West Wind Technologies\TestConfig"
   o.cRegNode = "Parameters"
   ? o.SaveRegistry()
ENDIF
IF .F.   
   o.cRegPath = "Software\West Wind Technologies\TestConfig"
   o.cRegNode = "Parameters"
   
   ? o.LoadRegistry()
ENDIF

? o.cAppName
? o.nTimerInterval
? o.cTemplate

RETURN

*** All you have to do is add properties
*** for the config items and type them properly
*** with default values for first startup
DEFINE CLASS MyConfig AS wwConfig

cPath="d:\temp\"
cTemplate="wc_"
nPriority=1
lDebugMode=.F.
lLogToFile=.T.
lShowStatus=.T.
nScriptMode=3
nTimerInterval=250
lSaveRequestFiles=.F.
cAppName = ""
oTest = .NULL.

FUNCTION Init
*THIS.oTest = CREATE("cTest")
*THIS.oTest.cHTMLPagePath = "d:\westwind\wconnect\"

RETURN
ENDFUNC

ENDDEFINE

DEFINE CLASS cTest as Relation

cHTMLPagePath = "Test Path"
*cDataPath = "d:\westwind\data"
ENDDEFINE

#ENDIF



*************************************************************
DEFINE CLASS wwConfig AS Relation
*************************************************************

*** These values are not part of the XML exported
*** interface. 
cFileName = ""
cSubName = "config"
oXML = .NULL.
cRegPath = "SOFTWARE\West Wind Technologies\Config"
cRegNode = "Parameters"
cMode = "INI"

PROTECTED cPropertyExclusionList
cPropertyExclusionList =  ",cfilename,oxml,cregpath,cregnode,"+;
                          "csubname,cmode,cpropertyexclusionlist,loverwriteini,"


****************************************************************
FUNCTION Save
*************
LPARAMETER loObject

THIS.cMode = UPPER(THIS.cMode)

DO CASE
	CASE THIS.cMode = "XML"
		IF EMPTY(THIS.cFileName)
		   RETURN .F.
		ENDIF   

		STRTOFILE(THIS.CreateXML(),THIS.cFileName)
	CASE THIS.cMode = "INI"
		IF EMPTY(THIS.cFileName)
		   RETURN .F.
		ENDIF   
        *ERASE (FULLPATH(THIS.cFileName))
        THIS.SaveIni(this) 
	CASE THIS.cMode = "REGISTRY"
	    THIS.SaveRegistry()
ENDCASE   

RETURN .T.

****************************************************************
FUNCTION Load
*************
LPARAMETER loObject

THIS.cMode = UPPER(THIS.cMode)

DO CASE
CASE THIS.cMode = "XML"
	IF EMPTY(THIS.cFileName) or !FILE(THIS.cFileName)
	   RETURN .F.
	ENDIF

	lcXML = FILETOSTR(THIS.cFileName)
	THIS.LoadFromXML(lcXML)
CASE THIS.cMode = "INI"
	RETURN THIS.LoadIni(loObject)
CASE THIS.cMode = "REGISTRY"
    RETURN THIS.LOADREGISTRY()   
ENDCASE 

RETURN


****************************************************************
FUNCTION SaveRegistry
*********************
loAPi = CREATE("wwAPI")

lcXML = THIS.CreateXML()

RETURN loAPI.WriteRegistryString(,THIS.cRegPath,THIS.cRegNode,lcXML,.T.)


****************************************************************
FUNCTION LoadRegistry
*********************

loAPI = CREATE("wwAPI")
lcXML = loAPI.ReadRegistryString(,THIS.cRegPath,THIS.cRegNode)
IF ISNULL(lcXML)
   RETURN .F.
ENDIF

RETURN THIS.LoadFromXML(lcXML)

****************************************************************
PROTECTED FUNCTION CreateXML
****************************

loXML = CREATE("wwXML")
loXML.lRecurseObjects = .T.
loXML.lStripTypePrefix = .T.

loXML.cDocRootName = lower(JustStem(THIS.cFileName))
IF loXML.cDocRootName="config"
   loXML.cDocRootName = "wwConfig"
ENDIF

*** We have to exclude these internal properties
loXML.cPropertyExclusionList = loXML.cPropertyExclusionList + ;
      THIS.cPropertyExclusionList
      
RETURN loXML.ObjectToXML(THIS,THIS.cSubName)

****************************************************************
PROTECTED FUNCTION LoadFromXML
******************************
LPARAMETER lcXML

loXML = CREATE("wwXML")
loXML.lRecurseObjects = .T.
loXML.lStripTypePrefix = .T.

*** Simply reload the object properties from the XML
loXML.XMLToObject(lcXML,THIS)

RETURN loXML.lError

****************************************************************
FUNCTION SaveIni
*********************
LPARAMETER loObject, lcName
LOCAL lcOutput, lnX, lnCount, laFields(1), lcField, lcType, lvValue, loXML

loXML = CREATE("wwXML")
*** We have to exclude these internal properties
loXML.cPropertyExclusionList = loXML.cPropertyExclusionList + ;
      THIS.cPropertyExclusionList

lcName=IIF(EMPTY(lcName),THIS.cSubName,lcName)
lcFileName = LOWER(FULLPATH(THIS.cFileName))

EXTERNAL ARRAY la_array

IF VARTYPE(loObject)#"O"
   loObject = THIS
ENDIF   

loAPI = CREATE("wwAPI")

lnCount = AMEMBERS(laFields, loObject)

FOR lnX=1 TO lnCount
   lcField = LOWER(laFields[lnX])
   IF AT("," + lcField + ",", "," + loXML.cPropertyExclusionList + ",")>0
	       LOOP
   ENDIF
   lcType = TYPE("loObject."+lcField)
   lvValue =  EVAL("loObject."+lcField)
   
   IF .T. &&THIS.lStripTypePrefix
      lcDispField = Proper(SUBSTR(lcField,2))
   ELSE
      lcDispField = Proper(lcField)
   ENDIF
   
   DO CASE
      CASE ISNULL(lvValue)
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,"NULL")
      CASE lcType = "C"
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,TRIM(lvValue))
      CASE lcType = "D" OR lcType = "T"
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,TRANSFORM(lvValue))
       CASE lcType = "L"
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,IIF(lvValue,"On","Off"))
      CASE lcType = "O"
         THIS.SaveIni(loObject.&lcField,lcDispField)
      CASE lcType = "U"
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,"NULL")
      OTHERWISE
        loAPI.WriteProfileString(lcFileName,lcName,lcDispField,TRANSFORM(lvValue))
   ENDCASE
ENDFOR

RETURN .T.

****************************************************************
FUNCTION LoadIni
*********************
LPARAMETER loObject, lcName
LOCAL lcName, lcFileName, loAPI, loXML, lnProperties, lnX,;
      lcField, lcXMLField, lcType, lcValue, loObject,;
      laProperties[1]

IF VARTYPE(loObject) # "O"
   loObject=THIS
ENDIF

lcName=IIF(EMPTY(lcName),THIS.cSubName,lcName)
lcFileName = FULLPATH(THIS.cFileName)

loAPI = CREATE("wwAPI")
loXML = CREATE("wwXML")
*** We have to exclude these internal properties
loXML.cPropertyExclusionList = loXML.cPropertyExclusionList + ;
      THIS.cPropertyExclusionList

*** Walk the object and then pull properties 
*** from the INI to repopulate it
lnProperties = AMEMBERS(laProperties,loObject)

lnX=0
FOR lnX=1 TO lnProperties
   lcField = lower(laProperties[lnX])
   if "," + lower(lcField) + "," $  "," + loXML.cPropertyExclusionList + ","
      LOOP
   ENDIF

   lcXMLField = SUBSTR(lcField,2)
   lcType = TYPE("loObject." + lcField)
   lcValue = loAPI.GetProfileString(lcFileName,lcName,lcXMLField)
   IF ISNULL(lcValue) AND lcType # "O"
      LOOP
   ENDIF

   DO CASE
      CASE lcType $ "CM"
         loObject.&lcField = lcValue
      CASE lcType $ "NIF"
         loObject.&lcField = VAL(lcValue)
      CASE lcType = "T"
         loObject.&lcField = CTOT(lcValue)
      CASE lcType = "D"
         loObject.&lcField = CTOD(lcValue)
      CASE lcType = "L"
         IF lcValue = "1" or UPPER(lcValue) = "ON"
            loObject.&lcField = .T.
         ELSE
            loObject.&lcField = .F.
         ENDIF
      CASE lcType = "O"
           THIS.LoadIni(loObject.&lcField,lcXMLField)
   ENDCASE
ENDFOR

RETURN .T.


ENDDEFINE


*** CODE TO CREATE A NEW SUBTREE IN THE HELP HIERARCHY

*!*	loAPI = THIS.oAPI

*!*	this.cSubTree = "SOFTWARE\"+THIS.cCompany+"\"+THIS.cAppName
*!*	IF VARTYPE(THIS.cVersion) # "C"
*!*	   this.cVersion = TRANS(THIS.cVersion)
*!*	ENDIF

*!*	lcValue = loAPI.ReadRegistryString(,THIS.cSubTree,"")

*!*	lcValue = loAPI.ReadRegistryString(,"SOFTWARE\"+THIS.cCompany+"\"+THIS.cAppName+"\Parameters","CurrentVersion")
*!*	IF ISNULL(lcValue)
*!*	   loAPI.WriteRegistryString(,"SOFTWARE\"+THIS.cCompany,"","",.T.)
*!*	   loAPI.WriteRegistryString(,THIS.cSubTree,"","",.T.)
*!*	   loAPI.WriteRegistryString(,THIS.cSubTree+"\Parameters","CurrentVersion",THIS.cVersion,.T.)
*!*	ELSE
*!*	   *** Update the version if its different
*!*	   IF lcValue # THIS.cVersion
*!*	      loAPI.WriteRegistryString(,THIS.cSubTree+"\Parameters","CurrentVersion",THIS.cVersion,.T.)
*!*	   ENDIF
*!*	ENDIF

*!*	RETURN



