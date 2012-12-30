
SET PROCEDURE TO wwScripting ADDITIVE
SET PROCEDURE TO wwUtils ADDITIVE

#DEFINE CRLF CHR(13) + CHR(10)

*************************************************************
DEFINE CLASS wwScripting AS Custom
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2004
*:Contact: http://www.west-wind.com
*:Created: 09/24/2004
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwScripting 

*:Description:
This class provides end user applications with the ability to
dynamically evaluate and execute templates. It provides both
a TextMerge expression evaluator and a fully capable script
parser using Visual FoxPro language code. Both mechanisms
are based on the ASP <%=  %> script tag expressions.

*:Remarks
This class requires VFP 8 or later

*:ENDHELP
#ENDIF
************************************************************************

*** Error Message if a failure occurs
cErrorMsg = ""

*** Error flag that can and should be checked after running a script or template
lError = .F.

*** A VFP 8/9 Exception object
oException = null

*** If .t. doesn't delete the generate VFP source code after compiling
lSaveVfpSourceCode = .F.

*** If .T. pops up an editor window for editing the error in the code
lEditErrors = .F.

*** If .T. displays full error information on the page if possible
lShowFullErrorInfo = .T.

*** Flag used to cause parser to stop on the line of code causing error in VFP
*** This flag should be used only as a debugging feature.
lStopOnError = .F.

*** The HTML page header (including <html> and HTML text) that is displayed over
*** the table of error information. This property is used to override the display
cErrorHeader = ""

*** Path where our compiled FXP and WCT files are stored
cCompiledPath = ""

PROTECTED cCurrentTemplate
*** Internal property that holds the currently processing template
cCurrentTemplate = ""

*** If .T. doesn't check or attempt to compile the file, but just executes the FXP. Assuemes the FXP exists 
lNoVersionCheck = .F.

*** The input script code
cScriptCode = ""

*** The generated VFP code
cVFPCode = ""

cScriptResponseClass = "wwScriptingResponse"

oResponse = null


************************************************************************
FUNCTION AspTextMerge(lcAspCode,llIsFile)
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwScripting :: AspTextMerge

*:Description:
This method is a wrapper around the VFP TextMerge function
to provide template expansion of <%= %> syntax. It also
provides proper error handling.


*:Parameters:
<<b>>lcASPCode<</b>>
The code that is to be textmerged. This code should be
TEXT with embedded <%= %> tags for expressions TO be
evaluated. Note that any expressions must be in scope
(ie. vars need to be PRIVATE or PUBLIC).

You can also pass a filename here if llIsFile is set to .t.

<<b>>llIsFile<</b>>
IF .t. specifies that the first parameter indicates a filename.

*:Returns:
Expanded text. Check lError for failures.

*:Remarks:

*:SeeAlso:

*:Keywords:

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lcASPCode, lcResult

this.lError = .f.

IF llIsFile
   lcASPCode = File2Var(lcAspCode)
ENDIF

*** Must convert to 2 characters from <%=
lcASPCode = STRTRAN(lcAspCode,"<%=","<%")

lcResult = ""
loException = ""
TRY 
  lcResult = TEXTMERGE(lcASPCode,.f.,"<%","%>") 
CATCH TO loException
   this.oException = loException
   this.cErrorMsg = this.oException.Message
   this.lError = .t.
ENDTRY

RETURN lcResult
ENDFUNC

************************************************************************
* wwEval :: MergeText
*********************
***  Function: This function provides an evaluation engine for FoxPro
***            expressions and Codeblocks that is tuned for Active
***            Server syntax. It works with any delimiters however. This
***            parsing engine is faster than TEXTMERGE and provides
***            extensive error checking and the ability to run
***            dynamically in the VFP runtime (ie uncompiled). Embed any
***            valid FoxPro expressions using
***
***               <%= Expression%>
***
***            and any FoxPro code with
***
***               <% CodeBlock %>
***
***            Expressions ideally should be character for optimal
***            speed, but other values are converted to string
***            automatically. Although optimized for the delimiters
***            above you may specify your own. Make sure to set the
***            llNoAspSyntax parameter to .t. to disallow the = check
***            for expressions vs code. If you use your own parameters
***            you can only evaluate expressions OR you must use ASP
***            syntax and follow your deleimiters with an = for
***            expressions.
***   Assume:  Delimiter is not used in regular text of the text.
***     Uses:  wwEval class (wwEval.prg)
***            Codeblock Class (wwEval.prg)
***     Pass:  tcString    -    String to Merge
***            tcDelimeter -    Delimiter used to embed expressions
***                             Default is "<%"
***            tcDelimeter2-    Delimiter used to embed expressions
***                             Default is "%>"
***            llNoAspSytnax    Don't interpret = following first
***                             parm as expression. Everything is
***                             evaluated as expressions.
***
***  Example:  loHTML.MergeText(HTMLDocs.MemField,"##")
*************************************************************************
FUNCTION MergeText
LPARAMETER tcString,tlIsFile
LOCAL lnLoc1,lnLoc2,lnIndex, lcEvalText, lcExtractText, lcOldError, ;
   lnErrCount, lcType,lcResult
PRIVATE plEvalError

plEvalError=.F.   && Debug Error Variable

IF tlIsFile
   tcString = File2Var(tcString)
ENDIF

tcDelimiter="<%"
tcDelimiter2="%>"

*** Occurance flag for second delim AT()
IF tcDelimiter # tcDelimiter2
   lnDifferent = 1
ELSE
   lnDifferent = 2
ENDIF

lnLoc1=1
lnLoc2=1
lnIndex=0

lnErrCount=0

*** Loop through all occurances of embedding
DO WHILE lnLoc1 > 0 AND lnLoc2>0
   *** Find instance
   lnLoc1=AT(tcDelimiter,tcString,1)

   IF lnLoc1>0
      *** Now check for the ending delimiter
      lnLoc2=AT(tcDelimiter2,tcString,lnDifferent)
      IF lnLoc2 = 0
         LOOP
      ENDIF

      IF lnLoc2>lnLoc1
         *** Strip out the delimiter to get embedded expression
         lcExtractText=SUBSTR(tcString,lnLoc1+LEN(tcDelimiter),;
            lnLoc2-lnLoc1-LEN(tcDelimiter)  )

         llError = .F.
            *** ASP Syntax allows for <%= Expression %> <% CodeBlock %>
            IF  lcExtractText = "="
               llError = .f.

               TRY 
                  lcResult = EVALUATE(SUBSTR(lcExtractText,2))
               CATCH TO loException
                  llError = .t.
               ENDTRY
               IF !THIS.lError
                     IF VARTYPE(lcResult) # "C"
                        lcResult = TRANSFORM(lcResult)
                     ENDIF
               ENDIF
            ELSE
               TRY
                  lcResult = EXECSCRIPT(lcExtractText)
               CATCH TO loException   
                  llError = .T.
               ENDTRY
               
               IF VARTYPE(lcResult) # "C"
                  lcResult = ""
               ENDIF
            ENDIF

            IF !llError AND !plEvalError
               *** Now translate and evaluate the expression
               *** NOTE: Any delimiters contained in the evaluated
               ***       string are discarded!!! Otherwise we could end
               ***       up in an endless loop...
               tcString= STRTRAN(tcString,tcDelimiter+lcExtractText+tcDelimiter2,;
                  TRIM(lcResult))
            ELSE

               *** Check for EVAL error
               *         IF loEval.lError or plEvalError
               plEvalError=.F.

               *** Bail-Out Hack in case invalid bracket code
               *** causes recursive lockup
               lnErrCount=lnErrCount+1
               IF lnErrCount>150
                  EXIT
               ENDIF

               *** Error - embed an error string instead
               tcString=STRTRAN(tcString,;
                  tcDelimiter+lcExtractText+tcDelimiter2,;
                  "< % ERROR: "+STRTRAN(STRTRAN(lcExtractText,tcDelimiter,""),tcDelimiter2,"")+ " % >")
            ENDIF

         ELSE
            tcString = STUFF(tcString,lnLoc2,LEN(tcDelimiter2),SPACE(LEN(tcDelimiter2)) )
            LOOP
         ENDIF  && lnLoc2>=lnLoc1
      ENDIF     && lnLoc2>0
   ENDDO

 RETURN tcString
 ENDFUNC
 *EOF MergeText

************************************************************************
* wwScripting ::  ExecScript
****************************************
***  Function: Executes code from memory
***    Assume:
***      Pass: 
***    Return:
************************************************************************
FUNCTION ExecScript(lcTemplate as string, llIsCodeString as Boolean) as String
LOCAL loException, lcCode

this.cCurrentTemplate = lcTemplate

IF !llIsCodeString
	lcCode = this.ConvertAspToVfpCode(File2Var(lcTemplate))    
ELSE
	lcCode = this.ConvertAspToVfpCode(lcTemplate)    
ENDIF

*** Output is generated into this variable
PRIVATE _Out
_Out = ""

*** Response object for the the script code
PRIVATE Response 
IF ISNULL(this.oResponse)
	Response = this.CreateResponse()
ELSE
    Response = this.oResponse
ENDIF    	

loException = null
TRY 
	EXECSCRIPT( lcCode)	
CATCH TO loException
    *** Assign the captured exception from the inner code
    IF loException.ErrorNo = 10
       loException.Message = "Compilation Error: " + loException.Message
       loException.LineNo = 0
       loException.LineContents = ""
    ENDIF

    this.lError = .t.
    this.cErrormsg = loException.Message

    IF !EMPTY(loException.LineContents)
       LOCAL lnCodeLines
       lnCodeLines = ALINES(laLines,lcCode)
       IF lnCodeLines > 0 AND loException.LineNo > 0 AND loException.LineNo <= lnCodeLines 
            loException.LineContents = ALLTRIM(laLines[loException.Lineno])
       ENDIF
     ENDIF
     
    this.oException = loException
ENDTRY   

IF THIS.lError
   _Out = this.AspScriptErrorResponse()
ENDIF

IF (THIS.cScriptResponseClass == "wwScriptingHttpResponse")
   IF this.lError 
      Response.Status = "200 OK"
      Response.ContentType = "text/html" 
   ENDIF
   _Out = Response.RenderHttpHeader() + _Out
ENDIF

RETURN _Out
ENDFUNC
*  wwScripting ::  ExecScript

************************************************************************
FUNCTION RenderAspScript(lcTemplate as string)
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwScripting :: RenderASPScript

*:Description:
Renders an ASP style page as a compiled VFP program. This method
handles creation of the VFP source code from the script file,
compilation and checking for updates of the file.

Parsing works using ASP style syntax:

<%= Expression  %>

<%
VFP Code Block
%>

The script page gets passed a Response object which you can
USE to send output directly into the output stream. 
 
*:Parameters:
lcTemplate
Name of the file on disk to parse

*:Returns:
Evaluated result from the script code.
*:ENDHELP
#ENDIF
************************************************************************
LOCAL loException, lcOutFile, lcFile, lcFXPFile, lcWCTFile, lcVFPCode,;
      lcFileName, lcFXPFile, lcWCTFile, llNeedToCompile

IF EMPTY(THIS.cCompiledPath)
   this.cCompiledPath = JUSTPATH(lcTemplate) + "\"
ELSE
   this.cCompiledPath = ADDBS(THIS.cCompiledPath)   
ENDIF

this.cCurrentTemplate = lcTemplate

*** Figure out our filenames to use
lcFileName = JUSTFNAME(lcTemplate)
lcFXPFile =  FORCEEXT(THIS.cCompiledPath + lcFileName,"FXP")

this.lError = .f.

IF this.lNoVersionCheck
	llNeedToCompile = .F.
ELSE	
	llNeedToCompile = .T.
	TRY
	   *** This catches both fxp file not existing and being out of date
	   *** Slightly more efficient than checking file, and the dates
	   llNeedToCompile = FDATE(lcFxpFile,1) < FDATE(lcTemplate,1)
	CATCH
	   llNeedToCompile = .t.
	ENDTRY

	*** Create and compile the file only if it doesn't exist
	*** or the timestamp of the FXP is older than the source file
	*** NOTE: Must use SYS(2000) instead of file so we don't look for files in the EXE!
	IF  llNeedToCompile
	   IF !this.ConvertAndCompileScript(lcTemplate)
	      RETURN this.AspScriptErrorResponse()
	   ENDIF
	ENDIF
ENDIF

*** Output generated into this variable
PRIVATE _Out
_Out = ""

*** Response object for the page object - writes to _Out
PRIVATE Response 
IF ISNULL(this.oResponse)
	Response = this.CreateResponse()
ELSE
	Response = this.oResponse
ENDIF	

loException = null
IF this.lStopOnError
   *** fail and stop in the generated PRG file
   DO (lcFXPFile)  &&WITH lcOutput
ELSE
   TRY 
      *** Just execute the PRG File
      DO (lcFxpFile)  && WITH lcOutput
   CATCH TO loException
      this.lError = .t.
      this.cErrormsg = loException.Message

      *IF EMPTY(loException.LineContents)
         lcFile = FILE2VAR( FORCEEXT(lcFxPFile,"prg") )
         IF !EMPTY(lcFile)
            LOCAL lnCodeLines
            lnCodeLines = ALINES(laLines,lcFile)
            IF lnCodeLines > 0 AND loException.LineNo <= lnCodeLines
               loException.LineContents = ALLTRIM(laLines[loException.Lineno])
            ENDIF
         ENDIF   
      *ENDIF
      this.oException = loException
   ENDTRY   
ENDIF

IF THIS.lError
   _Out = this.AspScriptErrorResponse()
*!*	ELSE
*!*	   _Out = this.oResponse.GetOutput()
ENDIF

IF (THIS.cScriptResponseClass == "wwScriptingHttpResponse")
   IF this.lError 
      Response.Status = "200 OK"
      Response.ContentType = "text/html" 
   ENDIF   
   _Out = Response.RenderHttpHeader() + _Out
ENDIF

RETURN _Out
ENDFUNC


************************************************************************
* wwScripting ::  CreateResponse
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateResponse(loResponse)

IF VARTYPE(loResponse) == ")"
   this.oResponse = loResponse
   RETURN loResponse
ENDIF

this.oResponse = CREATEOBJECT(this.cScriptResponseClass)   

RETURN this.oResponse
ENDFUNC
*  wwScripting ::  CreateResponse

************************************************************************
FUNCTION ConvertAndCompileScript( lcTemplate as String) 
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwScripting :: ConvertAndCompileScript

*:Description:
This method takes a script file and converts it to a VFP file and
compiles it.

This method allows your code to pre-compile pages if you choose.
*:Parameters:
lcTemplate
The template to convert.
*:Returns:
.T. of .f.
*:Remarks:

*:SeeAlso:

*:Keywords:

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lcWCTFile, lcFXPFile, lcFileName

lcFileName = JUSTFNAME(lcTemplate)
lcFXPFile =  FORCEEXT(THIS.cCompiledPath + lcFileName,"FXP")
lcWCTFile =  FORCEEXT(THIS.cCompiledPath + lcFileName,"PRG")

*** Must create directory if it doesn't exist
IF !ISDIR(this.cCompiledPath)
   MD (this.cCompiledPath)
ENDIF   

IF !FILE(lcTemplate)
   this.cErrorMsg = "ASP Template doesn't exist"
   this.oException = CREATEOBJECT("Exception")
   THIS.oException.message = THIS.cErrorMsg
   this.lError = .t.
   RETURN .F.
ENDIF      

lcVFPCode = this.ConvertAspToVfpCode( File2Var(lcTemplate) )
STRTOFILE( lcVFPCode,lcWCTFile )

loException = null
TRY
   COMPILE ( lcWctFile )

   *** Once compiled we don't need the source code any more
   IF !this.lSaveVfpSourceCode
      ERASE ( lcWCTFile) 
   ENDIF
CATCH TO loException
   this.lError = .t.
   this.oException = loException
   this.cErrorMsg = this.oException.Message
ENDTRY


RETURN .T.
ENDFUNC



************************************************************************
FUNCTION ConvertAspToVFPCode( lcScriptCode AS String, llAddExceptionCode as Boolean ) AS String
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwScripting :: ConvertAspTemplateToVfpCode

*:Description:
Takes an input script file and converts the file into a string 
that contains a VFP program of that script page. The page is
parsed into a PRG that takes a string parameter input by reference
and fills that string value with the generated output.

*:Parameters:
lcScriptFile
The File to convert

*:Returns:
String containing the parsed source code.

*:Remarks:

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lcCode, lcLeft, lnAt, lcCurBlock

this.cScriptCode = lcScriptCode
lcLeft = lcScriptCode

* "PARAMETERS _out" + CRLF +

*** Assign output to a PRIVATE variable
lcCode =  "LOCAL CRLF" + CRLF+;
          "CRLF = CHR(13) + CHR(10)" + CRLF +;
		  "_out = []" + CRLF

DO WHILE .T.
	lnAt = AT("<%",lcLeft)
	IF lnAt = 0
	   *** The rest is string literal
	   lcCode = lcCode + this.CreateLiteralStringExpression(lcLeft,"_out")
	   EXIT
	ENDIF
	
	*** Grab the current literal block and render it
	lcCurBlock = LEFT(lcLeft,lnAt-1)
	IF (!EMPTY(lcCurBlock))
		lcCode = lcCode +  this.CreateLiteralStringExpression(lcCurBlock,"_out")
	ENDIF
	
	*** Now check for code expression or block
	lcLeft = SUBSTR(lcLeft,lnAt)	
	IF lcLeft = "<%=" 
	   *** Read to end of Expression
	   lnAt = AT("%>",lcLeft)
	   IF lnAt = 0
	      	lcCode = lcCode +  this.CreateLiteralStringExpression(lcLeft,"_out")
	      	EXIT
	   ENDIF
	   
	   lcCurBlock = SUBSTR(lcLeft,4,lnAt-4)
	   lcCode = lcCode + CRLF + "Response.Write(TRANSFORM( EVALUATE([" + this.FixupLiteralString(lcCurBlock) + "]) ))" + CRLF + CRLF
	   
	   lcLeft = SUBSTR(lcLeft,lnAt+2)
	ELSE
       *** Read to end of Code Block
	   lnAt = AT("%>",lcLeft)
	   IF lnAt = 0
	      	lcCode = lcCode +  this.CreateLiteralStringExpression(lcLeft,"_out")
	      	EXIT
	   ENDIF
	   
	   lcCurBlock = SUBSTR(lcLeft,3,lnAt-3)
	   lcCode = lcCode + CRLF + lcCurBlock + CRLF 
	   
	   lcLeft = SUBSTR(lcLeft,lnAt+2)
	ENDIF
ENDDO

this.cVFPCode = lcCode

RETURN lcCode
ENDFUNC

************************************************************************
PROTECTED FUNCTION AspScriptErrorResponse
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwScripting :: ScripterrorResponse

*:Description:
Creates an Error Response page based on the oException object
that might have captured an exception in the script execution.

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lcOutput, lnErrorLine, lnErrorPos, lnLoc, lcFileContent,lcCode, lcLineContents

lcOutput = ""

*** Figure out our filenames to use
lcFileName = JUSTFNAME(this.cCurrentTemplate)
lcFXPFile =  FORCEEXT(THIS.cCompiledPath + lcFileName,"FXP")
lcWCTFile =  FORCEEXT(THIS.cCompiledPath + lcFileName,"WCT")

IF !ISNULL(this.oException)
   lcLineContents = STRTRAN(this.oException.LineContents,"Response.Write(TRANSFORM( EVALUATE([","<%=")
   lcLineContents = STRTRAN(lcLineContents,"]) ))","%>")

   IF EMPTY(this.cErrorHeader)
      this.cErrorHeader = ;   
         [<html>] + CHR(13)+CHR(10) +;
         [<body style="margin: 0; font:normal 10pt verdana">] + CHR(13) +;
         [<h2 style="text-align=center;background-color:#eeeeee;color:navy">Scripting Error</h2>] + CHR(13) +;
         [<div style="margin-left:15pt;margin-right:25pt;">] +;
         [An error occurred during the processing of the script page <b>] + lcFileName + [</b>.] + CHR(13) +;
         [Most likely there's an invalid script tag inside of this script page.<p>] + CHR(13) +;
         [The following error information is available:<p></div>] + CHR(13)
   ENDIF      
     
    *** Try to find the source code location
	lnSourceLocation = this.oException.LineNo

	lcSourceFile = this.cCurrentTemplate
	iF !EMPTY(this.cScriptCode)
	      lcFileContent = this.cScriptCode
     ELSE
          IF FILE(  lcSourceFile )
     	     lcFileContent = File2Var( lcSourceFile)
          ENDIF
	  ENDIF
	  IF !EMPTY(lcFileContent)
	      lnSourceLocation = ATC(lcLineContents,lcfileContent)
		  IF this.lEditErrors
	          IF  lnSourceLocation = 0 
	             MODIFY FILE (lcSourceFile) IN MACDESKTOP NOWAIT
	          ELSE
	             MODIFY FILE (lcSourceFile) RANGE (lnSourceLocation),(lnSourceLocation + LEN(lcLineContents)) IN MACDESKTOP NOWAIT
	          ENDIF
	      ENDIF
	   ENDIF
	   
    
      IF this.lShowFullErrorInfo
		  lcBlockOfCode = "" 
		  IF lnSourceLocation # 0 AND lnSourceLocation # this.oException.LineNo AND !EMPTY(lcFileContent)
		     lnSourceLocation = ATLINE(lcLineContents,lcFileContent)
		     lnCount = ALINES(laLines,lcFileContent)
		     IF lnCount >= 2 AND lnSourceLocation <= lnCount - 2
		        FOR lnx = 2 TO -2 STEP -1
		            IF lnX = 0
			        	lcBlockOfCode = lcBlockOfCode + "<span style='color:red;font-weight:bold'>Line " + TRANSFORM(lnSourceLocation - lnX,"9999") + ": " + ;
			        	                                FixHtmlForDisplay( laLines[lnSourceLocation-lnx] ) + "</span>" + CRLF
			        ELSE
			        	lcBlockOfCode = lcBlockOfCode + "Line " + TRANSFORM(lnSourceLocation - lnX,"9999") + ": " +;
			        	                                FixHtmlForDisplay( laLines[lnSourceLocation-lnx] ) + CRLF		        
			        ENDIF
		        ENDFOR
		     ENDIF
	      ENDIF
      ENDIF

     lcOutput = this.cErrorHeader + ;
      [<center><TABLE BGCOLOR=#EEEEEE BORDER=1 CELLPADDING=4 STYLE="Font:normal normal 10pt Verdana;border-collapse:collapse">] + CHR(13) + CHR(10) +;
      "<tr><th style='background-color:navy;color:white;' colspan=2>Error Information</th>" + CHR(13) +;
      "<TR><TD ALGIN=RIGHT>Script:<b> </TD><TD>" + lcFileName + "</TD></TR>" + CHR(13) +;
      "<TR><TD ALGIN=RIGHT>Error:<b> </TD><TD width='400'>" +FixHtmlForDisplay( this.oException.Message ) + "</TD></TR>" + CHR(13) +;
      "<TR><TD ALGIN=RIGHT>Code:</TD><TD>" + FixHtmlForDisplay(lcLineContents) + "</TD></TR>" + CHR(13) +;
      "<TR><TD ALGIN=RIGHT>Error Number:</TD><TD>"+ TRANSFORM(this.oException.ErrorNo) + "</TD></TR>" + CHR(13) +;
      "<TR><TD ALGIN=RIGHT>Line No:</TD><TD>" + TRANSFORM(lnSourceLocation) + "</TD></TR>" + CHR(13) +;
      "</TABLE></center><p>"


      IF this.lShowFullErrorInfo AND !EMPTY(lcBlockOfCode)
      	lcOutput = lcOutput + "<div style='padding:15px;margin:30px;background:cornsilk;border: solid darkred 1px'><b>Source Error:</b><pre>" + lcBlockOfCode + "</pre></div>"		
      ENDIF       
ELSE
      lcOutput = [<TABLE WIDTH=100% BGCOLOR="BLACK"><TD ALIGN=CENTER><b><FONT COLOR="WHITE" FACE="VERDANA" SIZE="4">Scripting Error</FONT></b></TD></TABLE><p>] + ;
      [<TABLE BGCOLOR=#EEEEEE BORDER=1 CELLPADDING=3 STYLE="Font:normal normal 10pt Verdana">] + ;
      "<TR><TD ALGIN=RIGHT>Error: </TD><TD>"+this.oException.cErrorMsg + "</TD</TR>" + ;
      "</TABLE><p>"
ENDIF

RETURN lcOutput
ENDFUNC
* wwVFPScript :: AddScriptingErrorResponse

************************************************************************
* PageParser :: CreateLiteralStringExpression
****************************************
***  Function: Creates a PRG based code string that to build
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION CreateLiteralStringExpression(lcString,lcVarName)
LOCAL lnX, lcOutput, lnMemoWidth

IF EMPTY(lcString)
   RETURN ""
ENDIF
   
IF LEN(lcString) < 81 AND AT(CHR(13),lcString)=0
   RETURN  "Response.Write([" + THIS.FixUpLiteralString(lcString) + "])" + CRLF
ENDIF

lnLines = ALINES(laLines,lcString)
lnLineGroup = 10
lcOutput = ""
FOR lnX = 0 TO lnLines - 1
   IF  lnX % lnLineGroup = 0 
      lcOutput = lcOutput + "Response.Write(" 
   ELSE
      lcOutput = lcOutput + "   "
   ENDIF
   
   lcOutput = lcOutput + "[" + this.FixUpLiteralString(laLines[lnX+1]) + "]"

   IF  lnX % lnLineGroup  = lnLineGroup -1 AND lnX > 0 
       IF lnX < lnLines -1 
	       *** Close this block
	       lcOutput = lcOutput + " + CRLF )" + CRLF 
	   ELSE
	      *** Close complete block
	      lcOutput = lcOutput + ")" + CRLF 
	   ENDIF
   ELSE
	   IF lnX < lnLines-1  &&AND LEN(lcOutput) < 7500
	      lcOutput = lcOutput + "+ CRLF +;" + CRLF 
	   ELSE
	      lcOutput = lcOutput + ")" + CRLF 
	   ENDIF   
   ENDIF
ENDFOR

RETURN lcOutput
ENDFUNC 

************************************************************************
* PageParser :: FixupLiteralString
****************************************
***  Function: Fixes literal string by replacing out ] chars and
***            making sure the string does nto exceed the max 
***            literal string length.
***    Assume: Assumes you write code like this:
***            "lcString = [" + this.FixupLiteralString() + "]"
***      Pass: lcString       - String to fix up
***            llTextMerge    - When .T. replaces TextMerge Expressison
***                             with EVAL statements
***    Return: 
************************************************************************
PROTECTED FUNCTION FixUpLiteralString(lcString)
LOCAL lnMemoWidth, lnCount, lnX, lcOutput

IF EMPTY(lcString)
   RETURN ""
ENDIF   

*** Use tabs for 4 characters
lcString = STRTRAN(lcString,"   ",CHR(9) )

IF LEN( lcString ) > 80
   lnMemoWidth = SET("MEMOWIDTH")
   SET MEMOWIDTH TO (80)
   lnCount = MEMLINES(lcString)
   lcOutput = ""
   FOR lnX = 1 TO lnCount
       IF lnX = 1
       	  *** No leading brackets
       	  IF lnCount = 1	
	          lcOutput =  this.FixupLiteralString(MLINE(lcString,lnX)) 
	       ELSE
	          lcOutput =  this.FixupLiteralString(MLINE(lcString,lnX)) + "] + ;" + CRLF   
	       ENDIF
       ELSE
          IF lnX = lnCount
             lcOutput = lcOutput + " [" + this.FixupLiteralString(MLINE(lcString,lnX)) 
          ELSE
             lcOutput = lcOutput + " [" + this.FixupLiteralString(MLINE(lcString,lnX)) + "] + ;" + CRLF
          ENDIF
       ENDIF
   ENDFOR
   SET MEMOWIDTH TO (lnMemoWidth)
   RETURN lcOutput
ENDIF

*** Have to check for end brackets ] and externalize them as + "]" + 
lcString = STRTRAN(lcString, "]", "] + ']' + [")

*** VFP chokes on && in s a string so break them up as + "&" + "&" +
lcString = STRTRAN(lcString, "&" + "&", "] + '&' + '&' + [")

RETURN lcString
ENDFUNC 


ENDDEFINE


*************************************************************
DEFINE CLASS wwExecute AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2005
*:Contact: http://www.west-wind.com
*:Created: 01/06/2005
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwExecute

*:Description:
Simplified Safe Execution class. Allows execution of a
single command or expression with error handling WITHOUT
requiring a TRY/CATCH block.

Used here to allow for execution of code AND provide runtime
ERROR information (line no AND procedure name) which is not
available with TRY/CATCH)

*:ENDHELP
#ENDIF


lError = .f.
ErrorNo = 0
LineNo = 0
Message = ""
Method = ""
LineContents = ""

************************************************************************
* wwExecute :: ExecuteCommand
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ExecuteCommand(lcCommand)
SET DEBUG ON
SET DEVELOPMENT ON
&lcCommand
RETURN

************************************************************************
* wwExecute :: EvaluateCommand
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION EvaluateCommand(lcCommand)
RETURN EVAL( lcCommand )

FUNCTION Error(nError, cMethod, nLine)

this.LineNo = nLine
this.LineContents = Message(1)
this.Message = Message()
this.ErrorNo = nError
this.Method = cMethod
this.lError = .t.
RETURN

ENDDEFINE


*************************************************************
DEFINE CLASS wwScriptingHttpResponse AS wwScriptingResponse
*************************************************************
***  Function: Adds HTTP Header support to the base scripting class
***    Assume:
***      Pass:
***    Return:
************************************************************************

*** Custom Properties
ContentType = "text/html"
Headers = ""
Status = "200 OK"
Cookies = ""
HttpVersion = "1.1"
Expires = ""
lHeaderWritten = .f.

*** Stock Properties

************************************************************************
* wwHttpScriptResponse ::  AppendHeader
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AppendHeader(lcKey,lcValue)

IF EMPTY(lcValue)
	this.Headers = this.Headers + lcKey + CRLF
ELSE
	this.Headers = this.Headers + lcKey + ": " + lcValue + CRLF
ENDIF

RETURN

************************************************************************
* wwHttpScriptResponse ::  AddCookie
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddCookie(tcCookie,tcValue,tcPath,tcExpire)

tcCookie=IIF(VARTYPE(tcCookie)="C",tcCookie,"")
tcValue=IIF(VARTYPE(tcValue)="C",tcValue,"")
tcPath=IIF(VARTYPE(tcPath)="C",tcPath,"/")
tcExpire=IIF(VARTYPE(tcExpire)="L","",tcExpire)

IF VARTYPE(tcExpire) = "T"
   tcExpire=MimeDateTime(tcExpire,.t.)
ELSE
   IF UPPER(tcExpire)="NEVER"
      *** Add 5 years ( 86000 * 365 * 5 seconds)
      tcExpire=MimeDateTime(DATETIME() + 94170000,.T.)
      **"Sun, 28-Dec-2008 01:01:01 GMT"
   ENDIF
ENDIF

IF !EMPTY(tcExpire)
   tcExpire="; expires="+tcExpire
ENDIF

this.Cookies = this.Cookies +  "Set-Cookie: " + tcCookie+[=]+tcValue +;
                 [; path=] + tcPath+ tcExpire + CRLF 
ENDFUNC
*  wwHttpScriptResponse ::  AddCookie

************************************************************************
* wwPageResponse :: Redirect
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Redirect(lcUrl)

THIS.Headers = ""
this.Clear()

this.Status = "302 Moved"
this.ContentType = "text/html" 
this.AppendHeader("Location",lcUrl)

this.End()
ENDFUNC
*  wwPageResponse :: Redirect


************************************************************************
* wwPageResponse :: AddForceReload
****************************************
***  Function: Sets maximum cache expiration headers
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddForceReload()

this.Expires="0"
THIS.AppendHeader("Pragma","no-cache")
this.AppendHeader("Cache-Control","no-cache")

ENDFUNC     

************************************************************************
* wwPageResponse :: AddCacheHeader
****************************************
***  Function: Maximum Caching options
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddCacheHeader(lnExpirationSeconds)

IF EMPTY(lnExpirationSeconds)
   lnExpirationSeconds = 300  && 5 minutes
ENDIF

this.AppendHeader("Last-Modified",MimeDateTime( DATETIME(),.t.))
this.AppendHeader("Expires",MimeDateTime( DATETIME() + lnExpirationSeconds,.t.))
THIS.AppendHeader("Cache-Control","public,max-age=" + TRANSFORM(lnExpirationSeconds) )

RETURN
ENDFUNC

************************************************************************
* wwScriptingHttpResponse ::  BasicAuthentication
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION BasicAuthentication(tcRealm, tcErrorText)

tcRealm     = IIF(VARTYPE(tcRealm)="C",tcRealm,"")
tcErrorText = IIF(VARTYPE(tcErrorText)="C",tcErrorText,;
                "<HTML><body><h1>Access to this page is denied</h1><hr>"+CRLF+;
                "Please enter a valid username and password to access this page.</body></HTML>")

THIS.Headers=""
THIS.Clear()
this.ContentType = "text/html"
this.Status = "401 Not Authorized"
this.AppendHeader("WWW-Authenticate",[basic realm="]+ tcRealm + ["])

IF !EMPTY(tcErrorText)
   this.Write(tcErrorText)
ENDIF

THIS.End()
ENDFUNC
* wwPageResponse :: BasicAuthentication

************************************************************************
* wwHttpScriptResponse ::  RenderHttpHeader
*******************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION RenderHttpHeader()
LOCAL lcHeader, lnX, lcContentType, lcID

IF this.lHeaderWritten
   RETURN ""
ENDIF

lcContentType = LOWER(this.ContentType)
DO CASE
   CASE lcContentType = "none"
      RETURN ""
   CASE lcContentType = "force"   
      lcContentType = "text/html"
      this.AddForceReload()
   CASE lcContentType = "cache"
      lcContentType = "text/html"
      this.AddCacheHeader()
ENDCASE
      
lcHeader = "HTTP/" + this.HttpVersion + " " + this.Status + CRLF  +;
           "Content-Type: " + lcContentType + CRLF 

IF !EMPTY(THIS.Expires)
   lcHeader = lcHeader +  "Expires: " + this.Expires + CRLF
ENDIF

IF !EMPTY(THIS.Headers)
   lcHeader = lcHeader + THIS.Headers
ENDIF

IF !EMPTY(THIS.Cookies)
   lcHeader = lcHeader + THIS.Cookies
ENDIF

this.lHeaderWritten = .t.

*** Return with extra CRLF at the end
RETURN lcHeader + CRLF
ENDFUNC
*  wwHttpScriptResponse ::  RenderHttpHeader

************************************************************************
* wwScriptingHttpResponse ::  ContentTypeHeader
****************************************
***  Function: Legacy function to deal with previously passed headers
***    Assume: Used internally - do not call externally 
***            provided to allow compatibility with old ExpandScript
***            objects passed
***      Pass:
***    Return:
************************************************************************
FUNCTION ContentTypeHeader(lvContentType)
LOCAL loHeader, lcType, lcOutput

lcType=VARTYPE(lvContentType)

DO CASE
	*** wwHTTPHeader object passed - if so write it and 'close' headers
	CASE lcType="O"
	     LOCAL lcHeaders, lnX, lcLine, lcStatus
	     lcHeaders = lvContentType.GetOutput()
	     *** Add the headers to these headers
	     lnCount = ALINES(laHeaders,lcHeaders)
	     FOR lnX = 1 TO lnCount
	        lcLine = laHeaders[lnX]
	        IF lcLine = "HTTP/"
		         *** Strip off the HTTP/1.1 and return just the status 
	    		 THIS.Status = SUBSTR(laHeaders[1],10)
	    		 LOOP
	        ENDIF
	        IF lcLine = "Content-Type:"
	        	this.ContentType = SUBSTR(lcLine,LEN("Content-Type: ")+1)
	        	LOOP
	        ENDIF        
	        IF !EMPTY(lcLine)
	           this.Headers = THIS.Headers + lcLine + CRLF
	        ENDIF
	     ENDFOR	     
	CASE lcType="C"
	   this.ContentType = lower(lvContentType)
	   RETURN
ENDCASE

RETURN
ENDFUNC
*  wwScriptingHttpResponse ::  ContentTypeHeader

ENDDEFINE
*EOC wwHttpScriptResponse 

*************************************************************
DEFINE CLASS wwScriptingResponse as Custom
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1997
***   Contact: (541) 386-2087  / rstrahl@west-wind.com
***  Modified: 11/18/97
***
***  Function: Provides basic Response.Write() functionality
***            to inject output into the generated script
***            page. 
*************************************************************

*** Custom Properties
cFileName = ""

PROTECTED lOpened
lOpened = .f.

*** flag that stops all further output into response
lResponseEnded = .F.

*** Default Style Sheet used for messages
cStyleSheet = ""

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
ENDFUNC
* wwScriptResponse :: Init

************************************************************************
* wwScriptResponse :: Destroy
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Destroy()
ENDFUNC
*  wwScriptResponse :: Destroy


************************************************************************
* wwScriptResponse :: Open
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Open()
ENDFUNC
*  wwScriptResponse :: Open

************************************************************************
* wwScriptResponse :: Write
*********************************
***  Function: Basic Output Method for scripting. Used for direct
***            call or when using <%= <expression %> syntax.
************************************************************************
FUNCTION Write
LPARAMETER lvExpression
IF this.lResponseEnded
   RETURN 
ENDIF
_Out = _Out + TRANSFORM(lvExpression)
ENDFUNC
* Write

FUNCTION Send
LPARAMETER lvExpression
IF this.lResponseEnded
   RETURN 
ENDIF
_Out = _Out + TRANSFORM(lvExpression)
ENDFUNC

FUNCTION FastWrite
LPARAMETER lvExpression
IF this.lResponseEnded
   RETURN 
ENDIF
_Out = _Out + TRANSFORM(lvExpression)
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

Headers = ""
Cookies = ""
_Out = ""

ENDFUNC
* wwScriptResponse :: Clear

FUNCTION Rewind
THIS.Clear()
ENDFUNC


************************************************************************
* wwScriptingResponse ::  End
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION End()

this.lResponseEnded = .T.

ENDFUNC
*  wwScriptingResponse ::  End

************************************************************************
* wwScriptResponse :: GetOutput
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetOutput
LOCAL lcOutput
RETURN _Out
ENDFUNC
* wwScriptResponse :: GetOutput


 
ENDDEFINE
*EOC wwScriptResponse


*************************************************************
DEFINE CLASS wwHelpScripting AS wwScripting
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2005
*:Contact: http://www.west-wind.com
*:Created: 01/06/2005
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHelpScripting

*:Description:
Subclass of wwScripting that provides a custom Error Message
header.

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties

*** Stock Properties

cErrorHeader = ;   
 [<html><head>] + ;
 [<LINK rel="stylesheet" type="text/css" href="templates/wwhelp.css">] +;
 [</head>] + CHR(13)+CHR(10) +;
 [<body topmargin=0 leftmargin=0>] + CHR(13) +;
 [<TABLE WIDTH=100% class="banner"><TD ALIGN=CENTER><b><font SIZE="4">Help Builder Scripting Error</FONT></b></TD></TABLE><p>]+;
 [<div style="margin-left:15pt;margin-right:25pt;"><img src="file:///] + SYS(5) + CURDIR() + [bmp\images\alerticon.gif] + ;
 [" align="left">An error occurred during the processing of the Help Builder script page.] + CHR(13) +;
 [Most likely there's an invalid script tag inside of this script page. Help Builder has opened]  + CHR(13) +;
 [the script for editing and has tried to locate the cursor on the source of the error.<p>] + CHR(13) +;
 [The following error information is available:<p></div>] + CHR(13)


ENDDEFINE
*EOC wwHelpScripting 