#INCLUDE WCONNECT.H

SET PROCEDURE TO wwEval ADDITIVE
SET PROCEDURE TO wwVFPScript ADDITIVE
SET PROCEDURE TO wwResponse Additive

*************************************************************
DEFINE CLASS wwVFPScript AS Custom
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1997
***   Contact: (541) 386-2087  / rstrahl@west-wind.com
***  Modified: 11/18/97
***
***  Function:
*************************************************************
PROTECTED cTempFile

*** Custom Properties
oHTML = .NULL.
oCGI = .NULL.

cFileName = ""
cErrorMsg = ""
cCompileErrors = ""
*cVFPCode = ""

*** Script Mode determines how scripts are run
*** 1  -   Interpreted  (VFP Dev only)
*** 2  -   PreCompiled  (FXP files required  -  FASTEST)
*** 3  -   Using CodeBlock  (Dev or Runtime/Macro Interpreted - SLOW)
nScriptMode = 3

lSaveCode = .F.

*lUseCodeBlock = .F.
*lForceRuntime = .T.
lRuntime = .F.

lDeleteGeneratedCode = .T.
lEditErrors = .F.

cTempFile = ""
lAlwaysUnloadScript = .F.

*** Stock Properties

************************************************************************
* wwVFPScript :: Init
*********************************
***  Function:
***    Assume:
***      Pass: lcFile  -  File to Process
***            loHTML  -  An existing HTML object (Optional)
************************************************************************
FUNCTION Init
LPARAMETERS lcFile, loHTML &&, loCGI

IF !EMPTY(lcFile)
   THIS.cFilename = lcFile
ENDIF

IF TYPE("loHTML") # "O"
   THIS.oHTML = CREATE("WWRESPONSESTRING")
ELSE
   THIS.oHTML = loHTML
ENDIF

ENDFUNC
* Init

************************************************************************
* wwVFPScript :: Execute
*********************************
***  Function: Simple High level function that takes a piece of ASP
***            code and runs it using VFP Evaluation
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Execute
LPARAMETERS lcText, llRuntime
LOCAL lcFile

*** WCS - Script Text   WCX - Compiled   WCT - Intermediate
THIS.lAlwaysUnloadScript = .T.
 
IF !llRunTime
    THIS.cFileName = SYS(2023) + "\"+ SYS(2015) + ".WCS"
    THIS.lRuntime = .F.
    lcCode = THIS.ConvertPage(lcText)
    THIS.RenderPage()
ELSE
    THIS.lRuntime = .T.
    THIS.RenderPage(lcText)   && lcText is really the file name    
ENDIF

RETURN THIS.oHTML.GetOutput()
ENDFUNC
* wwVFPScript :: Execute

************************************************************************
* wwVFPScript :: cbExecute
**********************************
***  Function: Forces operation through CodeBlock
***      Pass: lcCode     -   Code to run as string
***            llVFPCode  -   ASP Scripting or VFP code
***    Return: Evaled output or ""
************************************************************************
FUNCTION cbExecute
LPARAMETER lcCode, llVFPCode
LOCAL lcVFPCode

IF !llVFPCode
   lcVFPCode = THIS.ConvertPage(lcCode,.t.)
   THIS.RenderPageFromVar(lcVFPCode)
ELSE
   THIS.RenderPageFromVar(lcCode)
ENDIF


RETURN THIS.oHTML.GetOutput()
ENDFUNC
* wwVFPScript :: ExecuteCodeBlock


************************************************************************
* wwVFPScript :: RenderPage
*******************************
***  Function: Actually creates the HTML from an input file (FXP or PRG
***            in the dev version)
***    Assume:
***      Pass: lcFile     -   File to render (.WCS, .WCT, .FXP)
***            llNoOutput - Result is returned as string but no output
***                         is sent to the wwHTML object.
***    Return: "" or rendered text if llOutput .T.
************************************************************************
FUNCTION RenderPage
LPARAMETER lcFile,llNoOutput
LOCAL lcOutput
PRIVATE lcFXPFile, Response

lcFile=IIF(type("lcFile")="C",lcFile,THIS.cFileName )

IF THIS.nScriptMode = 2 
   *** Precompiled
   lcFile = ForceExt(lcFile,"FXP")
ELSE
   *** Interpreted
   lcFile = ForceExt(lcFile,"WCT")   
ENDIF	

#IF wwVFPVersion > 6
	lcOutFile = sys(2023)+"\WCS"+Sys(2015)+ TRANSFORM(Application.ProcessId) + ".TMP"
#ELSE
	lcOutFile = sys(2023)+"\WCS"+Sys(2015)+ LTRIM(TRANS( int(rand() * 100),"99" )) + ".TMP"
#ENDIF

Response = CREATEOBJECT("wwScriptResponse",lcOutfile) 

*** Allow immediate unloading of script
IF THIS.lAlwaysUnloadScript
  lcOldDev = SET("DEVELOPMENT")
  SET DEVELOPMENT ON
  SET PROCEDURE TO (lcFile) ADDITIVE
  SET DEVELOPMENT &lcOldDev
ENDIF

*lcFXPFile = FORCEEXT(lcFile,"FXP")

*** Retrieve the Script and trim off __FUNCTION header
loEval = CREATE("wwEVal")
loEval.EVALUATE("__"+juststem(lcFile)+"()")

IF loEval.lError
   *** Print Error on top followed by existing output
   lcOutput = THIS.wwEvalErrorResponse(loEval,File2Var(ForceExt(lcFile,"WCT")) ) + "<HR>"+Response.GetOutput()
ELSE
   lcOutput = Response.GetOutput()
ENDIF   
   
IF THIS.lAlwaysUnloadScript
  * wait window timeout 3 "Releasing: " + FORCEEXT(lcFile,"")
 RELEASE PROCEDURE (FORCEEXT(lcFile,""))  && (lcFxpFile)
ENDIF  

IF lcOutput = "HTTP/"
   *** Clear existing output if we have a header
   THIS.oHTML.Rewind()
ENDIF

RETURN THIS.oHTML.Send(lcOutput,llNoOutput)
ENDFUNC
* RenderPage


************************************************************************
* wwVFPScript :: RenderPageFromVar
**********************************
***  Function: Renders a code snippet using CodeBlock.
***    Assume: Requst object must exist somewhere
***      Pass: lcCode     -  Page Code to run
***            llNoOutput -  Whether to send output or return string
***    Return: "" or output if llNoOutput = .T.
************************************************************************
FUNCTION RenderPageFromVar
LPARAMETERS lcCode, llNoOutput
LOCAL lcOutput
PRIVATE Response, lcFXPFile

lcOutFile = sys(2023)+"\WCS"+Sys(2015)+ LTRIM(TRANS( int(rand() * 100),"99" )) + ".TMP"

Response = CREATEOBJECT("wwScriptResponse",lcOutfile) 

IF THIS.lSaveCode 
   File2Var(SYS(2023) + "\TEMP_WCS.PRG",lcCode)
ENDIF

loEval = CREATEOBJECT("wwEval")  
loEval.Execute(lcCode)

IF loEval.lError
   *** Print Error on top followed by existing output
   lcOutput = THIS.wwEvalErrorResponse(loEval,lcCode) &&+ "<HR>"+Response.GetOutput() 
ELSE
   lcOutput = Response.GetOutput()
ENDIF   

IF lcOutput = "HTTP/"
   *** Clear existing output if we have a header
   THIS.oHTML.Clear()
ENDIF

RETURN THIS.oHTML.Send(lcOutput,llNoOutput)
ENDFUNC
* wwVFPScript :: RenderPageFromVar


************************************************************************
* wwVFPScript :: ConvertPage
*********************************
***  Function: Converts a script file from ASP syntax to VFP Syntax
***      Pass: lcFileText  -   (Optional) Text to parse
***                            If omitted data is loaded from WCT file
***            llReturnCode-   Returns the code as a string instead
***                            of writing it to file.
************************************************************************
FUNCTION ConvertPage
LPARAMETER lcFile, llReturnCode
LOCAL lcFile, lcVFPCode, lcEvalReplace, lcOutFile, llReturnCode, lcEvalCode

IF EMPTY(lcFile)
   lcFile = File2var(THIS.cFileName)
ENDIF
lcOutFile = ForceExt(THIS.cFileName,"WCT")

lcEvalCode = "x"
DO WHILE !EMPTY(lcEvalCode)
	lcEvalCode = Extract(lcFile,"<%=","%>")
	IF !EMPTY(lcEvalCode)
	   lcEvalReplace = "<%=" + lcEvalCode + "%>"
	   lcFile = STRTRAN(lcFile,lcEvalReplace,"<<" +ALLTRIM(lcEvalCode) + ">>")
	ENDIF
ENDDO

lcFile = STRTRAN(lcFile,"<%",CHR(13)+"ENDTEXT"+CHR(13))
lcVFPCode =;
 "TEXT" + CHR(13) +;
                STRTRAN(lcFile,"%>",CHR(13)+"TEXT"+CHR(13)) + ;
                CHR(13) + "ENDTEXT"  

IF llReturnCode
   RETURN lcVFPCode
ENDIF
   
File2Var(lcOutFile, "FUNCTION __"+JUSTSTEM(THIS.cFileName)+CR+;
                    lcVFPCode)
ENDFUNC
* ConvertPage

************************************************************************
* wwVFPScript :: CompilePage
*********************************
***  Function: Creates a compiled version that can be run by the
***            runtime version. 
***    Assume: File has a .FXP extension
***      Pass: llDelete    -   Delete intermediate file
************************************************************************
FUNCTION CompilePage

lcFileName = ForceExt(THIS.cFileName,"WCT")

COMPILE  (lcFileName)  && Create file with .FXP extension

*** Delete .WCT File?
IF THIS.lDeleteGeneratedCode
   ERASE (FORCEEXT(lcFileName,"wct"))
ENDIF

lcErrFile = ForceExt(THIS.cFileName,"ERR")
IF FILE(lcErrFile)
   THIS.cCompileErrors = THIS.cCompileErrors +;
                         "*********** " + THIS.cFileName + " Errors *************"+CR+;
                         File2Var(lcErrFile)+CR+CR
   ERASE (lcErrFile) 
ENDIF

IF !FILE(ForceExt(THIS.cFileName,"FXP"))
   RETURN .F.
ENDIF

RETURN .T.
ENDFUNC
* CompilePage


************************************************************************
* wwVFPScript :: wwEvalErrorResponse
************************************
***  Function: Creates an Error Response page from the loEval object and
***            its error information 
***      Pass: loEval   -   Eval Object
***            lcCode   -   Optionally pass in the code to display error
***    Return: Error HTML String
************************************************************************
FUNCTION wwEvalErrorResponse
LPARAMETERS loEval, lcCode
LOCAL lcOutput, lnErrorLine, lnErrorPos

lcOutput = ""

IF !EMPTY(lcCode)
  IF !EMPTY(THIS.cFileName)
	 lcCode = File2Var(THIS.cFileName)
     IF !EMPTY(lcCode)
		SET MEMOWIDTH TO 512
		lnErrorLine = ATLINE(loEval.cErrorCode,lcCode)
		lnErrorPos = ATC(loEval.cErrorCode, lcCode )
		IF lnErrorPos > 0 
    		loEval.nErrorLine = lnErrorLine
    		IF THIS.lEditErrors
            	MODI FILE (THis.cFileName) RANGE (lnErrorPos),lnERrorPos + LEN(loEval.cErrorCode) IN MACDESKTOP NOWAIT
        	ENDIF
        ELSE
            loEval.cErrorCode = ""
		ENDIF
	 ENDIF
  ENDIF
  
ENDIF


lcOutput = ;
   [<TABLE WIDTH=100% BGCOLOR="BLACK"><TD ALIGN=CENTER><b><FONT COLOR="WHITE" FACE="VERDANA" SIZE="4">Scripting Error</FONT></b></TD></TABLE><p>]+;
   [<TABLE BGCOLOR=#EEEEEE BORDER=1 CELLPADDING=3 STYLE="Font:normal normal 10pt Verdana">] + ;
   "<TR><TD ALGIN=RIGHT>Error: </TD><TD>"+loEval.cErrorMessage + "</TD</TR>" + ;
   "<TR><TD ALGIN=RIGHT>Code:</TD><TD>"+loEval.cErrorCode + "</TD></TR>" +;
   "<TR><TD ALGIN=RIGHT>Error Number:</TD><TD>"+ STR(loEval.nError) + "</TD></TR>" +;
   "<TR><TD ALGIN=RIGHT>Line No:</TD><TD>" + STR(loEval.nErrorLine)+ "</TD></TR>" + ;
   "</TABLE><p>"

RETURN lcOutput
ENDFUNC
* wwVFPScript :: wwEvalErrorResponse


ENDDEFINE
*EOC wwVFPScript

*************************************************************
DEFINE CLASS wwScriptResponse AS WWC_RESPONSE
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1997
***   Contact: (541) 386-2087  / rstrahl@west-wind.com
***  Modified: 11/18/97
***
***  Function:
*************************************************************

*** Custom Properties
cFileName = ""

*** Stock Properties

************************************************************************
* wwScriptResponse :: Init
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init
LPARAMETERS lcOutputFile, loVFPScript

SET TEXTMERGE ON
SET TEXTMERGE TO (lcOutputFile) NOSHOW 
THIS.cFileName = lcOutputFile

ENDFUNC
* wwScriptResponse :: Init

************************************************************************
* wwScriptResponse :: Write
*********************************
***  Function: Basic Output Method for scripting. Used for direct
***            call or when using <%= <expression %> syntax.
************************************************************************
FUNCTION Write
LPARAMETER lvExpression, lvIgnored

\\<<lvExpression>>

ENDFUNC
* Write

FUNCTION Send
LPARAMETER lvExpression

\\<<lvExpression>>
ENDFUNC

FUNCTION FastWrite
LPARAMETER lvExpression, lvIgnored
\\<<lvExpression>>
ENDFUNC

************************************************************************
* wwScriptResponse :: Clear
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Clear

SET TEXTMERGE TO (THIS.cFileName)

ENDFUNC
* wwScriptResponse :: Clear

FUNCTION Rewind
THIS.Clear()
ENDFUNC

************************************************************************
* wwScriptResponse :: GetOutput
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetOutput

SET TEXTMERGE TO
lcOutput = file2Var(THIS.cFileName)
ERASE (THIS.cFileName)

RETURN lcOutput 
ENDFUNC
* wwScriptResponse :: GetOutput

************************************************************************
* wwScriptResponse :: END
*********************************
***  Function: Stops output to the output file
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION End
SET TEXTMERGE TO
ENDFUNC

************************************************************************
* wwScriptResponse :: Redirect
*********************************
***  Function: Redirects to another URL
***    Assume:
***      Pass: lcURL  -  New URL to redirect to
************************************************************************
FUNCTION Redirect
LPARAMETERS lcTarget
THIS.HTMLRedirect(lcTarget)
ENDFUNC
* wwScriptResponse :: Redirect


FUNCTION HTMLRedirect
LPARAMETERS tcUrl
tcUrl=IIF(!EMPTY(tcUrl),tcUrl,"")
THIS.Clear()
THIS.Write("HTTP/1.1 302 Moved"+CR+;
             "Content-type: text/html"+CR+;
             "Location: "+tcUrl+CR +CR)
ENDFUNC

************************************************************************
* wwScriptResponse :: Cookies
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Cookies
LPARAMETERS lcCookie, lcValue, lcPath, lcExpires

THIS.oCGI.SetCookie(lcCookie,lcValue,lcPath,lcExpires)

ENDFUNC
* wwScriptResponse :: Cookies
 
ENDDEFINE
*EOC wwScriptResponse
