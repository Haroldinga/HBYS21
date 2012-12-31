* Purpose...: This program will test the performance of all view cursors in an application. 
* Author....: Toni M. Feltman
* Company...: F1 Technologies
* Parameters: None
* Returns...: None
* Added.....: 04/05/2012
LOCAL ;
	loTest AS Object 
	
loTest = NEWOBJECT('TestCursors')
loTest.ProcessAll()
loTest.SavePerformanceData()
loTest = .NULL.

DEFINE CLASS TestCursors AS Session 
#DEFINE DB_SRCTABLE        3
#DEFINE REQUERY_ERROR      0
#DEFINE REQUERY_SUCCESS    1

PROCEDURE ProcessAll
	* Process all cursors in the applicatoin.
	LOCAL ;
		loSelect AS Object, ;
		llFail AS Boolean

	loSelect = CREATEOBJECT('cSelect') 
	llFail = .F.

	SELECT 0
	TRY 
		USE metadata
	CATCH 
		llFail = .T.
	ENDTRY

	IF llFail
		MESSAGEBOX('Unable to locate the metadata table with class definition information. Cannot Continue!')
		RETURN 
	ENDIF

	SCAN FOR type = 'V'
		* Skip framework and ilibs class libraries.
		IF 'VFEFRAME\'$UPPER(Name) OR 'ILIBS\'$UPPER(name)
			LOOP
		ENDIF
		
		WAIT WINDOW NOWAIT 'Processing ' + ALLTRIM(name) + '....'
		This.ProcessSingleVCX(name)
	ENDSCAN

	MESSAGEBOX('Done!')
ENDPROC

PROCEDURE ProcessSingleVCX (tcName)
	LOCAL ;
		lnClasses AS Number, ;
		laClasses[1], ;
		lnI
	
	lnClasses = AVCXCLASSES(laClasses, tcName)
	
	FOR lnI = 1 TO lnClasses
		
		* Only deal with direct subclasses of the framework or iLayer.
		IF UPPER(laClasses[lnI, 3]) = 'ICURSOR' OR UPPER(laClasses[lnI, 3]) = 'ACURSOR'
			This.TestCursor(laClasses[lnI, 1])
		ENDIF
		
	ENDFOR
		
ENDPROC

PROCEDURE TestCursor (tcCursorClassName)
	LOCAL ;
		loCursor AS Object, ;
		lnParameters AS Number, ;
		lnSuccess AS Number, ;
		lnStart AS Number, ;
		lnEnd AS Number 

	PRIVATE ;
		pcRushmore AS Character
				
	loCursor = CREATEOBJECT(tcCursorClassName)
	
	IF VARTYPE(loCursor) = 'O'
		* We are only testing views in this version.
		IF loCursor.SourceType <> DB_SRCTABLE 
			WITH loCursor
				.NoDataOnLoad = .T.
				.Open()
				lnParameters = .Parameters.Count

				IF lnParameters > 0
					This.SetTestParameterValues(loCursor)					
				ENDIF
				lnSuccess = 0
								
				=SYS(3054, 11, "pcRushmore")
				lnStart = SECONDS()
				
				TRY
					lnSuccess = .Requery()
				CATCH
					lnEnd = 0
				ENDTRY
				
				lnEnd = SECONDS()
				
				IF lnSuccess = REQUERY_SUCCESS
					This.LogResults(tcCursorClassName, lnParameters, 'WHERE'$UPPER(loCursor.SQL), pcRushmore, lnEnd-lnStart)				
				ELSE
					This.LogResults(tcCursorClassName, .NULL., .NULL., pcRushmore, .NULL.)				
				ENDIF
			
				=SYS(3054, 0)				
			ENDWITH
			
		ENDIF

		loCursor.Close()
		loCursor.Release()
		loCursor = .NULL.
		
	ELSE
		This.LogResults(tcCursorClassName, .NULL., .NULL., .NULL., [])
	ENDIF
	
ENDPROC

PROCEDURE SetTestParameterValues (toCursor)
	LOCAL ;
		loParameter AS Object 

	FOR EACH loParameter IN toCursor.Parameters.Item
		loParameter.SetTestValue()
		This.ClearValidationProperties(loParameter)
	ENDFOR	

	loParameter = .NULL.
	toCursor = .NULL.
ENDPROC

PROCEDURE LogResults (tcCursorClassName, tnParameters, tlWhere, tcRushmore, tnTime)
	IF NOT USED('performance_results')
		This.CreatePerformanceCursor()
	ENDIF
	
	INSERT INTO Performance_Results ;
		(cCursor, mOptimized, lParameters, lWhere, lJoinOK, cLowFilter, nTime) ;
	VALUES ;
		(tcCursorClassName, tcRushmore, tnParameters > 0, tlWhere, .NULL., .NULL., tnTime)
		
	IF NOT EMPTY(tcRushmore)
		This.ProcessRushmoreLines(tcRushmore)
	ENDIF
	
ENDPROC

PROCEDURE CreatePerformanceCursor
	SELECT 0
	CREATE CURSOR Performance_Results (cCursor C(50), mOptimized M, lParameters L NULL, lWhere L NULL, lJoinOK L NULL, cLowFilter C(10) NULL, nTime I NULL)
ENDPROC

PROCEDURE ProcessRushmoreLines (tcText)
* We will assume that we are sitting on the correct recordin the performance results cursor.
	LOCAL ;
		lcLowFilter AS Character, ;
		llJoinOK AS Boolean, ;
		laLines[1], ;
		lnLines, ;
		lnI, ;
		lcLine
		
	lcLowFilter = []
	llJoinOK = .T.
	lnLines = ALINES(laLines, tcText)

	FOR lnI = 1 TO lnLines
		lcLine = laLines[lnI]
		
		DO CASE
		CASE UPPER(LEFT(lcLine, 8)) = 'RUSHMORE' AND UPPER(RIGHT(lcLine, 6)) = ': NONE'
			lcLowFilter = [NONE]

		CASE UPPER(LEFT(lcLine, 8)) = 'RUSHMORE' AND UPPER(RIGHT(lcLine, 9)) = ': PARTIAL'
			lcLowFilter = IIF(lcLowFilter <> [NONE], 'PARTIAL', lcLowFilter)

		CASE UPPER(LEFT(lcLine, 8)) = 'RUSHMORE' AND UPPER(RIGHT(lcLine, 6)) = ': FULL'
			lcLowFilter = IIF(lcLowFilter <> [NONE] AND lcLowFilter <> [PARTIAL], 'FULL', lcLowFilter)

		CASE UPPER(LEFT(lcLine, 7)) = 'JOINING' AND UPPER(RIGHT(lcLine, 10)) = 'TEMP INDEX'
			llJoinOK = .F.
		ENDCASE
		
	ENDFOR
	
	REPLACE lJoinOK WITH llJoinOK, cLowFilter WITH lcLowFilter IN performance_results
	RETURN 
ENDPROC

PROCEDURE SavePerformanceData
	LOCAL ;
		lcFile AS Character 
	
	lcFile = PUTFILE('Select location for XML Results', '', 'XML')

	IF NOT EMPTY(lcFile)
		CURSORTOXML('performance_results', lcFile, 1, 512+8)
	ENDIF
		
ENDPROC

PROCEDURE ClearValidationProperties (toParameter)
* Clears all validation properties of the view parameter.
	WITH toParameter.oProperties
		.lRequired = .F.
		.cLUTable = ''
	ENDWITH
	
	IF PEMSTATUS(toParameter, 'uMinValue', 5)
		REMOVEPROPERTY(toParameter, 'uMinValue')
	ENDIF

	IF PEMSTATUS(toParameter, 'uMaxValue', 5)
		REMOVEPROPERTY(toParameter, 'uMaxValue')
	ENDIF

	IF PEMSTATUS(toParameter, 'uListValues', 5)
		REMOVEPROPERTY(toParameter, 'uListValues')
	ENDIF

	toParameter = .NULL.
ENDPROC


ENDDEFINE
