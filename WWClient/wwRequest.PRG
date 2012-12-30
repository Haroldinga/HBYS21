*************************************************************
DEFINE CLASS wwRequest AS RELATION
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 1999
*:Contact: http://www.west-wind.com/
*************************************************************
#INCLUDE wconnect.h

#IF .F.
*:Help Documentation
*:Topic:
Class wwRequest

*:Description:
Web Connection Request input class. Serves as input class
that retrieves HTML form vars, server variables and client
status info.

*:ENDHELP
#ENDIF
*************************************************************

*-- Raw Web Server environment variables.
cServerVars = ""

*-- URL Query string or parameter string
cQuerystring = ""

*-- Raw URLEncoded HTML Form variables
cFormVars = ""

*-- If .T. Request.Form retrieves variables from an XML document contained in the form buffer rather than regular post variables.
lUseXMLFormVars = .F.

*-- When set assumes form variables and querystring values where posted in UTF 8 format
lUtf8Encoding = .F.

*-- Filter Unsafe Commands like EVAL, EXECSTR in FORM and QUERYSTRING results
lFilterUnsafeCommands = WWWC_FILTER_UNSAFECOMMANDS

*-- API access object
oapi = .NULL.

*-- local reference to an wwXML object when parsing XML form vars
oxml = .NULL.

*-- File that receives HTTP output when running file based
cOutputfile = ""

*-- Actual location of the Temporary path. This path is used to override any 'physical' paths to point to the network path instead.
cpathoverride = ""

cRequestId = ""

cApplicationPath = ""

DIMENSION aparms[1]
nparmcount = 0

*-- Full path of the script that's running
PROTECTED cMultiPartBorder
cphysicalpath = ""
cMultiPartBorder = ""

*** 0 - Not a POST - 1 - Form URLEncoded (default)  2 - Multipart forms. 4 - XML or raw buffer This property must be set prior to calling AddPostKey and HTTPGetEx
nPostMode = 1 

*********************************************************************

**** CONFIGURATION METHODS

*********************************************************************


*********************************************************************
FUNCTION Init()
***************

*** Init fires only once per server lifetime - server creates
*** this object on startup and then InitializeRequest() on each
*** hit to reconfigure with new request information

THIS.oAPI = CREATE("wwApi")

#IF WWC_LOAD_WWXML
    THIS.oXML = CREATE("wwXML")
#ENDIF

ENDFUNC
* EOF wwRequest::Init


*********************************************************************
FUNCTION ParseQueryString()
***************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::ParseQueryString

*:Description:
Parses the Querystring into an array based on the separating
character (~). The array is used for quick access to the positional
parameters.
*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lnX, lnSize

tcParmString=THIS.cQueryString

IF EMPTY(tcParmString)
*   THIS.aParms=0
   THIS.nParmCount=0
   RETURN 0
ENDIF

*** Translate spaces first
tcParmString=CHRTRAN(tcParmString,"+"," ")

*** Now get parameters 
 
*** Old AOL browsers have probs with ~ char
tcParmString=STRTRAN(tcParmString,"%7E","~")

*** Convert parameters to indivdual lines of text
tcParmString=STRTRAN(tcParmString,"~",CHR(13)+CHR(10))

*** Parse parameters into Array
* THIS.aParms = 0  && Clear out array JIC - slow!
lnSize=ALINES(THIS.aParms,tcParmString)

IF lnSize=0
   THIS.aParms=0
   THIS.nParmCount=0
   RETURN 0
ENDIF   

THIS.nParmCount = lnSize

RETURN lnSize
ENDFUNC
* EOF wwRequest::ParseQueryString


*********************************************************************

**** Generic retrieval methods - these are always the same for
**** each request mechanism

*********************************************************************



*********************************************************************
FUNCTION GetIPAddress()
***********************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetIpAddress

*:Description:
Returns the client's IP Address.

*:Returns:
IP Address as a string.

*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("REMOTE_ADDR")
ENDFUNC
* EOF wwRequest::GetIPAddress


************************************************************************
* wwRequest :: GetLanguage
****************************************
***  Function: returns the default language of the user
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetLocale(laLanguages)
LOCAL lcLanguage, lcOrigLanguages

lcOrigLanguages = this.GetExtraHeader("HTTP_ACCEPT_LANGUAGE")
lcLanguage = lcOrigLanguages
lnAt = AT(",",lcLanguage)
IF lnAt > 1
   lcLanguage = SUBSTR(lcLanguage,1,lnAt-1)
ENDIF

*** Default to en-us
IF EMPTY(lcLanguage)
   DIMENSION laLanguages[1]
   laLanguages[1] = "en-us"
   RETURN "en-us"
ENDIF

*** If there's no locale info assume 'generic' locale (ie. en-en or fr-fr)
IF LEN(lcLanguage) = 2
   lcLanguage = lcLanguage + "-" + lcLanguage
ENDIF

IF PCOUNT() > 0
   LOCAL lnX, lnCount
   
   lnCount = ALINES(laLanguages,lcOrigLanguages,[,])
   
   FOR lnX = 1 TO lnCount
      IF LEN(laLanguages[lnX]) = 2
         laLanguages[lnX]  = laLanguages[lnX] + "-" + laLanguages[lnX]
      ENDIF
   ENDFOR
ENDIF

RETURN lcLanguage
ENDFUNC
*  wwRequest :: GetLanguage


*********************************************************************
FUNCTION GetPhysicalPath()
**************************
#IF .F.
*:Help Documentation
*:Topic:
wwrequest::getphysicalpath

*:Description:
Returns the physical path to a script mapped page or an executable DLL
file. The physical path is a great tool for capturing the system specific
path of script mapped pages, so you can capture the location of the page
for further parsing.

For example, Web Connection uses the Physical Path to capture scripts and
uses the physical path to read in the original page, then parses it using
the wwVFPScript script parser. Regardless of where the page was called from
the physical path always returns the correct location for the file.


*:Remarks:
If you're using any remote servers you have to be careful about the
physical path. The physical path will always be returned with a Web server
specific path. If you're running remotely via a DCOM object or remote
filebased server, C:\inetpub\wwwroot\myapp is not a valid path to pull the
script page from, so you need to fix up the path.

You can do this by usign assiging a drive override which can use VFP's
FORCEDRIVE() or a full path override by using FULLPATH to adjust the path
for the full location.

*:ENDHELP
#ENDIF
*********************************************************************
IF EMPTY(THIS.cPhysicalPath)
   THIS.cPhysicalPath = THIS.ServerVariables("PHYSICAL_PATH")
   IF LEN(this.cPhysicalPath) > 255 
   	this.cPhysicalPath = "INVALIDPATH.invalid"
   ENDIF
ENDIF   
RETURN THIS.cPhysicalPath
ENDFUNC
* EOF wwRequest::GetPhysicalPath


*********************************************************************
FUNCTION GetLogicalPath()
*************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetLogicalpath

*:Description:
Returns the web server relative path of the current request. For example:

<<pre>>http://www.west-wind.com/wconect/TestPage.wwd<</pre>>
returns:

<<pre>>/wconnect/TestPage.wwd<</pre>>

The path is always in Web format with forward slashes and is relative to
the Web server's root directory.
*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("SCRIPT_NAME")
ENDFUNC
* EOF wwRequest::GetLogicalPath


*********************************************************************
FUNCTION GetExecutablePath()
****************************
#IF .F.
*:Help Documentation
*:Topic:
wwrequest::GetExecutablePath

*:Description:
Returns the path the DLL or script as a Web path. This data is always
returned returned, where <<%=
TopicLink("GetLogicalPath()","wwRequest::GetLogicalpath") %>> only returns
a value when a script map is used.

<<pre>>http://www.west-wind.com/wconect/wc.dll?wwDemo~TestPage<</pre>>
returns:

<<pre>>/wconnect/wc.dll<</pre>>

The path is always in Web format with forward slashes and is relative to
the Web server's root directory.

In general GetExecutablePath is more reliable than GetLogicalPath()

*:Returns:
string of the executable path

*:Remarks:
Same as calling Request.ServerVariables("SCRIPT_PATH")

*:SeeAlso:
Class wwrequest
wwRequest::GetLogicalPath
wwRequest::GetPhysicalPath

*:Keywords:
Script Path

*:HelpId:
991
*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("SCRIPT_NAME")
ENDFUNC
* EOF wwRequest::GetExecutablePath


************************************************************************
* wwRequest :: GetApplicationPath
****************************************
***  Function: Returns the physical path of the IIS virtual directory.
***            this returns the 'virtual' root.
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetApplicationPath()

IF EMPTY(this.cApplicationPath)
	this.cApplicationPath = ADDBS( REQUEST.ServerVariables("APPL_PHYSICAL_PATH") )	   
	IF EMPTY(this.cApplicationPath)
		this.cApplicationPath = Process.oConfig.cHtmlPagePath
	ENDIF
ENDIF 
RETURN this.cApplicationPath
ENDFUNC
*  wwRequest :: GetApplicationPath

*********************************************************************
FUNCTION GetPreviousURL()
*************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetPreviousURL

*:Description:
Returns the URL of the referring document. Only valid if the previuos
link was Web page.
*:ENDHELP
#ENDIF
*********************************************************************
lcUrl= THIS.ServerVariables("HTTP_REFERER")
RETURN lcUrl
ENDFUNC
* EOF wwRequest::GetPreviousURL


*********************************************************************
FUNCTION GetCurrentUrl(llHTTPS)
*******************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetCurrentUrl

*:Description:
Returns the current URL in full.

*:Parameters
llHTTPS
Optionally return the URL with an HTTPS prefix. Useful for switching
back and forth between HTTP and HTTPS operations.

*:ENDHELP
#ENDIF
*********************************************************************
lcPort = THIS.ServerVariables("SERVER_PORT")
IF lcPort == "80"  or lcPort == "443"
	IF lcPort == "443"
	   llHttps = .t.
	ENDIF   
   lcPort = ""
ELSE
   lcPort = ":" + lcPort
ENDIF
RETURN "http"+IIF(llHTTPS,"s","")+"://"+THIS.GetServerName()+;
       lcPort + THIS.GetLogicalPath()+[?] + THIS.cQueryString
ENDFUNC
* EOF wwRequest::GetCurrentUrl


*********************************************************************
FUNCTION GetRelativeSecureLink(lcLink, llNonSecure)
***************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetRelativeSecureLink

*:Description:
This method allows you to easily create a secure link simply by specifying
a relative link like any other link.

The problem is that switching between HTTP and HTTPS requires a fully
qualified URL including protocol, domain name and full Web path, while most
sites entirely link with relative links where the protocol and domain name
are never used explicitly. It's often difficult to derive the full URL for
a secure link especially if the site must be portable and the link cannot
be hardcoded with a domain name required to do this.

This method figures out the full current URL converts it to a fully
quallified secure link and strips of the document name, then add your link
or path at the end. So now to switch you can simply do:

<<pre>><a href="<%= Request.GetRelativeSecureLink([Somepage.wc]) %>">Secure
Page</a><</pre>>


*:Parameters:
<<b>>lcLink<</b>>
A web server relative link. This path can include relative path
information, but should never include a protocol and domainname. If you
this method is not useful.

<<b>>llNonSecure<</b>>
Optionally you can specify to have the result return a plain HTTP protocol
link. This is useful when switching out of secure mode back into the
regular site. For example, after you're done after an order on secure site,
you probably have a button for 'Shop some more' which returns to the main
site in non-secure mode.


*:Returns:
Fully qualified HTTP link based on the currently active URL

*:Remarks:
This method will not work correctly if the current URL does not include a
document name, such as home pages. To get around this always reference
pages that use this method with an explicit page such as Default.wc.

*:SeeAlso:
Class wwrequest
wwRequest::GetCurrentUrl
wwRequest::GetPreviousUrl

*:HelpId:
1427
*:ENDHELP
#ENDIF
*********************************************************************
lcCurUrl = THIS.GetCurrentUrl(!llNonSecure)

*** Strip off the document and add the relative link 
RETURN SUBSTR(lcCurUrl,1,RAT("/",lcCurUrl) ) + lcLink
ENDFUNC
* EOF wwRequest::GetRelativeSecureLink



*********************************************************************
FUNCTION GetAuthenticatedUser(lnMode)
*******************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetAuthenticatedUser

*:Description:
Returns the name of a user if he has been authenticated by the Web server.
This variable gets set and stays set once a user has entered a valid
username into the browser dialog box when prompted. The username is valid
for a given Web server path and down and once set cannot be unset until the
browser is shut down or another authentication request is made for the same
user.

*:Returns:
String of the logged in user name, or blank if not logged in.
*:ENDHELP
#ENDIF
*********************************************************************

DO CASE
 *** Check both Basic and Windows Auth
 CASE EMPTY(lnMode)
   lcUser =  THIS.ServerVariables("REMOTE_USER")
   IF EMPTY(lcUser)
      lcUser = THIS.ServerVariables("LOGON_USER")
   ENDIF
 *** Check only Basic Auth
 CASE lnMode = 1
    lcUser = THIS.ServerVariables("REMOTE_USER")
 CASE lnMode = 2
    lcUser = this.ServerVariables("LOGON_USER")
ENDCASE
   

RETURN lcUser
ENDFUNC
* EOF wwRequest::GetAuthenticatedUser


************************************************************************
* wwRequest :: IsPostBack
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION IsPostBack()
RETURN THIS.ServerVariables("REQUEST_METHOD") = "POST"
ENDFUNC
*  wwRequest :: IsPostBack

*********************************************************************
FUNCTION GetBrowser()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetBrowser

*:Description:
Returns the client's browser display name.

The names tend to be verbose and do not lend themselves well for parsing
and consistent values. For example IE 5 returns:

<<b>>Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt<</b>>

In order to do some useful browser detection you probably have to do a
little more work. For example to check for IE you typically check for the
MSIE string or the IE version MSIE 5.

*:Returns:
String of the user agent/browser name

*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("HTTP_USER_AGENT")
ENDFUNC
* EOF wwRequest::GetBrowser


*********************************************************************
FUNCTION GetClientCertificate(lcSubKey)
***************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetClientCertificate

*:Description:

*:Parameters:

*:Returns:

*:Example:

*:Remarks:

*:Keywords:

*:ENDHELP
#ENDIF
*********************************************************************

lcCert = THIS.ServerVariables("CERT_SUBJECT")
IF !EMPTY(lcSubkey)
   DO CASE
      CASE UPPER(lcSubkey) = "NAME"
         lcSubKey = "CN"
      CASE UPPER(lcSubKey) = "EMAIL"         
         lcSubKey = "E"
   ENDCASE
   
   lcCert = ALLTRIM(Extract(lcCert,", "+lcSubkey + "=",", ",,.T.) )
ENDIF

RETURN lcCert
ENDFUNC
* EOF wwRequest::GetClientCertificate


*********************************************************************
FUNCTION GetCookie(lcCookie)
****************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetCookie

*:Description:
Returns an HTTP Cookie that was previously set. HTTP cookies allow keeping
state by keeping a persistent variable on the user's browser. Cookies are
sent along in each HTTP request and appear as a server variable in the
incoming request data.

*:Parameters:
<<b>>lcCookie<</b>>
The name of the cookie to retrieve.


*:Returns:
String of the cookies contents.

*:Remarks:
Cookies are scoped to a particular virtual directory, so a cookie set in a
different virtual than the one the current request is running in will not
be visible.

Although cookies follow the directory hierarchy down, a Cookie set in the
root directory will also not be in scope in a virtual below the root, but
will be in scope in a dircectory below the root that is not a virutal.
*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lcCookieString, lcValue

lcCookieString=THIS.ServerVariables("HTTP_COOKIE")
lcValue=EXTRACT(" "+lcCookieString + ";",;
                " " + TRIM(lcCookie)+"=",";","",.T.)

RETURN lcValue

ENDFUNC
* EOF wwRequest::GetCookie


*********************************************************************
FUNCTION GetServerName()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetServerName

*:Description:
Returns the server's IP or domain as specified in the URL
*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("SERVER_NAME")
ENDFUNC
* EOF wwRequest::GetServerName


*********************************************************************
FUNCTION GetServerSoftware()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetServerSoftware

*:Description:
The software that's running the Web server (ie. IIS)
*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.ServerVariables("SERVER_SOFTWARE")
ENDFUNC
* EOF wwRequest::GetServerSoftware


*********************************************************************
FUNCTION IsLinkSecure(lcSecurePort)
***********************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::IsLinkSecure

*:Description:
Checks to see if the user is coming in over the SSL port.

*:Parameters:
<<b>>lcSecurePort<</b>>
Optional - number of the port that is the dedicated SSL port. Defaults to
the standard SLL port 443.

*:ENDHELP
#ENDIF
*********************************************************************

lcSecurePort=IIF(VARTYPE(lcSecurePort)="C",lcSecurePort,"443")
RETURN IIF(THIS.ServerVariables("SERVER_PORT") = lcSecurePort,.T.,.F.)
ENDFUNC
* EOF wwRequest::IsLinkSecure

*-- Is the browser DHTML capable?
FUNCTION isie4
	lcBrowser = THIS.GetBrowser()

	IF "MSIE " $ lcBrowser 
	   RETURN .T.
	ENDIF

	RETURN .F.
ENDFUNC


*********************************************************************
FUNCTION GetOutputFile()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetOutputFile

*:Description:
Returns the name of the output file in file based messaging

*:Returns:
String of the output file name
*:ENDHELP
#ENDIF
*********************************************************************
RETURN THIS.cOutputfile
ENDFUNC
* EOF wwRequest::GetOutputFile


************************************************************************
* wwRequest ::  GetRequestId
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetRequestId()
IF EMPTY(this.cRequestId)
   RETURN this.ServerVariables("REQUESTID")
ENDIF
RETURN this.cRequestId   
ENDFUNC
*  wwRequest ::  GetRequestId

*********************************************************************
FUNCTION GetWCIniValue(lcKey, lcSection)
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwrequest::getwcinivalue

*:Description:
Retrieves a value from the Web Connection ISAPI/CGI configuration file.
Most useful for retrieving the AdminUser value.

*:Parameters:
<<b>>lcKey<</b>>
The key to retrieve

<<b>>lcSection<</b>>
<<i>>Optional<</i>> - the section to retrieve the value from. The default
is the [Main] section.

*:Returns:
String of the value retrieved or "" (null string) if the key doesn't exist.

*:ENDHELP
#ENDIF
*********************************************************************

lcSection=IIF(EMPTY(lcSection),"wwcgi",lcSection)

lcValue = THIS.oAPI.GetProfileString(THIS.ServerVariables("WCCONFIG"),;
                                     lcSection,lcKey) 
IF ISNULL(lcValue)                                        
   RETURN ""
ENDIF      

RETURN lcValue
ENDFUNC
* EOF wwRequest::GetWCIniValue




*********************************************************************

**** The following methods will need to be overridden for each 
**** request method supported (wwwc or ASP for example)

*********************************************************************




*********************************************************************
FUNCTION InitializeRequest(lcPostData, lcTempPath)
**************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::InitializeRequest

*:Description:
This method is responsible for setting up the Request object on each hit by
passing in the POST data in some format and making it available to the
specific Get methods. This method is fired on every Web request hit and
deals with clearing out values from previous requests and then reassigning
new values.

It deals with setting up the form data, configuring the querystring and
setting up. Once this method complete the Request object is fully
operational and can be accessed as normal.


*:Parameters:
<<b>>lcPostData<</b>>
The post data as a string by default with Web Connection's ISAPI extension.
With ASP messaging this parameter will contain the ASP Request object. This
data is used to set up the Request object to use the standard interface
described through this class.

<<b>>lcTempPath<</b>>
This is required only for file based operation, which needs to know where
the HTML output needs to be written to.

*:Returns:
nothing
*:ENDHELP
#ENDIF

*********************************************************************
*** Locate the boundary that divides form and server vars
lnSplit = AT( POST_BOUNDARY , lcPostData)


IF lnSplit = 0
   *** No boundary - no form vars
   THIS.cFormVars = ""
   THIS.cServerVars = "&" + lcPostData
ELSE   
*   THIS.cServerVars = SUBSTR(lcPostData,1,lnSplit-1)
*   THIS.cFormvars = SUBSTR(lcPostData,lnSplit + LEN(POST_BOUNDARY))
   THIS.cServerVars = "&" + SUBSTR(lcPostData,1,lnSplit-1)
   THIS.cFormvars = "&"+SUBSTR(lcPostData,lnSplit + LEN(POST_BOUNDARY))
ENDIF

*** Override the file to properly allow translation to
*** a remote drive if passed. Otherwise use default drive/path
*** as specified by THIS.cContentFile
IF !EMPTY(lcTempPath)
   THIS.cPathOverride=lcTempPath
ELSE
   THIS.cPathOverride=""
ENDIF
THIS.cOutputFile= ForcePath(THIS.ServerVariables("Output File"),THIS.cPathOverride)
   
*** Clear out any 'cached' property values
THIS.cQueryString= STRTRAN(THIS.ServerVariables("QUERY_STRING"),"%7E","~")
THIS.cPhysicalPath = ""
THIS.cMultiPartBorder = ""
THIS.lUseXMLFormVars = .F.
THIS.lUtf8Encoding = .F.
THIS.lFilterUnsafeCommands = WWWC_FILTER_UNSAFECOMMANDS

*** Create aParms[] array containing positional parms
THIS.ParseQueryString()

LOCAL lcContentType
lcContentType = LOWER(this.ServerVariables("CONTENT_TYPE"))
DO CASE
   CASE lcContentTYpe = "application/x-www-form-urlencoded"
      this.nPostMode = 1
   CASE lcContentType = "multipart"
      this.nPostMode = 2
   CASE lcContentType = "text/xml"
      this.nPostMode = 4
   CASE EMPTY(lcContentType)
      *** Some HTTP clients are sloppy and don't set the Content-Type
      *** so to make sure let's keep the legacy behavior
      this.nPostMode = 1   
   OTHERWISE
	  *** Default to UrlEncoded
      this.nPostMode = 1
ENDCASE

RETURN .T.
ENDFUNC
* EOF wwRequest::InitializeRequest

*********************************************************************
FUNCTION ServerVariables(lcKey)
*******************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::ServerVariables

*:Description:
Retrieves a server variable from the request data. Server variables provide
information about the current request including info about the client
application (browser, IP Address), the current request (server name,
querystring), authentication (username, port accessing this app) and status
information (Cookies, type of request) etc.

Most of the server variables that are returned are abstracted in method of
this class, such as GetBrowser(), GetIPAddress(),
GetAuthenticatedUsername() and so on.

To see a list of available raw server variables you can capture the current
request output by bringing up the Web Connection Status form and clicking
on<<i>> Save Request files<</i>>. Re-run your request the click on the
<<i>>Display<</i>> button of the status form and click on <<i>>Request Data
<</i>>in the popup.

*:Parameters:
<<b>>lcKey<</b>>
Name of the server variable to return

*:Returns:
String value of the server variable or "" if it doesn't exist or is empty.

*:ENDHELP
#ENDIF

*********************************************************************
RETURN GetUrlEncodedKey(THIS.cServerVars,lcKey)
ENDFUNC
* EOF wwRequest::ServerVariables


************************************************************************
* wwRequest :: GetExtraHeader
****************************************
***  Function: Returns an Extra Header from the ALL_HTTP block. Extra
***            headers are custom headers added by other applications.
***            Extra headers are last in the list of Server Variables
***            and are NOT ENCODED
***      Pass: lcHeader  -  Var name to retrieve
***    Return: string or "" if not found
************************************************************************
FUNCTION GetExtraHeader
LPARAMETERS lcHeader
LOCAL lcHeaders
lcVal = this.ServerVariables(lcHeader)
IF EMPTY(lcVal)
	lcHeaders = STREXTRACT(THIS.cServerVars,"ALL_HTTP=","",1,2)	
	RETURN Extract(lcHeaders,lcHeader + ":",CHR(10),CHR(13),.t.)
ENDIF
RETURN lcVal	
ENDFUNC
*  wwRequest :: GetExtraHeader


*********************************************************************
FUNCTION QueryString(lvKey)
***************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::Querystring

*:Description:

This method returns the Query String and individual pieces of it. The
method supports both numeric,positional parameters and named parameters.
Positional parameters are great for grabbing request information:

<<pre>>wc.dll?wwDemo~ClientForm~West+Wind+Technologies~ID0001<</pre>>

where each parameter can be accessed using Request.QueryString(1) through
QueryString(4). Web Connection typically uses the first two positional
parameters to identify the request that is being accessed so wwDemo is the
class to call and ClientForm is the method inside of that class for
example. Parameters 3 and 4 are application specific parameters.

URLEncoded parameters are better for optional parameters and look like
this:

<<pre>>wc.dll?UserName=Rick+Strahl&UserId=0111&Address=400+Morton%0A%0Dhood
+River,+OR<</pre>>

Essentially  spaces are converted to + signs, keys are separated by & and
any control characters are converted to hex representations preceeded by a
% sign.

You can mix positional and URLEncoded parameters by adding a separating ~
between the posititional parms and the named ones:

<<pre>>wc.dll?wwdemo~URLTest~&Username=Rick+Strahl&Company=West+Wind<</pre>
>

which allows you to use both GetCGIParameter(2), which returns
<<i>>URLTest<</i>> or QueryString("Company") which returns <<i>>West
Wind<</i>>.

*:Parameters:
<<b>>lcKey<</b>>
This parameter can either be a string or numeric value.


<<ul>>
<<li>> <<b>>Named parameter string<</b>>
The key of a named parameter is returned. For example:

<<b>>http://localhost/wc.wc?wwDemo~TestPage~&Company=West+Wind&Name=Rick<</b>>

where Company and Name would be key values to retrieve.

<<li>> <<b>>Positional numerical value<</b>>
You can also pass a numeric value to get at positional parameters separated
by ~. In the above example, QueryString(1) returns wwDemo, QueryString(2)
TestPage.
<</ul>>

Make sure when mixing positional and named parameter that you separate the
two with a ~ and & as the link above does.

*:Returns:
String value of the requested key.
*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lnloc, lcRetval, lcValue

IF EMPTY(lvkey)
   RETURN THIS.cQueryString
ENDIF

IF VARTYPE(lvkey) = "N"
      IF lvkey > THIS.nParmCount
         RETURN ""
      ENDIF
      IF this.lUtf8Encoding
      	  STRCONV( URLDecode(THIS.aParms[lvKey]),11 )
	  ENDIF
	  RETURN URLDecode(THIS.aParms[lvKey])
ELSE
      *** We got a character key
      lcRetval=Extract("&" + THIS.cQueryString,"&"+lvkey+"=","&",,.T.)
      
      IF THIS.lFilterUnsafeCommands
      	 IF THIS.lUtf8Encoding
	         RETURN THIS.UnsafeCommandFilter( STRCONV(UrlDecode(lcRetVal),11) )
	     ENDIF
         RETURN THIS.UnsafeCommandFilter( UrlDecode(lcRetVal) )
      ENDIF
ENDIF

IF this.lUtf8Encoding
	RETURN STRCONV( URLDecode(lcRetval),11)
ENDIF

RETURN URLDecode(lcRetval)
ENDFUNC
* EOF wwRequest::QueryString

*********************************************************************
FUNCTION Form(lcVarname)
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::Form

*:Description:
Retrieves an HTML form variable posted to the Web server. Form variables
are the primary interface for a Web client to communicate with a Web server
and POST variables are the most common. Everytime a user on an HTML page
fills out a form and submits it the values are POSTed to the server and can
be retrieved with Request.Form("fieldname").

This method returns these values.

Standard functionality retrieves plain HTTP POST data. If you've posted XML
to the server with tools like IE5's  XMLHTTP or wwIPStuff, you can set the
<<%= TopicLink("wwRequest::lUseXMLFormvars","wwRequest::lUseXMLFormvars")
%>> to treat the passed XML as form variables using this method. This works
extremely well to use the same codebase for both accepting input from HTML
based Web forms and XML based clients using the exact same codebase.

*:Parameters:
<<b>>lcVarname<</b>>
The name of the form variable to retrieve.

*:Returns:
String value of the variable or ""
*:ENDHELP
#ENDIF
*********************************************************************

#IF WWC_LOAD_WWXML
IF THIS.lUseXMLFormVars
   IF EMPTY(lcVarname)
     RETURN ""
   ENDIF  
   RETURN THIS.oXML.GetObjVar(lcVarName,THIS.cFormVars)
ENDIF  
#ENDIF

IF EMPTY(lcVarName)
   *** Must skip over the leading &
   RETURN SUBSTR(Request.cFormVars,2)
ENDIF

*** Note there's some duplication here to avoid copying the
*** data to a variable explicitly - on purpose for optimization
*** to have minimal impact on the most common read scenario
DO CASE
   CASE this.nPostMode = 1
      IF THIS.lFilterUnsafeCommands
      	IF this.lUtf8Encoding
	      	RETURN THIS.UnsafeCommandFilter( STRCONV(GetUrlEncodedKey(THIS.cFormVars,lcVarname),11) )	
	     ENDIF
         RETURN THIS.UnsafeCommandFilter( GetUrlEncodedKey(THIS.cFormVars,lcVarname) )
      ENDIF
      
      IF this.lUtf8Encoding
	      RETURN STRCONV(GetUrlEncodedKey(THIS.cFormVars,lcVarname),11)
	  ENDIF
	  RETURN GetUrlEncodedKey(THIS.cFormVars,lcVarname)
   CASE this.nPostMode = 2      
      IF THIS.lFilterUnsafeCommands
      	IF this.lUtf8Encoding
	        RETURN THIS.UnsafeCommandFilter( STRCONV(this.GetMultiPartFormVar(lcVarname),11) )
        ELSE
            RETURN THIS.UnsafeCommandFilter( this.GetMultiPartFormVar(lcVarname) )
        ENDIF
      ENDIF
      IF this.lUtf8Encoding
	      RETURN STRCONV(this.GetMultiPartFormVar(lcVarname),11)
	  ENDIF
   	  RETURN this.GetMultiPartFormVar(lcVarname)
   CASE this.nPostMode = 4
      RETURN THIS.oXML.GetObjVar(lcVarName,THIS.cFormVars)
   OTHERWISE
      RETURN ""
ENDCASE

ENDFUNC
* EOF wwRequest::Form

************************************************************************
* wwRequest :: Params
****************************************
***  Function: Returns the combined value from FOrm and QUeryString
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Params(lcVarName)

lcResult = this.Form(lcVarName)
IF EMPTY(lcResult)
   lcResult = this.QueryString(lcVarName)
ELSE
	RETURN lcResult   
ENDIF
IF EMPTY(lcResult) AND VARTYPE(SESSION)="O"
   lcResult = Session.GetSessionVar(lcVarName)
ELSE
	RETURN lcResult
ENDIF
IF EMPTY(lcResult) AND VARTYPE(__WEBPAGE)="O"
   lcResult = __WebPage.ViewState.Item(lcVarName)
ENDIF

RETURN lcResult
ENDFUNC
*  wwRequet :: Params

************************************************************************
* wwRequest :: UnsafeCommandFilter
****************************************
***  Function: Filters out unsafe commands in the form of VFP
***            commands like EVALUATE, STRTOFILE, EXECSTR that
***            might be used to run external code.
***            To be used as a filter in Form() and QueryString()
***            methods.
***      Pass: lcRetVal  -  String to filter
***    Return: original string or *** UNSAFE CONTENT *** if filtered
************************************************************************
FUNCTION UnsafeCommandFilter(lcRetVal)
LOCAL lnAt

IF "(" $ lcRetval AND ")" $ lcRetVal
   IF ATC("EVAL", lcRetVal) > 0 OR ;
      ATC("EXEC", lcRetVal) > 0 OR ;
      ATC("STRTO", lcRetVal) > 0

      *** Check if these strings exist and then make sure they 
      *** are indeed followed by paranthesis
      lnAt = ATC("EXEC",lcRetVal)
      IF lnAt > 0
         lnAt1 = AT("(",SUBSTR(lcRetVal,lnAt,11))
         IF lnAt1 > 0
            RETURN "*** UNSAFE CONTENT ***"
         ENDIF   
      ENDIF
      lnAt = ATC("EVAL",lcRetVal)
      IF lnAt > 0
         lnAt1 = AT("(",SUBSTR(lcRetVal,lnAt,9))
         IF lnAt1 > 0
            RETURN "*** UNSAFE CONTENT ***"
         ENDIF   
      ENDIF
      IF ATC("STRTO",lcRetVal) > 0
         RETURN "*** UNSAFE CONTENT ***"
      ENDIF
   ENDIF
ENDIF

RETURN lcRetval
ENDFUNC
*  wwRequest :: UnsafeCommandFilter


*********************************************************************
FUNCTION FormXML()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::FormXML

*:Description:
Retrieves an XML POST buffer. The data in this case is posted in raw format
from a client like IE5's XMLHTTP or wwIPStuff with the XML POST option.

Use this only if data was posted with XMLHTTP or wwIPStuff using the no key
option. Unlike standard POST data the POST content is not encoded nor
contains any special header info, rather it's a raw POST block.

Although this method is named FormXML, you can retrieve the raw POST buffer
in this fashion.

If the data is XML you can set the <<%=
TopicLink("wwRequest::lUseXMLFormVars","wwRequest::lUseXMLFormvars") %>>
property to treat the XML data as your form variables - <<%=
TopicLink("wwRequest::Form()","wwRequest::Form") %>> will retrieve values
from the XML elements transparently.

*:Returns:
Returns the full post buffer in raw form. If XML was posted this will
contain the XML document.

*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lcXML

*** Must skip over the leading &
lcXML = SUBSTR(Request.cFormVars,2)

RETURN lcXML
ENDFUNC
* EOF wwRequest::FormXML

************************************************************************
* wwRequest ::  GetRawFormData
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetRawFormData()
RETURN SUBSTR(Request.cFormVars,2)
ENDFUNC
*  wwRequest ::  GetRawFormData


*********************************************************************
FUNCTION GetFormMultiple(taVars,tcVarname)
******************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetFormMultiple

*:Description:
This method retrieves multiselect HTML form variables from the CGI content
file into an array. Multiselect variables can be returned when using
scrolling HTML lists with the SELECT MULTIPE option or multiple radio
buttons and checkboxes using the same variable name.

Multi-select values can come from Multi-select lists and drop downs or from
radio buttons.

*:Parameters:
<<b>>@taVars<</b>>
An array that will receive the form variables. MUST BE PASSED BY REFERENCE

<<b>>tcVarname<</b>>
The name of the form variable to retrieve.

*:Returns:
Numeric - count variables retrieved into the array. The array will be
filled.

*:Example:
DIMENSION laVars[1]
lnVars=Request.GetFormMultiple(@laVars,"LastName")

FOR lnX=1 to lnVars
   Response.Write( laVars[1] + "<BR>")
ENDFOR

*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lnX, lcValue, lnAt, lcFind, lcPointer, lnCount

lnX = 0
DO CASE
   CASE this.nPostMode = 1
      lcPointer = THIS.cFormVars
      lcFind = "&"+STRTRAN(tcVarname," ","+")+"="
      lnAt = ATC(lcFind,lcPointer)
      IF lnAt = 0
         RETURN 0
      ENDIF

      DO WHILE lnAt > 0
        lcValue = GetUrlEncodedKey(lcPointer,tcVarName) 

        lnX=lnX+1
        DIMENSION taVars[lnX]
        taVars[lnX]=lcValue
        
        lcPointer = SUBSTR(lcPointer,lnAt + LEN(lcFind))
        lnAt = ATC(lcFind,lcPointer)
      ENDDO  
   CASE THIS.nPostMode = 2
      lnCount = this.FormVarCount(tcVarName)
      FOR lnX = 1 TO lnCount
         DIMENSION taVars[lnX]
         taVars[lnX] = this.GetMultipartFormVar(tcVarName,lnX)
      ENDFOR
      RETURN lnCount
   ENDCASE

RETURN lnX
ENDFUNC
* EOF wwRequest::GetFormMultiple


*********************************************************************
FUNCTION GetMultipartFile(lcKey, lcFileName)
********************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetMultipartFile

*:Description:
Retrieves a file uploaded with HTTP file upload into a binary string.

HTTP file uploads and multipart forms are sent up to server with multipart
forms which are submitted in an HTML page as follows:


<<pre>><form ACTION="wc.dll?wwDemo~FileUpload" METHOD="POST"
enctype="multipart/form-data">
     <font face="Verdana"><input TYPE="FILE" NAME="File">
      <br>
      <strong>File Description:</strong><br>
      <textarea rows="4" name="txtFileNotes" cols="43"></textarea><br>
      <input TYPE="submit" value="Upload File" name="btnSubmit">
</font></font></p>
</form><</pre>>

*:Parameters:
<<b>>lcKey<</b>>
The name of the file to retrieve

<<b>>@lcFileName<</b>>
<<i>>Optional<</i>> - a string that will be filled with the file's name.
must be passed by reference. Initial value is ignored.

*:Returns:
String that contains binary image of the file. Use STRTOFILE() to save the
file to disk.

*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lcMultipart

IF EMPTY(lcKey)
   RETURN ""
ENDIF   

IF EMPTY(THIS.cMultiPartBorder)
   THIS.GetMultiPartBorder()
ENDIF   

lcMultipart =  THIS.cFormVars

lnLoc = ATC([NAME="]+lcKey+["],lcMultipart)
IF lnLoc=0
   RETURN ""
ENDIF
lcMultipart=SUBSTR(lcMultipart,lnLoc)

lcFileName = JustFname(Extract(lcMultipart,[FileName="],["]))
RETURN Extract(@lcMultipart,CHR(13)+CHR(10)+CHR(13)+CHR(10),;
               CHR(13)+CHR(10)+ "--" + THIS.cMultiPartBorder )
*** Note the extra two leading --. Don't know why this is
*** required but it must be there for multipart files!
*               "---------"   

ENDFUNC
* EOF wwRequest::GetMultipartFile



*********************************************************************
FUNCTION GetMultipartFormVar(lcKey,lnInstance)
**********************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::GetMultipartFormVar

*:Description:
Retrieves a multipart form variable from the request buffer. Multipart form
variables are submitted on the client side by specifiying an encoding type
of "multipart/form-data".

Multipart forms are inherently more efficient especially for large form
submissions since the data is not encoded. Multi-part forms are also used
for HTTP file uploads.

To create a multipart form add the following enctype attribute to your
form:

<<pre>><form ACTION="wc.dll?wwDemo~FileUpload" METHOD="POST"
enctype="multipart/form-data">
     <font face="Verdana"><input TYPE="FILE" NAME="File">
      <br>
      <strong>File Description:</strong><br>
      <textarea rows="4" name="txtFileNotes" cols="43"></textarea><br>
      <input TYPE="submit" value="Upload File" name="btnSubmit">
</font></font></p>
</form><</pre>>

*:Parameters:
<<b>>lcKey<</b>>
The multipart form variable to retrieve

*:Returns:
String of the value retrieved. A null string if the var doesn't exist.

*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lcMultipart, lnLoc

IF EMPTY(lcKey)
   RETURN ""
ENDIF   
IF EMPTY(lnInstance)
   lnInstance = 1
ENDIF

IF EMPTY(THIS.cMultiPartBorder)
   THIS.GetMultiPartBorder()
ENDIF   

lcMultiPart = THIS.cFormVars   && THIS.GetFormVar("MultiPart")
lnLoc = ATC([NAME="]+lcKey+["],lcMultipart,lnInstance)
IF lnLoc=0
   RETURN ""
ENDIF
lcMultipart=SUBSTR(lcMultipart,lnLoc)

RETURN Extract(@lcMultipart,CHR(13)+CHR(10)+CHR(13)+CHR(10),;
               CHR(13)+CHR(10)+"--" + THIS.cMultipartBorder)

*!*   RETURN Extract(@lcMultipart,lcKey + ["]+CHR(13)+CHR(10)+CHR(13)+CHR(10),;
*!*                  CHR(13)+CHR(10)+"--" + THIS.cMultipartBorder)
ENDFUNC
* wwRequest::GetMultipartFormVar


FUNCTION GetMultiPartBorder

lcBorder = THIS.ServerVariables("CONTENT_TYPE")
lnFound = ATC("boundary=",lcBorder)
IF lnFound=0
   THIS.cMultiPartBorder = ""
   RETURN
ENDIF

THIS.cMultiPartBorder = SUBSTR(lcBorder,lnFound + 9)

RETURN THIS.cMultiPartBorder



*********************************************************************
FUNCTION aFormVars(taVars,tcPrefix)
***********************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest::aFormvars

*:Description:
This method retrieves all the form variables that were submitted into a two
dimensional array.


*:Parameters:
<<b>>@laVars<</b>>
An array that will receive the form variables and values.

The array contains the name of the field and the value:

1 - The name/key of the variable
2 - the actual value as a string

*:Returns:
Numeric - count of variables retrieved.

*:Remarks:
Only form variables that were filled in are submitted. HTML forms are very
peculiar about which fields will show up on the server side when left empty
and which won't. In particular Checkboxes, radios and buttons tend to show
up on every request, while empty text boxes will not.

You can check the request data on the <<%= TopicLink("server status
form","The server status form") %>> to see what you're actually getting.
*:ENDHELP
#ENDIF
*********************************************************************
LOCAL lnX,lcPointer, lnAt, lnEqual, lcKey, lcValue, lnFound

IF EMPTY(tcPrefix)
   tcPrefix = ""
ELSE   
   tcPrefix = LOWER(TRIM(tcPrefix))
ENDIF

lnX = 0

DO CASE
   CASE this.nPostMode = 1 
      lcPointer = THIS.cFormVars
      lnAt = ATC("&" + tcPrefix,lcPointer)
      IF lnAt = 0
         RETURN 0
      ENDIF
      lcPointer = SUBSTR(lcPointer,lnAt+1)


      DO WHILE lnAt > 0
        *** Find = sign then extract the value
        lnEqual = AT("=",lcPointer)

        *** No Equal Sign - Invalid key so skip it
        IF lnEqual = 0
           lnAt=ATC("&" + tcPrefix,lcPointer)
           LOOP
        ENDIF
           
        lcKey = SUBSTR(lcPointer,1,lnEqual-1)
        
        lcPointer = SUBSTR(lcPointer,lnEqual+1)
        
        *** Find the & at the end
        lnAt = ATC("&",lcPointer)
        IF lnAt = 0
           lcValue = lcPointer
        ELSE
           lcValue = LEFT(lcPointer,lnAt - 1)
        ENDIF
        
        lcValue = URLDecode(lcValue) 
        lcKey = URLDecode(lcKey)

        IF EMPTY(tcPrefix) OR LOWER(lcKey) = tcPrefix
           lnX=lnX+1
           DIMENSION taVars[lnX,2]
           taVars[lnX,1]=lcKey
           taVars[lnX,2]=lcValue
        ENDIF
          
        lcPointer = SUBSTR(lcPointer,lnAt + 1 )
        IF  LOWER(lcPointer) # tcPrefix
           lnAt=ATC("&" + tcPrefix,lcPointer)
           LOOP
        ENDIF
      ENDDO  

   *** Multipart   
   CASE this.nPostMode = 2
      IF EMPTY(THIS.cMultiPartBorder)
         THIS.GetMultiPartBorder()
      ENDIF
      
      lcFormVars = this.cFormVars
      lnFound = 0
      lnAt = 1
      DO WHILE lnAt > 0
         lnAt = ATC("--" + this.cMultipartBorder + CHR(13) + CHR(10) +;
                    [Content-Disposition: form-data; name="] + tcPrefix,lcFormVars)
      
         IF lnAT > 0
            lnFound = lnFound + 1
         
            *** Trim teh string and make sure we won't repeat our search
            lcFormVars = SUBSTR(lcFormVars,lnAT + LEN(this.cMultipartBorder) )
            
            DIMENSION taVars[lnFound,2]
            taVars[lnFound,1] = Extract( lcFormVars,[name="],["])
            taVars[lnFound,2] = this.GetMultipartFormVar(taVars[lnFound,1])
         ENDIF   

      ENDDO
      lnx = lnFound
ENDCASE

RETURN lnX
ENDFUNC
* EOF wwRequest::aFormVars

************************************************************************
* wwRequest :: FormVarsToObject
*******************************
***  Function: Updates an object from the form vars in the request
***            object.
***    Assume: Object must exist and be passed in
***      Pass: loObject  -  Object to populate
***            lcPrefix  -  An optional prefix for the formvars
***                         that's stripped to match properties
***    Return: loObject  -  populated object
************************************************************************
FUNCTION FormVarsToObject
LPARAMETER loObject,lcPrefix
LOCAL lnProperties,lnX, lcPrefix, lcField, lcFormVar, lcType, lcValue

IF EMPTY(lcPrefix)
  lcPrefix = ""
ENDIF

#IF WWVFPVERSION > 7
IF VARTYPE(loObject) # "O"
   DIMENSION laFormVars[1,2]
   lnProperties = THIS.aFormVars(@laFormVars,lcPrefix)
   loObject = CREATEOBJECT("EMPTY")
   FOR lnX=1 TO lnProperties
       ADDPROPERTY(loObject,laFormVars[lnx,1],laFormVars[lnx,2])
   ENDFOR
   
   RETURN loObject
ENDIF
#ENDIF



*** Walk the object and then pull properties 
*** from the XML to repopulate it
lnProperties = AMEMBERS(laProperties,loObject)
lnX=0

FOR lnX=1 TO lnProperties
   lcField = lower(laProperties[lnX])
   lcFormVar = lcPrefix + lcField
   lcType = TYPE("loObject." + lcField)
   IF lcType # "L" AND !THIS.IsFormVar(lcFormVar)
      LOOP
   ENDIF
   lcValue = THIS.Form(lcFormVar)

   DO CASE
      CASE lcType $ "CMQ"
         loObject.&lcField =  lcValue
      CASE lcType $ "NIFY"
         loObject.&lcField = VAL(lcValue)
      CASE lcType = "T"
         loObject.&lcField = CTOT(lcValue)
      CASE lcType = "D"
         loObject.&lcField = CTOD(lcValue)
      CASE lcType = "L"
         IF INLIST(UPPER(lcValue),"T","ON","Y",".T.","1")
            loObject.&lcField = .T.
         ELSE
            loObject.&lcField = .F.
         ENDIF
     *** OTHERWISE  && Do nothing
   ENDCASE
ENDFOR

RETURN loObject


*********************************************************************
FUNCTION IsFormVar(lcFormVar)
************************
#IF .F.
*:Help Documentation
*:Topic:
wwrequest::IsFormVar

*:Description:
Checks to see if a form variable exists in the request POST buffer. This
method returns .T. if the key exists even if the value is blank. It will
only return .F. if the key doesn't exist at all. If you need to check for
blank you can simply read the key with <<%=
TopicLink("wwRequest::Form()","wwRequest::Form") %>>.

*:Parameters:
<<b>>lcKey<</b>>

*:ENDHELP
#ENDIF
*********************************************************************

DO CASE
  *** UrlEncoded
  CASE THIS.nPostMode = 1
      RETURN ATC("&"+lcFormVar+"=",THIS.cFormVars) > 0
  CASE this.nPostMode = 2
      RETURN ATC([; name="] + lcFormVar + ["],this.cFormVars) > 0
  CASE this.nPostMode = 4     
     RETURN AT("<" + lcFormVar + ">",this.cFormVars)
ENDCASE

RETURN .f.  
ENDFUNC
* EOF wwRequest::IsFormVar


************************************************************************
FUNCTION FormVarCount(lcFormVar)
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwRequest :: FormVarCount

*:Description:
Returns the number of available form variables for a given form 
variable.

*:Parameters:
lcFormVar
The name of the formvariables to retrieve.

*:Returns:

*:Remarks:

*:SeeAlso:

*:Keywords:

*:ENDHELP
#ENDIF
************************************************************************
LOCAL lnX, lnLoc
   
DO CASE 
   CASE this.nPostMode = 1
      lnX=0
      DO WHILE .t.
         lnX = lnX + 1
         lnLoc = ATC([&] +lcFormVar + [="],this.cFormVars,lnX)
         IF lnLoc < 1
            RETURN lnX-1
         ENDIF
      ENDDO
   CASE this.nPostMode = 2
      lnX=0
      DO WHILE .t.
         lnX = lnX + 1
         lnLoc = ATC([NAME="]+lcFormVar+["],this.cFormVars,lnX)
         IF lnLoc < 1
            RETURN lnX-1
         ENDIF
      ENDDO
   CASE this.nPostMode = 4
      RETURN OCCURS("<" + lcFormvar + ">",this.cFormVars)
ENDCASE

RETURN 0
ENDFUNC
*  wwRequest :: FormVarCount


*********************************************************************
FUNCTION SetKey(lcKey, lcValue, lvReserved)
*******************************************
#IF .F.
*:Help Documentation
*:Topic:
wwrequest::setkey

*:Description:
Sets a form or server variable to the specified value from the existing
POST data block.

This method is useful for operations where the program needs to make
changes to existing POST variable provided by the client application. An
example might be stripping out a password the user passed before
redisplaying a DHTML form that contains this data. After the display
operation is complete the original value can be reset.


*:Parameters:
<<b>>lcKey<</b>>
The form variable to set.

<<b>>lcValue<</b>>
The value to set the variable to

<<b>>lvReserved<</b>>
not used provided purely for compatibility

*:Remarks:
This functionality may not be provided for non-Web Connection messaging
types such as ASP messaging, since there's no way to change the POST buffer
data in those tools.
*:ENDHELP
#ENDIF

*********************************************************************
LOCAL lcFormVars, lcFullValue, lcValue, lcKey, lnLoc, lcRest, lnLength

lcFullValue=WWC_NULLSTRING

lcFormVars = THIS.cFormVars
lcValue = URLEncode(lcValue)
lcKey = STRTRAN(lcKey," ","+")

lnLoc=ATC("&"+lcKey+"=",lcFormVars)

if lnLoc > 0
   lcRest = SUBSTR(lcFormvars,lnLoc)
   lnLength = ATC("&",lcRest,2) 
   IF lnLength=< 1 
      *** No & at end - full string size
      lnLength = LEN(lcRest) + 1 && One to long to match &
   ENDIF
   lcFullValue = LEFT(lcRest,lnLength-1)
   THIS.cFormvars = STRTRAN(lcFormvars,lcFullValue,"&"+lcKey+"="+lcValue)
ELSE
   THIS.cFormVars=THIS.cFormVars + "&" + lcKey +"="+lcValue
ENDIF

ENDFUNC
* EOF wwRequest::SetKey

************************************************************************
* wwRequest ::  SetServerVariable
****************************************
***  Function: Sets a Server Variable to a specific name
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SetServerVariable(lcKey, lcValue)
LOCAL lcFormValue, lcValue, lcKey, lnLoc, lcRest,lnLength

lcFullValue=WWC_NULLSTRING
lcFormVars = THIS.cServerVars
lcValue = URLEncode(lcValue)
lcKey = STRTRAN(lcKey," ","+")

lnLoc=ATC("&"+lcKey+"=",lcFormVars)

if lnLoc > 0
   lcRest = SUBSTR(lcFormvars,lnLoc)
   lnLength = ATC("&",lcRest,2) 
   IF lnLength=< 1 
      *** No & at end - full string size
      lnLength = LEN(lcRest) + 1 && One to long to match &
   ENDIF
   lcFullValue = LEFT(lcRest,lnLength-1)
   THIS.cServerVars = STRTRAN(lcFormvars,lcFullValue,"&"+lcKey+"="+lcValue)
ELSE
   THIS.cServerVars=THIS.cServerVars + "&" + lcKey +"="+lcValue
ENDIF

ENDFUNC
*  wwRequest ::  SetServerVariable

*********************************************************************

**** INCLUDED FOR BACKWARDS COMPATIBILITY ONLY

*********************************************************************


*** INCLUDED FOR BACKWARDS COMPATIBILITY ONLY

#IF WWC_COMPATIBILITY
PROCEDURE getcgiparameter
LPARAMETER lnParameter
RETURN THIS.QueryString(lnParameter)
ENDPROC

PROCEDURE getformvar
LPARAMETERS lcVarname
RETURN THIS.Form(lcVarName)
ENDPROC
#ENDIF

ENDDEFINE
*
*-- EndDefine: wwrequest
**************************************************


*************************************************************
DEFINE CLASS wwApacheRequest AS wwRequest
*************************************************************

************************************************************************
* wwApacheRequest :: GetPhysicalPath
****************************************
***  Function: Works around some Apache Issues in how 
***            the physical path is returned. This bug
***            affects a number of the various path related
***            Server variables from apache
***    Assume: http://www.west-wind.com/wiki/kb.wiki?wc~Edit~ConfiguringWebConnectionWithApache
************************************************************************
FUNCTION GetPhysicalPath()
LOCAL lcPathInfo, lcLogical, lcWebRootPath, lnAt, lcAppPath

IF EMPTY(THIS.cPhysicalPath)   
	lcPathInfo = THIS.ServerVariables("PATH_TRANSLATED")
	IF EMPTY(lcPathInfo)
		lcPathInfo = THIS.ServerVariables("PHYSICAL_PATH")
   ENDIF   
   this.cPhysicalPath = STRTRAN( STRTRAN(lcPathInfo,"/","\"),"\\","\")

  IF LEN(this.cPhysicalPath) > 255
	this.cPhysicalPath = "INVALIDPATH.invalid"
  ENDIF

   IF UPPER(JUSTEXT(this.cPhysicalPath)) = "DLL"
 	   *** We have a ScriptAlias forwarding directive - the physical path is the DLL
	   *** and not the actual script file so let's try and fix it up
       lcLogical = this.GetLogicalPath()
       
       *** This shouldn't happen any longer in 5.25 and later
       IF UPPER(JUSTEXT(lcLogical)) # "DLL"
           *** Map to the Web Root then apply the logical pathing
           *** NOTE *** THIS IS NOT PERFECT - there are some situations where this can break
           lcWebRootPath = this.ServerVariables("WebRoot_Path")
           IF RIGHT(lcWebRootPath,1) != "\"
              lcWebRootPath = ADDBS(JUSTPATH(lcWebRootPath))
           ENDIF           
		   this.cPhysicalPath = LOWER( FULLPATH(lcWebRootPath + lcLogical))
	   ENDIF
   ENDIF
ENDIF

RETURN THIS.cPhysicalPath   
ENDFUNC
*  wwApacheRequest :: GetPhysicalPath

ENDDEFINE

*************************************************************
DEFINE CLASS wwShellCGI AS wwApacheRequest
*************************************************************

ENDDEFINE


