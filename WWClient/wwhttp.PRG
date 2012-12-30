#INCLUDE "wconnect.h"

*** Load Library
SET PROCEDURE TO wwHTTP ADDIT

** Load Dependencies
SET PROCEDURE TO wwUtils ADDIT 
SET PROCEDURE TO wwAPI ADDIT

*** Also required:
* wwipstuff.dll  (UrlEncoding and Async operation only)
* zlib.dll  (GZIP content only)

*************************************************************
DEFINE CLASS wwHTTP AS Custom 
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2000
*:Contact: http://www.west-wind.com
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHTTP

*:Description:
A standalone HTTP client library. Same HTTP interfaces
as wwIPStuff, but provided here for lighter environment.

*:Example:

*:Remarks:
Requires wwIPStuff.dll for URLEncoding and Decoding of 
strings larger than 80 characters.

*:SeeAlso:

*:ENDHELP
#ENDIF
**************************************************************
PROTECTED cdllpath
cDllPath = ""

*** Last Error Message Text for the last operation. Implemented only for SMTP and HTTP operations.
cErrorMsg = ""

*** Password to log on to server (applies to FTP and HTTP)
cPassword = ""

*** Username for log in operations (FTP and HTTP).
cUsername = ""

*** Determines whether SSL is used
lSecureLink = .F.

*** Connection timeout for Connection, Send and Read operations
*** if any take longer than the number of seconds here operation will abort
nConnectTimeout = 30

PROTECTED hIPSession, hhttpsession
hhttpsession = 0
hipsession = 0

*** The last error code.
nError = 0

*** Allows to specify how the connection is opened: 1 - Direct, 3 - Proxy (IE 4 and later) and 0 - PreConfig (using IE settings)*
nHttpConnectType = 0

*** HTTP Server Address. Format: www.west-wind.com, or 111.111.111.111
cServer = ""

*** HTTP Link to visit on a site. Site relative URL. Example: /default.asp, /, /wconnect.dll?wwDemo~TestPage
cLink = ""

*** Optional property to allow overriding the HTTP Verb. Defaults to empty
*** which auto-determines between GET and POST depending on whether POST 
*** data is provided
*** Use this option to set other verbs PUT,DELETE etc.
cHttpVerb = ""

*** The port to use for HTTP Connections. If the default value of 0 is used, the HTTP and HTTPS default ports (80 and 443) are used.
nHttpPort = 0

*** Size of the download HTTP buffer used while downloading dynamically sized requests with HTTPGetEx. This is the size of chunks that will be pulled at a time and also determines how often OnHTTPBufferUpdate is called.
nHttpWorkBuffersize = 4096

*** Any extra headers to send to the server. 
cExtraHeaders = ""

*** Any response HTTP headers returned by the request from the server
cHttpHeaders = ""

*** The Content Size based on the HTTP header. Set while reading the header at the
*** beginning of the request. Note this can be 0 if the server is chunking output
*** and isn't returning a content-length.
nContentSize = 0

*** Flag that can be set in OnHTTPBufferUpdate to allow cancellation of the current HTTP download
lHttpCancelDownload = .F.

*** HTTP Post mode determines how requests are posted to the server. 
*** 1 - Form URLEncoded (default)  2 - Multipart forms. 4 - XML or raw buffer This property must be set prior to calling AddPostKey and HTTPGetEx
nHttpPostmode = 1

*** The content type of any data to be posted to the server. 
*** Note this property is used only if nHttpPostMode is not 1 or 2
cContentType = ""

*** The POST buffer used internally 
cPostBuffer = ""

*** Version of the wwIPStuff library. This value should match the DLL Version number.
cversion = TRANSFORM(WWVERSION_NUMBER)

*** The browser name (User Agent) that wwHTTP sends to the server
cUserAgent = "West Wind Internet Protocols " + TRANSFORM(WWVERSION_NUMBER)

*** String that specifies the name or IP address of the proxy server and its port.
cHttpproxyname = ""

*** Address of a string variable that contains an optional list of host names or IP addresses, or both, that should not be routed through the proxy
chttpproxybypass = ""

*** Proxy Authentication info (make sure you use nHTTPConnectType=3)
cHttpProxyUserName = ""
cHttpProxyPassword = ""

*** Optional flags used for InternetOpen calls.
nServiceFlags = 0
nHttpServiceFlags = 0

*** if .T. ignores sercurity certificate warnings
lIgnoreCertificateWarnings = .F.

*** Client certificate index to use
nClientCertNumberIndex = 0

*** The HTTP result code returned by this response - 200, 500, 404 etc.
cResultCode = 0 

*** Determines whether GET requests cached
lCacheRequest = .f.

*** If .T. allows GZip content to be requested. Requires ZLib1.dll
lAllowGZip = .F.


************************************************************************
* wwHTTP :: Init
*********************************
***  Function: Loads the DLL
***      Pass: lcPath  -  Path where to find the DLL. If "" is used
***                       SYSTEM path or local is assumed. Path must
***                       be terminated with a trailing backslash
************************************************************************
FUNCTION INIT
LPARAMETER lcPath

#IF SHAREWARE
   WAIT WINDOW NOWAIT ;
      "Welcome to West Wind Internet Protocols..." + CHR(13) + ;
      "This is a shareware copy of wwHTTP." + CHR(13)+ CHR(13) +;
      "Please register your copy."
#ENDIF

lcPath=IIF(VARTYPE(lcPath)="C",lcPath,"")

THIS.cdllpath=lcPath+"wwIPStuff.dll"

DECLARE INTEGER GetLastError;
   IN WIN32API

DO PATH WITH lcPath
RETURN


************************************************************************
* wwHTTP :: AddPostKey
*********************************
***  Function: Adds POST variables to the HTTP request
***    Assume: depends on nHTTPPostMode setting
***      Pass: 
***    Return:
************************************************************************
FUNCTION AddPostKey(tcKey, tcValue, llFileName)
LOCAL lcOldAlias
tcKey=IIF(VARTYPE(tcKey)="C",tcKey,"")
tcValue=IIF(VARTYPE(tcValue)="C",tcValue,"")

IF tcKey="RESET" OR PCOUNT() = 0
   THIS.cPostBuffer  = ""
   RETURN
ENDIF

*** If we post a raw buffer swap parms
IF PCOUNT() < 2
   tcValue = tcKey
   tcKey = ""
ENDIF

IF !EMPTY(tcKey)
   DO CASE
    *** Url Encoded
    CASE THIS.nhttppostmode = 1
         THIS.cPostBuffer = THIS.cPostBuffer + tcKey +;
            "="+URLEncode(tcValue)+ "&"
    OTHERWISE
      *** Multi-part formvars and file

      *** Check for File Flag -  HTTP File Upload - Second parm is filename
      IF llFileName
         THIS.cPostBuffer = THIS.cPostBuffer + ;
            "--" + MULTIPART_BOUNDARY + CR + ;
            [Content-Disposition: form-data; name="]+tcKey+["; filename="] + tcValue + ["]+CR+CR+;
            FILETOSTR(tcValue) + CR
      ELSE
         THIS.cPostBuffer = THIS.cPostBuffer + ;
            "--" + MULTIPART_BOUNDARY + CR + ;
            [Content-Disposition: form-data; name="]+tcKey+["]+CR+CR+;
            tcValue+CR
      ENDIF
   ENDCASE
ELSE
   *** If there's no Key post the raw buffer
   THIS.cPostBuffer = THIS.cPostBuffer + tcValue
ENDIF

ENDFUNC


************************************************************************
* wwHttp :: AddHeader
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AddHeader(lcKey, lcValue)

lnParmCount = PCOUNT()

DO CASE
  CASE lnParmCount = 0 OR EMPTY(lcKEY)
      this.cExtraheaders = ""
  CASE lnParmCount = 1
      this.cExtraHeaders = this.cExtraHeaders + lcKey + CRLF   
  OTHERWISE
      this.cExtraHeaders = this.cExtraHeaders + lcKey + ": " + lcValue + CRLF
ENDCASE

ENDFUNC
*  wwHttp :: AddHeader

************************************************************************
* wwHttp ::  GetHttpHeader
****************************************
***  Function: Retrieves an HTTP header after an HTTP call has been 
***            made.
***    Assume:
***      Pass: lcHeader - the name of hte header to retrieve
***    Return:
************************************************************************
FUNCTION GetHttpHeader(lcHeader)
RETURN ALLTRIM(Extract(this.cHttpHeaders, lcHeader + ":",CHR(13)))
ENDFUNC
*  wwHttp ::  GetHttpHeader



********************************************************
* wwHTTP :: HTTPConnect
*********************************
***  Function: Connect to an HTTP server.
***    Assume: Sets two handle values in this class Each
***            instance of this class can only manage
***            one HTTP session at a time. Use this low
***            level function for quick repeated access
***            to HTTP pages.
***      Pass: lcServer   - Server name
***            lcUsername - Optional Username
***            lcPassword - Optional Password
***            llHTTPS    - .T. for secure connections
***    Return: 0 on success or WinAPI Errorcode
********************************************************
FUNCTION HTTPConnect
LPARAMETER lcServer, lcUserName, lcPassword, llHTTPS
LOCAL lhIP, lhHTTP, lnError, lnHTTPPort

lcServer=TRIM(IIF(!EMPTY(lcServer),lcServer,THIS.cserver))
THIS.cserver = lcServer
lcServer = LOWER(lcServer)
lcUserName=TRIM(IIF(!EMPTY(lcUserName),lcUserName,THIS.cusername))
lcPassword=TRIM(IIF(!EMPTY(lcPassword),lcPassword,THIS.cpassword))

*** Strip out HTTP:// prefix since this is a common error
IF lcServer = "http://"
   lcServer = STRTRAN(lcServer,"http://","")
ENDIF

IF ATC("http:",lcServer) > 0
   This.nError = -1
   THIS.cerrormsg="You must provide a server name (ie. www.somedomain or 111.111.111.121), not a URL."
   RETURN -1
ENDIF

*** Assign Default Ports
IF THIS.nhttpport = 0
   lnHTTPPort = IIF(llHTTPS or THIS.lSecureLink,;
                    INTERNET_DEFAULT_HTTPS_PORT,;
                    INTERNET_DEFAULT_HTTP_PORT)
ELSE
   lnHTTPPort = THIS.nhttpport
ENDIF

THIS.lsecurelink = llHTTPS OR THIS.lsecurelink

THIS.nerror=0
THIS.cerrormsg=""

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
   
DECLARE INTEGER InternetSetOption ;
   IN WININET.DLL ;
   INTEGER HINTERNET,;
   INTEGER dwFlags,;
   INTEGER @dwValue,;
   INTEGER dwSize

*** Force to Proxy Operation
IF !EMPTY(THIS.cHttpProxyName)
   THIS.nHTTPConnectType = 3  && Proxy
ENDIF

hInetConnection=;
   InternetOpen(THIS.cUserAgent,;
   THIS.nhttpconnecttype,;
   THIS.chttpproxyname,THIS.chttpproxybypass,0)

IF hInetConnection = 0
   THIS.nerror=GetLastError()
   THIS.cerrormsg=THIS.getsystemerrormsg(THIS.nerror)
   RETURN THIS.nerror
ENDIF

THIS.hipsession=hInetConnection

DECLARE INTEGER InternetConnect ;
   IN WININET.DLL ;
   INTEGER hIPHandle,;
   STRING lpzServer,;
   INTEGER dwPort, ;
   STRING lpzUserName,;
   STRING lpzPassword,;
   INTEGER dwServiceFlags,;
   INTEGER dwFlags,;
   INTEGER dwReserved


lhHTTPSession=;
   InternetConnect(hInetConnection,;
   lcServer,;
   lnHTTPPort,;
   lcUserName,;
   lcPassword,;
   INTERNET_SERVICE_HTTP,;
   THIS.nserviceflags,0)


IF (lhHTTPSession = 0)
   =InternetCloseHandle(hInetConnection)
   THIS.nerror = GetLastError()
   THIS.cerrormsg = THIS.getsystemerrormsg()
   RETURN THIS.nerror
ENDIF

THIS.hhttpsession = lhHTTPSession

RETURN 0


********************************************************
* wwHTTP :: HTTPClose
*********************************
***  Function: Closes an HTTP Session.
***    Return: nothing
********************************************************
FUNCTION httpclose

DECLARE INTEGER InternetCloseHandle ;
   IN WININET.DLL ;
   INTEGER hIPSession

*** Always clear the POST buffer after a request
THIS.cPostBuffer = ""

IF THIS.hHTTPSession # 0
  InternetCloseHandle(THIS.hhttpsession)
  THIS.hhttpsession=0
ENDIF
IF THIS.hipSession # 0
  InternetCloseHandle(THIS.hipsession)
  THIS.hipsession=0
ENDIF

ENDFUNC

************************************************************************
* wwHTTP :: HTTPGet
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION HTTPGet()
LPARAMETERS lcUrl, lcUserName, lcPassword, lcOutputFile
LOCAL lnError, lnSize, lcBuffer, szHead, loUrl, llHTTPS, lnResult,;
   hInetConnection, hHTTPResult

*** Handle www.west-wind.com without http:// prefix
IF ATC("http://",lcUrl) < 1 AND ATC("https://",lcUrl) < 1
   lcUrl = "http://" + lcUrl
ENDIF   

THIS.nerror = 0
THIS.cerrormsg = ""

IF VARTYPE(lcUserName) = "N"
   tnBufferSize=lcUserName
   lcUserName = ""
   lcPassword = ""
ELSE
   tnBufferSize = 0
   lcUserName=IIF(EMPTY(lcUserName),"",lcUserName)
   lcPassword=IIF(EMPTY(lcPassword),"",lcPassword)
ENDIF


loUrl = THIS.InternetCrackUrl(lcUrl)
IF VARTYPE(loUrl) # "O" 
   THIS.nError = -1
   THIS.cerrormsg = "Invalid URL passed."
   RETURN ""
ENDIF

llHTTPS = IIF(LOWER(loUrl.cProtocol)="https",.T.,.F.)
this.lSecureLink = llHttps
THIS.nHttpPort=VAL(loUrl.cPort)

lnResult = THIS.HTTPConnect(loUrl.cserver,lcUserName,lcPassword,llHTTPS)
IF lnResult # 0
   RETURN ""
ENDIF

IF tnBufferSize # 0
   lcData=SPACE(tnBufferSize)
   lnSize=tnBufferSize
ELSE
   lcData = ""
   lnSize = 0
ENDIF

lnResult = THIS.HTTPGetEx(loUrl.cPath + loUrl.cQueryString,@lcData,@lnSize,,lcOutputFile)

THIS.HTTPClose()

IF lnResult # 0
   THIS.cerrormsg = THIS.cerrormsg
   RETURN ""
ENDIF

RETURN lcData
ENDFUNC


********************************************************
* wwHTTP :: HTTPGetEx
*********************************
***  Function: Retrieves an HTTP request from the
***            network and returns a string. Read an
***            HTML or data file across the net.
***    Assume: Blocking call - waits for completion
***            before returning. Use AddPostKey
***            to post data to server
***            Must call HTTPConnect/HTTPClose to
***            manage connection to Server.
***      Pass: tcURL        - URL to retrieve
***            tcBuffer     - HTTP result (by Reference)
***            tnBufferSize - Size of the buffer (ref)
***            tcHeaders    - HTTP Headers sent from
***                           client request. Separate
***                           key:value pairs with CR
***            tcFileName   - Optional filename to save
***                           content to to avoid keeping
***                           the entire content in memory
***    Return: WinAPI Error Code (check THIS.cErrorMsg)
*******************************************************
FUNCTION HTTPGetEx
LPARAMETERS tcPage, tcBuffer, tnBufferSize, tcHeaders, tcFileName
LOCAL hHTTPResult, lcOldAlias, lhFile, lcVerb

tcPage=IIF(EMPTY(tcPage),THIS.clink,tcPage)
tnBufferSize=IIF(VARTYPE(tnBufferSize)="N",;
   tnBufferSize,LEN(tcBuffer))

lcOldAlias=ALIAS()

IF THIS.lAllowGZip
	this.AddHeader("Accept-Encoding","gzip")
ENDIF

IF EMPTY(tcHeaders)
   tcHeaders = this.cExtraHeaders 
ENDIF   

IF ATC("http:",This.cServer) > 0
   This.nError = -1
   THIS.cerrormsg="You must provide a server name (ie. www.somedomain or 111.111.111.121), not a URL."
   RETURN -1
ENDIF

THIS.lhttpcanceldownload = .F.
this.nContentSize = 0

THIS.clink = tcPage

IF !EMPTY(THIS.cPostBuffer)
   IF THIS.nHTTPPostMode=1 AND RIGHT(THIS.cPostBuffer,1) = "&"
      THIS.cPostbuffer = LEFT(THIS.cPostbuffer,LEN(THIS.cPostBuffer)-1)
   ENDIF
   tnPostSize=LEN(THIS.cPostBuffer)
   lcPostBuffer= IIF(tnPostSize > 0,THIS.cPostBuffer,NULL)
ELSE
   tnPostSize=0
   lcPostBuffer=NULL
ENDIF

THIS.nerror=0
THIS.cerrormsg=""


*** Force ignoring of Offline Mode
this.SetOption(THIS.hhttpsession,INTERNET_OPTION_IGNORE_OFFLINE,1)

DECLARE INTEGER HttpOpenRequest ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   STRING lpzReqMethod,;
   STRING lpzPage,;
   STRING lpzVersion,;
   STRING lpzReferer,;
   STRING lpzAcceptTypes,;
   INTEGER dwFlags,;
   INTEGER dwContextw

*** Keep alive must be used for Proxies
IF !This.lCacheRequest AND (!EMPTY(THIS.cHTTPProxyName) OR this.nHTTPConnectType = 3)
   THIS.nHTTPServiceFlags = THIS.nHTTPServiceFlags + INTERNET_FLAG_KEEP_CONNECTION 
ENDIF

IF EMPTY(this.cHttpVerb)
	lcVerb = IIF( tnPostSize > 0, "POST","GET")
ELSE
	lcVerb = this.cHttpVerb
ENDIF	

hHTTPResult=HttpOpenRequest(THIS.hhttpsession,;
   lcVerb,;
   tcPage,;
   NULL,NULL,NULL,;
   INTERNET_FLAG_RELOAD + ;
   IIF(THIS.lsecurelink,INTERNET_FLAG_SECURE,0) + ;
   this.nHTTPServiceFlags,0) 

*** Reset the HttpVerb
this.cHttpVerb = ""

IF (hHTTPResult = 0)
   THIS.nerror=GetLastError()
   THIS.cerrormsg=THIS.getsystemerrormsg()
   RETURN THIS.nerror
ENDIF

*** Apply timeout to the HTTP connection handle
THIS.wininetsettimeout(THIS.nConnectTimeOut,hHTTPResult)
THIS.wininetsettimeout(THIS.nConnectTimeOut)

*** This shouldn't be necessary
* THIS.hhttpsession=hHTTPResult

IF this.lIgnoreCertificateWarnings
	this.SetOption(hHttpResult,;
				   INTERNET_OPTION_SECURITY_FLAGS,;
                   SECURITY_FLAG_IGNORE_UNKNOWN_CA + ;
	               SECURITY_FLAG_IGNORE_CERT_DATE_INVALID  +;
	               SECURITY_FLAG_IGNORE_CERT_CN_INVALID + ;
	               SECURITY_FLAG_IGNORE_REVOCATION +;
	               SECURITY_FLAG_IGNORE_WRONG_USAGE)
ENDIF

THIS.OnHttpPostConnect(hHTTPResult)


DECLARE INTEGER HttpSendRequest    ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   STRING lpzHeaders,;
   INTEGER cbHeaders,;
   STRING lpzPost,;
   INTEGER cbPost

IF tnPostSize > 0
   DO CASE
      CASE !EMPTY(this.cContentType)
		 	tcHeaders = "Content-Type: " + this.cContentType + CRLF + tcHeaders      
      CASE THIS.nhttppostmode = 1
         tcHeaders = "Content-Type: application/x-www-form-urlencoded"  + CRLF +;
            IIF(!EMPTY(tcHeaders),CRLF+tcHeaders,"")
      CASE THIS.nhttppostmode = 2
         tcHeaders = "Content-Type: multipart/form-data; boundary=" + MULTIPART_BOUNDARY + CRLF + CRLF +;
            IIF(EMPTY(tcHeaders),"",tcHeaders)

         *** NOTE: extra dashes required to simulate browser operation!
         lcPostBuffer = lcPostBuffer + "--" + MULTIPART_BOUNDARY + CR
         tnPostSize=LEN(lcPostBuffer)
      OTHERWISE      && CASE THIS.nhttppostmode = 4  && XML or Raw
         tcHeaders = "Content-Type: text/xml" + CRLF + tcHeaders		 
   ENDCASE
ELSE
   tcHeaders =  IIF(!EMPTY(tcHeaders),tcHeaders,"")
ENDIF


IF !EMPTY(THIS.cHTTPProxyUserName)
  IF !THIS.SetProxyLogin()
      RETURN THIS.nError
  ENDIF
ENDIF

lnRetval=0

LOCAL llLoop
llLoop = .T.
DO WHILE llLoop
	llLoop = .F. && Exit loop
	this.nError = 0
	
	lnRetval=HttpSendRequest(hHTTPResult,;
	   tcHeaders,LEN(tcHeaders),;
	   lcPostBuffer,tnPostSize)

	IF lnRetval = 0
	   THIS.nerror=GetLastError()

	   IF this.nError = 12044 && ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED
			***  http://www.codeguru.com/cpp/i-n/internet/generalinternet/article.php/c3367
			lnCertNo = this.nClientCertNumberIndex   && the certificate to find by its numeric 0 based order - no API to get cert list

*** For debugging you can uncomment this code to see all certs available				
*!*				DECLARE integer InternetErrorDlg IN WinInet.dll ;
*!*					integer hWindow,;
*!*					integer hInternet,;
*!*					integer hRequest,;
*!*					integer uiflags,;
*!*					DWORD lppvData
*!*			
*!*				lnResult = InternetErrorDlg(_Screen.HWnd,hHttpResult,12044,0x04 + 0x01 + 0x02,0)			
			
	   		DECLARE INTEGER InternetSetOption IN WinInet.dll integer, integer, integer @, integer
			*** INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT = 47 && 12047
	   		InternetSetOption(hHttpResult,47,@lnCertNo,4)
	   		llLoop = .T.
	   		LOOP  && retry now
	   ENDIF
	   
	   THIS.cerrormsg=THIS.getsystemerrormsg()
	   =InternetCloseHandle(hHTTPResult)
	   RETURN THIS.nerror
	ENDIF
ENDDO

*** This code doesn't work as you need to use HttpSendRequestEx()
*** which requires structures that can't be passed easily from
*** VFP because they are nested. As it stands there are no message
*** events provided to the client. All POST operations are synchronous.
*!*   IF !EMPTY(lcPostBuffer)
*!*      lnWritten = 0
*!*      DECLARE integer InternetWriteFile IN WinInet.dll ;
*!*         INTEGER HttpHandle,STRING PostBuffer,INTEGER PostSize,INTEGER  @Written
*!*      lnRetval = InternetWriteFile(hHttpResult,lcPostBuffer,tnPostSize,@lnWritten)
*!*      IF lnRetval = 0
*!*         THIS.nerror=GetLastError()
*!*         THIS.cerrormsg=THIS.getsystemerrormsg()
*!*         =InternetCloseHandle(hHTTPResult)
*!*         RETURN THIS.nerror
*!*      ENDIF
*!*   ENDIF   


DECLARE INTEGER HttpQueryInfo ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   INTEGER nType,;
   STRING @cHeaders,;
   INTEGER @cbHeaderSize,;
   STRING cNULL

*** Retrieve the HTTP Headers
lcHeaders = SPACE(2048)
lnHeaderSize = 2048
lnRetval = HttpQueryInfo(hHTTPResult,;
   HTTP_QUERY_RAW_HEADERS_CRLF,;
   @lcHeaders,@lnHeaderSize,NULL)
THIS.chttpheaders = TRIM(STRTRAN(lcHeaders,CHR(0),""))
  

*** Check the HTTP Result Code
lcHeaders = SPACE(7)
lnHeaderSize = 6
lnRetval = HttpQueryInfo(hHTTPResult,;
   HTTP_QUERY_STATUS_CODE,;
   @lcHeaders,@lnHeaderSize,NULL)
THIS.cResultCode = TRIM(STRTRAN(lcHeaders,CHR(0),""))

#IF .F.
IF this.cResultCode # "200"
   lcHeaders = SPACE(256)
   lnHeaderSize = 255
   lnRetval = HttpQueryInfo(hHTTPResult,;
      HTTP_QUERY_STATUS_TEXT,;
      @lcHeaders,@lnHeaderSize,NULL)
   THIS.nerror=VAL(this.cResultCode)
   THIS.cErrorMsg = TRIM(STRTRAN(lcHeaders,CHR(0),""))
   =InternetCloseHandle(hHTTPResult)
   RETURN THIS.nerror
ENDIF
#ENDIF

IF !EMPTY(this.cHttpHeaders)
	THIS.nContentSize = ;
    	 VAL( EXTRACT(this.cHttpHeaders,CHR(13)+CHR(10) + "Content-length: ",CHR(13)) )
ENDIF     

*** Call HTTP Event method
THIS.OnHTTPBufferUpdate(0,0,THIS.chttpheaders,THIS)

DECLARE INTEGER InternetReadFile ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   STRING @lcBuffer,;
   INTEGER cbBuffer,;
   INTEGER @cbBuffer


IF tnBufferSize > 0
   *** Use Fixed Buffer Size
   tcBuffer=SPACE(tnBufferSize)
   lnBufferSize=tnBufferSize
   lnRetval=InternetReadFile(hHTTPResult,;
      @tcBuffer,;
      tnBufferSize,;
      @tnBufferSize)
ELSE
   *** If a filename was specified output to the file instead of string
   IF !EMPTY(tcFileName)
      lhFile = FCREATE(tcFileName)
      IF lhFile = -1
         THIS.nerror=1
         THIS.cerrormsg="Couldn't create output file"
         =InternetCloseHandle(hHTTPResult)
         RETURN THIS.nerror
      ENDIF
   ENDIF

   *** Build the buffer dynamically
   tcBuffer = ""
   tnSize = 0
   lnRetval = 0
   lnBytesRead = 1
   lnBufferReads = 0
   DO WHILE .T.
      lcReadBuffer = SPACE(THIS.nhttpworkbuffersize)
      lnBytesRead = 0
      lnSize = LEN(lcReadBuffer)

      lnRetval=InternetReadFile(hHTTPResult,;
         @lcReadBuffer,;
         lnSize,;
         @lnBytesRead)

      IF lnRetval = 1 AND lnBytesRead > 0
         *** Update the input parameters - result buffer and size of buffer
         IF EMPTY(tcFileName)
            *** Build string
            tcBuffer = tcBuffer + LEFT(lcReadBuffer,lnBytesRead)
         ELSE
            *** Write to file
            FWRITE(lhFile,lcReadBuffer,lnBytesRead)
         ENDIF
         
         tnBufferSize = tnBufferSize + lnBytesRead
         lnBufferReads = lnBufferReads + 1
         
         THIS.OnHTTPBufferUpdate(tnBufferSize,lnBufferReads,lcReadBuffer,THIS)
      ENDIF
      IF THIS.lhttpcanceldownload
         tcBuffer = "Error: Download canceled"
         tnBufferSize = LEN(tcBuffer)
         THIS.nError = -2
         THIS.cErrorMsg = "Download Cancelled"
         EXIT
      ENDIF
      IF (lnRetval = 1 AND lnBytesRead = 0) OR (lnRetval = 0)
         EXIT
      ENDIF
   ENDDO
   lnBufferSize = tnBufferSize

   IF !EMPTY(tcFileName)
      FCLOSE(lhFile)
   ENDIF

   THIS.OnHTTPBufferUpdate(0,-1,"",THIS)
ENDIF

IF lnRetval = 0
   THIS.nerror=GetLastError()
   THIS.cerrormsg=THIS.getsystemerrormsg()
ENDIF

=InternetCloseHandle(hHTTPResult);

tcBuffer = (IIF(tnBufferSize > 0 AND tnBufferSize <= lnBufferSize,SUBSTR(tcBuffer,1,tnBufferSize),""))

IF this.lAllowGzip AND ATC("Content-Encoding: gzip",this.cHttpHeaders) >0
	tcBuffer = GzipUncompressString(tcBuffer)
ENDIF

RETURN THIS.nerror


************************************************************************
* wwHTTP :: HTTPGetAsync
*********************************
***  Function: Sends an HTTP request but doesn't wait for completion.
***            You can use this one for stress testing. Each request
***            fires off a new thread so make sure you let the
***            thread count catch up before overrunning your machine.
***            Why - use for stress testing.
***      Pass: lcUrl   -    Location to open
***    Return: nothing
************************************************************************
FUNCTION httpgetasync
LPARAMETERS lcUrl
lcUrl=IIF(TYPE("lcUrl")="C",lcUrl,"")

DECLARE INTEGER HTTPGetAsync ;
   IN (THIS.cDLLPath) ;
   STRING cURL

HTTPGetAsync(lcUrl)
RETURN



*!*   ************************************************************************
*!*   * wwHTTP :: HTTPGetHeader
*!*   *********************************
*!*   ***  Function: Retrieves just the HTTP header of a page request.
*!*   ***    Assume: Must call HTTPConnect/HTTPClose to manage connection
*!*   ***            to Server
*!*   ***      Pass: tcPage    -    The Server relative page to view
*!*   ***            tcHeader  -    Buffer to receive headers (by reference)
*!*   ***            tnSize    -    Size of the Buffer (by Reference)
*!*   ***    Return: Win32API Error Code
*!*   ************************************************************************
*!*   LPARAMETERS tcPage, tcHeaders, tnHeaderSize
*!*   LOCAL lnError, lnSize, lcBuffer

*!*   tcHeaders=IIF(TYPE("tcHeaders")="C",tcHeaders,"")
*!*   tnHeaderSize=IIF(TYPE("tnHeaderSize")="N",tnHeaderSize,2048)

*!*   IF !EMPTY(THIS.cPostBuffer)
*!*      tnPostSize=LEN(THIS.cPostBuffer)
*!*      lcPostBuffer= IIF(tnPostSize > 0,THIS.cPostBuffer,NULL)
*!*   ELSE
*!*      tnPostSize=0
*!*      lcPostBuffer=NULL
*!*   ENDIF

*!*   DECLARE INTEGER HttpOpenRequest ;
*!*      IN WININET.DLL ;
*!*      INTEGER hHTTPHandle,;
*!*      STRING lpzReqMethod,;
*!*      STRING lpzPage,;
*!*      STRING lpzVersion,;
*!*      STRING lpzReferer,;
*!*      STRING lpzAcceptTypes,;
*!*      INTEGER dwFlags,;
*!*      INTEGER dwContextw

*!*   hHTTPResult=HttpOpenRequest(THIS.hhttpsession,;
*!*      IIF( tnPostSize > 0, "POST","GET"),;
*!*      tcPage,;
*!*      NULL,NULL,NULL,;
*!*      INTERNET_FLAG_RELOAD + IIF(THIS.lsecurelink,INTERNET_FLAG_SECURE,0),0)


*!*   IF (hHTTPResult = 0)
*!*      THIS.nerror=GetLastError()
*!*      THIS.cerrormsg=THIS.getsystemerrormsg()
*!*      RETURN THIS.nerror
*!*   ENDIF


*!*   DECLARE INTEGER HttpSendRequest    ;
*!*      IN WININET.DLL ;
*!*      INTEGER hHTTPHandle,;
*!*      STRING lpzHeaders,;
*!*      INTEGER cbHeaders,;
*!*      STRING lpzPost,;
*!*      INTEGER cbPost

*!*   lcHeaders=TRIM(tcHeaders)

*!*   lnRetval=HttpSendRequest(hHTTPResult,;
*!*      lcHeaders,LEN(lcHeaders),;
*!*      lcPostBuffer,tnPostSize)

*!*   IF lnRetval = 0
*!*      THIS.nerror=GetLastError()
*!*      THIS.cerrormsg=THIS.getsystemerrormsg()
*!*      RETURN THIS.nerror
*!*   ENDIF

*!*   DECLARE INTEGER HttpQueryInfo ;
*!*      IN WININET.DLL ;
*!*      INTEGER hHTTPHandle,;
*!*      INTEGER nType,;
*!*      STRING @cHeaders,;
*!*      INTEGER @cbHeaderSize,;
*!*      STRING cNULL

*!*   lnRetval = HttpQueryInfo(hHTTPResult,;
*!*      HTTP_QUERY_RAW_HEADERS_CRLF,;
*!*      @tcHeaders,@tnHeaderSize,NULL)
*!*   IF (lnRetval = 0)
*!*      THIS.nerror=GetLastError()
*!*      THIS.cerrormsg=THIS.getsystemerrormsg()
*!*      RETURN THIS.nerror
*!*   ENDIF

*!*   InternetCloseHandle(hHTTPResult);

*!*   tcHeaders = (IIF(tnHeaderSize > 0,SUBSTR(tcHeaders,1,tnHeaderSize-1),""))

*!*   RETURN lnError


********************************************************
* wwHTTP :: HTTPGetExAsync
*********************************
***  Function: Retrieves an HTTP request from the
***            network asynchronously. This means the
***            request fires and returns immediately
***            without an error code. Operation runs on
***            new thread in the background after returing
***            control to VFP.
***
***            This method is fully self contained.
***            You don't need to call HTTPOpen or HTTPClose.
***
***            This method allows full configuration
***            of the request with: POST data, SSL,
***            Passwords and creation of an output
***            file.
***
***            Use AddPostKey to add POST vars. Use lSecureLink
***            to enable SSL operation. Use cUserName and cPassword
***            for passwords.
***
***            Output file option allows for async
***            downloads and later checking for a result.
***            Using a timer it's possible to fire 'events'
***            when the download is complete.
***
***      Pass: tcURL        - Server relative link (/default.asp)
***            tcResultFile - File where result get stored to
***                           Make sure this is file unique...
***            tnResultSize - If you're saving the result you
***                           can use this to specify the size
***                           Default is a small 256 (used for
***                           not checking results).
***      Used: lSecureLink, cUserName, cPassword, AddPostKey()
***    Return: nothing
***            If tcResultFile is passed you can check
***            for this file. On success you'll get the
***            document. On failure you get:
***            Error: <nAPIErrorCode>
*******************************************************
FUNCTION httpgetexasync
LPARAMETERS tcPage, tcResultFile, tnResultSize, tcHeaders, tnSecondsBeforeDelete
LOCAL hHTTPResult

*** Post Buffer and lSecureLink also apply via properties
tcServer=THIS.cserver
tcPage=IIF(EMPTY(tcPage),"/",tcPage)
tcUserName=THIS.cusername
tcPassword=THIS.cpassword
tcResultFile=IIF(EMPTY(tcResultFile),"",tcResultFile)
tnResultSize=IIF(EMPTY(tnResultSize),256,tnResultSize)
tnSecondsBeforeDelete = IIF(EMPTY(tnSecondsBeforeDelete),0,tnSecondsBeforeDelete)

IF !EMPTY(THIS.cPostBuffer)
   tnPostSize=LEN(THIS.cPostBuffer)
   lcPostBuffer= IIF(tnPostSize > 0,THIS.cPostBuffer,NULL)
ELSE
   tnPostSize=0
   lcPostBuffer=""
ENDIF


IF tnPostSize > 0
   IF EMPTY(tcHeaders)
      IF THIS.nhttppostmode = 1
         tcHeaders = "Content-Type: application/x-www-form-urlencoded"  + CR+;
            IIF(!EMPTY(tcHeaders),CR+tcHeaders,"")
      ELSE
         tcHeaders = "Content-Type: multipart/form-data; boundary=" + MULTIPART_BOUNDARY + CR + CR +;
            IIF(EMPTY(tcHeaders),"",tcHeaders)

         IF tnPostSize > 0
            lcPostBuffer = lcPostBuffer + MULTIPART_BOUNDARY + CR
            tnPostSize=LEN(lcPostBuffer)
         ENDIF
      ENDIF
   ENDIF
ELSE
   tcHeaders =  IIF(!EMPTY(tcHeaders),tcHeaders,"")
ENDIF

lcOldAlias=ALIAS()

DECLARE INTEGER HTTPGetExAsync ;
   IN WWIPSTUFF.DLL ;
   INTEGER hInternet,;
   INTEGER hHTTP,;
   STRING SERVER,;
   STRING PAGE,;
   STRING BUFFER,;
   INTEGER BufferSize,;
   STRING HEADER,;
   STRING POST,;
   INTEGER POSTSIZE,;
   INTEGER SECURE,;
   INTEGER CONNECTTYPE,;
   STRING Username, STRING PASSWORD,;
   STRING ResultFile,;
   INTEGER ResultSize,;
   INTEGER DeleteFileSeconds

tcBuffer = SPACE(256)
tnBufSize = LEN(tcBuffer)-1
lnRet = HTTPGetExAsync(THIS.hipsession, THIS.hhttpsession,;
   tcServer,;
   tcPage,;
   tcBuffer,tnBufSize,;
   tcHeaders,;
   lcPostBuffer, tnPostSize,;
   IIF(THIS.lsecurelink,1,0),;
   THIS.nhttpconnecttype,;
   tcUserName, tcPassword,;
   tcResultFile,tnResultSize, tnSecondsBeforeDelete)

*** Cause HTTPClose() to have no effect on these
*** handles - the C thread code will clean these up
THIS.hIPSession = 0
THIS.hHTTPSession = 0

RETURN


************************************************************************
* wwHttp :: HTTPGetHeader
*********************************
***  Function: Retrieves just the HTTP header of a page request.
***    Assume: Must call HTTPConnect/HTTPClose to manage connection
***            to Server
***      Pass: tcPage    -    The Server relative page to view
***            tcHeader  -    Buffer to receive headers (by reference)
***            tnSize    -    Size of the Buffer (by Reference)
***    Return: Win32API Error Code
************************************************************************
FUNCTION HTTPGetHeader
LPARAMETERS lcUrl, lcUserName, lcPassword
LOCAL lnError, lnSize, lcBuffer, lcHeaders

IF EMPTY(lcUsername)
  lcUsername = ""
ENDIF
IF EMPTY(lcPassword)
  lcPassword = ""
ENDIF

THIS.nError = 0

IF USED("wwPostBuffer")
   SELE wwPostBuffer
   tnPostSize=LEN(wwPostBuffer.cPostBuffer)
   lcPostBuffer= IIF(tnPostSize > 0,wwPostBuffer.cPostBuffer,NULL)
ELSE
   tnPostSize=0
   lcPostBuffer=NULL
ENDIF

LOCAL loUrl, llHttps, lnResult
loUrl = THIS.InternetCrackUrl(lcUrl)
IF VARTYPE(loUrl) # "O" 
   THIS.nError = -1
   THIS.cerrormsg = "Invalid URL passed."
   RETURN ""
ENDIF

llHTTPS = IIF(LOWER(loUrl.cProtocol)="https",.T.,.F.)
this.lSecureLink = llHttps
THIS.nHttpPort=VAL(loUrl.cPort)

lnResult = THIS.HTTPConnect(loUrl.cserver,lcUsername,lcPassword,llHTTPS)
IF lnResult # 0
   RETURN ""
ENDIF

DECLARE INTEGER HttpOpenRequest ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   STRING lpzReqMethod,;
   STRING lpzPage,;
   STRING lpzVersion,;
   STRING lpzReferer,;
   STRING lpzAcceptTypes,;
   INTEGER dwFlags,;
   INTEGER dwContextw

hHTTPResult=HttpOpenRequest(THIS.hHTTPSession,;
   "HEAD",;
   loUrl.cPath + loUrl.cQueryString,;
   NULL,NULL,NULL,;
   INTERNET_FLAG_RELOAD + IIF(THIS.lSecureLink,INTERNET_FLAG_SECURE,0),0)


IF (hHTTPResult = 0)
   THIS.nError=GetLastError()
   THIS.cErrorMsg=THIS.GetSystemErrorMsg()
   InternetCloseHandle(hHttpResult)	
   this.HttpClose()
   RETURN THIS.nError
ENDIF


DECLARE INTEGER HttpSendRequest    ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   STRING lpzHeaders,;
   INTEGER cbHeaders,;
   STRING lpzPost,;
   INTEGER cbPost


lcHeaders = TRIM(this.cExtraHeaders)

lnRetval=HttpSendRequest(hHTTPResult,;
   lcHeaders,LEN(lcHeaders),;
   lcPostBuffer,tnPostSize)

IF lnRetval = 0
   THIS.nError=GetLastError()
   THIS.cErrorMsg=THIS.GetSystemErrorMsg()
   InternetCloseHandle(hHttpResult)	
   this.HttpClose()
   RETURN THIS.nError
ENDIF

DECLARE INTEGER HttpQueryInfo ;
   IN WININET.DLL ;
   INTEGER hHTTPHandle,;
   INTEGER nType,;
   STRING @cHeaders,;
   INTEGER @cbHeaderSize,;
   STRING cNULL


*** Capture the headers
lcHeaders = SPACE(50000)
lnHeaderSize = LEN(lcHeaders)
lnRetval = HttpQueryInfo(hHTTPResult,;
   HTTP_QUERY_RAW_HEADERS_CRLF,;
   @lcHeaders,@lnHeaderSize,NULL)

IF (lnRetval = 0)
   THIS.nError=GetLastError()
   THIS.cErrorMsg=THIS.GetSystemErrorMsg()
   RETURN THIS.nError
ENDIF

InternetCloseHandle(hHTTPResult)
this.HttpClose()

tcHeaders = (IIF(lnHeaderSize > 1,SUBSTR(lcHeaders,1,lnHeaderSize-1),""))

RETURN tcHeaders


FUNCTION OnHttpPostConnect
LPARAMETERS lnHTTPHandle
ENDFUNC

*** Gets called whenever the buffer is updated on an HTTPGetEx update. Only applies if the buffer size is set to 0 (Automatic sizing)
FUNCTION OnHTTPBufferUpdate
   LPARAMETER lnBytesDownloaded,lnBufferReads,lcCurrentChunk, loHTTP
ENDFUNC


*** Cancels an HTTPGetEx download if the buffer is sized dynamically
FUNCTION httpcanceldownload
   THIS.lhttpcanceldownload = .T.
ENDFUNC


************************************************************************
* wwHTTP :: UnZipFiles
*********************************
***  Function: Unzips files to a specified directory
***    Assume: Requires DynaZip DLLs (dunzip32.dll)
***      Pass: lcZipFile
***            lcDestination  -  Dir to unzip to
***            lcFileSpec     -  Files to unzip (*.*)
***    Return: DynaZip Error Code or 0 on success
************************************************************************
FUNCTION UnZipFiles
LPARAMETERS lcZipFile, lcDestination, lcFileSpec
* Defer to wwUtils UnzipFiles
RETURN UnzipFiles(lcZipFile,lcDestination,lcFileSpec)
ENDFUNC
* wwHTTP :: UnZipFiles

************************************************************************
* wwHTTP :: ZipFiles
*********************************
***  Function: Zips files
***    Assume: Function requires DynaZip DLLs (dzip32.dll)
***      Pass: lcZipFile   - Fully qualified ZIP file name 
***            lcFileList  - Comma Delimited file list (Wildcards OK)
***    Return: DynaZip error code or 0
************************************************************************
FUNCTION ZipFiles
LPARAMETERS lcZipFile, lcFileList, lnCompression, llRecurse
* defer to wwUtils ZipFiles
RETURN ZipFiles(lcZipFile,lcFileList,lnCompression,llRecurse)
ENDFUNC
* wwHTTP :: ZipFiles


************************************************************************
* wwHTTP :: DecodeDBF
*********************************
FUNCTION DecodeDBF
LPARAMETERS lcBuffer,lcDBF
* defer to wwUtils DecodeDbf
RETURN DecodeDbf(@lcBuffer,lcDbf)
ENDFUNC
* wwHTTP :: DecodeDBF


********************************************************
* wwHTTP :: EncodeDBF
*********************************
FUNCTION EncodeDBF
LPARAMETERS lcDBF, llHasMemo, lcEncodedName
* defer to wwutils::EncodeDbf
RETURN EncodeDbf(lcDbf,llHasMemo,lcEncodedName)
* eof EncodeDbf
  


************************************************************************
* wwHTTP :: SetProxyLogin
****************************************
***  Function: Sets the HTTP Proxy username and password
***      Pass: tcUserName
***            tcPassword
***            hIPHandle   - HTTP Request handle (optional)
***    Return: .T. or .F.
************************************************************************
PROTECTED FUNCTION SetProxyLogin(tcUserName, tcPassword, hIPHandle)
LOCAL lcUsername, lcPassword, lpBuffer, lpdwBufferLength, nSuccess

lcUserName = IIF(!EMPTY(tcUserName),tcUserName,THIS.cHTTPProxyUserName)
lcPassword = IIF(!EMPTY(tcPassword),tcPassword,THIS.cHTTPProxyPassword)

*hIPHandle = IIF(EMPTY(hIPHandle),THIS.hHTTPSession,hIPHandle)
hIPHandle = IIF(EMPTY(hIPHandle),THIS.hIpSession,hIPHandle)

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
    lpBuffer = lcUserName + CHR(0)
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
   lpBuffer = lcpassword + CHR(0)
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
ENDFUNC


************************************************************************
* wwHTTP ::  SetOption
****************************************
***  Function: Sets an Internet Option for a given Id.
***    Assume: This option only works with numeric values
***      Pass:
***    Return:
************************************************************************
FUNCTION SetOption(lnHandle,lnOptionId,lnOptionValue)
LOCAL lnResult

DECLARE INTEGER InternetSetOption ;
   IN WININET.DLL ;
   INTEGER HINTERNET,;
   INTEGER dwFlags,;
   INTEGER @dwValue,;
   INTEGER cbSize

*** Set needed SSL flags
lnResult=InternetSetOption(lnHandle,;
   lnOptionId ,;
   @lnOptionValue ,4)

IF lnResult = 1
   RETURN .t.
ENDIF

RETURN .F.   
ENDFUNC
*  wwHTTP ::  SetOption


************************************************************************
* wwHTTP :: HTTPPing
****************************************
***  Function: Checks whether a site is up by a timeout value
***    Assume: IE 5.5 or later is installed
***      Pass: lnTimeout   -   in seconds
***            lcServer    -   (ie. http://www.west-wind.com/somepage.htm)
***            lcLink      -   optional link to hit (/default.htm)
***    Return:
************************************************************************
FUNCTION httpping
LPARAMETER lnTimeout, lcServer, lcLink
LOCAL lcFile, llSuccess, lnHandle

IF EMPTY(lcLink)
   lcLink = "/"
ENDIF

lnSaveTimeout = THIS.nConnectTimeout
THIS.nConnectTimeout = lnTimeout

IF (LOWER(lcServer) = "http://" OR LOWER(lcServer) = "https://")
   *** Processing a full Url
   lcResult = this.HttpGet(lcServer)
ELSE   
   lcResult = THIS.HTTPGet("http://" + lcServer + lcLink)
ENDIF

THIS.nConnectTimeout = lnSaveTimeout

IF THIS.nError = 0
   RETURN .T.
ENDIF

RETURN .F.


************************************************************************
* wwHTTP :: InternetCrackUrl
*********************************
***  Function: Breaks out a URL into its component pieces
***      Pass: lcURL  -  URL to crack
***    Return: loUrl  or NULL
************************************************************************
FUNCTION InternetCrackUrl
LPARAMETERS lcUrl
LOCAL  lnAT, lcProtocol, lcQuerystring, lcPort, lcServer

*lcUrl = LOWER(lcUrl)

*** Find the querystring first
lnAT = AT("?",lcUrl)
IF lnAT > 0
   lcQuerystring = SUBSTR(lcUrl,lnAT)
   lcUrl = LEFT(lcUrl,lnAT-1)
ELSE
   lcQuerystring = ""
ENDIF

lnAT = AT("://",lcUrl)
IF lnAT < 1
   RETURN .NULL.
ENDIF

lcProtocol = lower(LEFT(lcUrl,lnAT-1))
DO CASE
CASE lcProtocol == "http"
   lcPort = "80"
CASE lcProtocol == "https"
   lcPort = "443"
CASE lcProtocol == "ftp"
   lcPort = "21"
OTHERWISE
   *** Assume HTTP
   lcPort = "80"   
ENDCASE

lcUrl = SUBSTR(lcUrl,lnAT + 3)
lnAT = AT(":",lcUrl)

IF lnAT > 0
   lcPort = Extract(lcUrl,":","/",,.T.)
   lcServer = LEFT(lcUrl,lnAT-1)
   lcUrl = SUBSTR(lcUrl,lnAT + LEN(lcPort) + 1)
ELSE
   lnAT = AT("/",lcUrl)
   IF lnAT = 0
      lcServer = lcUrl
      lcUrl = ""
   ELSE
      lcServer = SUBSTR(lcUrl,1,lnAT-1)
      lcURL = SUBSTR(lcUrl,lnAt) 
   ENDIF
ENDIF

loUrl = CREATE("RELATION")
loUrl.ADDPROPERTY("cProtocol",lcProtocol)
loUrl.ADDPROPERTY("cServer",lcServer)
loUrl.ADDPROPERTY("cPath",lcUrl)  && What's left of the url
loUrl.ADDPROPERTY("cquerystring",lcQuerystring)
loUrl.ADDPROPERTY("cPort",lcPort)

*** Not implementented
loURL.AddProperty("cUserName","")
loUrl.AddProperty("cPassword","")

RETURN loUrl
ENDFUNC
* wwHTTP :: InternetCrackUrl   FUNCTION InternetCrackUrl

********************************************************
* wwHTTP :: WinInetSetTimeout
*********************************
***  Function: Sets various timeout for use with a
***            WinInet Connection
***      Pass: dwTimeoutSecs - Secs to wait for timeout
********************************************************
FUNCTION wininetsettimeout
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
RETURN



************************************************************************
* wwHTTP :: GetLastInternetError
*********************************
***  Function: Retrieves the last WinInet error using WinInet's error
***            responses.
***    Assume: Currently not used by class internally
***            Under Construction
***      Pass: lnError   -  Error Code to resolve(Optional)
***    Return: Error Message or ""
************************************************************************
   FUNCTION getlastinterneterror
   LPARAMETERS lnError

   lnError=IIF(TYPE("lnError")="N",lnError,THIS.nerror)

   DECLARE INTEGER InternetGetLastResponseInfo ;
      IN WININET.DLL ;
      INTEGER @lpdwError,;
      STRING @lpszBuffer,;
      INTEGER @lpcbSize

   lcErrorMsg=SPACE(1024)
   lnSize=LEN(lcErrorMsg)

   =InternetGetLastResponseInfo(@lnError,@lcErrorMsg,@lnSize)

   IF lnSize < 2
      RETURN ""
   ENDIF

   RETURN SUBSTR(lcErrorMsg,1,lnSize)
ENDFUNC

************************************************************************
* wwHTTP :: GetPostBuffer
*********************************
***  Function: Returns the entire Post Buffer as a string
************************************************************************
FUNCTION getpostbuffer
RETURN THIS.cPostBuffer
ENDFUNC


********************************************************
* wwHTTP :: GetSystemErrorMsg
*********************************
***  Function: Returns an Error Message for the last
***            error value set in nError property.
***    Assume: nError was set by last operation
***    Return: Error String or ""
********************************************************
FUNCTION getsystemerrormsg
LPARAMETERS lnErrorNo, llAPI
LOCAL szMsgBuffer,lnSize

lnErrorNo=IIF(TYPE("lnErrorNo")="N",lnErrorNo,THIS.nerror)

IF lnErrorNo = ERROR_INTERNET_EXTENDED_ERROR
   RETURN THIS.getlastinterneterror()
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



************************************************************************
* wwHTTP :: Destroy
*********************************
***  Function: Clears HTTP Session Handles if open
************************************************************************
FUNCTION DESTROY

IF THIS.hipsession # 0 OR THIS.hhttpsession # 0
   THIS.httpclose()
ENDIF

ENDFUNC



ENDDEFINE
*** EndDefine: wwHTTP
**************************************************
