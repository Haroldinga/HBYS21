************************************************************************
*FUNCTION wwcClient
*******************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1995-2002
***   Contact: www.west-wind.com - rstrahl@west-wind.com
***  Modified: 05/01/2002
***  Function: Main Program that loads all the Web Connect
***            classes into memory. This program is not required
***            for the registered version - simply use
***            SET PROCEDURE commands in your main program file.
************************************************************************
LPARAMETER lcUnload

lcUnload=IIF(VARTYPE(lcUnload)="C",UPPER(lcUnload),"LOAD")

#INCLUDE WCONNECT.H

*** Web Connection classes and PRGs are expected in a
*** CLASSES subdirectory or else in the current dir. Either
*** way they need to be accessible via the VFP PATH
*DO PATH WITH WWC_FRAMEWORK_PATH + "CLASSES"

*** Utility classes
SET PROCEDURE TO wwUTILS ADDITIVE
SET PROCEDURE TO wwEval ADDITIVE
SET PROCEDURE TO CodeBlockClass ADDITIVE
SET PROCEDURE TO wwAPI ADDITIVE

SET PROCEDURE TO wwConfig ADDITIVE

#IF WWC_LOAD_WWSOAP
   SET PROCEDURE TO wwSOAP ADDITIVE
#ENDIF
#IF WWC_LOAD_WWHTTP
    SET PROCEDURE TO wwHTTP ADDITIVE
#ENDIF      
#IF WWC_LOAD_WWIPSTUFF
   SET CLASSLIB TO wwIPSTUFF ADDITIVE
#ENDIF
#IF WWC_LOAD_WWXML
   SET CLASSLIB TO wwXML ADDITIVE
#ENDIF

#IF WWC_LOAD_WWBUSINESS
  SET CLASSLIB TO wwBusiness ADDITIVE
#ENDIF
#IF WWC_LOAD_WWPDF
   SET PROCEDURE TO wwPDF ADDITIVE
#ENDIF
#IF WWC_LOAD_WWSQL
  SET CLASSLIB TO wwSQL ADDITIVE
#ENDIF
#IF WWC_LOAD_WWHTTPSQL
   SET PROCEDURE TO wwHTTPSQL ADDITIVE
#ENDIF

RETURN
*EOP wConnect


************************************************************************
FUNCTION Path
******************
***  Function: Adds or deletes items from the path string
***      Pass: pcPathName   -   Filename
***            pcMethod     -   *"ADD","DELETE"
***
***    Return: New Path or ""
************************************************************************
PARAMETERS pcPath,pcMethod
PRIVATE aPath,lcOldPath
pcMethod=IIF(type("pcMethod")="C",upper(pcMethod),"ADD")

IF parameters()<1 
   * WAIT WINDOW "No path passed..." NOWAIT
   RETURN
ENDIF
   
pcPath=ADDBS(LOWER(TRIM(pcPath)))
lcOldPath=LOWER(SET("PATH"))

IF pcMethod="ADD"
    IF EMPTY(pcPath) .OR. ;
       !Directory(pcPath)
      * WAIT WINDOW "Path does not exist..." NOWAIT
      RETURN ""
   ENDIF
   IF AT(";" + pcPath,";" + lcOldPath)>0
      * WAIT WINDOW "Path is already included..." NOWAIT
      RETURN ""
   ENDIF
   lcOldPath=lcOldPath+";"+pcPath
ELSE
   IF AT(";" + pcPath,";" + lcOldPath)<1
      * WAIT WINDOW "Path is not part of path string..." NOWAIT
      RETURN ""
   ENDIF
   lcOldPath=STRTRAN(lcOldPath,";"+pcPath)
   lcOldPath=STRTRAN(lcOldPath,pcPath)
ENDIF   

SET PATH TO &lcOldPath
* WAIT WINDOW NOWAIT "New Path: "+lcOldPath

RETURN lcOldPath
*EOP PATH
