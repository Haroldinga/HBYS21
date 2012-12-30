****************************************************************************
*
*  PROGRAM NAME: PackMeta.prg
*
*  AUTHOR: Richard A. Schummer, August 1996
*
*  COPYRIGHT © 1996   All Rights Reserved.
*     Richard A. Schummer
*     42759 Flis Dr.  
*     Sterling Heights, MI  48314-2850
*     RSchummer@CompuServe.com
*
*     Free for the use by all FoxPro developers around the world!
*
*  SYSTEM: Common Utilities
*
*  PROGRAM DESCRIPTION: 
*     This program packs all the Visual Class Libraries and Forms
*     that are contained in a selected project file.  This PACK
*     removes all the "memo bloat" that naturally occurs during 
*     a development cycle.
*
*     Error not handled includes File in Use (usually caused by 
*     a Form running or instantiation of a Visual Class).
*    
*  CALLED BY: 
*     DO PackMeta.prg
*
*  SAMPLE CALL:
*     DO PackMeta.prg
*
*  INPUT PARAMETERS: 
*     None
*
*  OUTPUT PARAMETERS:
*     None
* 
*  DATABASES ACCESSED: 
*     None
* 
*  GLOBAL VARIABLES REQUIRED:
*     None
*
*  GLOBAL PROCEDURES REQUIRED:
*     None
* 
*  DEVELOPMENT STANDARDS:
*     Version 3.0 compliant
*  
*  TEST INFORMATION:
*     None
*   
*  SPECIAL REQUIREMENTS/DEVICES:
*     None
*
*  FUTURE ENHANCEMENTS:
*     1) Possibly include Reports and Menus as well.  These are not as big 
*        a problem for the developer so they were not included in this 
*        version
*
*  LANGUAGE/VERSION:
*     Visual FoxPro 3.0b or higher                                                  
* 
****************************************************************************
*
*                           C H A N G E    L O G
*
*   Date                SE            Version           Description
* ----------  ----------------------  -------  ----------------------------- 
* 08/11/1996  Richard A. Schummer     1.0      Created program 
* -------------------------------------------------------------------------- 
* 12/08/1996  Richard A. Schummer     1.0      Added documentation to meet
*                                              development standards
* -------------------------------------------------------------------------- 
* 03/08/1997  Richard A. Schummer     1.1      Handle error of File Open,
*                                              Count of skipped files, chged
*                                              some var names to conform to
*                                              development standards.
* -------------------------------------------------------------------------- 
*
****************************************************************************
#INCLUDE FoxPro.h
#DEFINE  ccMESSAGE_CAPTION  "Pack Metadata Process Message"
#DEFINE  ccTOOL_VERSION     "1.1.0"

PRIVATE  plFileOpened                  && Indicates metadata open, changed to .F. in error routine
LOCAL    lnRecordsProcessed            && Number of metadata files PACKed
LOCAL    lnRecordsSkipped              && Number of metadata files not PACKed
LOCAL    lcSelectedCursor              && Previously selected cursor
LOCAL    lcProjectFile                 && Project file selected by user
LOCAL    lcOldError                    && Save error routine

lcOldError = ON("ERROR")

* ON ERROR for this program
ON ERROR DO ErrorHandlerPR WITH ;
         ERROR( ), MESSAGE( ), MESSAGE(1), PROGRAM( ), LINENO( ), lcMetaData

lcSelectedCursor = SELECT()
lcProjectFile    = GETFILE('PJX', 'Select a Project File', 'Select')

IF !EMPTY(lcProjectFile)
   IF USED("projfile")
      USE IN projfile                  &&  So no "Alias in use" msg
   ENDIF

   USE (lcProjectFile) ;
       IN SELECT(1) ;
       AGAIN NOUPDATE ALIAS projfile SHARED

   IF TYPE("projfile.user") = "U"
      =MESSAGEBOX("Project file selected is from prior version of FoxPro." + CHR(13) + ;
                  "Please select Visual FoxPro project.", ;
                  MB_ICONEXCLAMATION + MB_OK, ccMESSAGE_CAPTION))

      USE IN projfile
      RETURN
   ENDIF
ELSE
   RETURN
ENDIF

lnMsgRet = MESSAGEBOX("Are you sure you want to pack all the metadata files selected for the project?", ;
                      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1, ccMESSAGE_CAPTION)
                      
IF lnMsgRet = IDNO
   USE IN projfile
   RETURN 
ENDIF

lnRecordsProcessed = 0
lnRecordsSkipped   = 0

WAIT WINDOW PADC("Processing project file...",78) NOWAIT

SELECT * ;
   FROM projfile ;
   WHERE UPPER(type) = "H" ;
   INTO CURSOR query


* Initialize home directory variable and get project file name
	
IF !EOF()
   lcHomeDir = ALLTRIM(HomeDir) + IIF(RAT("\", HomeDir) != LEN(ALLTRIM(HomeDir)), "\","")
   lcHomeDir = UPPER(STRTRAN(lcHomeDir, CHR(0), ""))
ELSE
   lcHomeDir = ""
ENDIF

USE IN query

* Only packing the Visual Class Libraries and Forms at this time.

SELECT * ;
   FROM projfile ;
   WHERE Type IN ("V", "K") ; 
   INTO CURSOR projtemp

IF _TALLY < 1
   WAIT WINDOW "No object type(s) in project that you specified, press any key..."
ELSE
   SCAN
      SCATTER MEMVAR MEMO

      * Count subdirectories so actual directory name can be printed
      
      lnSubDir = 0
      lnIndex  = 1
   
      DO WHILE .T.
         DO CASE
            CASE SUBSTR(name, lnIndex, 4) = "..\\"
               lnSubDir = lnSubDir + 1
               lnIndex  = lnIndex + 4
            CASE SUBSTR(name, lnIndex, 3) = "..\"
               lnSubDir = lnSubDir + 1
               lnIndex  = lnIndex + 3
            OTHERWISE
               EXIT
         ENDCASE
      ENDDO
   
      * Process "calculated" fields, remember mNotes is based on parameter
   
      DO CASE
         CASE lnSubDir = 0 AND SUBSTR(Name,1,1) = "\"     &&  Absolute directories
            lcParentDir = SUBSTR(lcHomeDir, 1, 2)
         CASE lnSubDir = 0 AND SUBSTR(Name,2,1) = ":"     &&  Complete path
            lcParentDir = ""
         CASE lnSubDir = 0 AND SUBSTR(Name,1,1) != "\"    &&  Relative directories
            lcParentDir = lcHomeDir

         OTHERWISE                                        && One or more parental directories
            lcParentDir = UPPER(SUBSTR(lcHomeDir, 1, RAT("\", lcHomeDir, lnSubDir+1)))
      ENDCASE
   
      * m.mDirName was created during SCATTER (why it is not std name)
      m.mDirName   = lcParentDir + UPPER(SUBSTR(Name, lnIndex , RAT("\",Name)-lnIndex+1))
      lcMetaData   = m.mDirName + ShortNamePR(Name)
      plFileOpened = .T.
         
      USE (lcMetaData) ;
          IN SELECT(1) ;
          ALIAS MetaData EXCLUSIVE
      
      IF plFileOpened
         SELECT MetaData
         WAIT WINDOW PADC("Packing: " + lcMetaData, 80) NOWAIT
         PACK
         USE
         lnRecordsProcessed = lnRecordsProcessed + 1
      ELSE
         lnRecordsSkipped   = lnRecordsSkipped + 1
      ENDIF

      SELECT projtemp

   ENDSCAN
ENDIF

WAIT CLEAR
	   
=MESSAGEBOX("Number of metadata tables packed was " + ALLTRIM(STR(lnRecordsProcessed)) + CHR(13) + ;
            "Number of metadata tables skipped was " + ALLTRIM(STR(lnRecordsSkipped)), ;
            MB_OK + MB_ICONINFORMATION, ccMESSAGE_CAPTION)

USE IN projfile
USE IN projtemp

SELECT (lcSelectedCursor)

ON ERROR &lcOldError

RETURN


****************************************************************************
*
*  PROCEDURE NAME: ShortNamePR
*
*  PROCEDURE DESCRIPTION:
*     This routine is called to truncate the directory information from the
*     NAME field in the project file.
*
*  INPUT PARAMETERS:
*     tcFileName  = The NAME field passed in as a parameter with possible
*                   directory information
*
*  OUTPUT PARAMETERS:
*     lcRetString = The filename with no directory or possilble NULL character 
*
****************************************************************************
PROCEDURE ShortNamePR
LPARAMETER tcFileName

PRIVATE lcRetString                     &&  Value returned by the function

lcRetString = UPPER(SUBSTR(tcFileName,RAT("\",tcFileName)+1))

* Eliminate all Null characters from field passed to procedure.  This removes
* the "box" character displayed in field during the report print preview.

RETURN  STRTRAN(lcRetString, CHR(0), "")


****************************************************************************
*
*                              ErrorHandlerPR
*
*  PROCEDURE DESCRIPTION:
*     Custom error handler for the program.  Main reason for this procedure
*     is to capture the error of FoxUser.dbf in use by another session of
*     FoxPro.  All other errors get a messagebox which allows the user to
*     cancel or continue the program.
*
*  INPUT PARAMETERS (All Required):
*     tnError     = Error number from the FoxPro generated error
*     tcMsg       = Actual error message string related to the error
*     tcMsg1      = FoxPro code that caused the error
*     tcProg      = Program name where the error occured
*     tnLineno    = Line number of the program where error occured
*     tcMetadata  = Name of metadata file being opened when error occurs
*
*  OUTPUT PARAMETERS:
*     None
*
****************************************************************************
PROCEDURE ErrorHandlerPR
LPARAMETER tnError, tcMsg, tcMsg1, tcProg, tnLineno, tcMetadata

LOCAL lcOldOnError
LOCAL lnRetVal

lcOldOnError = ON("ERROR")

ON ERROR

DO CASE
   CASE tnError = 3
      plFileOpened = .F.
      lnRetVal     = MESSAGEBOX("Metadata file (" + LOWER(tcMetaData) + ;
                                ") already in use, will not be packed during this run.", ;
                                MB_OK + MB_ICONEXCLAMATION, ccMESSAGE_CAPTION)
   OTHERWISE
      lnRetVal     = MESSAGEBOX(tcMsg + "(VFP "+ ALLTRIM(STR(tnError)) + ")" + CHR(13) + ;
                                "in " + tcProg + " on line " +  ALLTRIM(STR(tnLineno)) + CHR(13) + CHR(13) + ;
                                "Do you want to continue?", ;
                                MB_YESNO + MB_ICONEXCLAMATION, ccMESSAGE_CAPTION)

     IF lnRetVal = IDNO
        CANCEL
     ENDIF
ENDCASE

ON ERROR &lcOldOnError

ENDPROC

*: EOF :*