#DEFINE NEWCODEBLOCK .T.

SET PROCEDURE TO wwEval Addititive

**************************************************************
*** This program file consists of two classes:
***
***     wwEval        -  Single statement Evaluation routine
***     wwCodeBlock   -  Multiple command 'program' evaluation
***                      routine. This class is really 
***                      Randy Pearson's CodeBlock class
***                      renamed here for consistency with 
***                      Web Connection
*************************************************************
#INCLUDE WCONNECT.H

loEval = CREATEOBJECT("wwEval")
loEval.vErrorResult = ""

TEXT TO lcCode NOSHOW
lcOutput = ""
FOR x = 1 TO 10
   lcOutput = lcOUtput + TRANSFORM(x) + CHR(13)
ENDFOR
RETURN lcOutput
ENDTEXT

lcResult = loEval.Execute(lcCode)

IF loEval.lError
   ? loEval.cErrorMessage
   RETURN
ENDIF

? lcResult


*************************************************************
DEFINE CLASS wwEval AS RELATION
*************************************************************
***    Author: Rick Strahl
***            (c) West Wind Technologies, 1996
***   Contact: (541) 386-2087  / rstrahl@west-wind.com
***  Modified: 05/01/96
***  Function: Evaluation Class used to safely execute
***            evaluation strings and test for error
*************************************************************

*** Custom Properties
lError=.F.
nError=0
nError2=0

cResultType="L"
vErrorResult=.F.
Result=""

*** These properties are specific to executing
*** Code Block 
oCodeBlock=.Null.
nErrorLine=0
cErrorCode=""
cErrorMessage=""

lCompileCodeBlock = .F.

*** Determines whether Eval expressions
*** can contain other expressions that are evaluated
lAllowEvalRecursion = .F.

*** Stock Properties

************************************************************************
* wwEval :: Evaluate
*********************************
***  Function: Actually evaluates expression.
***      Pass: lcExpression  -  Expression to evaluate
***    Return: Result
************************************************************************
FUNCTION Evaluate
LPARAMETERS lcEvalString

THIS.lError=.F.

THIS.Result=EVALUATE(lcEvalString)

IF THIS.lError  && OR TYPE("THIS.Result")#THIS.cResultType
   THIS.lError=.T.
   IF this.nError = 1429 OR this.nError = 1427
      AERROR(laError)
      this.cErrorMessage = laError[3]
      this.nError2 = laError[7]
   ELSE
      THIS.cErrorMessage=Message()
   ENDIF
   THIS.cErrorCode = Message(1) 
   RETURN THIS.vErrorResult
ENDIF   
   
RETURN THIS.Result
* Evaluate

************************************************************************
*  SafeEval
****************************************
***  Function: A Safe Evaluation function that wraps an EVAL()
***            operation into a try catch.
***    Assume:
***      Pass: lcEvalString - the string to evaluate
***            lcErrorResult - the result if an error occurs "" default
***                            "ERRORMESSAGE"
***    Return: evaluated result or error result
************************************************************************
FUNCTION SafeEval(lcEvalString,lcErrorResult)
LOCAL lcResult, loException

TRY
	lcResult = EVALUATE(lcEvalString)
CATCH TO loException
    IF EMPTY(lcErrorResult)
       lcErrorResult = ""
    ENDIF
	DO CASE
	CASE lcErrorResult = "ERRORMESSAGE"
	   lcResult = "Error: " + loException.Message
	CASE lcErrorResult = "EXPRESSION"
	   lcResult = "Error: " + lcEvalString  
	OTHERWISE
	   lcResult = lcErrorResult
	ENDCASE
ENDTRY

RETURN lcResult
ENDFUNC

************************************************************************
* wwEval :: ExecuteCommand
*********************************
***  Function: Macro Expands the command passed.
***      Pass: lcCommand -  Command to run 
***    Return: nothing
************************************************************************
FUNCTION ExecuteCommand
LPARAMETERS lcEvalString

THIS.lError=.F.

&lcEvalString

IF THIS.lError  && OR TYPE("THIS.Result")#THIS.cResultType
   THIS.lError=.T.
   IF this.nError = 1429 OR this.nError = 1427
      AERROR(laError)
      this.cErrorMessage = laError[3]
      this.nError2 = laError[7]
   ELSE
      THIS.cErrorMessage=Message()
   ENDIF
   THIS.cErrorCode = lcEvalString
   RETURN THIS.vErrorResult
ENDIF   
   
RETURN
* Evaluate

************************************************************************
* wwEval :: ExecuteClassMethod
*********************************
***  Function: Executes a method inside of a class
***    Assume:
***      Pass: lcClass   -   Name of the Class
***            lcMethod  -   Method to call
***            lcLib	 -   Class Library (optional)
***    Return: Value from method call. lError Set to .t. if 
************************************************************************
FUNCTION EvaluateClassMethod
LPARAMETERS lcClass, lcMethod, lcClassLib
LOCAL loObject

THIS.lError=.F.

IF !EMPTY(lcClass) AND !EMPTY(lcMethod)
   IF EMPTY(lcClassLib)
      loObject=CreateObject(lcClass)
    ELSE      
       loObject=NewObject(lcClass,lcClassLib)
    ENDIF
ENDIF    

lcEvalString= "loObject."+lcMethod + IIF( ATC( "(",lcMethod)>0,"","()")
THIS.Result=EVALUATE(lcEvalString)

IF THIS.lError  && OR TYPE("THIS.Result")#THIS.cResultType
   THIS.cErrorMessage=Message()+ " - " + Message(1) 
   RETURN THIS.vErrorResult
ENDIF   

RETURN THIS.Result
ENDFUNC
* wwEval :: EvaluateClassMethod

************************************************************************
* wwEval :: MergeTextEx
****************************************
***  Function: Same as the MergeText function, but uses VFP 7
***            and later commands to parse text 
***    Assume:
***      Pass:
***    Return:
************************************************************************
#IF .F.
FUNCTION MergeTextEx
LPARAMETER tcString,tcDelimiter, tcDelimiter2, llNoASPSyntax


tcDelimiter=IIF(EMPTY(tcDelimiter),"<%=",tcDelimiter)
tcDelimiter2=IIF(EMPTY(tcDelimiter2),"%>",tcDelimiter2)

IF !llNoASPSyntax
   tcString = STRTRAN(tcString,"<%=","<#=")
   tcString = STRTRAN(tcString,"%>","#>")
   tcString = STRTRAN(tcString,"<%","<^")
   tcString = STRTRAN(tcString,"%>","^>")
ENDIF

SET TEXTMERGE ON
lcResult = TEXTMERGE(tcString,.F.,tcDelimiter,tcDelimiter2)

ENDFUNC
*  wwEval :: MergeTextEx

#ENDIF

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
LPARAMETER tcString,tcDelimiter, tcDelimiter2, llNoASPSyntax
LOCAL lnLoc1,lnLoc2,lnIndex, lcEvalText, lcExtractText, lcOldError, ;
   lnErrCount, lcType,lcResult
PRIVATE plEvalError

plEvalError=.F.   && Debug Error Variable

tcDelimiter=IIF(EMPTY(tcDelimiter),"<%",tcDelimiter)
tcDelimiter2=IIF(EMPTY(tcDelimiter2),"%>",tcDelimiter2)

*** Occurance flag for second delim AT()
IF tcDelimiter # tcDelimiter2
   lnDifferent = 1
ELSE
   lnDifferent = 2
ENDIF

lnLoc1=1
lnLoc2=1
lnIndex=0

*** Create Evaluate Object (for error trappign)
THIS.SetResultType("C")
THIS.SetErrorResult("")

*** DEBUGMODE - Set up Error Handler 
***             Otherwise Eval object handles errors
***             You can disable this here to find any script bugs
*!*   #IF DEBUGMODE
*!*      lcOldError=ON("ERROR")
*!*      ON ERROR plEvalError=.T.
*!*   #ENDIF

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

         THIS.lError = .F.
         IF llNoASPSyntax
            lcResult = EVALUATE(lcExtractText)
            IF THIS.lError
               lcResult = TRANSFORM(THIS.vErrorResult)
            ELSE
               IF VARTYPE(lcResult) # "C"
                  lcResult = TRANSFORM(lcResult)
               ENDIF
            ENDIF
         ELSE
            *** ASP Syntax allows for <%= Expression %> <% CodeBlock %>
            IF  lcExtractText = "="
               lcResult = EVALUATE(SUBSTR(lcExtractText,2))
               IF !THIS.lError
                     IF VARTYPE(lcResult) # "C"
                        lcResult = TRANSFORM(lcResult)
                     ENDIF
               ENDIF
            ELSE
               THIS.Execute(lcExtractText)
               lcResult = THIS.Result
                  IF VARTYPE(lcResult) # "C"
                     lcResult = ""
                  ENDIF
               ENDIF
            ENDIF

            IF !THIS.lError AND !plEvalError
               *** Now translate and evaluate the expression
               *** NOTE: Any delimiters contained in the evaluated
               ***       string are discarded!!! Otherwise we could end
               ***       up in an endless loop...
               IF !this.lAllowEvalRecursion
                  lcResult = STRTRAN(lcResult,"<%","<!--%")
                  lcResult = STRTRAN(lcResult,"%>","%-->")
               ENDIF
               
               tcString= STRTRAN(tcString,tcDelimiter+lcExtractText+tcDelimiter2,;
                                 TRIM(lcResult),1,1)

            ELSE

               *** Check for EVAL error
               *			IF loEval.lError or plEvalError
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
                  "<!--% ERROR: "+STRTRAN(STRTRAN(lcExtractText,tcDelimiter,""),tcDelimiter2,"")+ " %-->")
            ENDIF

         ELSE
            tcString = STUFF(tcString,lnLoc2,LEN(tcDelimiter2),SPACE(LEN(tcDelimiter2)) )
            LOOP
         ENDIF  && lnLoc2>=lnLoc1
      ENDIF     && lnLoc2>0
   ENDDO

*!*      *** DEBUGMODE - Turn off the error handler
*!*      #IF DEBUGMODE
*!*         ON ERROR &lcOldError
*!*      #ENDIF


 RETURN tcString
 ENDFUNC
 *EOF MergeText


************************************************************************
* wwEval :: Execute
*********************************
***  Function: 
***    Assume: Codeblock Class must be loade with 
***            SET PROCEDURE TO CodeBlckClass
***      Pass: lcCode   -   Any block of Visual FoxPro code.
***    Return: Result of the code
************************************************************************
FUNCTION Execute
LPARAMETERS lcCode

this.lError = .F.

IF THIS.lCompileCodeBlock
   lcFile = SYS(2023) + "\" + SYS(2015) + ".prg"
   STRTOFILE(lcCode,lcFile)
   COMPILE (lcFile)
   SET PROCEDURE TO (ForceExt(lcFile,"") ) ADDITIVE
   
   lvResult = THIS.Evaluate( JustStem(lcFile)+"()" )
   
   RELEASE PROCEDURE (ForceExt(lcFile,""))   
   ERASE (lcFile)
   ERASE (forceExt(lcFile,"FXP"))
   
   RETURN lvResult
ENDIF

LOCAL loException, loPassedException as Exception
*** Execute with ExecScript
loException = null
TRY 
	this.Result = EXECSCRIPT( lcCode )	
CATCH TO loException
	this.lError = .t.
    IF loException.ErrorNo = 10 
	    THIS.cErrorMessage =  "Compilation Error: Syntax error in code"
	    loException.LineContents = ""
	    loException.LineNo = 0
    ELSE
	    THIS.cErrorMessage = loException.Message
	ENDIF

   THIS.nError=loException.ErrorNo
   THIS.nErrorLine=loException.LineNo
   THIS.cErrorCode=loException.LineContents
ENDTRY   

IF this.lError 
   RETURN THIS.vErrorResult
ENDIF
   
RETURN THIS.Result
* Execute

************************************************************************
* wwEval :: ExecutePRG
*********************************
***  Function: Executes a program by dumping it to a PRG and then
***            running the PRG file.
***    Assume: Works only in the Development version of Web Connection
***            but is significantly faster on larger code blocks
***      Pass: lcCode   -   Code to run
***            llNoDeleteFiles    Leave FXP in place
************************************************************************
FUNCTION ExecutePRG
LPARAMETER lcExtractTxt, lcFileName, llNoDeleteFile

THIS.lError=.F.

lcFilename=IIF(EMPTY(lcFilename),SYS(2015),lcFilename)

*** Store text to a file
=File2Var(lcFileName+".PRG",lcExtractTxt)
          
*** Run the Program - NOTE: Must return Character expression!
THIS.Result=EVALUATE(lcFileName+"()")            

IF !llNoDeleteFile
  ERASE(lcFileName+".PRG")
  ERASE(lcFileName+".FXP")
ENDIF
ERASE(lcFileName+".ERR")

IF THIS.lError  && OR TYPE("THIS.Result")#THIS.cResultType
   THIS.lError=.T.
   THIS.cErrorMessage=Message()+ " - " + Message(1) 
   THIS.nErrorCode=Error()
   RETURN THIS.vErrorResult
ENDIF   

RETURN THIS.Result
* ExecutePRG



************************************************************************
* wwEval :: ExecuteScript
****************************************
***  Function: Executes a script by dumping to disk, compiling
***            and running the PRG file.
***    Assume:
***      Pass: lcScript  -  Script Code or Program to run
***            lvParmN   -  Up to 6 parameters to pass to the script
***    Return: Result or error string
************************************************************************
FUNCTION ExecuteScript
PARAMETER lcScript, lvParm1, lvParm2, lvParm3, lvParm4, lvParm5, lvParm6
LOCAL lnX, lvResult, lnParmCount, lcTFile
lnParmCount = PCOUNT()

lcParmString = ""
FOR lnX=2 to lnParmCount
   lcParmString =  lcParmString + ",lvParm" + TRANSFORM(lnX-1) 
ENDFOR && lnX=1 to lnParmCount

#IF WWVFPVERSION > 6
	lvResult = THIS.Evaluate("EXECSCRIPT(lcScript" + lcParmString + ")" )
#ELSE
	lcTFile = SYS(2023) + "\"  + "WWS" + SYS(2015)
	lcFunc = JUSTFNAME(lcTFile)

	File2Var(lcTFile +".prg","FUNCTION " + lcFunc + CHR(13) + CHR(10) + lcScript)
	COMPILE (lcTFile + ".prg")

	SET PROCEDURE TO (lcTFile) ADDIT

	IF !EMPTY(lcParmString)
	  lcParmString = SUBSTR(lcParmstring,2)
	ENDIF
	lcCmdLine = lcFunc + "(" + lcParmString + ")"

	lvResult = THIS.Evaluate( lcCmdLine)

	RELEASE PROCEDURE (lcTFile)
	ERASE ( lcTFile + ".*")
#ENDIF

RETURN lvResult
ENDFUNC
*  wwEval :: ExecuteScript

************************************************************************
* wwEval :: SetResultType
*********************************
***  Function: Set the Result Type for the Evaluated expression.
***      Pass: lcType -   Valid FoxPro Type
***    Return: nothing
************************************************************************
FUNCTION SetResultType
LPARAMETERS lcType
lcType=IIF(vartype(lcType)="C",UPPER(lcType),"C")
THIS.cResultType=lcType
ENDFUNC
* SetResultType

************************************************************************
* wwEval :: SetErrorResult
*********************************
***  Function: Set the Default value that is returned if the Eval
***            fails.
***      Pass: lvErrorResult   -   Result value to assign
***    Return: nothing
************************************************************************
FUNCTION SetErrorResult
LPARAMETERS lvErrorResult
THIS.vErrorResult=lvErrorResult
ENDFUNC
* SetErrorResult

************************************************************************
* wwEval :: IsError
*********************************
***  Function: Returns error status of previous eval operation
***    Return: .T. or .F.
************************************************************************
FUNCTION IsError
RETURN THIS.lError
* IsError

************************************************************************
* wwEval :: GetErrorNumber
*********************************
***  Function: Returns the error number of the previous eval operation
***            if an error occurred.
***    Return: Error number or 0
************************************************************************
FUNCTION GetErrorNumber
IF !THIS.lError
   RETURN 0
ENDIF
RETURN THIS.nError  
* GetErrorNumber


************************************************************************
* wwEval :: Error
*********************************
***  Function: Traps Evaluation error, sets error flag and error number
************************************************************************
FUNCTION ERROR
LPARAMETER nError, cMethod, nLine

THIS.lError=.T.
THIS.nError=nError
THIS.nErrorLine=nLine
THIS.cErrorMessage = MESSAGE()

ENDFUNC
* Error


ENDDEFINE
*EOC wwEval


*************************************************************
DEFINE CLASS wwEvalTimer AS Timer
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2007
*:Contact: http://www.west-wind.com
*:Created: 04/04/2007
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwExecuteTimer

*:Description:
Class that allows for delayed execution of an evaluation
string.

*:Example:

*** Make sure to use reference that doesn't go out of scope!
THISFORM.ADDPROPERTY("oEvalTimer",CREATEOBJECT("wwEvalTimer"))

*** We need to assign the Form to state so we can ref it
THISFORM.oEvalTimer.State = THISFORM

*** Now evaluate the expression based on state
THISFORM.oEvalTimer.cEvalExpression = " this.State.Move(this.State.Left + 1)"

*** Fire 500 iterations in 10 ms intervals
THISFORM.oEvalTimer.INTERVAL = 10
THISFORM.oEvalTimer.nIterations = 500

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** A string of to be evaluated by the timer call
*** Call a UDF of 	
cEvalExpression = ""

*** Sets the number of iterations for this timer to fire
nIterations = 1
   
*** If set cleans up the state variables when execution stops
lCleanupState = .T.

*** A state variable that can be set with any value or reference
*** Note that you can assign an object to this state and then
*** reference this State property in the EvaluationExpression
*** for example to fire an event on a Form object you might
*** set the State to THISFORM and then use "this.State.Close()"
*** as an expression
State = .F.
State1 = .F.
State2 = .F.

PROTECTED nIterationCount
nIterationCount = 0

PROCEDURE TIMER

EVALUATE( THIS.cEvalExpression )

this.nIterationCount = this.nIterationCount + 1 

IF (this.nIterationCount >= this.nIterations)
   THIS.INTERVAL = 0

   this.nIterationCount = 0

   IF THIS.lCleanupState
      this.CleanupState()
   ENDIF
ENDIF

ENDFUNC
   
FUNCTION CleanupState()
THIS.State = .f.
this.State1 = .f.
this.State2 = .f.
ENDFUNC   
   
ENDDEFINE
