
SET PROCEDURE TO wwFtp Additive
SET PROCEDURE TO wwAPI ADDITIVE


**************************************************
*-- Class:        wwftp (c:\wwapps\wc3\classes\wwipstuff.vcx)
*-- ParentClass:  wwipstuff (c:\wwapps\wc3\classes\wwipstuff.vcx)
*-- BaseClass:    custom
*-- Time Stamp:   12/11/09 01:08:08 AM
*-- The FTP class provides for basic FTP functionality for uploads and downloads
*
#INCLUDE wconnect.h

DEFINE CLASS wwftp AS Custom

HelpContextID = 703

*** The size of the FTPGetEx download buffer. For each buffer chunk the OnFTPBufferUpdate event is fired to allow you to cancel and display status information
nftpworkbuffersize = 4096

*** Cancel flag that can be set in OnFTPBufferUpdate to let wwFTP know to stop downloading a file from the Internet.
lcanceldownload = .F.

*** The FTP Session handle used in Internet Access. One of two (hIPSession is the other)
hftpsession = 0

*** Flag to determine whether FTP file sent is ASCII (0) or Binary (1)
nftpbinary = 1

*** The FTP server to connect to.
cftpserver = ""

*** The Source file to upload from the client or download from the server.
cftpsource = ""

*** The file to download to from the server or upload to on the server.
cftptarget = ""

*** Flag that sets whether to use passive FTP.
lpassiveftp = .F.

*** The filesize of the current file being uploaded or downloaded.
ncurrentfilesize = 0

*** Connection timeout 
nConnectTimeout = 25

nftpport = 0
nhttpport = 21
cserver = ""
cUsername = ""
cPassword = ""

*** Connection mode: 0 - Auto configuration 1 - direct 3 - Proxy
nHttpConnectType = 0

cHttpProxyName = ""
cHttpProxyPassword = ""
cHttpProxyUsername = ""
cHttpProxyByPass = ""

nError = 0
cErrorMsg = ""

hIPSession = 0
cUserAgent = ""
nServiceFlags = 0



PROCEDURE Init
LPARAMETER lcPath

#IF SHAREWARE
WAIT WINDOW NOWAIT ;
  "Welcome to West Wind Internet Protocols..." + CHR(13) + ;
  "This is a shareware copy of wwIPStuff." + CHR(13)+ CHR(13) +;
  "Please register your copy."
#ENDIF
ENDPROC


PROCEDURE Destroy
IF THIS.hIPSession # 0 OR THIS.hFtpSession # 0
   THIS.FtpClose()
ENDIF
ENDPROC



#IF .F.
TEXT
********************************
*   HELP BUILDER COMMENT BLOCK *
********************************
*:Help Documentation
*:Topic:
wwFTP::FTPGetFileEx                                     

*:Description:
Retrieves a file from an FTP site and allows trapping the OnFTPBufferUpdate event. 
This event allows for status information and also cancellation of a download.

*:Parameters:
<<b>>cSourceFile<</b>>
The source file to retrieve from the server.

<<b>>cTargetFile<</b>>
The target file to save it to on the local machine/network.


*:Returns:
numeric - API error code
API Error result codes can be retrieved with wwGetSystemErrorMsg() 

*:Example:
o=create("wwFTP")

o.FTPConnect("ftp.west-wind.com")
o.FTPGetFileEx("/downloads/pkzip.exe","c:\temp\pkzip.exe")


*:Remarks:
Fires OnFTPBufferUpdate events which you can capture to provide progress information on your download.


*:SeeAlso:
Class wwFTP
wwFTP::OnFTPBufferUpdate


*:Keywords:

*:HelpId:
678

*:ENDHELP
ENDTEXT
#ENDIF
PROCEDURE ftpgetfileex
LPARAMETER lcSourceFile, lcTargetFile
LOCAL lhFileHandle, hFTPFile, tcBuffer, tnSize, tnBufferSize, lnRetVal, lnBytesRead, lnBufferReads

DECLARE INTEGER FtpOpenFile ;
   IN WININET.DLL ;
   INTEGER hIPSession,;
   STRING @lpszFileName,;
   INTEGER dwAcessFlags,;
   INTEGER dwServiceFlags,;
   INTEGER dwContext


DECLARE INTEGER InternetReadFile ;
   IN WININET.DLL ;
   INTEGER hFTPHandle,;
   STRING lcBuffer,;
   INTEGER cbBuffer,;
   INTEGER @cbBuffer

lnMode = IIF(this.nFtpBinary = 1, FTP_TRANSFER_TYPE_BINARY,FTP_TRANSFER_TYPE_ASCII)
hFTPFile = FtpOpenFile(THIS.hFTPSession,TRIM(lcSourceFile),;
                       GENERIC_READ,;
                       INTERNET_FLAG_RELOAD + lnMode,0)

IF hFTPFile = 0
   THIS.nError = GetLastError()
   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
   RETURN THIS.nError
ENDIF

DECLARE INTEGER FtpGetFileSize IN WinINet.dll ;
   INTEGER lhFile, LONG @lnSize

lnUpperSize = 0
THIS.nCurrentFileSize =  FtpGetFileSize(hFTPFile,@lnUpperSize)  

*** Build the buffer dynamically
THIS.lCancelDownload = .f.
tcBuffer = ""
tnSize = 0
tnBufferSize = 0
lnRetVal = 0
lnBytesRead = 1
lnBufferReads = 0
lhFileHandle = FCREATE(TRIM(lcTargetFile))
IF lhFileHandle=-1
      THIS.cErrorMsg = "Output file couldn't be created."
      InternetCloseHandle(hFTPFile)
      RETURN FError()
ENDIF

DO WHILE .t.
     lcReadBuffer = REPL(CHR(0),THIS.nFTPWorkBufferSize)
     lnBytesRead = 0
     lnSize = THIS.nFTPWorkBufferSize

     lnRetval=InternetReadFile(hFTPFile,;
		   @lcReadBuffer,;
		   lnSize,;
		   @lnBytesRead)

		IF lnRetVal = 1 AND lnBytesRead > 0
		   *** Update the input parameters - result buffer and size of buffer
		   *tcBuffer = tcBuffer + LEFT(lcReadBuffer,lnBytesRead)
		   =FWRITE(lhFileHandle,LEFT(lcReadBuffer,lnBytesRead) )
		   tnBufferSize = tnBufferSize + lnBytesRead
		   lnBufferReads = lnBufferReads + 1

         *** Event Call through
		   THIS.OnFTPBufferUpdate(tnBufferSize,lnBufferReads,lcReadBuffer,this.nCurrentFileSize,THIS)
		ENDIF
        IF (lnRetVal = 1 AND lnBytesRead = 0) OR (lnRetVal = 0) 
           *** Done
           EXIT
        ENDIF
        IF THIS.lCancelDownload
           =FCLOSE(lhFileHandle)
           ERASE (lcTargetFile)
           EXIT
        ENDIF
ENDDO

InternetCloseHandle(hFTPFile)

lnBufferSize = tnBufferSize

*** Event Call through 
THIS.OnFTPBufferUpdate(0,-1,"",this.nCurrentfilesize,THIS)
this.nCurrentFileSize = 0

=FCLOSE(lhFileHandle)

RETURN 0
ENDPROC


*** Event that fires whenever the buffer is updated by FTPGetFileEx(). This method is passed the current download total and the number of chunks retrieved already. You can set lCancelDownload to .T. to force FTPGetEx to stop the file download.
PROCEDURE onftpbufferupdate
	LPARAMETERS lnbytesdownloaded,lnbufferreads,lccurrentchunk, lnTotalBytes, loFtp

	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::onftpbufferupdate                                    

	*:Description:
	Event that fires whenever the buffer is updated by FTPGetFileEx(). This method is passed the current download total and the number of chunks retrieved already. You can set lCancelDownload to .T. to force FTPGetEx to stop the file download.

	*:Parameters:
	<<b>>lnbytesdownloaded<</b>>
	Total bytes that have been downloaded on this request so far.

	<<b>>lnbufferreads<</b>>
	Total number of buffers that have been read so far.

	<<b>>lccurrentchunk<</b>>
	Content of the current download chunk read. File information is incremental so it's possible to capture text and append it to a file incrementally for possibly viewing information while it's downloading.


	*:Returns:


	*:Example:
	*** Download with Status Events
	SET CLASSLIB TO wwIPStuff additive
	SET PROCEDURE TO wwUtils additive

	PUBLIC o
	o=CREATE("myFTP")
	wait window nowait "Alt-x to abort download..."
	ON KEY LABEL ALT-X o.lCancelDownload = .T.

	IF o.FTPConnect("ftp.west-wind.com") # 0
	   ? o.nError
	   ? o.cErrorMsg
	   RETURN
	ENDIF

	IF o.FtpGetFileEx("wconnect.zip","c:\temp\wconnect.zip")  # 0
	  ? o.nError
	  ? o.cErrorMsg
	  RETURN
	ENDIF


	ON KEY LABEL ALT-X
	RETURN

	*** Implementation of Message Display and abort code

	Define class myFtp as wwFTP

	Function OnFTPBufferUpdate
	LPARAMETER lnBytesDownloaded,lnBufferReads,lcCurrentChunk

	DO CASE
	  CASE lnBufferReads > 0
	     wait window "Downloaded: " + TRANSFORM(lnBytesDownloaded)+ " bytes (Alt-X to cancel)" nowait
	  CASE lnBufferReads = -1
	    wait window "Download aborted..." timeout 2
	ENDCASE
	RETURN
	ENDDEFINE


	*:Remarks:


	*:SeeAlso:
	Class wwftp
	wwftp::lCancelDownload
	wwftp::nFTPWorkBufferSize
	wwftp::FTPGetFileEx
	wwftp::FTPSendFileEx

	*:Keywords:


	*:HelpId:
	679

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Connects to an FTP site and allows passing of a user name and password.
PROCEDURE ftpconnect
	LPARAMETER lcServer, lcUsername, lcPassword
	LOCAL lhIP, lhHTTP, lnError, lnHTTPPort

	lcServer=LOWER(TRIM(IIF(!EMPTY(lcServer),lcServer,THIS.cServer)))
	lcUsername=TRIM(IIF(!EMPTY(lcUsername),lcUsername,THIS.cUsername))
	lcPassword=TRIM(IIF(!EMPTY(lcPassword),lcPassword,THIS.cPassword))

	IF lcServer = "ftp://"
	   lcServer = STRTRAN(lcServer,"ftp://","")
	ENDIF   

	*** Assign Default Ports
	IF THIS.nHTTPPort = 0
	   lnHTTPPort = INTERNET_DEFAULT_FTP_PORT
	ELSE
	   lnHTTPPort = THIS.nHTTPPort
	ENDIF

	IF THIS.lPassiveFTP
	   THIS.nServiceFlags = THIS.nServiceFlags + FTP_CONNECT_PASSIVE
	ENDIF

	THIS.cServer = lcServer
	THIS.nError=0
	THIS.cErrorMsg=""

	DECLARE INTEGER InternetCloseHandle ;
	   IN WinInet.DLL ;
	   INTEGER

	DECLARE INTEGER GetLastError;
	   IN WIN32API

	DECLARE INTEGER InternetOpen ;
	   IN WININET.DLL ;
	   STRING,;
	   INTEGER,;
	   STRING, STRING, INTEGER

	hInetConnection=;
	   InternetOpen(THIS.cUserAgent,;
	   THIS.nhttpconnecttype,;
	   THIS.chttpproxyname,THIS.chttpproxybypass,0)

	IF hInetConnection = 0
	   THIS.nError=GetLastError()
	   THIS.cErrorMsg=THIS.GetSystemErrorMsg(THIS.nError)
	   RETURN THIS.nError
	ENDIF

	THIS.hIPSession=hInetConnection
	THIS.WinInetSetTimeout()

	DECLARE INTEGER InternetConnect ;
	   IN WININET.DLL ;
	   INTEGER hIPHandle,;
	   STRING lpzServer,;
	   INTEGER dwPort, ;
	   STRING lpzUserName,;
	   STRING lpzPassword,;
	   INTEGER dwServiceFlags,;
	   INTEGER dwReserved,;
	   INTEGER dwReserved


	lhFTPSession=;
	   InternetConnect(hInetConnection,;
	   lcServer,;
	   lnHTTPPort,;
	   lcUsername,;
	   lcPassword,;
	   INTERNET_SERVICE_FTP,;
	   THIS.nServiceFlags,0)

	IF (lhFTPSession = 0)
	   lnError = 0
	   lcErrMsg = SPACE(256)
	   lnErrLen = LEN(lcErrMsg)
	   
	   DECLARE INTEGER InternetGetLastResponseInfo ;
	      IN WININET.DLL ;
	      INTEGER @dwError,;
	      STRING @szBuffer,;
	      INTEGER @dwBufferLength
	      
	   lnResult = InternetGetLastResponseInfo(@lnError,@lcErrMsg,@lnErrLen)

	   =InternetCloseHandle(hInetConnection)

	   IF lnError = 0
	      THIS.cErrorMsg = TRIM(STRTRAN(lcErrMsg,CHR(0),""))
	      IF EMPTY(this.cErrorMsg)
	         this.cErrorMsg = "Couldn't connect to FTP Server"
	      ENDIF
	      THIS.nError = 1
	   ELSE
	      THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	      this.nError = lnError
	   ENDIF
	   RETURN THIS.nError
	ENDIF

	THIS.hIPSession = hInetConnection
	THIS.hFTPSession = lhFTPSession

	IF !EMPTY(THIS.cHTtpproxyusername)
	   THIS.SetProxyLogin(,,THIS.hFTPSession)
	ENDIF

	RETURN 0


	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::ftpconnect

	*:Description:
	Connects to an FTP site and allows passing of a user name and password.

	*:Parameters:
	<<b>>cServer<</b>>
	The server to connect to. Example: ftp.west-wind.com or 127.0.0.1

	<<b>>lcUsername<</b>>
	<<i>>Optional<</i>> - username for authenticated connections to the server

	<<b>>lcPassword<</b>>
	<<i>>Optional<</i>> - password for authenticated connections to the server


	*:Returns:


	*:Example:
	oFTP = CREATE("wwFTP")

	oFTP.FTPConnect("ftp.west-wind.com")
	oFTP.FTPGetFile("pkzip.exe","c:\temp\pkzip.exe")
	oFTP.FTPClose()


	*:Remarks:


	*:SeeAlso:
	Class wwftp


	*:Keywords:


	*:HelpId:
	680

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Closes a connection with an FTP Site
PROCEDURE ftpclose

	DECLARE INTEGER InternetCloseHandle ;
	   IN WININET.DLL ;
	   INTEGER hIPSession

	=InternetCloseHandle(THIS.hFTPSession)
	=InternetCloseHandle(THIS.hIPSession)   

	THIS.hFTPSession=0
	THIS.hIPSession=0
	   
	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::ftpconnect                                           

	*:Description:
	Connects to an FTP site and allows passing of a user name and password.

	*:Parameters:
	<<b>>cServer<</b>>
	The server to connect to. Example: ftp.west-wind.com or 127.0.0.1

	<<b>>lcUsername<</b>>
	<<i>>Optional<</i>> - username for authenticated connections to the server

	<<b>>lcPassword<</b>>
	<<i>>Optional<</i>> - password for authenticated connections to the server


	*:Returns:


	*:Example:
	oFTP = CREATE("wwFTP")

	oFTP.FTPConnect("ftp.west-wind.com")
	oFTP.FTPGetFile("pkzip.exe","c:\temp\pkzip.exe")
	oFTP.FTPClose()


	*:Remarks:


	*:SeeAlso:
	Class wwftp


	*:Keywords:


	*:HelpId:
	680

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Uploads a file to an FTP site with event progress information and the ability to cancel.
PROCEDURE ftpsendfileex
	LPARAMETER lcSourceFile, lcTargetFile
	LOCAL lhFile, lnRetVal, lnBytesRead, lnBufferReads, lcWriteBuffer, hFTPFile, lnMode

	this.nError = 0
	this.cErrorMsg = ""

	DECLARE INTEGER FtpOpenFile ;
	   IN WININET.DLL ;
	   INTEGER hIPSession,;
	   STRING @lpszFileName,;
	   INTEGER dwAcessFlags,;
	   INTEGER dwServiceFlags,;
	   INTEGER dwContext

	DECLARE INTEGER InternetWriteFile ;
	   IN WININET.DLL ;
	   INTEGER hFTPHandle,;
	   STRING lcBuffer,;
	   INTEGER cbBuffer,;
	   INTEGER @cbBuffer
	 
	lnMode = IIF(this.nFtpBinary = 1, FTP_TRANSFER_TYPE_BINARY,FTP_TRANSFER_TYPE_ASCII)
	hFTPFile = FtpOpenFile(THIS.hFTPSession,TRIM(lcTargetFile)+CHR(0),;
	                       GENERIC_WRITE,;
	                       lnMode,0)
	IF hFTPFile = 0
	   THIS.nError = GetLastError()
	   IF THIS.nError = 0 
	      this.cErrorMsg = this.GetSystemErrorMsg(ERROR_INTERNET_EXTENDED_ERROR)
	   ELSE
	      THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   ENDIF

	   IF this.nError = 0 
	      IF EMPTY(THIS.cErrorMsg)
	         this.cErrorMsg = "Unable to connect to server..."
	      ENDIF
	      THIS.nError = -1
	   ENDIF
	   RETURN THIS.nError
	ENDIF

	*** Read the file from disk
	lhFile = FOPEN(TRIM(lcSourceFile))
	IF lhFile = -1
	   THIS.cErrorMsg = "Source file doesn't exist or is in use..."
	   THIS.nError = 1
	   RETURN 1
	ENDIF   

	*** Set the file size to upload
	this.nCurrentFileSize = FSEEK(lhFile,0,2)
	FSEEK(lhFile,0,0)

	THIS.lCancelDownload = .f.
	tnBufferSize = 0
	lnBufferReads = 0
	DO WHILE .T.
	   *** Read one chunk at a time
	   lcWriteBuffer = FRead(lhFile,THIS.nFTPWorkBufferSize)
	   IF LEN(lcWriteBuffer) = 0
	      EXIT
	   ENDIF

	   *** And write out each chunk
	   lnSize=LEN(lcWriteBuffer)
	   lnBytesRead = 0
	   lnRetval=InternetWriteFile(hFTPFile,;
			   lcWriteBuffer,;
			   lnSize,;
			   @lnBytesRead)

	      IF (lnRetVal = 0)
	         THIS.nError = GetLastError()
	         THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	         exit
	      ENDIF

	    IF lnRetVal = 1 AND lnBytesRead > 0
		   *** Update the input parameters - result buffer and size of buffer
		   tnBufferSize = tnBufferSize + lnBytesRead
		   lnBufferReads = lnBufferReads + 1
		   THIS.OnFTPBufferUpdate(tnBufferSize,lnBufferReads,"",this.nCurrentFileSize)
		ENDIF
		IF THIS.lCancelDownload
	      THIS.cErrorMsg = "Download canceled by user"
		  EXIT
		ENDIF
	    IF (lnRetVal = 1 AND lnBytesRead = 0) OR (lnRetVal = 0) 
	       EXIT
	    ENDIF
	    
	    DOEVENTS
	ENDDO

	InternetCloseHandle(hFTPFile)
	lnBufferSize = tnBufferSize

	*** Notify Completion
	THIS.OnFTPBufferUpdate(0,-1,"",this.nCurrentFileSize)

	this.nCurrentFileSize = 0
	FCLOSE(lhFile)


	RETURN this.nError

	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::FTPSendFileEx                                        

	*:Description:
	Uploads a file to an FTP site with event progress information and the ability to cancel.

	*:Parameters:
	<<b>>cSourceFile<</b>>
	Local file to send to the server.

	<<b>>cTargetFile<</b>>
	Filename on the server to copy the file to. 


	*:Returns:


	*:Example:


	*:Remarks:
	You must have rights to write to the FTP directory based on the FTP server permissions. Write permissions are not granted to FTP directories by default, so you have to make sure that you can upload files in the first place. You can check this out with your regular FTP client.

	*:SeeAlso:
	Class wwftp
	wwFTP::OnFTPBufferUpdate
	wwFTP::lCancelDownload

	*:Keywords:


	*:HelpId:
	682

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Returns a datetime value from a date time structure (binary form)
PROCEDURE parsefiletime
	LPARAMETER lcFTime
	LOCAL lcSysTime, lnYear, lnMonth, lnDay, lnHour, lnMinute, lnSecond, lcDTime

	DECLARE INTEGER FileTimeToSystemTime ;
	   IN WIN32API ;
	   STRING sFileTime, ;
	   STRING @sSysTime
	 
	   
	lcSysTime = SPACE(16)
	FileTimeToSystemTime( lcFTime, @lcSysTime)
	lnYear = CharToBin(LEFT(lcSysTime,2))
	lnMonth = CharToBin(SUBSTR(lcSysTime,3,2))
	lnDay = CharToBin(SUBSTR(lcSysTime,7,2))
	lnHour = CharToBin(SUBSTR(lcSysTime,9,2))
	lnMinute = CharToBin(SUBSTR(lcSysTime,11,2))
	lnSecond = CharToBin(SUBSTR(lcSysTime,13,2))

	lcDTime =  ALLTRIM(STR(lnYear)) + '-' + ALLTRIM(STR(lnMonth)) + '-' + ALLTRIM(STR(lnDay))  + ' ' + ;
	   ALLTRIM(STR(lnHour)) + ':' + ALLTRIM(STR(lnMinute)) + ':' + ALLTRIM(STR(lnSecond))

	RETURN EVALUATE( "{^" + lcDTime + "}" )
ENDPROC


*** Sends a file via FTP
PROCEDURE ftpsendfile
	LPARAMETERS lcFTPServer, lcSource, lcTarget, lcUsername, lcPassword
	LOCAL lnResult

	lcFTPServer=TRIM(IIF(type("lcFTPServer")="C",lcFTPServer,THIS.cFTPServer))
	lcSource=TRIM(IIF(type("lcSource")="C",lcSource,THIS.cFTPSource))
	lcTarget=TRIM(IIF(type("lcTarget")="C",lcTarget,THIS.cFTPTarget))
	lcUserName=TRIM(IIF(type("lcUserName")="C",lcUserName,THIS.cUsername))
	lcPassword=TRIM(IIF(type("lcPassword")="C",lcPassword,THIS.cPassword))
	lnBinary=THIS.nFTPBinary

	IF (lnBinary = 1)
	   lnBinary = FTP_TRANSFER_TYPE_BINARY
	ELSE
	   lnBinary = FTP_TRANSFER_TYPE_ASCII
	ENDIF
	   
	lnResult = THIS.FTPConnect(lcFTPServer,lcUserName,lcPassWord)
	IF lnResult != 0
	   RETURN lnResult
	ENDIF

	DECLARE Integer FtpPutFile ;
	   IN WinInet.dll ;
	   Integer hFTPSession,;
	   STRING lpzSource,;
	   STRING lpzTarget,;
	   INTEGER nBinary,;
	   INTEGER nReserved
	   
	lnResult=FtpPutFile(THIS.hFTPSession,;
			  lcSource+CHR(0),;
			  lcTarget+CHR(0),;
			  lnBinary,;
			  0)

	IF lnResult = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   THIS.FTPClose()
	   RETURN THIS.nError
	ENDIF

	THIS.FTPClose()
	   
	RETURN 0


	DECLARE INTEGER FTPSendFile ;
	  IN (THIS.cDLLPath) ;
	  STRING cServer,;
	  STRING cSource,;
	  STRING cTarget,;
	  INTEGER nBinary,;
	  STRING cUsername,;
	  STRING cPassword

	THIS.nError = 0


	lnResult=FTPSendFile(lcFTPServer, lcSource, lcTarget, THIS.nFTPBinary, lcUsername,lcPassword)

	IF lnResult # 0

	   THIS.nError = lnResult
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	ENDIF   

	RETURN lnResult
	************************************************************************
	* wwIPStuff :: FTPSendFile
	*********************************
	***  Function: Sends a file from the local machine to an FTP server
	***    Assume: Synchronous method - waits for completion without
	***                                 status reports
	***      Pass: lcFTPServer     -
	***            lcSource        -   Source file on the FTP site
	***            lcTarget        -   Name to save to
	***            lcUsername      -   Username - "" for Anonymous
	***            lcPassword      -   Password - "" for Anonymous
	***    Return: 0 on success - otherwise Win32 API Error Code
	***            12003  -  Permissions error
	***            3      -  Path not found
	***            5      -  Access denied (local file)
	************************************************************************
ENDPROC


*** Receives a file via FTP
PROCEDURE ftpgetfile
	LPARAMETERS lcFTPServer, lcSource, lcTarget, lnBinary, lcUsername, lcPassword

	lnBinary=IIF(EMPTY(lnBinary),FTP_TRANSFER_TYPE_BINARY,lnBinary)

	IF EMPTY(lcFTPServer)
	  lcFTPServer = THIS.cFTPServer
	ENDIF
	IF EMPTY(lcSource)
	  lcSource = THIS.cFTPSource
	ENDIF
	IF EMPTY(lcTarget)
	  lcTarget = THIS.cFTPTarget
	ENDIF
	IF EMPTY(lcUserName)
	   lcUserName = THIS.cUserName  
	ENDIF
	IF EMPTY(lcPassWord)
	   lcPassword = THIS.cPassword    
	ENDIF

	lnResult = THIS.FTPConnect(TRIM(lcFTPServer),TRIM(lcUserName),TRIM(lcPassWord))
	IF lnResult # 0 
	   RETURN lnResult
	ENDIF

	DECLARE Integer FtpGetFile ;
	   IN WinInet.dll ;
		Integer dwIPSession,;
		String cSource,;
		String cTarget, ;
		Integer bNoOverwrite,;
		INTEGER nAttributes, ;
		Integer nFlags, ;
		Integer nContext

	lnResult = FtpGetFile(THIS.hFTPSession,TRIM(lcSource),;
	                     TRIM(lcTarget),0,FILE_ATTRIBUTE_NORMAL,;
	                     lnBinary + INTERNET_FLAG_RELOAD,0)

	IF lnResult = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   THIS.FTPClose()
	   RETURN THIS.nError
	ENDIF

	THIS.FTPClose()
	   
	RETURN 0

	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::FTPGetFile                                           

	*:Description:
	Simple FTP retrieval method. This method retrieves a file from an FTP server with a single method call. This method is synchronous and does not fire any events.

	*:Parameters:
	<<b>>cServer<</b>>
	The server to connect to. Example: <<i>>ftp.west.wind.com<</i>> or <<i>>123.123.123.213<</i>>

	<<b>>cSourceFile<</b>>
	Source File on the FTP Server.

	<<b>>cTargetFile<</b>>
	Target file on the local system. 

	<<b>>cUsername<</b>>
	<<i>>Optional<</i>> - Username when connecting to a secure directory.

	<<b>>cPassword<</b>>
	<<i>>Optional<</i>> - Password when connecting to a secure directory


	*:Returns:


	*:Example:
	o=create("wwFTP")

	o.FTPGetFile("ftp.west-wind.com","/downloads/pkzip.exe",;
	             "c:\temp\pkzip.exe")


	*:Remarks:
	This method provides no mechanism for reporting progress information.

	*:SeeAlso:
	Class wwftp
	wwFTP::FTPGetFileEx

	*:Keywords:


	*:HelpId:
	704

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Retireves an FTP directory listing.
PROCEDURE aftpdir
	LPARAMETERS lafiles,lcfilespec

	IF EMPTY(lcFileSpec)
	   lcFileSpec = "*.*"
	ENDIF

	*** W32_FILE_FIND structure
	lsFileFind = SPACE(320)
	lnFindHandle = 0

	*** Offsets into structure
	#DEFINE POS_FILENAME  45
	#DEFINE POS_FILESIZE  33
	#DEFINE POS_FILEATTRIBUTES 1

	#DEFINE MAX_PATH 260
	#DEFINE DIR_DIMENSIONS 4

	THIS.nError = 0

	DECLARE INTEGER FtpFindFirstFile ;
	   IN WININET.DLL ;
	   INTEGER hFTPSession,;
	   STRING cFileSpec,;
	   STRING @sFileFind,;
	   INTEGER nFlags,;
	   INTEGER nContext

	*** Find the first file and get info into lsFileFind structure
	lnFindHandle = ;
	   FtpFindFirstFile(THIS.hFTPSession,;
	   lcfilespec,;
	   @lsFileFind,;
	   INTERNET_FLAG_RELOAD,0)

	IF lnFindHandle = 0
	   THIS.nError = GetLastError()

	   *** No files should not be considered an error
	   IF THIS.nError = 18
	      THIS.nError = 0
	      RETURN 0
	   ENDIF
	   
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN 0
	ENDIF

	*** Parse out the various fields we're interested in
	DIMENSION lafiles[1,DIR_DIMENSIONS]
	lcFileName = SUBSTR(lsFileFind,POS_FILENAME,MAX_PATH)
	lafiles[1,1] = SUBSTR(lcFileName,1,ATC(CHR(0),lcFileName)-1)

	lcAttributes = SUBSTR(lsFileFind,POS_FILEATTRIBUTES,4)
	lafiles[1,3] = CharToBin(lcAttributes)

	lcSize = SUBSTR(lsFileFind,POS_FILESIZE,4)
	lafiles[1,2] = CharToBin(lcSize)

	laFiles[1,4] = THIS.ParseFileTime(SUBSTR(lsFileFind, 21, 8))

	lnFileCount = 1

	DECLARE INTEGER InternetFindNextFile ;
	   IN WinInet.DLL ;
	   INTEGER hFindHandle,;
	   STRING @lsFileFind


	*** Loop through the file list
	DO WHILE InternetFindNextFile(lnFindHandle,@lsFileFind)  # 0
	   lnFileCount = lnFileCount + 1
	   lcFileName = SUBSTR(lsFileFind,POS_FILENAME,MAX_PATH)
	   DIMENSION lafiles[lnFileCount,DIR_DIMENSIONS]
	   lafiles[lnFileCount,1] = SUBSTR(lcFileName,1,ATC(CHR(0),lcFileName)-1)

	   lcAttributes = SUBSTR(lsFileFind,POS_FILEATTRIBUTES,4)
	   lafiles[lnFileCount,3] = CharToBin(lcAttributes)

	   lcSize = SUBSTR(lsFileFind,POS_FILESIZE,4)
	   lafiles[lnFileCount,2] = CharToBin(lcSize)
	 
	   lafiles[lnFileCount,4] = THIS.ParseFileTime(SUBSTR(lsFileFind, 21, 8))
	ENDDO

	InternetCloseHandle(lnFindHandle)

	RETURN lnFileCount


	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::aFTPDir

	*:Description:
	This method retrieves a directory listing from an FTP directory into an array. The array returns the name, file attributes and size of the file.

	*:Parameters:
	<<b>>@aFiles<</b>>
	Array that contains the list of files. The array has 4 dimensions:

	  1 - Filename
	  2 - File Size
	  3 - File Attribute (numeric)
	  4 - Date Time value (not implemented yet)

	<<b>>cFileSpec<</b>>
	A filespec that specifies which directory to get a listing for. The file spec should include wild card characters like *.* to specify all files or *.txt to show all text files.


	*:Returns:
	numeric - the number of files returned by the directory.
	If this value is 0 you can check the nError and cErrorMsg properties for error conditions, but only if an error occurred.

	*:Example:
	oFTP = CREATE("wwFTP")

	oFTP.FTPConnect("ftp.west-wind.com")

	DIMENSION laFiles[1,4]
	lnResult = oFTP.aFTPDir(@laFiles,"/*.*")
	FOR x=1 to lnResult
	   ? laFiles[x,1],laFiles[x,2],laFiles[x,3]
	ENDFOR

	*:Remarks:
	This method requires that you manually call FTPConnect and FTPClose to open and close the FTP session.

	*:SeeAlso:
	Class wwftp

	*:Keywords:


	*:HelpId:
	703

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


*** Creates a new FTP directory on the server.
PROCEDURE ftpcreatedirectory
	LPARAMETER lcPath

	IF EMPTY(lcPath) 
	   RETURN .F.
	ENDIF
	   
	DECLARE INTEGER FtpCreateDirectory ;
	   IN WININET.DLL ;
	   INTEGER hConnect,;
	   STRING lpszDirectory

	IF FtpCreateDirectory(THIS.hftpsession,lcPath)=0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN .F.
	ENDIF
	
	RETURN .T.	
ENDPROC


*** Removes a directory on the Web server.
PROCEDURE ftpremovedirectory
	LPARAMETER lcPath

	IF EMPTY(lcPath) 
	   RETURN .F.
	ENDIF
	   
	DECLARE INTEGER FtpRemoveDirectory ;
	   IN WININET.DLL ;
	   INTEGER hConnect,;
	   STRING lpszDirectory

	IF FtpRemoveDirectory(THIS.hftpsession,lcPath)=0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN .F.
	ENDIF
	
	RETURN .T.
ENDPROC


*** Deletes file on the server. Must be called after explicitly connecting with FTPConnect first.
PROCEDURE ftpdeletefile
	LPARAMETERS lcfile

	DECLARE INTEGER FtpDeleteFile ;
	   IN WinInet.dll ;
	   INTEGER hFTPSession,;
	   STRING cFileName
	   
	IF FtpDeleteFile(THIS.hFTPSession,lcFile + CHR(0)) = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN THIS.nError
	ENDIF
	   
	RETURN 0

	#IF .F.
	TEXT
	********************************
	*   HELP BUILDER COMMENT BLOCK *
	********************************
	*:Help Documentation
	*:Topic:
	wwftp::FTPDeleteFile                                        

	*:Description:
	Deletes a file on the FTP server.

	*:Parameters:
	<<b>>cFileName<</b>>
	The filename to delete on the server. This filename can include a FTP server relative path such as "/uploads/somefile.txt". No wildcards are allowed.


	*:Returns:
	numeric - Windows API or WinInet API error code. 0 - on success, other on failure

	*:Example:
	oFTP = CREATE("wwFTP")

	oFTP.FTPConnect("ftp.west-wind.com")

	DIMENSION laFiles[1,4]
	IF  oFTP.DeleteFile("/uploads/somefile.txt") # 0
	   ? oFTP.cErrorMsg
	   RETURN
	ENDIF

	? "File deleted..."

	oFTP.Close()

	*:Remarks:
	This method requires that you manually call FTPConnect and FTPClose to open and close the FTP session. 

	In order to delete files you have to have the appropriate rights on the server.

	*:SeeAlso:
	Class wwftp
	wwFTP::FTPConnect
	wwFTP::FTPClose

	*:Keywords:


	*:HelpId:
	702

	*:ENDHELP

	ENDTEXT
	#ENDIF
ENDPROC


PROCEDURE ftpcommand
	LPARAMETER lcCommand, lcBuffer, lnSize

	this.cErrorMsg = ""
	
	DECLARE INTEGER FtpCommand ;
	   IN WININET.DLL ;
	   INTEGER hConnect,;
	   INTEGER fExpectResponse,;
	   INTEGER dwFlags,;
	   STRING lpzCommand,;
	   INTEGER dwContext,;
	   INTEGER @phFTPCommandResultHandle

	lhResult = 0
	lnResult = FtpCommand(THIS.hFTPSession,0,FTP_TRANSFER_TYPE_ASCII,lcCommand,0,@lhResult)
	IF lnResult = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN lnResult
	ENDIF

	IF LEN(lcBuffer) = 0
	   lcBuffer = SPACE(4096)
	   lnSize = LEN(lcBuffer)
	ELSE
	   lnSize = LEN(lcBuffer)
	ENDIF


	DECLARE INTEGER InternetReadFile ;
	   IN WININET.DLL ;
	   INTEGER hFTPHandle,;
	   STRING lcBuffer,;
	   INTEGER cbBuffer,;
	   INTEGER @cbBuffer
	   
	lnBytesRead = 0
	lnRetval=InternetReadFile(lhResult,;
			   @lcBuffer,;
			   lnSize,;
			   @lnBytesRead)

	IF lnRetVal = 1 AND lnBytesRead > 0
	   lnSize = lnBytesRead
	   lcBuffer = SUBSTR(lcBuffer,1,lnBytesRead)
	ELSE
	   lcBuffer = ""
	   lnSize = 0
	ENDIF

	InternetCloseHandle(lhResult)

	RETURN 0
ENDPROC


*** Renames a file on the server. Requires existing connection.
PROCEDURE ftprenamefile
	LPARAMETERS lcOldName, lcNewName

	Declare integer FtpRenameFile ;
	   in wininet.dll ;
	   INTEGER HCONNECT, ;
	   STRING lpszExisting, ;
	   STRING lpszNew

	lnResult = FtpRenameFile(THIS.hftpsession, lcOldName + CHR(0), lcNewName + CHR(0))
	IF lnResult = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   RETURN THIS.nError
	ENDIF
	   
	RETURN 0
ENDPROC


PROCEDURE ftpsetdirectory
	LPARAMETER lcPath

	IF EMPTY(lcPath) 
	   RETURN .F.
	ENDIF
	   
	DECLARE INTEGER FtpSetCurrentDirectory ;
	   IN WININET.DLL ;
	   INTEGER hConnect,;
	   STRING lpszDirectory

	RETURN IIF(FtpSetCurrentDirectory(THIS.hftpsession,lcPath)=0,.F.,.T.)
ENDPROC


PROCEDURE ftpsendfileex2
	LPARAMETERS lcSource, lcTarget

	DECLARE Integer FtpPutFile ;
	   IN WinInet.dll ;
	   Integer hFTPSession,;
	   STRING lpzSource,;
	   STRING lpzTarget,;
	   INTEGER nBinary,;
	   INTEGER nReserved

	lnMode = IIF(this.nFtpBinary = 1, FTP_TRANSFER_TYPE_BINARY,FTP_TRANSFER_TYPE_ASCII)
	lnResult=FtpPutFile(THIS.hFTPSession,;
	        lcSource+CHR(0),;
	        lcTarget+CHR(0),;
	        lnMode,;
	        0)

	IF lnResult = 0
	   THIS.nError = GetLastError()
	   THIS.cErrorMsg = THIS.GetSystemErrorMsg()
	   WAIT WINDOW TIMEOUT 1 this.cErrorMsg
	   THIS.FTPClose()
	   RETURN THIS.nError
	ENDIF

	RETURN 0
ENDPROC


PROCEDURE nftpport_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.nHttpPort = m.vNewVal
this.nFtpPort = m.vNewVal
ENDPROC



************************************************************************
*  SetProxyLogin
****************************************
***  Function: Allows you to specify proxy information for a request
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SetProxyLogin()
LPARAMETERS tcUserName, tcPassword, hIPHandle
LOCAL lcUsername, lcPassword, lpBuffer, lpdwBufferLength, nSuccess

lcUserName = IIF(!EMPTY(tcUserName),tcUserName,THIS.cHTTPProxyUserName)
lcPassword = IIF(!EMPTY(tcPassword),tcPassword,THIS.cHTTPProxyPassword)
hIPHandle = IIF(EMPTY(hIPHandle),THIS.hFtpSession,hIPHandle)

IF EMPTY(lcUsername)
   RETURN
ENDIF   

DECLARE INTEGER InternetSetOption IN WinInet.dll ;
    INTEGER hInternet, ;
    INTEGER dwOption, ;
    STRING @lpBuffer, ;
    LONG lpdwBufferLength

INTERNET_OPTION_PROXY_USERNAME = 43
INTERNET_OPTION_PROXY_PASSWORD = 44

IF !EMPTY(lcUserName)
    lpBuffer = lcUserName 
    dwBufferLength = LEN(lpBuffer) 
    dwOption = INTERNET_OPTION_PROXY_USERNAME
    nSuccess = InternetSetOption(hIPHandle, dwOption, @lpBuffer, dwBufferLength)
    IF nSuccess <> 1
         THIS.nError = GetLastError()
         THIS.cErrorMsg = THIS.GetSystemErrorMsg(THIS.nError)
         RETURN .F.
     ENDIF
ENDIF

IF !EMPTY(lcPassword)
   lpBuffer = lcpassword
   dwBufferLength = LEN(lpBuffer) 
   dwOption = INTERNET_OPTION_PROXY_PASSWORD
   nSuccess = InternetSetOption(hIPHandle, dwOption, @lpBuffer, dwBufferLength)
   IF nSuccess <> 1
      THIS.nError = GetLastError()
      THIS.cErrorMsg = THIS.GetSystemErrorMsg(THIS.nError)
      RETURN .F.
   ENDIF
ENDIF

RETURN .T.
ENDPROC



************************************************************************
* GetLastInternetError
*********************************
***  Function: Retrieves the last WinInet error using WinInet's error 
***            responses.
***      Pass: lnError   -  Error Code to resolve(Optional)
***    Return: Error Message or "" 
************************************************************************
FUNCTION GetLastInternetError
LPARAMETERS lnError

lnError=IIF(type("lnError")="N",lnError,THIS.nError)

DECLARE INTEGER InternetGetLastResponseInfo ;
    IN WININET.DLL ;
    INTEGER @lpdwError,;
    STRING @lpszBuffer,;
    INTEGER @lpcbSize 

lcErrorMsg=SPACE(1024)
lnSize=LEN(lcErrorMsg)

=InterNetGetLastResponseInfo(@lnError,@lcErrorMsg,@lnSize)

IF lnSize < 2
   RETURN ""
ENDIF

RETURN SUBSTR(lcErrorMsg,1,lnSize)
ENDFUNC

********************************************************
* GetSystemErrorMsg
*********************************
***  Function: Returns an Error Message for the last 
***            error value set in nError property.
***    Assume: nError was set by last operation
***    Return: Error String or ""
********************************************************
FUNCTION GetSystemErrorMsg
LPARAMETERS lnErrorNo, llAPI
LOCAL szMsgBuffer,lnSize

lnErrorNo=IIF(type("lnErrorNo")="N",lnErrorNo,THIS.nError)

IF lnErrorNo = ERROR_INTERNET_EXTENDED_ERROR
  RETURN THIS.GetLastInternetError()
ENDIF

szMsgBuffer=SPACE(500)
DECLARE INTEGER FormatMessage ;
     IN WIN32API ;
     INTEGER dwFlags ,;
     INTEGER lpvSource,;
     INTEGER dwMsgId,;
     INTEGER dwLangId,;
     STRING @lpBuffer,;
     INTEGER nSize,;
     INTEGER  Arguments

DECLARE INTEGER GetModuleHandle ;
   IN WIN32API ;
   STRING

lnModule=GetModuleHandle("wininet.dll")
IF lnModule # 0 AND !llAPI
    lnSize=FormatMessage(FORMAT_MESSAGE_FROM_HMODULE,lnModule,lnErrorNo,;
                         0,@szMsgBuffer,LEN(szMsgBuffer),0)
ELSE
  lnSize=0                     
ENDIF                     

IF lnSize > 2
  szMsgBuffer=SUBSTR(szMsgBuffer,1, lnSize -2  )
ELSE
  *** REtry with 12000 less - WinInet return Windows API file error codes
  lnSize=FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,0,lnErrorNo,;
                     0,@szMsgBuffer,LEN(szMsgBuffer),0)

   IF lnSize > 2
      szMsgBuffer="Win32 API: " + SUBSTR(szMsgBuffer,1, lnSize-2 )
   ELSE
      szMsgBuffer=""  
   ENDIF
ENDIF
               
RETURN szMsgBuffer
ENDFUNC


********************************************************
* WinInetSetTimeout
*********************************
***  Function: Sets various timeout for use with a 
***            WinInet Connection
***      Pass: dwTimeoutSecs - Secs to wait for timeout
********************************************************
FUNCTION WinInetSetTimeout
LPARAMETERS dwTimeoutSecs, lnHandle

dwTimeoutSecs=IIF(VARTYPE(dwTimeoutSecs)="N",;
   dwTimeoutSecs,THIS.nconnecttimeout)
   
IF dwTimeoutSecs = 0
   *** Just use the default
   RETURN
ENDIF   

IF EMPTY(lnHandle)
   lnHandle = THIS.hIPSession
ENDIF      

DECLARE INTEGER InternetSetOption ;
   IN WININET.DLL ;
   INTEGER HINTERNET,;
   INTEGER dwFlags,;
   INTEGER @dwValue,;
   INTEGER 

dwTimeoutSecs=dwTimeoutSecs * 1000   && to milliseconds
llRetVal=InternetSetOption(lnHandle,;
   INTERNET_OPTION_CONNECT_TIMEOUT,;
   @dwTimeoutSecs,4)

llRetVal=InternetSetOption(lnHandle,;
   INTERNET_OPTION_RECEIVE_TIMEOUT,;
   @dwTimeoutSecs,4)

llRetVal=InternetSetOption(lnHandle,;
   INTERNET_OPTION_SEND_TIMEOUT,;
   @dwTimeoutSecs,4)

*   dwTimeoutSecs=1  &&// Retry only 1 time
*   llRetVal=InternetSetOption(lnHandle,;
*      INTERNET_OPTION_CONNECT_RETRIES,;
*      @dwTimeoutSecs,4)
ENDFUNC

ENDDEFINE
*
*** EndDefine: wwftp
**************************************************
