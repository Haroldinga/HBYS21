#INCLUDE WCONNECT.H

SET PROCEDURE TO wwPDF ADDITIVE
SET PROCEDURE TO wwEVAL ADDITIVE
SET PROCEDURE TO wwAPI ADDITIVE  && wwPDF/wwPDF40 only


*************************************************************
DEFINE CLASS wwPDF50 AS RELATION
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1999
***   Contact: http://www.west-wind.com  
***            rstrahl@west-wind.com
***  Modified: 07/10/99
***  Function: Creates Adobe Acrobat documents on the fly
***            both to a file and to a string.
***            This version works with Acrobat 4.0 and later.
***            Win95/98 still requires the old class, but it's
***            managed through this class.
***            REQUIRES FULL ACROBAT INSTALL WITH PDFWRITER
***            INSTALLED.
***    Assume: Uses wwEval procedure files.
***            Win95/98 still uses the wwPDF class!!!
***  Function: Allows printing of VFP reports to PDF files
*************************************************************

*** Contains any error messages
cErrorMsg = ""

*** The Name of the printer driver to use for conversion
cPrinterDriver = "Acrobat PDFWriter"


************************************************************************
* wwPDF50 :: PrintReport
*********************************
***  Function: The worker function. This method actually goes out
***            sets the printer and prints the report. Use this
***            instead of a REPORT form command.
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),"",lcExtraReportClauses)

THIS.cErrorMsg = ""

*** Make sure we erase existing file first
ERASE (lcOutputFile)

*** Check if we have PDFWriter installed (safely using wweval)
loEval = CREATE("wwEval")
loEval.ExecuteCommand("SET PRINTER TO NAME '" +THIS.cPrinterDriver +"'")
IF loEval.lError
   THIS.cErrorMsg = "Couldn't set printer to " + THIS.cPrinterDriver
   RETURN .F.
ENDIF   

*SET PRINTER TO NAME (THIS.cPrinterDriver)

*** We'll create a Postscript Output File
lcTFile = SYS(2023) + "\" + SYS(2015) + ".ps"

REPORT FORM (lcReport) &lcExtraReportClauses NOCONSOLE TO FILE &lcTFile
SET PRINTER TO

*** Get rid of the PS file - empty.
*** Distiller will automatically create a PDF file with ps.pdf extension

*** Note: PDFWriter will create two files .ps and .ps.pdf
***       the latter of which contains the actual output data
ERASE (lcTFile)
lcTFile = FORCEEXT(lcTFile,"pdf")

IF FILE(FULLPATH(JUSTFNAME(lcTFile)))
   lcTFile = FULLPATH(JUSTFNAME(lcTFile))
   RENAME (lcTFile) TO (lcOutputFile)
ELSE
   IF FILE(lcTFile)
      *** Move the temp file to the actual file name by renaming
      RENAME (lcTFile) TO (lcOutputFile)
   ELSE 
       THIS.cErrorMsg = "Output file not created"
       RETURN .F.
   ENDIF
ENDIF
    
RETURN .T.
ENDFUNC
* wwPDF :: PrintReport


************************************************************************
* wwPDF40 :: PrintReportToString
*********************************
***  Function: Prints a report to string
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: PDF file as a string or "" on failure
************************************************************************
FUNCTION PrintReportToString
LPARAMETERS lcReport, lcExtraClauses
LOCAL lcFilename, lcOutput

lcFilename = SYS(2023) + "\" + Sys(2015) + ".pdf"

 
IF THIS.PrintReport(lcReport,lcFileName,lcExtraClauses)
   lcOutput = FileToStr(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput   
ENDIF
   
*** Try to erase this file just in case
ERASE (lcFileName)
   
RETURN ""
ENDFUNC

************************************************************************
* wwPDF :: QuickReport
*********************************
***  Function: Prints a report from a cursor without an FRX
***            courtesy of Randy Pearson, Cycla Corp
***      Pass: lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION QuickReport

LPARAMETERS lcOutputFile, lcExtraReportClauses

IF EMPTY( ALIAS() )
   RETURN .F.
ENDIF

LOCAL lcFrx, llResult
lcFrx = SYS(2023) + '\' + SYS(3)
CREATE REPORT ( m.lcFrx ) ;
   FROM ( ALIAS() )

llResult = THIS.PrintReport( m.lcFrx + '.FRX', ;
   lcOutputFile, lcExtraReportClauses ) 

ERASE ( m.lcFrx + '.FRX' )
ERASE ( m.lcFrx + '.FRT' )

RETURN m.llResult
ENDFUNC
* wwPDF50 :: QuickReport



************************************************************************
* wwPDFAmyuni :: QuickReportToString
*********************************
*** Function: Prints a PDF report to string without an FRX
*** courtesy of Randy Pearson, Cycla Corp
*** Pass: lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** Return: PDF file as a string or '' on failure
************************************************************************
FUNCTION QuickReportToString
LPARAMETERS lcExtraClauses

LOCAL lcFileName
lcFilename = SYS(2023) + '\' + Sys(3) + '.pdf'

IF THIS.QuickReport(lcFileName,lcExtraClauses)
   lcOutput = File2Var(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput
ENDIF

*** Try to erase this file just in case
ERASE (lcFileName)

RETURN ''
ENDFUNC
* wwPDFAmyuni :: QuickReportToString


ENDDEFINE
* wwPDF50



*************************************************************
DEFINE CLASS wwDistiller AS wwPDF50
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2002
*:Contact: http://www.west-wind.com
*:Created: 02/03/2002
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwDistiller

*:Description:
This class uses Acrobat Distiller to create PDF files
by first printing a PostScript file to disk, then converting
the PostScript file to a PDF. This tends to be more reliable
than the other classes, works with all versions of Acrobat
but is a little slower.

*:Example:

*:Remarks:
IMPORTANT: YOU HAVE TO INSTALL A POSTSCRIPT PRINTER DRIVER
           IN ORDER FOR THIS DRIVER TO WORK CORRECTLY. THE
           FOLLOWING IS A STANDARD WINDOWS PS DRIVER YOU 
           CAN USE:
           Xerox Phaser 1235 PS  
           Apple Color LW 12/660 PS
*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties

*** Stock Properties
*** Contains any error messages
cErrorMsg = ""

*** The Name of the printer driver to use for conversion
cPrinterDriver = "Xerox Phaser 1235 PS"

cDistillerProgId = "PDFDISTILLER.PDFDISTILLER.1"


************************************************************************
* wwDistiller :: PrintReport
*********************************
***  Function: The worker function. This method actually goes out
***            sets the printer and prints the report. Use this
***            instead of a REPORT form command.
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),"",lcExtraReportClauses)

THIS.cErrorMsg = ""

*** Make sure we erase existing file first
ERASE (lcOutputFile)


*** Check if we have PDFWriter installed (safely using wweval)
loEval = CREATE("wwEval")
loEval.ExecuteCommand("SET PRINTER TO NAME '" +THIS.cPrinterDriver +"'")
IF loEval.lError
   THIS.cErrorMsg = "Couldn't set printer to " + THIS.cPrinterDriver
   RETURN .F.
ENDIF   

*SET PRINTER TO NAME (THIS.cPrinterDriver)

*** We'll create a Postscript Output File
lcTFile = SYS(2023) + "\" + SYS(2015) + ".ps"

REPORT FORM (lcReport) &lcExtraReportClauses NOCONSOLE TO FILE &lcTFile
SET PRINTER TO

IF FILE(lcTFile)
   loDist  = CREATEOBJECT(this.cDistillerProgId)
   lnResult = loDist.FileToPDF(lcTFile,lcOutputFile,"") 

   ERASE (lcTFile)

   IF lnResult # 1 OR !FILE(lcOutputFile)
      THIS.cErrorMsg = "Output file not created"
      RETURN .F.
   ENDIF   
ELSE 
   THIS.cErrorMsg = "Output file not created"
   RETURN .F.
ENDIF
    
RETURN .T.
ENDFUNC
* wwPDF :: PrintReport

ENDDEFINE
*EOC wwDistiller 


*************************************************************
DEFINE CLASS wwGhostScript AS wwPDF50
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2002
*:Contact: http://www.west-wind.com
*:Created: 02/03/2002
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwGhostScript

*:Description:
This class uses GhostScript to create PDF files
by first printing a PostScript file to disk, then converting
the PostScript file to a PDF. 

Note that you need to download AND install the free GhostScript
distribution from:

www.ghostscript.com

*:Remarks:
IMPORTANT: YOU HAVE TO INSTALL A POSTSCRIPT PRINTER DRIVER
           IN ORDER FOR THIS DRIVER TO WORK CORRECTLY. THE
           FOLLOWING IS A STANDARD WINDOWS PS DRIVER YOU 
           CAN USE:
           Xerox Phaser 6120 PS (Win 7)
		   Xerox Phaser 1235 PS (Vista)
           Apple Color LW 12/660 PS (XP and prior)

IMPORTANT: THIS METHOD REQUIRES THE USE OF WWIPSTUFF.DLL
           TO PERFORM THE INTERFACE TO GhostScript. MAKE
           SURE YOU DISTRIBUTE WWIPSTUFF.DLL WITH YOUR 
           APPLICATION!

*:Example:
o = CREATEOBJECT("wwGhostScript")

*** Assign a PostScript Driver (or you can use an installed PS driver
*o.cPrinterDriver = "Xerox Phaser 6120 PS"
o.cPrinterDriver = FindPostScriptPrinter()

*** Open data for report
USE wwDemo\tt_cust

*** Run the report
? o.PrintReport(fullpath("wwDemo\CustList.frx"),"c:\temp\test.pdf")

*** Show the report in configured PDF Viewer
GoUrl("c:\temp\test.pdf")

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties

*** Stock Properties
*** Contains any error messages
cErrorMsg = ""

*** The Name of the printer driver to use for conversion
cPrinterDriver = "Xerox Phaser 1235 PS"

*** Optional path to the GhostScript DLL in case this 
*** not a full GhostScript Install
cGhostScriptDllPath = ""

*** Resolution of the PDF file in the format horizontalxvertical
cResolution = "150x150"

*** GhostScript supported letter sizes:http://www.cs.wisc.edu/~ghost/doc/cvs/Use.htm#Known_paper_sizes
*** Examples: letter, legal,11x17,ledger,a2, a4, ,le
cPaperSize = "letter"

************************************************************************
* wwGhostScript :: PrintReport
*********************************
***  Function: The worker function. This method actually goes out
***            sets the printer and prints the report. Use this
***            instead of a REPORT form command.
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),"",lcExtraReportClauses)

THIS.cErrorMsg = ""

*** Make sure we erase existing file first
ERASE (lcOutputFile)

*** Check if we have PDFWriter installed (safely using wweval)
loEval = CREATE("wwEval")
loEval.ExecuteCommand("SET PRINTER TO NAME '" +THIS.cPrinterDriver +"'")
IF loEval.lError
   THIS.cErrorMsg = "Couldn't set printer to " + THIS.cPrinterDriver
   RETURN .F.
ENDIF   

*SET PRINTER TO NAME (THIS.cPrinterDriver)

*** We'll create a Postscript Output File
lcTFile = SYS(2023) + "\" + SYS(2015) + ".ps"

REPORT FORM (lcReport) &lcExtraReportClauses NOCONSOLE TO FILE &lcTFile
SET PRINTER TO

IF FILE(lcTFile)
   DECLARE INTEGER GhostPsToPdf IN wwipstuff.dll ;
      STRING, STRING, STRING,  string, string
   
   LOCAL lcGhostScriptDLLPath
   IF !EMPTY(this.cGhostScriptDllPath)
      lcGhostScriptDllPath = THIS.cGhostScriptDllPath
   ELSE
      lcGhostScriptDllPath = NULL
   ENDIF  

   IF GhostPsToPdf(lcTFile,lcOutputFile,THIS.cResolution,this.cPaperSize,;
                   lcGhostScriptDLLPath) = 0 OR ;
                   !FILE(lcOutputFile)
      this.cErrorMsg = "Final PDF output file was not created."
      ERASE (lcTFile)
      RETURN .F.
   ENDIF

   ERASE (lcTFile)
ELSE 
   THIS.cErrorMsg = "Postscript output file was not created"
   RETURN .F.
ENDIF
    
RETURN .T.
ENDFUNC
* wwPDF :: PrintReport

ENDDEFINE
*EOC wwGhostScript 




*************************************************************
DEFINE CLASS wwActivePDF  AS wwPDF50
*************************************************************
*** Author: Rick Strahl
*** (c) West Wind Technologies, 2000
***
*** Recommended Setup: VFP 8.0 SP1 and ActivePDF Server 3.5.2 SP6
***                    or later versions
***
*** Contact: http://www.west-wind.com
*** rstrahl@west-wind.com
***
*** Function: Allows printing of VFP reports to PDF files
*************************************************************

*-- reference to the PDFServer object
oPDF = NULL

*** Contains any error messages
cErrorMsg = ''

*** Time to wait for report to print
nTimeout = 20

*** Name of the Printer driver to generate report
cPrinterDriver = ''

*** Temporary output file
cTempOutputFile = ''


************************************************************************
* wwActivePDF :: Init
*********************************
*** Function: Initialize the ActiveServerPDF Object
*** Return: nothing
************************************************************************
FUNCTION Init

this.oPDF = CREATEOBJECT('APServer.Object')

ENDFUNC
* wwActivePDF :: Init

************************************************************************
* wwActivePDF :: Destroy
*********************************
*** Function: Release the ActiveServerPDF Object
************************************************************************
FUNCTION Destroy

this.oPDF = NULL

ENDFUNC
* wwActivePDF :: Destroy


************************************************************************
* wwActivePDF :: SetLandscapeMode
*********************************
*** Function: Sets or unsets landscape mode
*** Pass: llSet - Optional Pass .F. only if you want to go
*** back to portrait
*** Return: nothing
************************************************************************
FUNCTION SetLandscapeMode
LPARAMETERS llSet

IF PCOUNT() = 0
   llSet = .T.
ENDIF

this.oPDF.Orientation = IIF(llSet,2,1)

ENDFUNC
* wwActivePDF :: SetLandscapeMode

************************************************************************
* wwActivePDF :: PrintReport
*********************************
*** Function: The worker function. This method actually goes out
*** sets the printer and prints the report. Use this
*** instead of a REPORT form command.
*** Assume:
*** Pass: lcReport - Name of the FRX Report to run
*** lcOutputFile - Filename to print the PDF output to
*** lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle, lcSetPrinterStr, lnRetVal, lcOutputDir,;
      lcFileStub, lnSeconds

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)

lcOutputfile = LOWER(lcOutputFile)

*** First set the output options
lcOutputDir = JUSTPATH(lcOutputFile)
IF EMPTY(lcOutputDir)
	*** set to the current dir
	lcOutputDir = SYS(5) + SYS(2003)
ENDIF

IF !DIRECTORY(lcOutputDir)
	***
	*** invalid dir try adding current drive
	IF !DIRECTORY(SYS(5) + lcOutputDir)
		*** ok give up and error
		this.cErrorMsg = "Can't find PDF output directory: " + lcOutputDir
		RETURN .F.
	ELSE
		lcOutputDir = SYS(5) + lcOutputDir
	ENDIF
ENDIF

*** Finally set the output file
this.oPDF.OutputDirectory = ADDBS(lcOutputDir)
this.oPDF.NewDocumentName = JUSTFNAME(lcOutputFile)

*** Get rid of an existing file
ERASE (lcOutputFile)

*** Start the Printing process
THIS.oPDF.UseStaticPool = .f.
 
lnRetVal = this.oPDF.StartPrinting()
IF lnRetVal <> 0
	this.cErrorMsg = 'PDF StartPrinting() Error# ' + ALLTRIM(STR(lnRetVal))
	RETURN .F.
ENDIF

*** NOTE: This is the only way ActivePDF will print under Windows 2000
***       This changes the Windows Default printer and that works here
***       but doesn't scale real well.
*This.oPDF.SetPrinterAsDefault()

*** Set to the printer   -  VFP 8 SP1!
aprinters(stuparray)
s = "set printer to name '" + this.oPDF.NewPrinterName + "'"
&s

*** Run the report
REPORT FORM (lcReport) &lcExtraReportClauses NOCONSOLE TO PRINTER 

THIS.oPDF.Wait(8)
this.oPDF.StopPrinting()

RETURN .T.

*!*   *** Set the timeout  -  THIS DOESN"T WORK
*!*   llExtraFile = .T.

*!*   *** So use file based check in a loop instead
*!*   lnSeconds = SECONDS()
*!*   DO WHILE .T. 
*!*      lnHandle = FOPEN(lcFileStub + ".pdf") 
*!*      IF lnHandle = -1 and ( SECONDS() - lnSeconds < THIS.nTimeout)
*!*         lnHandle = FOPEN(lcFileStub)
*!*         IF lnHandle = -1
*!*            Sleep(100)
*!*         ELSE
*!*            llExtraFile = .F.
*!*            FCLOSE(lnHandle)
*!*            EXIT
*!*         ENDIF
*!*      ELSE
*!*         FCLOSE(lnHandle)
*!*         EXIT
*!*      ENDIF
*!*   ENDDO

*!*   *!*   IF lnRetVal <> 0
*!*   *!*   	this.cErrorMsg = 'PDF Wait() Error# ' + ALLTRIM(STR(lnRetVal))
*!*   *!*   	RETURN
*!*   *!*   ENDIF

*!*   IF llExtraFile
*!*      IF FILE(lcFileStub)
*!*         ERASE (lcFileStub)
*!*      ENDIF
*!*      IF FILE(lcFileStub + ".pdf")
*!*         RENAME (lcFileStub + ".pdf") TO ( STRTRAN(lcFileStub,".ps","") + ".pdf" )
*!*      ELSE
*!*         THIS.cErrorMsg = "PDF File creation timed out."
*!*         RETURN .F.   
*!*      ENDIF
*!*   ELSE
*!*   	IF FILE(lcFileStub)
*!*   	   RENAME (lcFileStub) TO ( STRTRAN(lcFileStub,".ps",".pdf") )
*!*      ELSE
*!*         THIS.cErrorMsg = "PDF File creation timed out."
*!*         RETURN .F.   
*!*      ENDIF
*!*   ENDIF

*!*   SET PRINTER TO

*!*   RETURN .T.
ENDFUNC
* wwActivePDF :: PrintReport

ENDDEFINE
*EOC wwActivePDF

*************************************************************
DEFINE CLASS wwPDFAmyuni AS wwPDF50
*************************************************************
*** Adapted for use with Amyuni PDF Print Driver
*** 08/09/2000 Keith Hackett
*** 02/06/2002 Rick Strahl updates
*************************************************************

*-- reference to the PDFServer object
oPDF = NULL

*** Contains any error messages
cErrorMsg = ''

*** Time to wait for report to print
nTimeout = 20

*** Name of the Printer driver used to generate report
cPrinterDriver = 'Amyuni PDF Converter' &&'PDF Compatible Printer Driver'

*** Temporary output file
cTempOutputFile = ''

PROTECTED cSemaphoreFile

*** Lock file to avoid simultaneous access
cSemaphoreFile = SYS(2023) + "\wwPDF.dbf"

************************************************************************
* wwPDFAmyuni :: Init
*********************************
*** Function: Initialize the ActiveServerPDF? Object
*** Return: nothing
************************************************************************
FUNCTION Init

*** Do this as a Macro to avoid project inclusion
lcCmd = [SET LIBRARY TO "FllIntf.fll" ADDITIVE]
&lcCMD

*this.oPDF = PdfDriverInit( "AmyUni_" + TRANSFORM(Application.Processid))
this.oPDF = DriverInit( this.cPrinterDriver )

ENDFUNC
* wwPDFAmyuni :: Init

************************************************************************
* wwPDFAmyuni :: Destroy
*********************************
*** Function: Release the AmyuniPDF? Object and our semaphore lock
************************************************************************
FUNCTION Destroy

*** Make sure file gets unlocked in case there was a problem
THIS.UnlockSemaphore()

FileNameOptions( this.oPDF, 0 ) && reset options
DriverEnd( this.oPDF ) && for the developer versions: remove the PDF or HTML printer, otherwise only clears some memory

this.oPDF = NULL
Release Library FllIntf.fll

ENDFUNC
* wwPDFAmyuni :: Destroy

************************************************************************
* wwPDFAmyuni :: PrintReport
*********************************
*** Function: The worker function. This method actually goes out
*** sets the printer and prints the report. Use this
*** instead of a REPORT form command.
*** Assume:
*** Pass: lcReport - Name of the FRX Report to run
*** lcOutputFile - Filename to print the PDF output to
*** lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle, lcSetPrinterStr, lnRetVal, lcOutputDir

*** Make sure we don't have concurrent access
IF !THIS.LockSemaphore()
   RETURN .F.
ENDIF

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)

LOCAL nNoPrompt, nUseFileName, nBroadcast
nNoPrompt=1
nUseFileName=2
nBroadcast=32

*-- Set the output file name (FLL calls)
FileNameOptions( this.oPDF, m.nNoPrompt + m.nUseFileName + m.nBroadcast) &&-- no prompt + use file name + broadcast messages
DefaultFileName( this.oPDF, m.lcOutputFile )

*-- Get rid of existing file
DO WHILE FILE(lcOutputFile)
   ERASE (lcOutputFile)
   DoEvents
ENDDO

*-- Direct output to the PDF printer driver
loEval = CREATE("wwEval")
loEval.ExecuteCommand([SET PRINTER TO NAME "] + THIS.cPrinterDriver + ["])
IF loEval.lError
   THIS.cErrorMsg = "Couldn't set printer to " + THIS.cPrinterDriver
   THIS.UnlockSemaphore()
   RETURN .F.
ENDIF

*-- Run the report
REPORT FORM (lcReport) &lcExtraReportClauses NOEJECT NOCONSOLE TO PRINTER

SET PRINTER TO

THIS.UnlockSemaphore()

RETURN .T.
ENDFUNC
* wwPDFAmyuni :: PrintReport

************************************************************************
* wwPDFAmyuni :: PrintReportToString
*********************************
*** Function: Prints a report to string
*** Pass: lcReport - Name of the FRX Report to run
*** lcOutputFile - Filename to print the PDF output to
*** lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** Return: PDF file as a string or '' on failure
************************************************************************
FUNCTION PrintReportToString
LPARAMETERS lcReport, lcExtraClauses
LOCAL lcFilename, lcOutput

lcFilename = SYS(2023) + '\' + Sys(3) + '.pdf'

IF THIS.PrintReport(lcReport,lcFileName,lcExtraClauses)
   lcOutput = File2Var(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput
ENDIF

*** Try to erase this file just in case
ERASE (lcFileName)

RETURN ''
ENDFUNC
* wwPDFAmyuni :: PrintReportToString

************************************************************************
* wwPDFAmyuni :: LockSemaphore
*********************************
*** Function: Makes sure that only one report is printed at a time.
*** This method locks a record in a temporary file.
************************************************************************
PROTECTED FUNCTION LockSemaphore
LOCAL lcOldAlias, lnOldReprocess, llRetVal

lcOldAlias = Alias()

*** Check if the file exists
IF !FILE(THIS.cSemaphoreFile)
   CREATE TABLE (THIS.cSemaphoreFile) FREE ;
( timestamp t, ID c ( 10) )
   APPEND BLANK
   REPLACE timestamp with datetime()
   USE
ENDIF

IF !USED("wwPDF")
   USE (THIS.cSemaphoreFile) ALIAS wwPDF IN 0 SHARED
ENDIF
SELE wwPDF

lnOldReprocess = SET("REPROCESS")
set reprocess to 1
local xx
xx=0
do while !rlock() and xx < this.nTimeOut
   xx=xx+1
   WinApi_Sleep(1000)
enddo

llRetVal = RLOCK()

SET REPROCESS TO (lnOldReprocess) SECONDS

IF !EMPTY(lcOldAlias)
   SELE (lcOldAlias)
ENDIF

RETURN llRetVal
ENDFUNC
* wwPDFAmyuni :: LockSemaphore

************************************************************************
* wwPDFAmyuni :: UnlockSemaphore
*********************************
*** Function: Unlocks the semaphore record when the report has
*** completed.
************************************************************************
PROTECTED FUNCTION UnlockSemaphore

lcOldAlias = select()

IF !USED("wwPDF")
   USE (THIS.cSemaphoreFile) ALIAS wwPDF IN 0
ENDIF
SELE wwPDF

UNLOCK

SELECT (lcOldAlias)
   
RETURN
ENDFUNC
* wwPDFAmyuni :: UnlockSemaphore

ENDDEFINE
*EOC wwPDFAmyuni


FUNCTION Sleep
LPARAMETERS lnTime

DECLARE INTEGER Sleep IN WIN32API INTEGER
Sleep(lnTime)

RETURN

*** Amyuni External FLL function Dummies so
*** we get no compiler errors
FUNCTION DriverInit
FUNCTION DriverEnd
FUNCTION FileNameOptions
FUNCTION DefaultFileName


*************************************************************
DEFINE CLASS wwXFRX AS wwPDF50
*************************************************************
*** Adapted for use with XFRX VFP report converter
*** You must have a copy of XFRX to use this class.
*** A trial version can be downloaded here: http://www.eqeus.com/xfrxdownload.php
***
*** Be sure that XFRX.FXP is either included in your project/VFP path
*** or XFRX.APP (demo version) is in the VFP search path.
***
*** The following support files should also be located in the
*** VFP search path:
***    XFRXLIB.FLL
***    HNDLIB.DLL
***    ZLIB.DLL
***    MSVCR71.DLL
***
*** 03/18/2005 Keith Hackett
*************************************************************

*** XFRX Session instance reference
oPDF = NULL             


cErrorMsg = []
cOutputName = []

*** Temp directory for work files
cTempDir = SYS(2023)   && Location of where temp files are built.

*** Output type:  PDF,HTML,WORD,FWORD,XLS - see XFRX documentation
cTarget = [PDF]

*** Set to .f. if you want to preview the PDF immediately
lNotOpenViewer = .t.

cCodePage = .f.

lSilent = .t.
lNewSession = .f.

cArchive = .f.
lAdditive = .f.

lDeleteFileAfter = .f.
nEmbeddingType = 3 &&--- Partial embedding of fonts.
lSuccessful = .f. &&--- Indicates successful run.
nParamsRetVal = .f. &&--- When numeric, contains value returned when parameters in XFRX are set.

*************************************************************
* wwXFRX :: PrintReport
***********************
*** Function: The worker function. This method actually goes out
*** sets the printer and prints the report. Use this
*** instead of a REPORT form command.
*** Assume:
***     Pass: lcReport - Name of the FRX Report to run
***  lcOutputName - Filename to print the PDF output to
*** lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** llAppend - Report is appended onto the end of the existing report.
*** Return: .T. or .F.
*************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses, llAppend
LOCAL loEval, ltStart, lnHandle, lcSetPrinterStr, lnRetVal, lcOutputDir

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)

LOCAL cXFRX
cXFRX = [XFRX("XFRX#INIT")]
this.oPDF = EVALUATE(cXFRX)

IF TYPE('this.oPDF') # 'O'
   this.cErrorMsg = [Unable to create report generator instance]
   this.lSuccessful = .f.
ELSE
   lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)
   IF TYPE('m.lcOutputFile') = 'C' AND !EMPTY(m.lcOutputFile);
      AND NOT m.lcOutputFile == this.cOutputName
      this.cOutputName = m.lcOutputFile
      this.nParamsRetVal = .f.
   ENDIF
   IF TYPE('this.nParamsRetVal') # 'N'
      this.SetParams(m.llAppend)
   ENDIF
   IF this.nParamsRetVal = 0
      this.oPDF.setEmbeddingType(this.nEmbeddingType)
      this.lSuccessful = this.oPDF.ProcessReport(m.lcReport, m.lcExtraReportClauses)
      IF this.lSuccessful
         this.cErrorMsg = []
      ELSE
         this.cErrorMsg = [Unable to generate report.]
      ENDIF
   ELSE
      this.cErrorMsg = [Unable to set report parameters, error code ] + TRANSFORM(this.nParamsRetVal)
   ENDIF

   this.oPDF.Finalize()
ENDIF

this.oPdf = null

RETURN this.lSuccessful
ENDFUNC
* wwXFRX :: PrintReport

*************************************************************
* wwXFRX :: SetParams
*********************
*** Function: This method sets the parameters for the XFRX object.
*** Return: Numeric result of parameter initialization.
*************************************************************
FUNCTION SetParams(llAppend)
   this.nParamsRetVal = this.oPDF.SetParams(this.cOutputName, this.cTempDir, this.lNotOpenViewer,;
      this.cCodePage,this.lSilent, this.lNewSession, this.cTarget, this.cArchive, this.lAdditive,;
      this.lDeleteFileAfter, m.llAppend)
RETURN this.nParamsRetVal
ENDFUNC
* wwXFRX :: SetParams

ENDDEFINE
* EOC wwXFRX

*************************************************************
DEFINE CLASS wwXFRX9 AS wwPDF50
*************************************************************
*** Provided thanks to Web Connection MVP Keith Hackett 
*** 
*** Adapted for use with the XFRX listener for VFP 9 report generator
*** You must have a copy of XFRX to use this class.
*** A trial version can be downloaded here: http://www.eqeus.com/xfrxdownload.php
***
*** Be sure that XFRX.FXP is either included in your project/VFP path
*** or XFRX.APP (demo version) is in the VFP search path.
***
*** The following support files should also be located in the
*** VFP search path:
***    XFRXLIB.FLL
***    HNDLIB.DLL
***    ZLIB.DLL
*** The following libraries are required by XFRXLIB.FLL
***    MSVCP71.DLL
***    GDIPLUS.DLL
***    MSVCR71.DLL
*** The XFRX 9 version also has dependencies on either
*** either FFC classes Also there are dependenc
*** 01/06/2007 Keith Hackett
*** 05/12/2009 Rick Strahl
*************************************************************

*** XFRX Session instance reference
oPDF = NULL             
cErrorMsg = []
cOutputName = []

*** Temp directory for work files
cTempDir = GETENV('temp') &&--- Location of where temp files are built.

*** Output type:  PDF,HTML,WORD,FWORD,XLS - see XFRX documentation
cTarget = [PDF]

*** Set to .f. if you want to preview the PDF immediately
lNotOpenViewer = .t.

cCodePage = .f.
lSilent = .t.
lNewSession = .f.
cArchive = .f.
lAdditive = .f.
lDeleteFileAfter = .f.
nEmbeddingType = 3 &&--- Partial embedding of fonts.
lSuccessful = .f. &&--- Indicates successful run.
nParamsRetVal = .f. &&--- When numeric, contains value returned when parameters in XFRX are set.
lResetPageNo = .f.

*************************************************************
* wwXFRX :: PrintReport
***********************
*** Function: The worker function. This method actually goes out
*** sets the printer and prints the report. Use this
*** instead of a REPORT form command.
*** Assume:
***     Pass: lcReport - Name of the FRX Report to run
***  lcOutputName - Filename to print the PDF output to
*** lcExtraReportClauses - Any extra tags like FOR, WHEN etc.
*** llAppend - Report is appended onto the end of the existing report.
*** Return: .T. or .F.
*************************************************************
FUNCTION PrintReport(lcReport, lcOutputFile, lcExtraReportClauses, llAppend)
LOCAL loEval, ltStart, lnHandle, lcSetPrinterStr, lnRetVal, lcOutputDir

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)

LOCAL cXFRX
cXFRX = [XFRX("XFRX#LISTENER")]
this.oPDF = EVALUATE(cXFRX)

this.lSuccessful = .t.
TRY
	IF TYPE('this.oPDF') # 'O'
	   this.cErrorMsg = [Unable to create report generator instance]
	   this.lSuccessful = .f.
	ELSE
	   m.lcExtraReportClauses = IIF(EMPTY(lcExtraReportClauses),'',lcExtraReportClauses)
	   IF TYPE('m.lcOutputFile') = 'C' AND !EMPTY(m.lcOutputFile);
	      AND NOT m.lcOutputFile == this.cOutputName
	      this.cOutputName = m.lcOutputFile
	      this.nParamsRetVal = .f.
	   ENDIF
	   IF TYPE('this.nParamsRetVal') # 'N'
	      this.SetParams(m.llAppend)
	   ENDIF
		IF !this.lResetPageNo
			m.lcExtraReportClauses = m.lcExtraReportClauses + ' noreset'
		ENDIF
		this.lResetPageNo = .f.
	   IF this.nParamsRetVal = 0
	      this.oPDF.setEmbeddingType(this.nEmbeddingType)
	      REPORT FORM (m.lcReport) OBJECT this.oPDF NOPAGEEJECT &lcExtraReportClauses
	      SET PRINTER TO default
	   ELSE
	      this.cErrorMsg = [Unable to set report parameters, error code ] + TRANSFORM(this.nParamsRetVal)
	      this.lSuccessful = .f.
	   ENDIF

	   this.oPDF.Finalize()
	ENDIF
	this.oPDF.Finalize()
	this.oPdf = null
CATCH TO oError
	this.lSuccessful = .f.
	this.cErrorMsg = oError.Message
ENDTRY

RETURN this.lSuccessful
ENDFUNC
* wwXFRX :: PrintReport

*------------------------------------------------------------
* PDFDriver :: ResetPageNo
*------------------------------------------------------------
* Function: This method sets the flag to reset the page number on printing.
*------------------------------------------------------------
FUNCTION ResetPageNo
	this.lResetPageNo = .t.
ENDFUNC

*************************************************************
* wwXFRX :: SetParams
*********************
*** Function: This method sets the parameters for the XFRX object.
*** Return: Numeric result of parameter initialization.
*************************************************************
FUNCTION SetParams(llAppend)
   this.nParamsRetVal = this.oPDF.SetParams(this.cOutputName, this.cTempDir, this.lNotOpenViewer,;
      this.cCodePage,this.lSilent, this.lNewSession, this.cTarget, this.cArchive, this.lAdditive,;
      this.lDeleteFileAfter, m.llAppend)
RETURN this.nParamsRetVal
ENDFUNC
* wwXFRX :: SetParams

ENDDEFINE
* EOC wwXFRX



#IF WWC_COMPATIBILITY

*************************************************************
DEFINE CLASS wwPDF40 AS wwPDF50
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1999
***   Contact: http://www.west-wind.com  
***            rstrahl@west-wind.com
***  Modified: 07/10/99
***  Function: Creates Adobe Acrobat documents on the fly
***            both to a file and to a string.
***            This version works with Acrobat 4.0 and later.
***            Win95/98 still requires the old class, but it's
***            managed through this class.
***            REQUIRES FULL ACROBAT INSTALL WITH PDFWRITER
***            INSTALLED.
***    Assume: Uses wwEval procedure files.
***            Win95/98 still uses the wwPDF class!!!
***  Function: Allows printing of VFP reports to PDF files
*************************************************************

*** Contains any error messages
cErrorMsg = ""

*** The Name of the printer driver to use for conversion
cPrinterDriver = "Acrobat PDFWriter"

PROTECTED lWin95, oOldwwPDF

*** Windows 95 Requires special handling
lWin95 = .F.

*** Reference to wwPDF class if 
oOldwwPDF = .NULL.

************************************************************************
* wwPDF40 :: Init
*********************************
***  Function: Figures out whether to use the 'old' wwPDF class
***            for Win95/98 which stores output options in Win.ini
************************************************************************
FUNCTION Init

*** Check for Win95/98 - need to use old wwPDF class
IF !IsWinNT() && AT("NT",OS()) = 0 AND AT("5.",OS()) = 0
   THIS.lWin95 = .T.
   THIS.oOldwwPDF = CREATEOBJECT("wwPDF","WIN95")
ELSE
   *** Make sure the viewer doesn't pop up
   loAPI = CREATE("wwAPI")
   llResult = loAPI.WriteRegistryString(HKEY_CURRENT_USER,"Software\Adobe\Acrobat PDFWriter","bExecViewer","0")
ENDIF   


ENDFUNC
* wwPDF40 :: Init

************************************************************************
* wwPDF40 :: PrintReport
*********************************
***  Function: The worker function. This method actually goes out
***            sets the printer and prints the report. Use this
***            instead of a REPORT form command.
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle

*** Win95 must still use Win.ini settings 
*** to direct output to a file without UI
IF THIS.lWin95
   RETURN THIS.oOldwwPDF.PrintReport(lcReport,;
                                     lcOutputFile,;
                                     lcExtraReportClauses)
ENDIF   

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),"",lcExtraReportClauses)

THIS.cErrorMsg = ""

*** Make sure we erase existing file first
ERASE (lcOutputFile)


*** Check if we have PDFWriter installed (safely using wweval)
loEval = CREATE("wwEval")
loEval.ExecuteCommand("SET PRINTER TO NAME '" +THIS.cPrinterDriver +"'")
IF loEval.lError
   THIS.cErrorMsg = "Couldn't set printer to " + THIS.cPrinterDriver
   RETURN .F.
ENDIF   

*SET PRINTER TO NAME (THIS.cPrinterDriver)

*** We'll create a Postscript Output File
lcTFile = SYS(2023) + "\" + SYS(2015) + ".ps"

REPORT FORM (lcReport) &lcExtraReportClauses NOCONSOLE TO FILE &lcTFile
SET PRINTER TO

*** Get rid of the PS file - empty.
*** Distiller will automatically create a PDF file with ps.pdf extension

*** Note: PDFWriter will create two files .ps and .ps.pdf
***       the latter of which contains the actual output data
ERASE (lcTFile)
lcTFile = lcTFile + ".pdf"
IF FILE(lcTFile)
   *** Move the temp file to the actual file name by renaming
   RENAME (lcTFile) TO (lcOutputFile)
ELSE 
    THIS.cErrorMsg = "Output file not created"
    RETURN .F.
ENDIF
    
RETURN .T.
ENDFUNC
* wwPDF :: PrintReport


************************************************************************
* wwPDF40 :: PrintReportToString
*********************************
***  Function: Prints a report to string
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: PDF file as a string or "" on failure
************************************************************************
FUNCTION PrintReportToString
LPARAMETERS lcReport, lcExtraClauses
LOCAL lcFilename, lcOutput

lcFilename = SYS(2023) + "\" + Sys(2015) + ".pdf"

IF THIS.PrintReport(lcReport,lcFileName,lcExtraClauses)
   lcOutput = FileToStr(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput   
ENDIF
   
*** Try to erase this file just in case
ERASE (lcFileName)
   
RETURN ""
ENDFUNC

ENDDEFINE
* wwPDF40


*** Use this class directly only if you have Acrobat 3.0x only!

*************************************************************
DEFINE CLASS wwPDF AS CUSTOM
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1998
***   Contact: http://www.west-wind.com  
***            rstrahl@west-wind.com
***  Modified: 04/25/98
***  Function: Allows printing of VFP reports to PDF files
*************************************************************

*** IMPORTANT:
*** ----------
*** PLEASE SEE DETAILED INSTALLATION INSTRUCTIONS AND NOTES AT 
*** THE BOTTOM OF THIS DOCUMENT.


*** Time to wait for report to print
nTimeout = 20

*** Name of the Printer driver to generate report
cPrinterDriver = "Acrobat PDFWriter"

*** Temporary output file
cTempOutputFile = SYS(2023) + "\__wwpdf.pdf"

PROTECTED cAcrobatIni, cSemaphoreFile

*** Name of the INI file that instructs PDFWriter
*** Note: this varies with WIN95 and NT (see instruction below)
cAcrobatIni = ""

*** Lock file to avoid simultaneous access
cSemaphoreFile = SYS(2023) + "\wwPDF.dbf"


************************************************************************
* wwPDF :: Init
*********************************
***  Function: Initialize the Acrobat COnfiguration to use
***      Pass: lcAcrobatIniFile -    "WINNT","WIN95" or
***                                  full path to Acrobat __PDF.INI (NT)
***                                  or Win.ini (Win95)
***    Return: nothing
************************************************************************
FUNCTION Init 
LPARAMETERS lcIniFile

THIS.SetAcrobatIniFile(lcIniFile)  

ENDFUNC
* wwPDF :: Init

************************************************************************
* wwPDF :: Destroy
********************************* 
***  Function: Makes sure our semaphore lock is released and closes
***            the table.
************************************************************************
FUNCTION Destroy

*** Make sure we always set back to portrait and clear the output filename
loAPI = CREATE("wwAPI")
loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","orient",chr(0))
loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","PDFFileName",chr(0))

*** Make sure file gets unlocked in case there was a problem
THIS.UnlockSemaphore()

IF USED("wwPDF")
   USE in wwPDF
ENDIF   

ENDFUNC
* wwPDF :: Destroy

************************************************************************
* wwPDF :: SetAcrobatIniFile
*********************************
***  Function: Sets the path to the PDFWRiter configuration file.
***            This method is also called from the Init of the class.
***
***            Default Paths by Acrobat:
***            Win95: WINDOWS\Win.ini
***            WinNT: WINNT\SYSTEM\spool\DRIVERS\W32X86\2\__pdf.ini
***             
***    Assume: THIS IS THE MOST IMPORTANT SETTING! MAKE SURE YOU MATCH
***            THIS TO YOUR INI FILE. START WITH THE DEFAULT SETTINGS
***            BY PLATFORM AND IF THAT FAILS TRY THE FULL INI FILE PATH.
***            NOTE: This setting will permanently change your Acrobat
***                  configuration.
***
***      Pass: lcAcrobatIniFile -    "WINNT","WIN95" or
***                                  full path to Acrobat __PDF.INI (NT)
***                                  or Win.ini (Win95)
***          llForceInteractive -    to bring up dialogs
***    Return: .T. or .F.
************************************************************************
FUNCTION SetAcrobatIniFile
LPARAMETERS lcIniFile, llInteractive
LOCAL loAPI

lcIniFile=IIF(EMPTY(lcIniFile),"",lcIniFile)

loAPI = CREATE("wwAPI")

DO CASE
  CASE lcInifile = "WIN95"
     THIS.cAcrobatIni = loAPI.GetSystemDir() + "..\win.ini"
  CASE lcIniFile = "WINNT"
     THIS.cAcrobatIni = loAPI.GetSystemDir() + "spool\DRIVERS\W32X86\__pdf.ini"
  CASE EMPTY(lcIniFile)
     *** Assume NT
     THIS.cAcrobatIni = loAPI.GetSystemDir() + "spool\DRIVERS\W32X86\__pdf.ini"
     IF EMPTY(THIS.cAcrobatIni)
        *** Assume Win95
        THIS.cAcrobatIni = loAPI.GetSystemDir() + "..\win.ini"
     ENDIF
  OTHERWISE     
     THIS.cAcrobatIni = lcIniFile
ENDCASE

IF !FILE(THIS.cAcrobatIni)
   RETURN .F.
ENDIF

IF llInteractive
  loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","PDFFileName",CHR(0))
  loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","bDocInfo","1")
  loAPI.WriteProfileString(THIS.cAcrobatIni,"Acrobat PDFWriter","bExecViewer","0")   
ELSE  
  lvresult = loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","PDFFileName",THIS.cTempOutputFile)
  loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","bDocInfo","0")
  loAPI.WriteProfileString(THIS.cAcrobatIni,"Acrobat PDFWriter","bExecViewer","0")   
ENDIF  

THIS.SetLandscapeMode(.F.)

RETURN .T.
ENDFUNC
* wwPDF :: SetAcrobatIniFile

************************************************************************
* wwPDF :: SetLandscapeMode
*********************************
***  Function: Sets or unsets landscape mode
***      Pass: llSet  - Optional Pass .F. only if you want to go
***                                   back to portrait
***    Return: nothing
************************************************************************
FUNCTION SetLandscapeMode
LPARAMETERS llSet

IF PCOUNT() = 0
   llSet = .T. 
ENDIF

loAPI = CREATE("wwAPI")
IF llSet
 lvREsult = loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","orient","2")
ELSE
  loAPI.WriteprofileString(THIS.cAcrobatIni,"Acrobat PDFWriter","orient",chr(0))
ENDIF

ENDFUNC
* wwPDF :: SetLandscapeMode

************************************************************************
* wwPDF :: PrintReport
*********************************
***  Function: The worker function. This method actually goes out
***            sets the printer and prints the report. Use this
***            instead of a REPORT form command.
***    Assume:
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION PrintReport
LPARAMETERS lcReport, lcOutputFile, lcExtraReportClauses
LOCAL loEval, ltStart, lnHandle

lcExtraReportClauses=IIF(EMPTY(lcExtraReportClauses),"",lcExtraReportClauses)

*** Make sure we don't have concurrent access
IF !THIS.LockSemaphore()
   RETURN .F.
ENDIF   

loEval = CREATE("wwEval")
loEval.Execute("SET PRINTER TO Acrobat PDFWriter")
IF loEval.lError
   *wait window "Adobe Acrobate PDFWriter not installed" nowait
   THIS.UnlockSemaphore()
   RETURN .F.
ENDIF   
REPORT FORM (lcReport) &lcExtraReportClauses TO PRINT NOCONSOLE 
SET PRINTER TO

DECLARE Sleep in WIN32API INTEGER

ltStart = datetime()

*** Wait for 20 seconds - if not complete, fail
lnHandle=FOPEN(THIS.cTempOutputFile,0)
do while lnHandle = -1 AND DATETIME() < ltStart + THIS.nTimeout
   =sleep(200)
enddo


*** Couldn't open the PDF file so fail
if lnHandle = -1
   THIS.UnlockSemaphore()
   RETURN .F.
ENDIF   

*** Get rid of an existing file
ERASE (lcOutputFile)
   
=FCLOSE(lnHandle)

*** Move the temp file to the actual file name by renaming
RENAME (THIS.cTempOutputFile) TO (lcOutputFile)

THIS.UnlockSemaphore()

RETURN .T.
ENDFUNC
* wwPDF :: PrintReport

************************************************************************
* wwPDF :: PrintReportToString
*********************************
***  Function: Prints a report to string
***      Pass: lcReport     -   Name of the FRX Report to run
***            lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: PDF file as a string or "" on failure
************************************************************************
FUNCTION PrintReportToString
LPARAMETERS lcReport, lcExtraClauses
LOCAL lcFilename, lcOutput

lcFilename = SYS(2023) + "\" + Sys(3) + ".pdf"

IF THIS.PrintReport(lcReport,lcFileName,lcExtraClauses)
   lcOutput = File2Var(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput
ENDIF
   
*** Try to erase this file just in case
ERASE (lcFileName)
   
RETURN ""
ENDFUNC
* wwPDF :: PrintReportToString


************************************************************************
* wwPDF :: LockSemaphore
*********************************
***  Function: Makes sure that only one report is printed at a time.
***            This method locks a record in a temporary file.
************************************************************************
PROTECTED FUNCTION LockSemaphore
LOCAL lcOldAlias, lnOldReprocess, llRetVal

lcOldAlias = Alias()

*** Check if the file exists
IF !FILE(THIS.cSemaphoreFile)
   CREATE TABLE (THIS.cSemaphoreFile) FREE ;
       (  timestamp  t, ID   c ( 10) ) 
   APPEND BLANK
   REPLACE timestamp with datetime()
   USE
ENDIF

IF !USED("wwPDF")
   USE (THIS.cSemaphoreFile) ALIAS wwPDF IN 0 SHARED
ENDIF
SELE wwPDF 

lnOldReprocess = SET("REPROCESS")
SET REPROCESS TO (THIS.nTimeOut) SECONDS

llRetVal = RLOCK()

SET REPROCESS TO (lnOldReprocess) SECONDS

IF !EMPTY(lcOldAlias)
   SELE (lcOldAlias)
ENDIF

RETURN llRetVal
ENDFUNC
* wwPDF :: LockSemaphore

************************************************************************
* wwPDF :: UnlockSemaphore
*********************************
***  Function: Unlocks the semaphore record when the report has 
***            completed.
************************************************************************
PROTECTED FUNCTION UnlockSemaphore

lcOldAlias = ALIAS()

IF !USED("wwPDF")
   USE (THIS.cSemaphoreFile) ALIAS wwPDF IN 0
ENDIF
SELE wwPDF 

UNLOCK

IF !EMPTY(lcOldAlias)
   SELE (lcOldAlias)
ENDIF
   
RETURN
ENDFUNC
* wwPDF :: UnlockSemaphore

************************************************************************
* wwPDF :: QuickReport
*********************************
***  Function: Prints a report from a cursor without an FRX
***            courtesy of Randy Pearson, Cycla Corp
***      Pass: lcOutputFile -   Filename to print the PDF output to
***            lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: .T. or .F.
************************************************************************
FUNCTION QuickReport

LPARAMETERS lcOutputFile, lcExtraReportClauses

IF EMPTY( ALIAS() )
   RETURN .F.
ENDIF

LOCAL lcFrx, llResult
lcFrx = SYS(2023) + '\' + SYS(3)
CREATE REPORT ( m.lcFrx ) ;
   FROM ( ALIAS() )

llResult = THIS.PrintReport( m.lcFrx + '.FRX', ;
   lcOutputFile, lcExtraReportClauses ) 

ERASE ( m.lcFrx + '.FRX' )
ERASE ( m.lcFrx + '.FRT' )

RETURN m.llResult
ENDFUNC
* wwPDF :: QuickReport


************************************************************************
* wwPDF :: QuickReportToString
*********************************
***  Function: Prints a PDF report to string without an FRX
***            courtesy of Randy Pearson, Cycla Corp
***      Pass: lcExtraReportClauses  - Any extra tags like FOR, WHEN etc.
***    Return: PDF file as a string or '' on failure
************************************************************************
FUNCTION QuickReportToString
LPARAMETERS lcExtraClauses

LOCAL lcFileName
lcFilename = SYS(2023) + '\' + Sys(3) + '.pdf'

IF THIS.QuickReport(lcFileName,lcExtraClauses)
   lcOutput = File2Var(lcFileName)
   ERASE (lcFileName)
   RETURN lcOutput
ENDIF
   
*** Try to erase this file just in case
ERASE (lcFileName)
   
RETURN ''
ENDFUNC
* wwPDF :: QuickReportToString

ENDDEFINE
*EOC wwPDF

#ENDIF