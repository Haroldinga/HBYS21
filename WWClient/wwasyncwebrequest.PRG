
*** Used for add and SetProperty
SET PROCEDURE TO wwXMLState ADDITIVE
SET PROCEDURE TO wwAsyncWebRequest ADDITIVE

*************************************************************
DEFINE CLASS wwAsyncWebRequest AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 03/23/2001
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwAsyncWebRequest

*:Description:
This class is an Aysnc Event manager that manages events
placed into a table. Both client and server applications
can look at this event management table to get their
input, create their output and pass data between the
client and server applications.

Methods exist to pass data into the even table by
using special input fields or an easy to use property
mechanism that can set and retrieve individual properties
WITH a single command.

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
cFileName = "wwAsyncWebRequest"
cDataPath = ""
cAlias = "wwAsyncWebRequest"

*** Current Request Object id
cID = ""

oEvent = .NULL.

*** nSQLMode: 1 - VFP  2 - SQL Server (not implemented yet)
nSQLMode = 1

lError = .F.
cErrorMsg = ""

*** Expire requests after x number of seconds after start
nDefaultExpire = 900

************************************************************************
* wwAsyncWebRequest :: SubmitEvent
****************************************
***  Function: Submits a Event to the queue and sets the
***            oEvent object to this new object
***    Assume:
***      Pass: lcInputData - Any data you want to set up for this
***                          Event. Typically this could be some
***                          XML with process instructions or data
***                          required to process the Event.
***    Return: ID of the Event and oEvent is set.
************************************************************************
FUNCTION SubmitEvent( lcInputData, lcTitle, llNoSave)
LOCAL lcID 

IF !THIS.LoadEvent("BLANK")
   RETURN ""
ENDIF   

WITH THIS.oEvent 
  lcID = SUBSTR(SYS(2015),2) + TRANSFORM(Application.ProcessId)
  .id = lcId
  .submitted = DATETIME()
  IF !EMPTY(lcInputData)
    .InputData = lcInputData
  ENDIF
  IF !EMPTY(lcTitle)
    .Title = lcTitle
  ENDIF
ENDWITH

IF llNoSave
   RETURN lcID
ENDIF
   
IF !THIS.SaveEvent()
   RETURN ""
ENDIF 

FLUSH
  
RETURN lcID
ENDFUNC
*  wwAsyncWebRequest :: Submit

************************************************************************
* wwAsyncWebRequest :: CheckForCompletion
*****************************************
***  Function: Checks to see if an event has been completed
***            and simply returns a result value of the status.
***    Assume: You can check oEvent for details
***      Pass: lcID
***    Return: 1 - Completed and oEvent is set
***            0 - Still running and oEvent is set
***           -1 - Cancelled and oEvent is set
***           -2 - Event ID is invalid
************************************************************************
FUNCTION CheckForCompletion( lcID )

*** Invalid Event ID
IF !THIS.LoadEvent(lcID)
   THIS.SetError("Invalid Event ID")
   RETURN -2
ENDIF   

*** Cancelled Event
IF THIS.oEvent.Cancelled
   RETURN -1
ENDIF

*** Event is done
IF THIS.oEvent.Completed > {^2001/01/01 00:00}
   RETURN 1
ENDIF

*** Increase the number of checks
THIS.oEvent.chkCounter = THIS.oEvent.chkCounter + 1
THIS.SaveEvent()

*** Still waiting
RETURN 0
ENDFUNC
*  wwAsyncWebRequest :: CheckForCompletion

************************************************************************
* wwAsyncWebRequest :: GetResult
****************************************
***  Function: Returns
***    Assume:
***      Pass:
***    Return:
************************************************************************
*FUNCTION GetResult
*
*ENDFUNC
*  wwAsyncWebRequest :: GetResult

************************************************************************
* wwAsyncWebRequest :: CompleteEvent
****************************************
***  Function:
***    Assume:
***      Pass: lcID  -  Event to complete
*** 
***    Return:
************************************************************************
FUNCTION CompleteEvent( lcID, lcData )

IF EMPTY(lcID)
   *** Assume we want to work off the current object
   lcID = THIS.oEvent.ID
ELSE
	IF !THIS.LoadEvent(lcID)
	   RETURN .F.
	ENDIF
ENDIF

THIS.oEvent.Completed = DATETIME()
IF !EMPTY(lcData)
  THIS.oEvent.ReturnData = lcData
ENDIF
   
THIS.SaveEvent()   
RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: CompleteEvent

************************************************************************
* wwAsyncWebRequest :: CompleteEvent
****************************************
***  Function: Cancels an event Event.
***    Assume:
***      Pass: lcID  -  Event to complete
***    Return: .T. or .F.
************************************************************************
FUNCTION CancelEvent(lcID)

IF EMPTY(lcID)
   lcID = THIS.oEvent.ID
ELSE
	IF !THIS.LoadEvent(lcID)
	   RETURN .F.
	ENDIF
ENDIF

THIS.oEvent.Cancelled = .T.
THIS.oEvent.Completed = DATETIME()

THIS.SaveEvent()   
RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: CompleteEvent

************************************************************************
* wwAsyncWebRequest :: GetNextEvent
****************************************
***  Function: Sets the current event with the next event waiting in
***            in the queue.
***    Assume: sets the oEvent member
***      Pass: Optional - the type of event to look for
***    Return: .T. if oEvent was set. .F. if no events pending.
************************************************************************
FUNCTION GetNextEvent
LPARAMETERS lcType

THIS.Open()
IF EMPTY(lcType)
   lcType = "  "
ENDIF   

DO WHILE .T.
   SELECT id FROM (THIS.cAlias) ;
      WHERE STARTED = { : } AND COMPLETED = { : } and TYPE = PADR(lcType,FSIZE("type")) ;
      ORDER BY Priority DESC, Submitted INTO ARRAY laEvents

   *? SYS(3054,2)
      
   IF _Tally > 0 
      LOCATE FOR id = laEvents[1,1]
      IF FOUND() AND RLOCK()  AND ;
         STARTED = { : } AND COMPLETED = { : } and TYPE = PADR(lcType,FSIZE("type"))
         SCATTER NAME THIS.oEvent MEMO
         THIS.oEvent.Started = DATETIME()
         REPLACE Started WITH THIS.oEvent.Started
         UNLOCK
         RETURN .T.  && Got an event
      ENDIF
      
      UNLOCK   && Make sure in case we didn't match
      
      *** No can't lock - try again
   ELSE
      RETURN .F.  && No Events
   ENDIF   
ENDDO

RETURN .F.
ENDFUNC
*  wwAsyncWebRequest :: GetNextEvent

************************************************************************
* wwAsyncWebRequest :: Open
****************************************
***  Function: Opens and selectes the event table.
***    Assume:
***      Pass: lcFile
***            lcPath 
***            lcAlias
***    Return: .T. or .F.
************************************************************************
FUNCTION Open(lcFile, lcPath, lcAlias)

IF USED(THIS.cAlias)
   SELECT (THIS.cAlias)
   RETURN .T.
ENDIF

IF !FILE( FORCEEXT(THIS.cDataPath + THIS.cFileName,"dbf") )
   CREATE TABLE (THIS.cDataPath + THIS.cFileName) FREE ;
   (  ID          C (13),;
      TITLE       C (60),;
      RETURNDATA  M ,;
      INPUTDATA   M ,;
      TYPE        C (15),;
      Priority    I,;
      SUBMITTED   T ,;
      STARTED     T,;
      COMPLETED   T ,;
      Expire      I,;
      STATUS      M ,;
      USERNAME    C(20),;
      ChkCounter I,;
      Cancelled  L,;
      PROPERTIES  M )
   USE
   THIS.Reindex()
ENDIF

SELECT 0
USE (THIS.cDataPath + THIS.cFileName) ALIAS (THIS.cAlias)

RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: Open

************************************************************************
* wwAysncWebRequest :: Close
****************************************
***  Function: Closes the event cursor
************************************************************************
FUNCTION Close()

IF USED(THIS.Alias)
   USE IN (THIS.cAlias)
ENDIF

ENDFUNC
*  wwAysncWebRequest :: Close


************************************************************************
* wwAysncWebRequest :: Reindex
****************************************
***  Function: Reindexes and packs the file
***    Assume: Doesn't leave the table open
***      Pass:
***    Return:
************************************************************************
FUNCTION Reindex

IF OPENEXCLUSIVE(THIS.cDataPath + THIS.cFileName,THIS.cAlias)
   *** Delete all entries that have expired
   DELETE FOR submitted < DATETIME() - Expire
 
   *** NOw pack and Reindex
   DELETE TAG ALL
   PACK
   INDEX ON ID TAG ID 
   INDEX ON TYPE TAG TYPE
   INDEX ON Priority TAG Priority
   INDEX ON STARTED TAG  STARTED
   INDEX ON Completed TAG Completed
   INDEX ON DELETED() TAG DELETED

   *** Close the table
   USE
   RETURN .T.
ENDIF   

THIS.SetError("Couldn't get exclusive use of the Event file")
RETURN .F.
*  wwAysncWebRequest :: Reindex


************************************************************************
* wwAsyncWebRequest :: LoadEvent
****************************************
***  Function: Loads a Event from the event table by ID
***    Assume:
***      Pass: lcID
***    Return: .T. or .F.   oEvent set afterwards
************************************************************************
FUNCTION LoadEvent(lcID)

IF EMPTY(lcId)
   THIS.SetError("No ID passed")
   RETURN .F.
ENDIF

THIS.Open()
   
IF lcID = "BLANK"
   SCATTER NAME THIS.oEvent MEMO BLANK
   THIS.oEvent.Expire = THIS.nDefaultExpire
   RETURN .T.
ENDIF  

*** Force a refresh always
REPLACE ID WITH ID 

lcID = PADR(lcID,FSIZE("ID"))
LOCATE FOR ID = lcID
IF FOUND()
   SCATTER NAME THIS.oEvent MEMO
   RETURN .T.
ENDIF

SCATTER NAME THIS.oEvent MEMO BLANK

THIS.SetError("Event not found")
RETURN .F.   
ENDFUNC
*  wwAsyncWebRequest :: LoadEvent

************************************************************************
* wwAsyncWebRequest :: SaveEvent
****************************************
***  Function: Saves the currently open Event object
***      Pass: nothing
***    Return: .T. or .F.
************************************************************************
FUNCTION SaveEvent
LOCAL lcID

lcID = THIS.oEvent.id

THIS.Open()

lcID = PADR(lcID,FSIZE("ID"))
LOCATE FOR ID = lcID
IF !FOUND()
   APPEND BLANK
ENDIF
   
GATHER NAME THIS.oEvent MEMO

RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: SaveEvent

************************************************************************
* wwAsyncWebRequest :: DeleteEvent
****************************************
***  Function: Deletes the current Event object.
***    Assume: Should be called by the client after the
***            data has been retrieved. Otherwise the
***            garbage collector will clean it out next
***            the table is opened for the first time.
***      Pass: lcID
***    Return: nothing
************************************************************************
FUNCTION DeleteEvent( lcId )

THIS.Open()
DELETE FOR ID == lcID

ENDFUNC
*  wwAsyncWebRequest :: DeleteEvent

************************************************************************
* wwAsyncWebRequest :: SetProperty
****************************************
***  Function: Sets a property on the current oEvent object.
***    Assume: Doesn't load or save oEvent object
***      Pass: lcProperty
***            lcValue
***    Return: nothing
************************************************************************
FUNCTION SetProperty(lcProperty, lcValue)
LOCAL loXMLState
loXMLState = CREATEOBJECT("wwXMLState")

loXMLState.LoadXML(This.oEvent.Properties)
loXMLState.SetProperty(lcProperty,lcValue)
THIS.oEvent.Properties = loXMLState.GetXML()

ENDFUNC
*  wwAsyncWebRequest :: SetProperty

************************************************************************
* wwAsyncWebRequest :: GetProperty
****************************************
***  Function: Retrieves a property.
***    Assume: Doesn't load or save oEventObject
***      Pass: lcProperty
***    Return: Value of property or .NULL. if it doesn't exist
************************************************************************
FUNCTION GetProperty(lcProperty)
LOCAL loXMLState

loXMLState = CREATEOBJECT("wwXMLState")

loXMLState.LoadXML(This.oEvent.Properties)
RETURN loXMLState.GetProperty(lcProperty)
ENDFUNC
*  wwAsyncWebRequest :: GetProperty

************************************************************************
* wwAsyncWebRequest :: SetError
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SetError
LPARAMETERS lcError

IF EMPTY(lcError)
   THIS.lError = .F.
   THIS.cErrorMsg = ""
ELSE
   THIS.lError = .T.
   THIS.cErrorMsg = lcError
ENDIF      

ENDFUNC
*  wwAsyncWebRequest :: SetError

ENDDEFINE
*EOC wwAsyncWebRequest 



*************************************************************
DEFINE CLASS wwSQLAsyncWebRequest AS wwAsyncWebRequest
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 04/04/2001
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwSQLAsyncWebRequest

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
oSQL = .NULL.
cConnectString = ""

************************************************************************
* wwSQLAsyncWebRequest :: Connect
****************************************
***  Function: Sets a SQL connection to the database that contains
***            the event table (wwAsyncWebRequest)
***    Assume:
***      Pass: SQL Connect String OR
***            wwSQL object previously loaded
***    Return: .T. or .F.
************************************************************************
FUNCTION Connect
LPARAMETERS lcConnectString

IF VARTYPE(lcConnectString) = "O"
   THIS.oSQL = lcConnectString
   RETURN .T.
ENDIF   

IF EMPTY(lcConnectString)
   lcConnectString = THIS.cConnectString
ELSE
   THIS.cConnectString = lcConnectString
ENDIF
   
THIS.oSQL = CREATEOBJECT("wwSQL")
IF !THIS.oSQL.Connect(lcConnectString)
   THIS.SetError(THIS.oSQL.cErrorMsg)
   RETURN .F.
ENDIF   

RETURN .T.
ENDFUNC
*  wwSQLAsyncWebRequest :: Connect


************************************************************************
* wwAsyncWebRequest :: LoadEvent
****************************************
***  Function: Loads a Event from the event table by ID
***    Assume:
***      Pass: lcID
***    Return: .T. or .F.   oEvent set afterwards
************************************************************************
FUNCTION LoadEvent(lcID)

IF EMPTY(lcId)
   THIS.SetError("No ID passed")
   RETURN .F.
ENDIF

IF !THIS.Open()
   RETURN .F.
ENDIF   
   
IF lcID = "BLANK"
   *** Retrieve a blank record
   IF !USED(THIS.cAlias)
      THIS.oSQL.cSQL = "select * from " + THIS.cAlias + " where 1=0"
      THIS.oSQL.cSQLCursor = THIS.cAlias
      lnResult = THIS.osql.Execute()
      IF lnResult # 1
           THIS.seterror(THIS.oSQL.cErrorMsg)
         RETURN .F.
      ENDIF
   ELSE
      SELECT (THIS.cAlias)
   ENDIF

   SCATTER NAME THIS.oEvent MEMO BLANK
   THIS.oEvent.Expire = THIS.nDefaultExpire
   RETURN .T.
ENDIF  

THIS.oSQL.cSQL = "select * from " + THIS.cAlias + " where id='" + lcID + "'"
THIS.oSQL.cSQLCursor = THIS.cAlias
lnResult = THIS.osql.Execute()
IF lnResult # 1
     THIS.seterror(THIS.oSQL.cErrorMsg)
   RETURN .F.
ENDIF

IF RECCOUNT() > 0
   SCATTER NAME THIS.oEvent MEMO
   RETURN .T.
ENDIF

SCATTER NAME THIS.oEvent MEMO BLANK
THIS.SetError("Event not found")

RETURN .F.   
ENDFUNC
*  wwAsyncWebRequest :: LoadEvent

************************************************************************
* wwAsyncWebRequest :: SaveEvent
****************************************
***  Function: Saves the currently open Event object
***      Pass: nothing
***    Return: .T. or .F.
************************************************************************
FUNCTION SaveEvent
LOCAL lcID

lcID = THIS.oEvent.id

THIS.Open()

THIS.oSQL.cSQL = "select * from " + THIS.cAlias + " where id='" + lcID + "'"
THIS.oSQL.cSQLCursor = THIS.cAlias
* _cliptext = THIS.oSQL.cSQL
lnResult = THIS.osql.Execute()
IF lnResult # 1
     THIS.seterror(THIS.oSQL.cErrorMsg)
   RETURN .F.
ENDIF

IF RECCOUNT() < 1
   THIS.oSQL.cSQL = THIS.BuildSQLInsertStatement(THIS.oEvent)
   * _cliptext = THIS.oSQL.cSQL
   lnResult = THIS.osql.Execute()
   IF lnResult # 1
        THIS.seterror(THIS.oSQL.cErrorMsg)
      RETURN .F.
   ENDIF
ELSE
   THIS.oSQL.cSQL = THIS.BuildSQLUpdateStatement(THIS.oEvent)
   * _cliptext = THIS.oSQL.cSQL
   lnResult = THIS.osql.Execute()
   IF lnResult # 1
        THIS.seterror(THIS.oSQL.cErrorMsg)
      RETURN .F.
   ENDIF
ENDIF

RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: SaveEvent

************************************************************************
* wwAsyncWebRequest :: DeleteEvent
****************************************
***  Function: Deletes the current Event object.
***    Assume: Should be called by the client after the
***            data has been retrieved. Otherwise the
***            garbage collector will clean it out next
***            the table is opened for the first time.
***      Pass: lcID
***    Return: nothing
************************************************************************
FUNCTION DeleteEvent( lcId )

THIS.Open()

THIS.oSQL.cSQL = "delete from " + THIS.cAlias + " WHERE ID = '" + lcID + "'"
* _cliptext = THIS.oSQL.cSQL
lnResult = THIS.osql.Execute()
IF lnResult # 1
     THIS.seterror(THIS.oSQL.cErrorMsg)
   RETURN .F.
ENDIF

RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: DeleteEvent

************************************************************************
* wwAsyncWebRequest :: GetNextEvent
****************************************
***  Function: Sets the current event with the next event waiting in
***            in the queue.
***    Assume: sets the oEvent member
***      Pass: Optinal - the type of event to look for
***    Return: .T. if oEvent was set. .F. if no events pending.
************************************************************************
FUNCTION GetNextEvent
LPARAMETERS lcType

THIS.Open()

IF EMPTY(lcType)
   lcType = "  "
ENDIF   

   THIS.oSQL.cSQL = "exec sp_ww_GetNextEvent '" + lcType + "'"

   * _cliptext = THIS.oSQL.cSQL
   lnResult = THIS.osql.Execute()
   IF lnResult # 1
      THIS.seterror(THIS.oSQL.cErrorMsg)
      RETURN .F.
   ENDIF
   
   IF RECCOUNT() > 0
      SCATTER NAME THIS.oEvent MEMO
      THIS.oEvent.Started = DATETIME()
      THIS.SaveEvent()
      THIS.oSQL.Commit()
      RETURN .T.  && Got an event
   ELSE
      SCATTER NAME THIS.oEvent BLANK MEMO
      RETURN .F.  && No Events
   ENDIF   

RETURN .F.
ENDFUNC
*  wwAsyncWebRequest :: GetNextEvent



************************************************************************
* wwAsyncWebRequest :: Open
****************************************
***  Function: Opens and selectes the event table.
***    Assume:
***      Pass: lcFile
***            lcPath 
***            lcAlias
***    Return: .T. or .F.
************************************************************************
FUNCTION Open(lcFile, lcPath, lcAlias)

IF ISNULL(THIS.oSQL)
   IF !THIS.Connect()
      RETURN .F.
   ENDIF
ENDIF

   
RETURN .T.
ENDFUNC
*  wwAsyncWebRequest :: Open

************************************************************************
* wwSQLAsyncWebRequest :: Reindex
****************************************
***  Function: Doesn't do anything for SQL
************************************************************************
FUNCTION Reindex
LPARAMETERS lcType

IF EMPTY(lcType)
   lcType = ""
ENDIF

THIS.oSQL.cSQL = ;
   "delete from " + THIS.cAlias + ;
   "  where submitted > '1/1/2001' and " + ;
   "  datediff(second,submitted,GetDate()) > expire"            

lnResult = THIS.osql.Execute()
IF lnResult # 1
     THIS.seterror(THIS.oSQL.cErrorMsg)
   RETURN .F.
ENDIF

RETURN
ENDFUNC
*  wwSQLAsyncWebRequest :: Reindex




FUNCTION BuildSQLInsertStatement

LPARAMETER loData
LOCAL lcFieldList, lcValueList, loData, lnFields, lnX, lcField, lcType, lvValue, lcValue

lcSQL = "INSERT " + THIS.cFileName

lcFieldList = ""
lcValueList = ""

lnFields = AMEMBERS(laFields,loData)
FOR lnX=1 TO lnFields
   lcField = laFields[lnX]

   *** We can't deal with Timestamp columns so ignore that
   IF UPPER(lcField) = "TIMESTAMP_COLUMN"
      LOOP
   ENDIF

   lcFieldList = lcFieldList + lcField + ","
   lcType = TYPE("loData."+laFields[lnX])
   DO CASE
      CASE lcType = "C"
         lvValue = STRTRAN(EVAL("loData."+lcField),"'","''")
         lcValue = [']+lvValue+[']
      CASE lcType = "N"
         lcValue = TRANSFORM(EVAL("loData."+lcField))
      CASE lcType = "L"
         lcValue = IIF(EVAL("loData."+lcField),'1','0')
      CASE lcType = "D"
         lvValue = EVAL("loData."+lcField)
         lcValue = [']+IIF(EMPTY(lvValue),"",DTOC(lvValue))+[']
      CASE lcType = "T"
         lvValue = EVAL("loData."+lcField)
         lcValue = [']+IIF(EMPTY(lvValue),"",TTOC(lvValue))+[']
   ENDCASE

   lcValueList = lcValueList + lcValue + ","
ENDFOR

IF EMPTY(lcFieldList) OR EMPTY(lcValueList)
   RETURN ""
ELSE 
   lcFieldList = SUBSTR(lcFieldList,1,LEN(lcFieldList) - 1)
   lcValueList = SUBSTR(lcValueList,1,LEN(lcValueList) - 1)
ENDIF   

lcSQL = lcSQL + " (" + lcFieldList + ") VALUES (" +  lcValueList + ")"

RETURN lcSQL


FUNCTION BuildSQLUpdateStatement
LPARAMETER loData
LOCAL loData, lnFields, lnX, lcField, lcType, lvValue, lcValue

lcSQL = "UPDATE " + THIS.cFileName + " SET"

lnFields = AMEMBERS(laFields,loData)
FOR lnX=1 TO lnFields
   lcField = laFields[lnX]
   *** We can't deal with Timestamp columns so ignore that
   IF UPPER(lcField) = "TIMESTAMP_COLUMN"
      LOOP
   ENDIF
   lcType = TYPE("loData."+laFields[lnX])
   DO CASE
      CASE lcType = "C"
         lvValue = STRTRAN(EVAL("loData."+lcField),"'","''")
         lcValue = [']+lvValue+[']
      CASE lcType = "N"
         lcValue = TRANSFORM(EVAL("loData."+lcField))
      CASE lcType = "L"
         lcValue = IIF(EVAL("loData."+lcField),'1','0')
      CASE lcType = "D"
         lvValue = EVAL("loData."+lcField)
         lcValue = [']+IIF(EMPTY(lvValue),"",DTOC(lvValue))+[']
      CASE lcType = "T"
         lvValue = EVAL("loData."+lcField)
         lcValue = [']+IIF(EMPTY(lvValue),"",TTOC(lvValue))+[']
   ENDCASE

   lcSQL = lcSQL +  " "+lcField + "=" + lcValue + ","
ENDFOR

lcSQL = SUBSTR(lcSQL,1,LEN(lcSQL)-1)  && Strip last comma

lcSQL = lcSQL + " WHERE  ID='" + TRANSFORM( loData.Id ) + "'"

RETURN lcSQL




ENDDEFINE
*EOC wwSQLAsyncWebRequest 


