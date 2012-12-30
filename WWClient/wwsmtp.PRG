#INCLUDE wconnect.h

SET PROCEDURE TO wwDotNetBridge Additive
SET PROCEDURE TO wwUtils Additive
SET PROCEDURE TO wwCollections ADDITIVE

SET PROCEDURE TO wwSmtp ADDITIVE


*************************************************************
DEFINE CLASS wwSMTP AS Custom
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2002
*:Contact: http://www.west-wind.com
*:Created: 08/31/2002
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwSmtp
*:Description:
The wwSMTP class allows sending emails from Visual FoxPro applications 
through standard SMTP/ESMTP mail servers. In order to use this class you 
will need to have an SMTP mail server address from your or your users ISP 
or a company server.

<<h3>>Two modes: Classic or wwSmpt (.NET)<</h3>>
The wwSmtp class comes in two flavors:

<<ul>>
<<li>> <<b>>.NET Mail Mode (nMailMode = 0)<</b>>
Uses .NET and wwDotNetBridge to send emails. The .NET component provides 
additional features such as SSL/TSL encrypted content, embedded rich 
content resources like images and the ability to send multiple emails on a 
single mail connection. It utilizes the Westwind.wwSmtp .NET class stored 
in wwDotNetBridge. This class uses the native SmtpClient in .NET to 
abstract mail sending operations which are exposed through wwDotNetBridge. 
To use this class requires .NET 2.0 pre-installed.

<<li>> <<b>>Classic wwIPStuff Mode (nMailMode = 2)<</b>>
Uses the classic wwIPStuff behavior using a plain Win32 dll that doesn't 
need to be registered. Only supports SendMail and SendMailAsync methods and
 the same property set that the older class supported.
<</ul>>

.NET mode (nMailMode = 0) is the default behavior of the class.

<<b>>Dependencies:<</b>>
.NET 2.0 or later
wwDotNetBridge.dll
*:Remarks:
Note that the .NET security environment puts restrictions on loading
.NET dlls (wwDotNetBridge.dll specifically here) from a network share.
If loaded from a network share the share must be added to a trusted
zone.
*:SeeAlso:
Sending SMTP Email
Sending Messages with Html and Text body
wwSMTP::SendMail
*:HelpId:
1251706
*:Filename:
_2QL0TV6K4
*:ENDHELP
#ENDIF

*** Custom Properties
*** wwDotnet Bridge Instance
oBridge = null

*** instance of the Westwind.wwSmtp .NET component
oSmtp = null

*** Mail Mode 0 - wwSmtp  2 - wwIPStuff (Classic)
nMailMode = 2

*** Mail server IP Address or domain name. Examples: 127.0.0.1, smtp.gmail.com
*** You can also specify the server port as part of this string: smtp.gmail.com:252
cMailServer = ""

*** The port on which to send email
nServerPort = 25

*** Determines if SSL/TLS should be used for this mail request
lUseSsl = .f.

*** Username for Authentication
cUsername = ""

*** Password for Authentication
cPassword = ""

*** An error message if the request fails
cErrorMsg = ""

*** True if a method call fails
lError = .f.

nError = 0

*** Determines if SendMail is sent asynchronous
lAsync = .F.

*** Timeout in seconds before mail sending is canceled
nTimeout = 10

*** The subject for the message send
cSubject = ""

*** The body for the message to send
cMessage = ""

*** The content type of the message to send
cContentType = "text/plain"

*** Optional alternate message format. Use if HTML message is sent and HTML is not available
*** in mail client. Optional.
cAlternateText = ""

*** Content type of alternate text sent. Should be plain
cAlternateContentType = "text/plain"

*** One ore more recipients. Multiple recipients should be comma or semi-colon delimited
*** Recipients can also be specified as: 
cRecipient = ""

*** The sender's email address
cSenderEmail = "" 

*** The display name of the sender (optional)
cSenderName = ""

*** List of CC's. Comma delimited
cCCList = ""

*** List of Blind CCs. Comma delimited
cBccList = ""

*** Default Priority of the message
cPriority = "Normal"

*** The Reply-To address
cReplyTo = ""

*** Allows overriding the user agent
cUserAgent = "West Wind SMTP 5.0"

*** Determines if a return receipt is requested (Return-Receipt-To)
*** Receipt is sent to SenderEmail. Alternately manually assign
*** the Return-Receipt-To header and specify an email address
lReturnReceipt = .F.

*** Log file name for SMTP logging
*** Used only for SendMailClassic() 
cLogFile = ""

*** One or more attachments, comma delimited. 
*** Attachments should be specified as fully qualified paths
*** and all files have to exist or else the email will not send
cAttachment = ""

*** Internally used extra headers property
cExtraHeaders = ""

************************************************************************
* wwSmtp ::  Init
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init(lnMailMode)

#IF SHAREWARE
   WAIT WINDOW NOWAIT ;
      "Welcome to West Wind Internet Protocols..." + CHR(13) + ;
      "This is a shareware copy of wwSMTP" + CHR(13)+ CHR(13) +;
      "Please register your copy."
#ENDIF


IF VARTYPE(lnMailMode) = "N"
   THIS.nMailMode = lnMailMode
ENDIF

ENDFUNC
*  wwSmtp ::  Init


************************************************************************
* wwSmtp ::  CreatewwSmtp
****************************************
***  Function: Creates a new instance of the wwSmtp .NET component
***            Ensures a clean instance
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreatewwSmtp()

IF ISNULL(this.oBridge)
	this.oBridge = CREATEOBJECT("wwDotNetBridge")
ENDIF
IF ISNULL(this.oSmtp)
	this.oSmtp = this.oBridge.CreateInstance("Westwind.wwSmtp")
	IF ISNULL(this.oSmtp)
	   *** Throw an error with the actual error message
	   ERROR this.oBridge.cErrorMsg
	ENDIF
ENDIF
ENDFUNC
*  wwSmtp ::  CreatewwSmtp

************************************************************************
* wwSmtp ::  Dispose
****************************************
***  Function: Cleans up this object instance
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Dispose()

IF !ISNULL(this.oSmtp)
	this.oSmtp.Dispose()
ENDIF	
this.oSmtp = null
this.oBridge = null

ENDFUNC
*  wwSmtp ::  Dispose

************************************************************************
* wwSmtp ::  Destroy
****************************************
FUNCTION Destroy()
this.Dispose()
ENDFUNC
*  wwSmtp ::  Destroy

************************************************************************
* wwSmtp ::  AddHeader
****************************************
***  Function: Adds an SMTP header to this email request
***    Assume: Note that headers that are automatically set by the 
***            SMTP component may override explicit headers you set.
***      Pass: lcHeader - name of the header to set
***            lcValue  - the value to set the header to
***    Return: nothing
************************************************************************
FUNCTION AddHeader(lcHeader, lcValue)

this.cExtraHeaders = this.cExtraHeaders + lcHeader + ": " + lcValue + CRLF

ENDFUNC
*  wwSmtp ::  AddHeader

************************************************************************
* wwSmtp ::  SendMail
****************************************
***  Function: Same interface as the wwIPStuff SendMail method for
***            compatibility. Self contained method that sends a single
***            email message.
***    Assume:  Uses .NET / wwDotNetBridge.dll
***      Pass:  nothing
***    Return: .T. of .F. check cErrorMsg on .F. result
************************************************************************
FUNCTION SendMail
LOCAL lcSubject, llResult

IF this.nMailMode = 2
   RETURN this.SendMailClassic()
ENDIF   

this.CreatewwSmtp()

this.SetError()

lcSubject=TRIM(THIS.cSubject)
lcSubject = CHRTRAN(lcSubject,CHR(13)+CHR(10)," ") && Strip out CRLF

LOCAL loSMTP as Westwind.wwSmtp
loSmtp = this.oSmtp

loSmtp.MailServer = TRIM(THIS.cMailServer)
loSmtp.ServerPort = this.nServerPort
loSmtp.UseSsl = this.lUseSsl
loSmtp.Timeout = this.nTimeout

loSmtp.Username = TRIM(this.cUsername)
loSmtp.Password = TRIM(this.cPassword)

loSmtp.Subject = lcSubject
loSmtp.Message = TRIM(THIS.cMessage)
loSmtp.ContentType = TRIM(THIS.cContentType)
loSmtp.AlternateText = (this.cAlternateText)
loSmtp.AlternateTextContentType = this.cAlternateContentType

loSmtp.SenderEmail = this.cSenderEmail
loSmtp.SenderName = this.cSenderName

loSmtp.Attachments = this.cAttachment
loSmtp.UserAgent = this.cUserAgent

*** Message options
loSmtp.ReturnReceipt = this.lReturnReceipt
loSmtp.ReplyTo = this.cReplyTo
loSmtp.Priority = this.cPriority

*** Add explicit headers
loSmtp.AddHeadersFromString(this.cExtraHeaders)

loSmtp.Recipient = this.cRecipient
loSmtp.CC = this.cCCList
loSmtp.BCC = this.cBccList

IF this.lAsync
	loSmtp.SendMailAsync()
	llResult = .T.
ELSE	
	llResult = loSmtp.SendMail()
	IF !llResult
		this.SetError(loSmtp.ErrorMessage)
	ENDIF
ENDIF

*** Must clear out headers
this.cExtraHeaders = ""

RETURN llResult
*  wwSmtp ::  SendMail


************************************************************************
* wwSmtp ::  SendMailAsync
****************************************
***  Function: Sends mail asynchronously. Uses the exact same interface
***            as the plain send mail interface.
************************************************************************
FUNCTION SendMailAsync()

THIS.lAsync = .T.

IF this.nMailMode = 2
   this.SendMailAsyncClassic()
   THIS.lAsync = .F.
   RETURN
ENDIF   

this.SendMail()
THIS.lAsync = .F.
ENDFUNC
*  wwSmtp ::  SendMailAsync


************************************************************************
* wwSmtp ::  SendMailClassic
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION SendMailClassic()
LOCAL lcSubject, lcUsername, lcPassword, lcError, llResult

this.SetError()

lcSubject=TRIM(THIS.cSubject)
lcSubject = CHRTRAN(lcSubject,CHR(13)+CHR(10)," ") && Strip out CRLF

*** NOte: this value is matched to the boundary in wwipstuff.dll
***       DON'T CHANGE!
LOCAL lcContentBoundary
lcContentBoundary = "NextPart_000_0025_01BDBAA5.86C80EB0"

*** Add some common required extra headers
IF !EMPTY(this.cPriority) AND ATC("Importance:",this.cExtraHeaders) < 1
   this.AddHeader("Importance",this.cPriority)
ENDIF
IF THIS.lReturnReceipt AND ATC("Return-Receipt-To:",this.cExtraHeaders) < 1
      this.Addheader("Return-Receipt-To",this.cSenderemail)
      this.AddHeader("Disposition-Notification-To",this.cSenderEmail)
ENDIF
IF !EMPTY(this.cReplyTo)
    this.AddHeader("Reply-To",this.cReplyTo)
ENDIF
IF !EMPTY(this.cUserAgent)
	this.AddHeader("x-mailer",this.cUserAgent)
ENDIF

IF !EMPTY(this.cAlternateText)
	*** More info: http://www.wilsonweb.com/wmt5/html-email-multi.htm
	lcMessage = "--" + lcContentBoundary + CRLF + ;
				"Content-Type: " + TRIM(this.cContentType) + CRLF +CRLF +;
				TRIM(this.cMessage) + CRLF +CRLF
	
	lcMessage = lcMessage + ;
				"--" + lcContentBoundary + CRLF + ;
				"Content-Type: " + this.cAlternateContentType + CRLF +CRLF +;
				this.cAlternateText  + CRLF
	
	lcContenttype = [multipart/alternative;boundary="] + lcContentBoundary + ["]
ENDIF

*** Error is passed in and returned back
lcError=SPACE(513)

DECLARE integer SendMail ;
   IN wwipstuff.dll ;
   STRING cFrom, ;
   STRING cFromName, ;
   STRING cTo, ;
   STRING cCC, ;
   STRING cBCC, ;
   STRING cSubject, ;
   STRING cMessage, ;
   STRING cAttachment,; 
   STRING cMailHost,;
   STRING @cError,;
   STRING cContentType,;
   INTEGER nPort,;
   STRING cExtraHeaders,;
   STRING cUsername,;
   STRING cPassword,;
   STRING cLogFile

lcUsername = IIF(!EMPTY(this.cUsername),STRCONV(TRIM(THIS.cUsername),13),"")
lcPassword = IIF(!EMPTY(this.cPassword),STRCONV(TRIM(This.cPassword),13),"")

llResult=IIF(SendMail(TRIM(this.cSenderEmail),;
		    TRIM(this.cSenderName),;
            TRIM(this.cRecipient),;
            TRIM(this.cCCList),;
            TRIM(this.cBCCList),;
            lcSubject,;
            TRIM(this.cMessage),;
            TRIM(this.cAttachment),;
            TRIM(this.cMailServer),;
            @lcError,;
            TRIM(this.cContentType),;
            THIS.nServerPort,;
            THIS.cExtraHeaders,;
            lcUsername, lcPassword,;
            TRIM(this.cLogFile))=1,.T.,.F.)

IF !llResult
   THIS.cErrorMsg = TRIM(CHRTRANC(lcError,CHR(0),""))
ELSE
   THIS.cErrorMsg = ""
ENDIF
               
RETURN llResult
ENDFUNC
*  wwSmtp ::  SendMailClassic

************************************************************************
* wwSmtp ::  SendMailAsyncClassic
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED FUNCTION SendMailAsyncClassic()
LOCAL lcSubject

lcSubject=IIF(vartype(lcSubject)="C",lcSubject,THIS.cSubject)
lcSubject = CHRTRAN(lcSubject,CHR(13)+CHR(10)," ") && Strip out CRLF

*** Add some common required extra headers
IF !EMPTY(this.cPriority) AND ATC("Importance:",this.cExtraHeaders) < 1
   this.AddHeader("Importance",this.cPriority)
ENDIF
IF THIS.lReturnReceipt AND ATC("Return-Receipt-To:",this.cExtraHeaders) < 1
      this.Addheader("Return-Receipt-To",this.cSenderemail)
ENDIF
IF !EMPTY(this.cReplyTo)
    this.AddHeader("Reply-To",this.cReplyTo)
ENDIF
IF !EMPTY(this.cUserAgent)
	this.AddHeader("x-mailer",this.cUserAgent)
ENDIF

*** NOte: this value is matched to the boundary in wwipstuff.dll
***       DON'T CHANGE!
LOCAL lcContentBoundary
lcContentBoundary = "NextPart_000_0025_01BDBAA5.86C80EB0"


IF !EMPTY(THIS.cAlternateText)
	*** More info: http://www.wilsonweb.com/wmt5/html-email-multi.htm
	lcMessage = "--" + lcContentBoundary + CRLF + ;
				"Content-Type: " + this.cContentType + CRLF +CRLF +;
				this.cMessage  + CRLF +CRLF
	
	lcMessage = this.cMessage + ;
				"--" + lcContentBoundary + CRLF + ;
				"Content-Type: " + this.cAlternateContentType + CRLF +CRLF +;
				this.cAlternateText  + CRLF
	
	lcContenttype = [multipart/alternative;boundary="] + lcContentBoundary + ["]
ENDIF


DECLARE integer SendMailAsync ;
   IN  wwipstuff.dll ; 
   STRING cFrom, ;
   STRING cFromName, ;
   STRING cTo, ;
   STRING cCC, ;
   STRING cBCC, ;
   STRING cSubject, ;
   STRING cMessage, ;
   STRING cAttachment,;
   STRING cMailHost,;
   STRING cContentType,;
   INTEGER nPort,;
   STRING cExtraHeaders,;
   STRING cUsername,;
   STRING cPassword

*** Base64 Encode username and password
lcUsername = IIF(!EMPTY(this.cUsername),STRCONV(THIS.cUsername,13),"")
lcpassword = IIF(!EMPTY(this.cPassword),STRCONV(This.cPassword,13),"")
       
=SendMailAsync(TRIM(this.cSenderEmail), ;
			   TRIM(this.cSenderName),;
               TRIM(this.cRecipient),;
               TRIM(this.cCCList),;
               TRIM(this.cBCCList),;
               lcSubject,;
               this.cMessage,;
               TRIM(this.cAttachment), ;
               TRIM(this.cMailServer), TRIM(this.cContentType),;
               THIS.nServerPort,THIS.cExtraHeaders,;
               TRIM(lcUsername), TRIM(lcPassword))

RETURN .T.
ENDFUNC
*  wwSmtp ::  SendMailAsyncClassic


************************************************************************
* wwSmtp ::  SendMapiMail
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SendMapiMail(llDontSend)
LOCAL loSession, lcOldPath, Y, lnRecips, x, loEval
PRIVATE loMessages

lcOldPath = SYS(5) + CURDIR()

loSession = CREATEOBJECT( "MSMAPI.MAPISession" )

* Signon to mail if you have a password
IF !EMPTY(THIS.cUserName)
    loSession.UserName = THIS.cUserName
    loSession.PASSWORD = THIS.cPassword
ENDIF

loSession.DownloadMail = !llDontSend && Force Send/Recv
loSession.Signon()
IF ( loSession.SessionID > 0 )
    *** Create Messages Object to attach messages to
    loMessages = CREATEOBJECT( "MSMAPI.MAPIMessages" )
    loMessages.SessionID = loSession.SessionID
ELSE
    THIS.cErrorMsg = "MAPI Logon failed..."
    CD (lcOldPath)
    RETURN .F.
ENDIF

loMessages.Compose()

Y=0

*** Primary Recipient
IF !EMPTY(THIS.cRecipient)
    DIMENSION laRecips[1]
    lnRecips=APARSESTRING(@laRecips,THIS.cRecipient,",")

    FOR x=1 TO lnRecips
        * Set the Recipient name and resolve
        Y = Y + 1
        loMessages.RecipIndex = y - 1
        loMessages.RecipType = 1
        loMessages.RecipDisplayName = laRecips[x]
        * loMessages.ResolveName()
    ENDFOR
ENDIF

IF !EMPTY(THIS.cCCList)
    *** Primary CCRecipient
    DIMENSION laRecips[1]
    lnRecips=APARSESTRING(@laRecips,THIS.cCCList,",")

    FOR x=1 TO lnRecips
        Y = Y + 1
        * Set the Recipient name and resolve
        loMessages.RecipIndex = Y - 1
        loMessages.RecipType = 2
        loMessages.RecipDisplayName = laRecips[x]
    ENDFOR
ENDIF

IF !EMPTY(THIS.cBCCList)
    *** Primary BCCRecipient
    DIMENSION laRecips[1]
    lnRecips=APARSESTRING(@laRecips,THIS.cBCCList,",")


    FOR x= 1 TO lnRecips
        Y = Y + 1
        * Set the Recipient name and resolve
        loMessages.RecipIndex = Y -1
        loMessages.RecipType = 3
        loMessages.RecipDisplayName = laRecips[x]
        *loMessages.ResolveName()
    ENDFOR
ENDIF
 
**** Attachments
IF !EMPTY(THIS.cAttachment)
    *** Primary BCCRecipient
    DIMENSION laRecips[1]
    lnRecips=APARSESTRING(@laRecips,THIS.cAttachment,",")

    FOR x= 1 TO lnRecips
        * Set the Recipient name and resolve
        loMessages.AttachmentIndex = x -  1       
		loMessages.AttachmentPosition = x - 1
		loMessages.AttachmentName = JustFName( laRecips[x] )
		loMessages.AttachmentPathName = laRecips[x]
    ENDFOR
ENDIF

loMessages.MsgSubject = THIS.cSubject
loMessages.MsgNoteText = THIS.cMessage


*** Send the message and capture the error
loEval = CREATE("wwEval")
loEval.Evaluate([loMessages.SEND( .F. )])

CD (lcOldPath)

loSession.SignOff()

IF loEval.lError
   THIS.cErrorMsg = loEval.cErrorMessage
   RETURN .F.
ENDIF    

RETURN .T.

ENDFUNC
*  wwSmtp ::  SendMapiMail


************************************************************************
* wwSmtp :: Connect
****************************************
***  Function: Connects to the POP server and logs in
***            Sets the message count
***    Assume: user name and password are set
***      Pass: nothing
***    Return: nothing
************************************************************************
FUNCTION Connect

this.CreatewwSmtp()

LOCAL loSMTP as Westwind.wwSmtp
loSmtp = this.oSmtp

loSmtp.MailServer = TRIM(this.cMailServer)
loSmtp.ServerPort = this.nServerPort
loSmtp.UseSsl = this.lUseSsl
loSmtp.Timeout = this.nTimeout * 1000

loSmtp.Username = TRIM(this.cUsername)
loSmtp.Password = TRIM(this.cPassword)

RETURN loSmtp.Connect()
ENDFUNC
*  wwSmtp ::  Close

************************************************************************
* wwSmtp ::  Close
****************************************
***  Function: Closes an SMTP connection opened with Connect
***    Assume: Use when sending multiple messages and SendMessage
***      Pass: 
***    Return:
************************************************************************
FUNCTION Close()
LOCAL loSMTP as Westwind.wwSmtp
loSmtp = this.oSmtp
IF !ISNULL(loSmtp)
	loSmtp.Close()
ENDIF
THIS.cExtraheaders = ""
ENDFUNC
*  wwSmtp ::  Close


************************************************************************
* wwSMTP :: SendMessage
****************************************
***  Function: Sends an individual message. Make sure you've called 
***            the Connect() method before the first call to SendMessage
***            and Close() after the last one
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SendMessage(lcRecipient, lcCC, lcBcc)
LOCAL llResult, lcSubject

this.SetError()

lcSubject=IIF(type("lcSubject")="C",lcSubject,THIS.cSubject)
lcSubject = CHRTRAN(lcSubject,CHR(13)+CHR(10)," ") && Strip out CRLF

LOCAL loSMTP as Westwind.wwSmtp
loSmtp = this.oSmtp

loSmtp.MailServer = TRIM(this.cMailServer)
loSmtp.ServerPort = this.nServerPort
loSmtp.UseSsl = this.lUseSsl

loSmtp.Username = TRIM(this.cUsername)
loSmtp.Password = TRIM(this.cPassword)

loSmtp.Subject = lcSubject
loSmtp.Message = TRIM(this.cMessage)
loSmtp.ContentType = TRIM(this.cContentType)
loSmtp.AlternateText = this.cAlternateText
loSmtp.AlternateTextContentType = this.cAlternateContentType

loSmtp.SenderEmail = TRIM(this.cSenderEmail)
loSmtp.SenderName = TRIM(this.cSenderName)

loSmtp.Attachments = TRIM(this.cAttachment)

*** Message options
loSmtp.ReturnReceipt = this.lReturnReceipt
loSmtp.ReplyTo = this.cReplyTo
loSmtp.Priority = this.cPriority

*** Add explicit headers
loSmtp.AddHeadersFromString(this.cExtraHeaders)


LOCAL loSMTP as Westwind.wwSmtp
loSmtp = this.oSmtp

llResult = loSmtp.SendMessage(this.cRecipient,this.cCCList,this.cBccList)

IF !llResult
	this.SetError(loSmtp.ErrorMessage)
ENDIF

RETURN llResult
ENDFUNC
*  wwSMTP :: SendMail

************************************************************************
* wwSMTP :: SendRecipients
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SendRecipients(lcRecipList)
LOCAL x

IF EMPTY(lcReciplist)
   RETURN 0
ENDIF

DIMENSION laRecips[1]
lnCount = APARSESTRING(@laRecips,lcRecipList,",")
FOR m.x=1 TO lnCount
	IF !EMPTY(laRecips[m.x])
	   lcResult = THIS.oIP.SendReceive("rcpt to: <" + laRecips[m.x] + ">" + CRLF)
	   IF lcResult # "250"
	      RETURN m.x -1
	   ENDIF
	ENDIF
ENDFOR

RETURN lnCount
ENDFUNC
*  wwSMTP :: SendRecipients

************************************************************************
* wwsmtp ::  AddAttachment
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddAttachment(lcFileName, lcContentType)
LOCAL lcType

IF this.nMailMode = 2
	IF !EMPTY(this.cAttachment)
		this.cAttachment =	this.cAttachment + ","
	ENDIF
	this.cAttachment = this.cAttachment + lcFileName	
	RETURN
ENDIF


this.CreatewwSmtp()

LOCAL loBridge as wwDotNetBridge
loBridge = this.oBridge

lcType = VARTYPE(lcFileName)
IF lcType = "O"
	*** Call AddAttachment and pass the Attachment object
	loBridge.InvokeMethod(this.oSMTP,;
						  "AddAttachment",;
						  lcFileName)
	RETURN
ENDIF

lcFileName = FULLPATH(lcFileName)
IF !EMPTY(lcContentType)
	loBridge.InvokeMethod(this.oSMTP,"AddAttachment",lcFileName, lcContentType)
ELSE
	loBridge.InvokeMethod(this.oSMTP,"AddAttachment",lcFileName)
ENDIF

ENDFUNC
*  wwsmtp ::  AddAttachment

************************************************************************
* wwSmtp ::  AddAlternateView
****************************************
***  Function:  Adds an alternative view to the page. Use this to
***             create a view that holds embedded data link images.
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddAlternateView(loAlternateView)

*** Make sure oBridge is available
this.CreatewwSmtp()

LOCAL loBridge as wwDotNetBridge
loBridge = this.oBridge

*** NASTY CODE because the System.NET component pieces are non-com visible
LOCAL loView as System.Net.Mail.AlternateView
loView = loBridge.InvokeStaticMethod("System.Net.Mail.AlternateView",;
									 "CreateAlternateViewFromString",;
									 loAlternateView.cText)
*** Must assign using SetProperty - non-com method								 
loBridge.SetProperty(loView,"ContentType",;
                     loBridge.createinstance("System.Net.Mime.ContentType",loAlternateView.cContentType))
                     
                     
*** Retrieve Resource property
loResources = loBridge.GetProperty(loView,"LinkedResources")

FOR lnX = 1 TO loAlternateView.oLinkedResources.Count
	*** Add linked resource to it - again non-com method
	loBridge.InvokeMethod(loResources,"Add",loAlternateView.oLinkedResources.Item(lnX))
ENDFOR

*** Pass the AlternateView to the .NET component
this.oSmtp.AddAlternateView(loView)

RETURN
ENDFUNC
*  wwSmtp ::  AddAlternateView



************************************************************************
* wwSmtp :: SetError
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
*  wwSmtp :: SetError

ENDDEFINE
*EOC wwSMTP 


*************************************************************
DEFINE CLASS wwSmtpAlternateView AS Custom
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2009
*:Contact: http://www.west-wind.com
*:Created: 09/04/2009
*************************************************************

cText = ""
cContentType = "text/plain"

oLinkedResources = null

************************************************************************
* wwSmtpAlternateView ::  Init
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init()
this.oLinkedResources = CREATEOBJECT([WWC_wwCollection])
ENDFUNC
*  wwSmtpAlternateView ::  Init

************************************************************************
* wwSmtpAlternateView ::  AddLionkedResource
****************************************
***  Function:
***    Assume:
***      Pass: lcFileName  -  file name to resource
***            lcContentType -  ContentType (ie. text/html)
***            lcContentId   -  An identifier for this resource so it 
***                             can be embedded
***    Return: nothing
************************************************************************
FUNCTION AddLinkedResource(lcFileName, lcContentType, lcId)

loBridge = CREATEOBJECT("wwDotNetBridge")
loResource = loBridge.CreateInstance("System.Net.Mail.LinkedResource",lcFileName,lcContentType)
loBridge.SetProperty(loResource,"ContentId",lcId)

this.oLinkedResources.Add(loResource)
ENDFUNC
*  wwSmtpAlternateView ::  AddLionkedResource


ENDDEFINE


