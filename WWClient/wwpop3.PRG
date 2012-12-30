CLEAR

*** Basic send Email to an SMTP server with sockets
#INCLUDE wconnect.h
SET PROCEDURE TO wwPOP3 ADDITIVE
SET PROCEDURE TO wwUTILS additive
SET PROCEDURE TO wwAPI ADDITIVE
SET PROCEDURE TO wwSocket ADDITIVE


*** Test Code
#IF .F.
loPOP = CREATEOBJECT("wwPOP3")

loPop.cMailServer = "mail.someserver.com"
loPop.cUserName = "test"
loPop.cPassword = "password"
 
*** Optional settings

*** Create a log string
*loPop.lLogSession = .T.
loPop.nTimeout = 15    && Seconds
loPop.nBufferSize = 1024
 
IF !loPOP.Connect()
   ? loPop.nError,loPop.cErrorMsg
   RETURN
ENDIF

? loPop.nMessageCount
? loPop.Getmessages()    && High level routine

x=1


loPop.quit()


*** you can view the log if you choose
File2Var("pop3.log",loPop.oIP.GetLog())
ShowText(loPop.oIP.GetLog())

 
RETURN

FOR x = 1 TO loPop.nMessageCount
  loMsg = loPop.GetMessage(x)
  IF ISNULL(loMsg)
     ? loPop.cErrorMsg
     File2Var("pop3.log",loPop.oIP.GetLog())
     RETURN
  ENDIF

  * loPop.ParseMultiPartMessage(loMsg)
ENDFOR

x=1

FOR x = 1 TO loPop.nMessageCount
   loMsg = loPop.aMessages[x]
   ? loMsg.cSubject, loMsg.cFromname, loMsg.cDate
ENDFOR


loPop.quit()

*** you can view the log if you choose
File2Var("pop3.log",loPop.oIP.GetLog())
ShowText("POP3.log")
RETURN
#ENDIF

*************************************************************
DEFINE CLASS wwPOP3 AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 09/03/2001
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwPOP3

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
oIP = .NULL.

cMailServer = ""
nPort = 110
cUsername = ""
cPassword = ""

lLogSession = .F.

nError = 0
lError = .f.
cErrorMsg = ""

nTimeout = 10
nBufferSize = 512

nMessageCount = 0
DIMENSION aMessages[1]


************************************************************************
* wwPOP3 :: Connect
****************************************
***  Function: Connects to the POP server and logs in
***            Sets the message count
***    Assume: user name and password are set
***      Pass:
***    Return:
************************************************************************
FUNCTION Connect
LOCAL lcMailServer, lnPOrt, lnAt, lcResult

THIS.oIP = CREATEOBJECT("wwSocket")
THIS.oIP.lStripNulls = .t.
THIS.OIP.lLogSession = THIS.lLogSession
THIS.oIP.nBufferSize = THIS.nBufferSize
THIS.oIP.nTimeout = THIS.nTimeout

lcMailServer = this.cMailServer
lnPort = this.nPort

lnAt = AT(":",this.cMailServer)
IF  lnAt> 0
   lcMailserver = LEFT(this.cMailServer,lnAt-1)
   lnPort = VAL( SUBSTR(this.cMailServer,lnAt+1) )
ENDIF

loIP = THIS.oIP
IF !loIP.Connect(lcMailserver,lnPort)
   THIS.SetError(loIP.cErrorMsg)
   RETURN .F.
ENDIF

*** Retrieve Hello Message
lcResult = loIP.Receive()
IF EMPTY(lcResult)
   RETURN .F.
ENDIF

lcResult = loIP.SendReceive("USER " + THIS.cUsername +  CRLF)
IF lcResult # "+"
   THIS.SetError("Login failed: " + SUBSTR(lcResult,2))
   RETURN .F.
ENDIF

lcResult = loIP.SendReceive("PASS " + THIS.cPassword + CRLF)
IF lcResult # "+"
   THIS.SetError("Login failed: " + SUBSTR(lcResult,2))
   RETURN .F.
ENDIF

IF  "has " $ lcResult AND " message" $ lcResult
   THIS.nMessageCount = VAL( EXTRACT(lcResult,"has "," message") )
ELSE
   *** Try again to get count with LIST command
   lcResult = loIP.SendReceive("STAT" + CRLF)
   
   THIS.nMessageCount = VAL( EXTRACT(lcResult,"OK "," ") )
ENDIF

IF THIS.nMessageCount > 0
   *** Pre-size the array
   DIMENSION THIS.aMessages[THIS.nMessageCount]
ENDIF

RETURN .T.
ENDFUNC
*  wwPOP3 :: Connect

************************************************************************
* wwPop3 :: GetMessages
****************************************
***  Function: Retrieves all messages into an array of message
***            objects.
***    Assume:
***      Pass: @lamessages  -  Array to
***            llNoParseAttachments  -  Determines whether attachments
***                                     are parsed and Decoded
***    Return: Message Count
************************************************************************
FUNCTION GetMessages(llNoParseAttachments,llDeleteMessages)
LOCAL x, loMsg, lnMsgs

lnMsgs = 0
FOR m.x =1 TO THIS.nMessageCount
  loMsg = THIS.GetMessage(m.x)
  IF !ISNULL(loMsg) AND !llNoParseAttachments
     THIS.ParseMultiPartMessage(loMsg)  
  ENDIF
  IF llDeleteMessages
     THIS.DeleteMessage(m.x)
  ENDIF
ENDFOR

RETURN THIS.nMessageCount
ENDFUNC
*  wwPop3 :: GetMessages


************************************************************************
* wwPop3 :: GetMessageById
****************************************
***  Function: Returns a message number from its message ID
***    Assume: 
***      Pass: Message Id: The string Message ID from the SMTP header
***    Return: message number or 0 on failure
************************************************************************
FUNCTION GetMessageNumberFromId(lcMsgId)
LOCAL x, lnMessage

lnMessage = 0

*** Run through message headers and try to find MsgID
FOR m.x=1 TO this.nMessageCount
   loMsg = THIS.GetMessageHeader(m.x)

   *** Check for a message that was picked up
   IF ISNULL(loMsg)
      LOOP 
   ENDIF
   
   IF loMsg.cMsgId == lcMsgId
      lnMessage = m.x
      EXIT
   ENDIF
ENDFOR

RETURN lnMessage
ENDFUNC
*  wwPop3 :: GetMessageById

************************************************************************
* wwPOP3 :: GetMessage
****************************************
***  Function: Retrieves a message from the server by its message number (order)
***    Assume: message is returned and stored into the msg array
***      Pass: lnMessage   -   Message Id
***    Return: Message object or NULL
************************************************************************
FUNCTION GetMessage(lnMessage)
LOCAL lcResult, lcMessage, loMsg,x, lcSize, lnMsgSize

IF VARTYPE(lnMessage) = "C"
   lnMessage = THIS.GetMessageNumberFromID(lnMessage)
ENDIF

*** Read the message Prefix  +OK x octets
lcResult =  THIS.oIP.SendReceive("RETR " + TRANSFORM(lnMessage) + CRLF)
IF lcResult # "+"
   THIS.SetError(SUBSTR(lcResult,2))
   RETURN .NULL.
ENDIF   
IF EMPTY(lcResult)
   THIS.SetError("Timed out.",THIS.oIP.nError)
   RETURN .NULL.
ENDIF


*** Now read the message until we get the server's . alone
lcMessage = lcResult
DO WHILE ATC(CRLF + "." + CHR(13),lcMessage) < 1 AND ;
         ATC(CHR(13) + "." + CHR(13),lcMessage) < 1
        
   *** Can't search for CRLF + "." CRLF because 
   *** some mail servers will send the . CRLF on their own
   lcResult = THIS.oIp.WaitFor( "." + CHR(13))  

   IF EMPTY(lcResult) AND THIS.oIP.nError # 0
      THIS.SetError("Timed out getting messages")
      RETURN .NULL. 
   ENDIF
   lcMessage = lcMessage + lcResult
ENDDO

*** Test with a test message for parsing
* lcMessage = FILETOSTR("test.txt") 

*** Create and store the message
loMsg = THIS.ParseMessageHeader(lcMessage)

loMsg.nSize = LEN(loMsg.cBody)
loMsg.cFullText = lcMessage

THIS.aMessages[lnMessage] = loMsg

RETURN loMsg
*  wwPOP3 :: GetMessage


*!*	************************************************************************
*!*	* wwPOP3 :: GetMessage
*!*	****************************************
*!*	***  Function: Retrieves a message from the server by its message number (order)
*!*	***    Assume: message is returned and stored into the msg array
*!*	***      Pass: lnMessage   -   Message Id
*!*	***    Return: Message object or NULL
*!*	************************************************************************
*!*	FUNCTION GetMessage(lnMessage)
*!*	LOCAL lcResult, lcMessage, loMsg, lcSize, lnMsgSize

*!*	IF VARTYPE(lnMessage) = "C"
*!*	   lnMessage = THIS.GetMessageNumberFromID(lnMessage)
*!*	ENDIF

*!*	SET STEP ON 

*!*	*** Read the message Prefix  +OK x octets
*!*	THIS.oIP.Send("RETR " + TRANSFORM(lnMessage) + CRLF)

*!*	lcSize =  THIS.oIP.WaitFor("octets",50) 
*!*	IF lcSize # "+"
*!*	   THIS.SetError(lcSize)
*!*	   RETURN .NULL.
*!*	ENDIF   

*!*	*** Retrieve the Message Size from first line
*!*	*** +OK xxxx octets
*!*	lnMsgSize = VAL(GETWORDNUM(lcSize,2))

*!*	IF lnMsgSize = 0
*!*	   THIS.SetError("Error retrieving message content")
*!*	   RETURN null
*!*	ENDIF   

*!*	*** Strip off first line 
*!*	*** +OK xxxx octets
*!*	lnAt = AT(CRLF,lcSize)
*!*	lcSize = SUBSTR(lcSize,lnAt+2)

*!*	lcMessage = lcSize
*!*	lnReadSize = LEN(lcMessage)
*!*	lnMsgSize = lnMsgSize - lnReadSize 

*!*	LOCAL lcRec, lnLastSize
*!*	lnLastSize = 0
*!*	DO while( lnReadSize < lnMsgSize)
*!*	   lcRec = this.oIP.Receive(lnMsgSize - lnReadSize)
*!*	   lnLastSize = LEN(lcRec)
*!*	   *? "  Rec Size: " + TRANSFORM(LEN(lcRec))
*!*	   lcMessage = lcMessage + lcRec
*!*	   lnReadSize = LEN(lcMessage)
*!*	   
*!*	   *** Bail out on a timeout
*!*	   IF lnLastSize = 0
*!*	      EXIT
*!*	   ENDIF
*!*	ENDDO

*!*	*? "Actual Size: " + TRANSFORM(LEN(lcMessage))
*!*	*? SUBSTR(lcMessage,LEN(lcMessage)-25)

*!*	*** Read the prologue (".")
*!*	IF lnLastSize > 0
*!*		LOCAL lcT, lnX
*!*		lcT = ""
*!*		lnX = 0
*!*		DO WHILE .T.
*!*			lcT = this.oIP.Receive(10)
*!*			IF EMPTY(lcT) OR ATC("." + CHR(13), lcT) > 0 OR lnX > 200
*!*				EXIT
*!*			ENDIF	
*!*			lnx = lnx + 1 
*!*		ENDDO
*!*	ENDIF

*!*	*** Create and store the message
*!*	loMsg = THIS.ParseMessageHeader(lcMessage)
*!*	loMsg.nSize = LEN(loMsg.cBody)
*!*	loMsg.cFullText = lcMessage

*!*	THIS.aMessages[lnMessage] = loMsg

*!*	RETURN loMsg
*!*	*  wwPOP3 :: GetMessage

************************************************************************
* wwPOP3 :: GetMessageHeader
****************************************
***  Function: Retrieves a message from the server
***    Assume: message is returned and stored into the msg array
***      Pass: lnMessage   -   Message Id
***    Return: Message object or NULL
************************************************************************
FUNCTION GetMessageHeader(lnMessage)

*** Read the message Prefix  +OK x octets
lcResult =  THIS.oIP.SendReceive("TOP " + TRANSFORM(lnMessage) + " 1"  + CRLF)
IF lcResult # "+"
   THIS.SetError(SUBSTR(lcResult,2))
   RETURN .NULL.
ENDIF   
IF EMPTY(lcResult)
   THIS.SetError("Timed out",THIS.oIP.nError)
   RETURN .NULL.
ENDIF

*** Now read the message until we get the server's . alone
lcMessage = lcResult
IF ATC(CRLF + "." ,lcMessage) < 1
   lcResult = THIS.oIp.WaitFor(CRLF + "." + CRLF)
   IF THIS.oIP.nError # 0
      THIS.SetError("Timed out getting message " + TRANSFORM(lnMessage))
      RETURN null
   ENDIF   
   lcMessage = lcMessage + lcResult
ENDIF

lcResult =  THIS.oIP.SendReceive("LIST " + TRANSFORM(lnMessage) +  CRLF)
lnSize = VAL( STRTRAN(lcResult,"+OK " + TRANSFORM(lnMessage) + " ","") )

loMsg = THIS.ParseMessageHeader(lcMessage)
loMsg.nSize = lnSize

THIS.aMessages[lnMessage] = loMsg

RETURN loMsg
*  wwPOP3 :: GetMessageHeader

************************************************************************
* wwPop3 :: ParseMessageHeader
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseMessageHeader(lcMessage)
LOCAL lnAt, lnAt2, loMsg, lnParens, lcFrom, lnBrackets, lnBodySize, lcHeaders, lnX
LOCAL lnCount, lcLine, lnLines

*** Create and store the message
loMsg = THIS.CreateMessageObject()

lnAt = AT(CRLF+CRLF,lcMessage)+4
lnAt2 = RAT(".",lcMessage)

*** Body size is . - CRLF 
lnBodySize = lnAt2 - (lnAt + 2)
loMsg.cBody = SUBSTR(lcMessage,lnAT,lnBodySize)   

*** Grab just the header
lcHeaders = SUBSTR(lcMessage,1,lnAt)

*** Parse the header lines into an laHeaders array
*** Need to combine lines that have continuation etc.
lnLines = ALINES(laLines,lcHeaders)

lnCount = 0
FOR lnX = 1 TO lnLines
	lcLine = ALLTRIM(laLines[lnX])
	IF EMPTY(lcLine)
	   LOOP
	ENDIF

    *** Read ahead and add any lines that start with blank chars
    *** These are header continuations
	DO WHILE lnX < lnLines AND laLines[lnX + 1] = " "
	   lnX = lnX + 1 
	   lcLine = lcLine + CRLF + laLines[lnX]	
	ENDDO
	
	lnCount = lnCount + 1 
	DIMENSION laHeaders[lnCount]
	laHeaders[lnCount] = lcLine
ENDFOR

&&lcMessage  &&Extract(lcMessage,CRLF+CRLF,CRLF + "." +CRLF," ." + CRLF)

*** Parse the From Name
lcFrom = this.GetHeader("From",@laHeaders)
lnBrackets = AT("<",lcFrom)
lnParens = AT("(",lcFrom)
DO CASE
 CASE  lnBrackets > 0
   loMsg.cFromEmail = Extract(lcFrom,"<",">")
   IF lnBrackets > 2
     loMsg.cFromName = STRTRAN( LEFT(lcFrom,lnBrackets-1),'"',"" )
   ELSE
      loMsg.cFromName = loMsg.cFromEmail
   ENDIF
  CASE lnParens > 0
   loMsg.cFromName = Extract(lcFrom,"(",")")
   IF lnParens > 2
     loMsg.cFromEmail = ALLTRIM(STRTRAN( LEFT(lcFrom,lnParens-1),'"',"" ))
   ELSE
      loMsg.cFromEmail = ALLTRIM(lcFrom)
   ENDIF
 
  OTHERWISE 
    loMsg.cFromName = STRTRAN(lcFrom,'"',"")
    loMsg.cFromEmail = loMsg.cFromName
ENDCASE

IF EMPTY(loMsg.cFromName)
   loMsg.cFromName = loMsg.cFromEmail
ENDIF

loMsg.cTo = this.GetHeader("To",@laHeaders)
loMsg.cTo = CHRTRAN(loMsg.cTo,"<>()[]","")
loMsg.cSubject = this.GetHeader("Subject",@laHeaders)
loMsg.nSize = LEN(loMsg.cBody)
loMsg.cContentType = this.GetHeader("Content-Type",@laHeaders)
IF (AT(";",loMsg.cContentType) > 0)
   loMsg.cContentType = SUBSTR(loMsg.cContentType,1,AT(";",loMsg.cContentType)-1)
ENDIF
loMsg.cGlobalContentType = loMsg.cContentType  
loMsg.cMultipartBoundary = CHRTRAN(Extract(lcHeaders,[boundary=],CRLF),["],[])
loMsg.cEncoding = ALLTRIM(STRTRAN( EXTRACT(lcHeaders,"Content-Transfer-Encoding:",CRLF),";",""))
loMsg.cDate = this.GetHeader("Date",@laHeaders)
loMsg.dDate = MimeDateTime(loMsg.cDate)
loMsg.cMsgId = this.GetHeader("Message-ID",@laHeaders)
   
loMsg.cFullText = lcMessage

RETURN loMSG 
ENDFUNC
*  wwPop3 :: ParseMessageHeader

************************************************************************
* wwPop3 ::  GetHeader
****************************************
***  Function: Internal function that retrieves a header from
***            the internally created list of headers
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION GetHeader(lcHeader,laLines)
LOCAL lnX

lcLookfor = LOWER(lcHeader) + ":"
FOR lnX = 1 TO ALEN(laLines)
	IF LOWER(laLines[lnX]) = lcLookFor
		RETURN ALLTRIM(SUBSTR(laLines[lnX],LEN(lcHeader)+2))
	ENDIF
ENDFOR

RETURN ""
ENDFUNC


************************************************************************
* wwPop3 :: ParseMultiPartMessage
****************************************
***  Function: Parses the cBody property of a message and creates
***            an array of attachments if 
***    Assume: Follows a call to GetMessage
***      Pass:
***    Return:
************************************************************************
FUNCTION ParseMultiPartMessage(loMsg)
LOCAL x, lnParts

DIMENSION laParts[1]
lnParts = APARSESTRING(@laParts,loMsg.cBody,loMsg.cMultipartBoundary)
*lnParts = ALINES(laParts,loMsg.cBody,loMsg.cMultipartBoundary)
IF lnParts = 0
   *** No attachments
   RETURN 
ENDIF

lnGotParts = 0
FOR m.x = 1 TO lnParts
   lcPart = laParts[m.x]
   lcContentType = STRTRAN( Extract(lcPart,"Content-Type: ",CHR(13)),";","")
   IF !EMPTY(lcContentType)
      loAttachment = THIS.CreateAttachmentObject()


      
      *** Strip off trailing "--" MIME chars
      IF RIGHT(lcPart,2) = "--"
         lcPart = SUBSTR(lcPart,1,LEN(lcPart)-2)
      ENDIF
      IF EMPTY(lcPart)
         LOOP
      ENDIF
      
      lnGotParts = lnGotParts + 1
      
      loAttachment.cContentType = STRTRAN( Extract(lcPart,"Content-Type: ",CHR(13)),";","")
      loAttachment.cEncoding = LOWER(Extract(lcPart,"Content-Transfer-Encoding: ",CHR(13)))
      loAttachment.cFileName = Extract(lcPart,[filename="],["])

      loAttachment.cBody = Extract(lcPart,CRLF+CRLF,WWC_NULLSTRING,,.T.)
      
      IF loAttachment.cContentType = "multipart/alternative"
         *** Boundary changes
         lcAltBoundary = EXTRACT(lcPart,[boundary="],["])
         DIMENSION laAltParts[1]
         lnAltParts = APARSESTRING(@laAltParts,loAttachment.cBody,lcAltBoundary)
         lnGotParts = lnGotParts - 1  && Start over

         FOR y = 2 TO lnAltParts
            loAttachment = THIS.CreateAttachmentObject()
            
            lcPart = laAltParts[y]
            
            *** Strip off trailing "--" MIME chars
            IF RIGHT(lcPart,2) = "--"
               lcPart = SUBSTR(lcPart,1,LEN(lcPart)-2)
            ENDIF
            
            IF EMPTY(lcPart)
               LOOP
            ENDIF
            
            lnGotParts = lnGotParts + 1

            loAttachment.cContentType = STRTRAN( Extract(lcPart,"Content-Type: ",CHR(13)),";","")
            loAttachment.cEncoding = LOWER(Extract(lcPart,"Content-Transfer-Encoding: ",CHR(13)))
            loAttachment.cFileName = Extract(lcPart,[filename="],["])

            loAttachment.cBody = Extract(lcPart,CRLF+CRLF,WWC_NULLSTRING,,.T.)
            THIS.DecodeMessagePart(loAttachment)
            loAttachment.nSize = LEN(loAttachment.cBody)
            IF lnGotParts > 1
               DIMENSION loMsg.aAttachments[lnGotParts -1]
               loMsg.aAttachments[lnGotParts-1] = loAttachment
            ELSE
               loMsg.cBody = loAttachment.cBody
               loMsg.cContentType = loAttachment.cContentType
            ENDIF
         ENDFOR
         LOOP
      ENDIF
      
      THIS.DecodeMessagePart(loAttachment)
      
      loAttachment.nSize = LEN(loAttachment.cBody)
      
      IF lnGotParts > 1
         DIMENSION loMsg.aAttachments[lnGotParts -1]
         loMsg.aAttachments[lnGotParts-1] = loAttachment
      ELSE
         loMsg.cBody = loAttachment.cBody
         loMsg.cContentType = loAttachment.cContentType
      ENDIF
   ENDIF
ENDFOR

loMsg.nAttachments = lnGotParts -1 
IF loMsg.nAttachments < 0 
   loMsg.nAttachments = 0
ENDIF

*** Fix up text message
IF loMsg.nAttachments = 0 AND loMsg.cEncoding = "quoted-printable"
   loMsg.cBody = STRTRAN(loMsg.cBody,"=20" )
   loMsg.cBody = STRTRAN(loMsg.cBody,"=" + CHR(13) + CHR(10) )  && 75 char breaks
   loMsg.cBody = STRTRAN(loMsg.cBody,"=" + CHR(13) )  && 75 char breaks
   loMsg.cBody = STRTRAN(loMsg.cBody,"=3D","=")
ENDIF

ENDFUNC
*  wwPop3 :: ParseMultiPartMessage

************************************************************************
* wwPOP3 :: DecodeMessagePart
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION DecodeMessagePart(loAttachment)

DO CASE
CASE loAttachment.cEncoding = "base64" 
   loAttachment.cbody = STRCONV(loAttachment.cBody,14)
CASE loAttachment.cEncoding = "quoted-printable"
   loAttachment.cBody = STRTRAN(loAttachment.cBody,"=20" )
   loAttachment.cBody = STRTRAN(loAttachment.cBody,"=" + CHR(13) + CHR(10) )  && 75 char breaks
   loAttachment.cBody = STRTRAN(loAttachment.cBody,"=" + CHR(13) )  && 75 char breaks
   loAttachment.cBody = STRTRAN(loAttachment.cBody,"=3D","=")
ENDCASE

ENDFUNC
*  wwPOP3 :: DecodeMessagePart


************************************************************************
* wwPOP3 :: DeleteMessage
****************************************
***  Function: Deletes a message by message number. Note this 
***            will change the order of messages and you'll have
***            reload the list to get new message number lists
***    Assume:
***      Pass: lnMessage   -   Message number
***    Return:
************************************************************************
FUNCTION DeleteMessage(lnMessage)

IF EMPTY(lnMessage)
   RETURN .F.
ENDIF

IF VARTYPE(lnMessage) = "C"
   lnMessage = THIS.GetMessageNumberFromID(lnMessage)
   IF lnMessage=0
      THIS.SetError("Couldn't delete message. Invalid Message Id.")
      RETURN .F.
   ENDIF
ENDIF

lcResult = THIS.oIP.SendReceive("DELE " + TRANSFORM(lnMessage) +CRLF )

IF lcResult # "+"
   THIS.SetError(SUBSTR(lcResult,2))
   RETURN .F.
ENDIF   

ENDFUNC
*  wwPOP3 :: DeleteMessage

FUNCTION Quit

IF !ISNULL(THIS.oIP)
   THIS.oIP.SendReceive("QUIT" + CRLF)
   THIS.oIp.Close()
ENDIF

ENDFUNC

************************************************************************
* wwPOP3 :: CreateMessageObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateMessageObject

loMsg = CREATEOBJECT("Relation")
loMsg.AddProperty("cSubject","")
loMsg.AddProperty("cBody","")
loMsg.AddProperty("cFromName","")
loMsg.AddProperty("cFromEmail","")
loMsg.AddProperty("cTo","")
loMsg.AddProperty("nSize","")
loMsg.AddProperty("cContentType","")
loMsg.AddProperty("cGlobalContentType","")
loMsg.AddProperty("cEncoding","")
loMsg.AddProperty("cMultiPartBoundary","")
loMsg.AddProperty("cFullText","")
loMsg.AddProperty("cDate","")
loMsg.AddProperty("dDate",{ : })
loMsg.AddProperty("cMsgId","")
loMsg.AddProperty("nAttachments",0)
loMsg.AddProperty("aAttachments(1)","")

RETURN loMsg
ENDFUNC
*  wwPOP3 :: CreateMessageObject

************************************************************************
* wwPop3 :: CreateAttachmentObject
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateAttachmentObject()
LOCAL loAttachment

loAttachment = CREATEOBJECT("Relation")
loAttachment.AddProperty("cFilename","")
loAttachment.AddProperty("nSize",0)
loAttachment.AddProperty("cBody","")
loAttachment.AddProperty("cContentType","")
loAttachment.AddProperty("cEncoding","")
loAttachment.AddProperty("cAltBoundary","")


RETURN loAttachment

ENDFUNC
*  wwPop3 :: CreateAttachmentObject

************************************************************************
* wwPOP3 :: SetError
****************************************
***  Function: Logs errors
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SetError
LPARAMETERS lcError, lnError

IF EMPTY(lnError)
   lnError = 0
ENDIF

IF EMPTY(lcError)
   THIS.lError = .F.
   THIS.cErrorMsg = ""
   THIS.nError = 0
ELSE
   THIS.lError = .T.
   THIS.cErrorMsg = lcError
   THIS.nError = lnError
ENDIF      
*  wwPOP3 :: SetError

************************************************************************
* wwPop3 :: Destroy
****************************************
***  Function: Shuts down the POP3 session.
***    Return: 
************************************************************************
FUNCTION Destroy()

THIS.Quit()

ENDFUNC
*  wwPop3 :: Destroy


PROTECTED FUNCTION nBufferSize_Assign(lnSize)
IF !ISNULL(THIS.oIP)
  THIS.oIP.nBufferSize = lnSize
ENDIF
THIS.nBufferSize = lnSize
RETURN 

PROTECTED FUNCTION nTimeout_Assign(lnTimeout)
IF !ISNULL(THIS.oIP)
  THIS.oIP.nTimeout = lnTimeout
ENDIF
THIS.nTimeout = lnTimeout
RETURN 

#IF SHAREWARE
FUNCTION INIT
WAIT WINDOW NOWAIT ;
  "Welcome to West Wind Internet Protocols..." + CHR(13) + ;
  "This is a shareware copy of wwPOP3." + CHR(13)+ CHR(13) +;
  "Please register your copy."
ENDFUNC
#ENDIF

ENDDEFINE


*************************************************************
DEFINE CLASS wwPop3Viewer AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2001
*:Contact: http://www.west-wind.com
*:Created: 10/03/2001
*:       : This class requires West Wind Web Connection
*:         and does not work with wwIPStuff/wwClient
*:        *** REQUIRES VFP 7.0 or later
*************************************************************

cPageFoot = ""
cBaseUrl = "webmail.wwd?"

************************************************************************
* wwPop3Viewer :: Render
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Render(loProcess)
LOCAL lcUsername, lcPassword, lcMailServer, m.x, loPop
PRIVATE SESSION

lcUserName = Request.Form("txtUserName")
lcPassword = Request.Form("txtPassword")
lcMailServer = Request.Form("txtServer")

lcID = Request.QueryString("MsgId")
lcAction = Request.QueryString("Action")

*** We need a session so the user doesn't have
*** to log in for every mailbox operation
loProcess.InitSession("WESTWINDUSER",3600,.t.)
Session = loProcess.oSession

IF EMPTY(lcUserName)
   lcUserName = Session.GetSessionVar("MailUsername")
ELSE
   Session.SetSessionVar("MailUserName",lcUserName)
ENDIF
IF EMPTY(lcPassword)
   lcPassword = Session.GetSessionVar("MailPassword")
ELSE
   Session.SetSessionVar("MailPassword",lcPassword)
ENDIF
IF EMPTY(lcMailServer)
   lcMailServer = Session.GetSessionVar("MailServer")
ELSE
   Session.SetSessionVar("MailServer",lcMailServer)
ENDIF

IF EMPTY(lcUsername) OR EMPTY(lcPassword)
   THIS.LoginForm()
   RETURN
ENDIF

IF lcAction = "Logout"
   Session.DeleteSession()
   Process.StandardPage("Mail Client Logout complete","You're no longer logged into the remote mail client...")
   RETURN
ENDIF

IF lcAction = "Write" OR lcAction = "Send"
   THIS.MailWriteForm(NULL)
   RETURN
ENDIF


loPop = CREATEOBJECT("wwPop3")
loPop.cMailServer = lcMailServer
loPop.cUserName = lcUserName
loPop.cPassword = lcPassword
lopop.lLogSession = .F.

*** Connect to the server with username password and retrieve message count
IF !loPOP.Connect()
   loProcess.Errormsg("Couldn't connect to mail server",loPop.cErrormsg)
   RETURN
ENDIF

IF EMPTY(lcId)
   *** Display a message list
   IF loPop.nMessageCount > 0
      CREATE CURSOR TMessages (Date C(20),From C(80),Subject M,Size C(15),Action M)
      FOR m.x =1 TO loPop.nMessageCount
        loMsg = loPop.GetMessageHeader(m.x)
        INSERT INTO TMessages(Date,From,Subject,Size,Action) VALUES ;
             (TIMETOC(loMsg.dDate),loMsg.cFromName, loMsg.cSubject , TRANS(loMsg.nSize/1000,"999,999,999kb"),;
             [<a href="WebMail.wwd?MsgID=] + UrlEncode(loMsg.cMsgId) + [">View</a> | ] + ;
             [<a href="WebMail.wwd?MsgID=] + UrlEncode(loMsg.cMsgId) + [&Action=Delete">Delete</a>]   )
      ENDFOR
      INDEX ON Date DESCENDING TAG Date
      
      loSC = CREATEOBJECT("wwShowCursor")
      loSC.lAlternateRows = .T.
      loSc.nPage_ItemsPerPage = 20
      loSc.cExtraTableTags = [style="font:8pt Verdana"] 
      loSC.ShowCursor()
      lcOutput = loSC.Getoutput()
   ELSE
      lcOutput = "<p><center><h3>No Messages in your mailbox</h3></center><p>"   
   ENDIF

   Response.HTMLHeader("Mailbox for: " + lcUserName + " at " + lcMailserver)
   Response.Write([ <a href="webmail.wwd?action=Write">New Message</a> | <a href="webmail.wwd">Refresh Mailbox</a> | <a href="webmail.wwd?action=Logout">Log out</a><p>] + lcOutput)
ELSE
   *** Handle Message Operations: Show, Delete, Download Attachments

   *** Handle Message Deletion
   IF lcAction = "Delete"
      loPop.DeleteMessage( lcID )
      Response.Redirect("WebMail.wwd")  
      RETURN
   ENDIF
   
   *** Retrieve an individual message
   loMsg = loPop.GetMessage( lcID )
   IF ISNULL(loMsg)
      Process.ErrorMsg("Invalid Message","This message number is no longer available")
      RETURN
   ENDIF
   
   *** Parse Attachments and body from Mime content
   loPop.ParseMultipartMessage( loMsg )
   
   IF lcAction = "Reply"
      THIS.MailWriteForm(loMsg)
      RETURN
   ENDIF
   

   *** If we asked to download the message - send it back now
   IF lcAction = "Download"
      lnAttachment = VAL(Request.QueryString("Attachment"))
      IF lnAttachment > 0 AND loMsg.nAttachments >= lnAttachment
         loAttach = loMsg.aAttachments[lnAttachment]

		 Response.AppendHeader("Content-length",TRANSFORM(loAttach.nSize))
         Response.AppendHeader("Content-type","application/octet-stream")
         Response.AppendHeader("Content-disposition","attachment; filename="+loAttach.cFileName)

         Response.Write(loAttach.cBody)
         RETURN
      ENDIF
   ENDIF

   *** Pull out HTML content as main content if it exists
   FOR m.x = 1 TO loMsg.nAttachments
       IF loMsg.aAttachments[m.x].cContentType = "text/html" AND ;
          EMPTY(loMsg.aAttachments[m.x].cFileName)
          loMsg.cBody = loMsg.aAttachments[m.x].cBody
          loMsg.cContentType = "text/html"
          EXIT
       ENDIF
   ENDFOR

  
   *** Show Attachments as download links
   lcAttachments = ""
   FOR m.x = 1 TO loMsg.nAttachments
       *** Skip first HTML attachment because we use that as message
       IF !EMPTY(loMsg.aAttachments[m.x].cFileName)
          lcAttachments = lcAttachments + ;
             [<a href="WebMail.wwd?MsgId=] + lcID + ;
             [&Attachment=] +  TRANSFORM(m.x) + ;
             [&Action=Download">] +  TRIM(loMsg.aAttachments[m.x].cFileName ) + [</a>] + ;
             [<small> (] + TRANSFORM(INT(loMsg.aAttachments[m.x].nSize/1000+1)) + [kb)</small> | ]
       ENDIF 
   ENDFOR 
   
   *** Display the single message
   Response.HTMLHeader(loMsg.cSubject)
   lcText = ;    
      [<a href="webmail.wwd?action=Reply&msgid=] +lcID + [">Reply</a> | ] + ;
      [<a href="webmail.wwd?action=Delete&MsgId=] + lcID + [">Delete and return to list</a> | ] + ;
      [<a href="webmail.wwd">Return to list</a><br>] +; 
      [<table width="95%"><tr><td><br>] + ;
      [<table bgcolor="LightGrey" width="95%">]   + CRLF + ;
      [<tr><td align="right" width="75"> From:</td><td><a href="mailto:] + loMsg.cFromEmail + [&Subject=] + "Re: " + loMsg.cSubject + [">] +  loMsg.cFromName  + [</a></td></tr>]   + CRLF + ;
      [<tr><td align="right" width="75"> Date:</td><td>] +  loMsg.cDate  + [</td></tr>]   + CRLF + ;
      [</table><p>]   + CRLF + ;
      IIF(loMsg.cContentType="text/html",loMsg.cBody,DisplayMemo(loMsg.cBody) ) +;
      [</td></tr></table>]   

   Response.Write(lcText)
    
   IF !EMPTY(lcAttachments)
      Response.Write("<hr><b>Attachments:</b> " + lcAttachments + "<hr>")
   ENDIF
   
   Response.HTMLFooter(THIS.cPageFoot)
   RETURN
ENDIF  && Individual Message

*File2Var("pop3.log",loPop.oIP.GetLog())

Response.HTMLFooter(THIS.cPageFoot)

ENDFUNC
*  wwDemo :: MailList

************************************************************************
* wwPop3Viewer :: MailWriteForm
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION MailWriteForm(loMsg)
LOCAL loPOP

*** Otherwise display message form
IF ISNULL(loMsg)
   loPop = CREATEOBJECT("wwPop3")
   loMsg = loPop.CreateMessageObject()
   lcTo = ""
ELSE
   IF LOWER(LEFT(loMsg.cSubject,3)) # "re:"
      loMsg.cSubject = "Re: " + loMsg.cSubject
   ENDIF
   lcTo = loMsg.cFromEmail
ENDIF

Process.InitSession("WESTWINDUSER",3600,.t.)
Session =Process.oSession

lcFromName = Session.GetSessionVar("FromName")
lcFromEmail = Session.GetSessionVar("FromEmail")

*** Posting data
IF !EMPTY(Request.Form("btnSubmit"))
   lcFromName = Request.Form("txtFromName")
   lcFromEmail = Request.Form("txtFromEmail")
   Session.SetSessionVar("FromName",lcFromName)
   Session.SetSessionVar("FromEmail",lcFromEmail)
   
   lcTo = Request.Form("txtTo")
   loMsg.cSubject = Request.Form("txtSubject")
   loMsg.cBody = Request.Form("txtMessage")
               
   loIP = CREATEOBJECT("wwSmtp")
   loIP.nMailMode = 2
   loIP.cMailServer = Session.GetSessionVar("MailServer")
   loIP.cSenderEmail = lcFromEmail
   loIP.cSenderName = lcFromName   
   loIP.cRecipient = lcTo
   loIP.cSubject = loMsg.cSubject
   loIP.cMessage = loMsg.cBody
   
   loIP.SendMailAsync()
   
   Process.StandardPage("Mail sent","The message has been sent to the mail server.<p>Returning now to the message list...",,2,"webmail.wwd")
   RETURN
ENDIF


TEXT TO lcHTML TEXTMERGE NOSHOW
<HTML>
  <HEAD>

    <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=ISO-8859-1">
    <TITLE>New Email Message</TITLE>
    <STYLE>
      <!--
      .fields{ font-family: Tahoma, sans-serif; font-size: 8pt; }
      -->
    </STYLE>
  </HEAD>
  <BODY BGCOLOR="#FFFFFF">

    <TABLE WIDTH="100%" BORDER="0"><TR><TD ALIGN="CENTER" VALIGN="CENTER">

      <FORM ACTION="WebMail.wwd?Action=Send" METHOD="POST">

        <TABLE BORDER="1" CELLSPACING="2" CELLPADDING="2" BGCOLOR="#B0B0B0" width="480">
          <TR>
            <TD WIDTH="433" COLSPAN="2" BGCOLOR="#000080">
              <FONT COLOR="#FFFFFF" SIZE=2 FACE="Verdana">
                <B>New Message</B>
              </FONT>
            </TD>
          </TR>
          <TR>
            <TD width="456">

              <TABLE BORDER="0" CELLPADDING="2" CELLSPACING="0" width="484">
                <TR>
                  <TD VALIGN="MIDDLE" width="63">
                    <FONT FACE="Verdana,Helvetica" SIZE="1" CLASS="fields">Your Name: </FONT>
                  </TD>
                  <TD width="416">
                    <INPUT TYPE="TEXT" SIZE="50" MAXLENGTH="256" NAME="txtFromName" VALUE="<<lcFromName>>" CLASS="fields">
                  </TD>
                </TR>
                <TR>
                  <TD VALIGN="MIDDLE" width="63">
                    <FONT FACE="Verdana,Helvetica" SIZE="1" CLASS="fields">Your Email: </FONT>
                  </TD>
                  <TD width="416">
                    <INPUT TYPE="TEXT" SIZE="50" MAXLENGTH="256" NAME="txtFromEmail" VALUE="<<lcFromEmail>>" CLASS="fields">
                  </TD>
                </TR>
                <TR>
                  <TD VALIGN="MIDDLE" width="63">
                    <FONT FACE="Verdana,Helvetica" SIZE="1" CLASS="fields">To: </FONT>
                  </TD>
                  <TD width="416">
                    <INPUT TYPE="TEXT" SIZE="50" MAXLENGTH="50" NAME="txtTo" VALUE="<<lcTo>>" CLASS="fields">
                  </TD>
                </TR>
                <TR>
                  <TD VALIGN="MIDDLE" width="63">
                    <FONT FACE="Verdana,Helvetica" SIZE="1" CLASS="fields">Subject: </FONT>
                  </TD>
                  <TD width="416">
                    <INPUT TYPE="TEXT" SIZE="50" MAXLENGTH="50" NAME="txtSubject" VALUE="<<loMsg.cSubject>>" CLASS="fields">
                  </TD>
                </TR>
                <TR>
                  <TD ALIGN="LEFT" COLSPAN="2" width="500">
                    <TEXTAREA NAME="txtMessage" ROWS="20" cols="100" WRAP style="font:normal normal 8pt Verdana"></TEXTAREA>
                  </TD>
                </TR>
              </TABLE>
            </TD>
          </TR>
          <tr>
          <td colspan=2> <input NAME="btnSubmit" type="submit" value=" Send Message " ACCESSKEY="S" style="font:normal normal 8pt Tahoma"></td>
          </tr>
        </TABLE>
      </FORM>

    </TD></TR></TABLE>
  <hr> 
  << IIF(loMsg.cContentType = "text/html","<b>Orignal Message Text:</b><hr>" + loMsg.cBody,DisplayMemo(loMsg.cBody)) >>
  </BODY>
</HTML>
ENDTEXT

Response.ContentTypeHeader()
Response.Write(lcHTML)

ENDFUNC
*  wwPop3Viewer :: MailWriteForm


************************************************************************
* wwPop3Viewer :: LoginForm
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION LoginForm()

IF wwVFPVersion < 7
   Process.StandardPage("Visual FoxPro 7 or later required","This sample requires VFP 7 or later...")
   RETURN
ENDIF   

TEXT TO lcText NOSHOW
<form action="WebMail.wwd" action="POST" method="POST">
Please provide you POP3 Mail Server login information:<p>
      <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse" width="475">
        <tr>
          <td width="180" align="right">Username:</td>
          <td>
      <input type="text" size="50" name="txtUserName" rows="1" value=""></td>
        </tr>
        <tr>
          <td align="right">Password:</td>
          <td>
      <input type="password" size="50" name="txtPassword" rows="1"></td>
        </tr>
        <tr>
          <td align="right">Mail Server:</td>
          <td>
      <input type="text" size="50" name="txtServer" rows="1" value=""></td>
        </tr>
      </table>
      <p>&nbsp;<input type="submit" name="btnSubmit" value="Check Mail"> </p>
</form>
ENDTEXT
Process.StandardPage("Login for Web Mail",lcText)

RETURN
ENDFUNC
*  wwPop3Viewer :: LoginForm

ENDDEFINE
*EOC wwPop3Viewer 
