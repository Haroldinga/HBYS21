#INCLUDE wconnect.h

*************************************************************
DEFINE CLASS wwHTTPHeader AS RELATION
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 1999
*:Contact: http://www.west-wind.com
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHTTPHeader

*:Description:
This class is used to generate the HTTP header for an HTTP
response request. This object is used internally in the 
wwResponse.ContentTypeHeader() method to generate the default
HTTP header for most requests.

*:ENDHELP
#ENDIF

*-- HTTP Version for header
chttpversion = DEFAULT_HTTP_VERSION

*-- Internal HTML object used to send output
oHTML = .NULL.

*-- Internet property that's .T. if you passed in an exisiting Request object
lPassedHTMLObject = .F.

*********************************************************************
FUNCTION Init(loHTML)
************************

IF VARTYPE(loHtml) = "O"
  THIS.oHTML = loHTML
  THIS.lPassedHTMLObject = .T.
ELSE
  THIS.oHTML = CREATE([WWC_RESPONSESTRING])
  THIS.lPassedHTMLObject = .F.
ENDIF

ENDFUNC
* EOF wwHTTPHeader::Init


*********************************************************************
FUNCTION DefaultHeader()
*************************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::DefaultHeader

*:Description:
This method creates a default HTTP header for standard HTML requests. The
header looks like this:

<<pre>>HTTP/1.0 200 OK
Content-type: text/html

<html>
...
</html>
<</pre>>

Note that every HTTP header must include a blank line after the header and
before the actual content of the request starts (<html> in the example
above) .
*:ENDHELP
#ENDIF
*********************************************************************

THIS.oHTML.Write(DEFAULT_CONTENTTYPE_HEADER)

ENDFUNC
* EOF wwHTTPHeader::DefaultHeader



************************************************************************
* wwHttpHeader :: ReturnFileHeader
****************************************
***  Function: Returns a file Download header that should prompt the
***            user to save the file to disk.
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION FileDownloadHeader(lcFileName,lcContentType,lnContentSize)
LOCAL lcContentSize

lcFileName = JUSTFNAME(lcFileName)
IF EMPTY(lcContentType)
   lcContentType = "application-octet-stream"
ENDIF   

lcContentSize = ""
IF !EMPTY(lnContentSize )
   lcContentSize = "Content-Length: " + TRANSFORM(lnContentsize) + CRLF
ENDIF

this.oHtml.Write([HTTP/] + this.cHttpVersion + [ 200 OK]+ CRLF + ;
         [Content-type: ] + lcContentType  + CRLF +;
         lcContentSize + ;
         [Content-Disposition: attachment; filename=]+ lcFileName + CRLF)

ENDFUNC
*  wwHttpHeader :: ReturnFileHeader


*********************************************************************
FUNCTION Authenticate(tcRealm, tcErrorText)
*******************************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::Authenticate

*:Description:
This method creates a self contained HTTP request that asks the browser to
present the login dialog into which the user must type the username and
password. The password is then validated by the Web server typically
against the NT (or Windows) user database. The exact validation varies by
Web server - IIS uses the NT User database on the server.

This mechanism works through Basic Authentication which is part of the HTTP
protocol.

*:Parameters:
<<b>>lcRealm<</b>>
Optional - The realm as its known in HTTP terms is the domain name or IP
address of the server.

<<b>>lcErrorText<</b>>
The HTML text to display if an error occurs with login validation. IOW, if
the user types in the wrong password this is what they'll see. This text is
static.

*:Returns:
nothing

*:Remarks:
In order for an authentication request to succeed on the server Basic
Authentication must be enabled on the server. By default this behavior is
disabled - see your Web server security settings to enable this
functionality.

Note: Basic Authentication is a non-secure protocol that sits on top of
HTTP. Passwords are passed as clear text (although encoded with a simple,
easily breakable hash algorithm) and can be easily hijacked with a network
sniffer. If you're worried about security make sure that your
authentication request runs over SSL/HTTPS - when you do the entire request
info is encrypted.

Also, check out the <<%=
TopicLink("wwRequest::GetAuthenticatedUser","wwRequest::GetAuthenticatedUse
r") %>> method which allows you to retrieve the authenticated username if
the login attempt succeeded.

*:ENDHELP
#ENDIF
*********************************************************************

tcRealm     = IIF(VARTYPE(tcRealm)="C",tcRealm,"")
tcErrorText = IIF(VARTYPE(tcErrorText)="C",tcErrorText,;
                "<HTML><h1>Access Denied</h1><hr>"+CR+;
                "Please enter a valid username and password to access this request.</HTML>")

THIS.oHTML.Clear()
THIS.oHTML.Write([HTTP/]+THIS.chttpversion+[ 401 Not Authorized]+CRLF+;
                [WWW-Authenticate: basic realm="]+ tcRealm + ["]+ CRLF+ ;
                [Context-Type: text/html] + CRLF + CRLF + ;
                tcErrorText) 
ENDFUNC
* EOF wwHTTPHeader::Authenticate


FUNCTION Redirect(tcUrl)
************************************************************************
* wwHTTPHeader :: Redirect
**************************
***  Function: Redirects Server output to the specified URL or Locator.
***            Note this operation creates a full document and erases
***            any existing text that was sent.
***      Pass: lcUrl
************************************************************************

tcUrl=IIF(VARTYPE(tcUrl)="C",tcUrl,"")

THIS.oHTML.Rewind()
THIS.oHTML.Write("HTTP/" + this.cHttpVersion + " 302 Moved"+CRLF+;
      "Content-type: text/html"+CRLF+;
      "Location: "+tcUrl+CRLF)
ENDFUNC


FUNCTION sethttpversion
************************************************************************
* wwHTTP :: SetHTTPVersion
*********************************
***  Function: Sets the HTTP version that is returned in the HTTP header.
***      Pass: tcVersion   -   "0.9", "1.0", "1.1"
***    Return:
************************************************************************
LPARAMETERS tcVersion
THIS.chttpversion=IIF(VARTYPE(tcVersion)="C",tcVersion,"1.1")
ENDFUNC

*********************************************************************
FUNCTION ClearHeader()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::ClearHeader

*:Description:
Clears all current output in the HTTP header.

*:ENDHELP
#ENDIF
*********************************************************************
THIS.oHTML.Clear()
ENDFUNC
* EOF wwHTTPHeader::ClearHeader


*********************************************************************
FUNCTION SetContentType(tcContentType)
**************************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::SetContenttype

*:Description:
Content types determine the type of data that is returned from a request
for the benefit of the client application. Browsers rely on content types
to figure out how to display incoming data. By default browsers expect to
see HTML content which is <<i>>text/html<</i>>. But you can also return
plain text <<i>>text/plain<</i>> for example. You can also return binary
data such as a PDF document: <<i>>application/pdf<</i>>. Zip files, Word
Docs, and most other common Windows file formats are represented and have
their own content types.

The browser uses this content type header to figure out what viewer or
external application to launch to provide a useful interface to for the
data downloaded. SetContentType sets the content type in the HTTP header on
the server.

*:Parameters:
<<b>>tcContentType<</b>>
The content type to set the output to. <<i>>Default:<</i>> text/html
*:ENDHELP
#ENDIF
*********************************************************************

tcContentType=IIF(!EMPTY(tcContentType),tcContentType,"text/html")
THIS.oHTML.Write("Content-type: "+tcContentType+CRLF)

ENDFUNC
* EOF wwHTTPHeader::SetContentType


*********************************************************************
FUNCTION AddCookie(tcCookie, tcValue, tcPath, tcExpire)
*******************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::AddCookie

*:Description:
HTTP cookies can be used to keep client state. A cookie is a piece of data
that is stored on the browser to identify the user. You create the cookie
as part of the HTTP header with this method and you can then read that
cookie from the user by using <<%=
TopicLink("wwRequest::GetCookie()","wwRequest::GetCookie") %>>.

*:Parameters:
<<b>>tcCookie<</b>>
Name of the cookie to create

<<b>>tcValue<</b>>
The value to set it to.

<<b>>tcPath<</b>>
The virtual path that it applies to. By default this is the Web's root
path, but realisticly you should scope it to the virtual directory that the
request is running in. FOr example if you run the following url:

<<pre>>/wconnect/wc.dll?wwDemo~TestPage<</pre>>

where /wconnect is a virtual directory the cookie should be scoped to the
/wconnect path.

<<b>>tcExpire<</b>>
Optional - Sets an expiration for the cookie. This must be a fully
qualified string:
For example: <<i>>Sun, 27-Dec-2009 01:01:01 GMT<</i>>

This value can also be NEVER which generates the value above. Note: older
browsers have problems with cookies far in the future - the above value
works with most 3.x and later browsers.

*:ENDHELP
#ENDIF
*********************************************************************
   tcCookie=IIF(VARTYPE(tcCookie)="C",tcCookie,"")
   tcValue=IIF(VARTYPE(tcValue)="C",tcValue,"")
   tcPath=IIF(VARTYPE(tcPath)="C",tcPath,"/")
   tcExpire=IIF(VARTYPE(tcExpire)="C",tcExpire,"")

   IF UPPER(tcExpire)="NEVER"
      tcExpire="Sun, 28-Dec-2008 01:01:01 GMT"
*   tcExpire="Fri, 31-Dec-2009 01:01:01 GMT"
   ENDIF
   IF !EMPTY(tcExpire)
      tcExpire="; expires="+tcExpire
   ENDIF

   THIS.oHTML.Write([Set-Cookie: ]+tcCookie+[=]+tcValue+;
      [; path=]+tcPath+tcExpire+CRLF)
ENDFUNC
* EOF wwHTTPHeader::AddCookie


*********************************************************************
FUNCTION AddForceReload()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::AddForceReload

*:Description:
Adds an immediate expiration to the page so the page will always be forced
to reload and not be read from cache.

This method basically sets an Expires: header that is in the past and
forces the page to expire immediately. This results in the page always
being reloaded and not being cached by proxies or browsers.

Use this method whereever you hit identical URLs that generate different
data or data that changes frequently.
*:ENDHELP
#ENDIF
*********************************************************************
THIS.oHTML.Write("Expires: 0" +CRLF + ;
                 "Pragma: no-cache" + CRLF +;
                 "Cache-Control: no-store, no-cache, must-revalidate" + CRLF +;
                 "Cache-Control: post-check=0, pre-check=0" + CRLF)


ENDFUNC
* EOF wwHTTPHeader::AddForceReload

************************************************************************
* wwHttpHeader :: CacheRequest
****************************************
***  Function: Caches an item publicly which means the Web Server
***            can use its cache to cache this item.
***            Note: On IIS 6 this may trigger Kernel Caching
***      Pass:
***    Return:
************************************************************************
FUNCTION AddCacheHeader(lnExpirationSeconds)

IF EMPTY(lnExpirationSeconds)
   lnExpirationSeconds = 300  && 5 minutes
ENDIF

this.AddHeader("Last-Modified",MimeDateTime( DATETIME(),.t.))
this.AddHeader("Expires",MimeDateTime( DATETIME() + lnExpirationSeconds,.t.))
*THIS.AddHeader("Cache-Control","public,max-age=" + TRANSFORM(lnExpirationSeconds) )

RETURN


*********************************************************************
FUNCTION AddCustom( tcCustomString)
***********************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::AddCustom

*:Description:
AddCustom works much like AddHeader() in that it generates a custom HTTP
header. Some HTTP headers don't conform to the Header/Value pair syntax so
this method allows you to specify a complete HTTP header line rather than
the key/value pair.


*:Parameters:
<<b>>lcCustomHeader<</b>>
The custom HTTP header line.
*:ENDHELP
#ENDIF
*********************************************************************

THIS.oHTML.Write(tcCustomString)

ENDFUNC
* EOF wwHTTPHeader::AddCustom


*********************************************************************
FUNCTION AddHeader(lckey,lcValue)
*********************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::AddHeader

*:Description:
HTTP allows you to specify a number of custom headers for requests that can
be interpreted by clients. This is one mechanism for the server to pass
down data to the client. Typically the HTTP header is used for standard
headers that are supported by browsers. For example, custom types in
include things like Expires, Set-Cookie, Pragma and so on. You can also add
your totally custom headers in this same fashion. This won't do much

Adds a custom HTTP header using a key/value string.

*:Parameters:
<<b>>lckey<</b>>
The HTTP header to set. This can be a standard HTTP header or a custom
header you make up of your own.

<<b>>lcValue<</b>>
The actual value to set the key to.

*:ENDHELP
#ENDIF
*********************************************************************

THIS.oHTML.Write(lckey+": "+lcValue+CRLF)

ENDFUNC
* EOF wwHTTPHeader::AddHeader

*********************************************************************
FUNCTION SetProtocol(tcProtocol,tcErrorCode,tcMessage)
******************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::SetProtocol

*:Description:
Sets the protocol for the HTTP header.

<<pre>>HTTP/1.0 200 OK
Content-type: text/html

<</pre>>

The HTTP is the protocol and the 1.0 is the version as specified in the
cHTTPVersion property.

SetProtocol() is meant to be called if you need to create non-standard (ie.
non-HTML) HTML headers that are built from scratch. Generally you will not
pass any parameters to this method but rather use the default values which
are based on the cHTTPVersion.

If you do specify a parameter you should specify the entire protocol header
line like:

<<pre>>HTTP/0.9 200 OK<</pre>>

*:Parameters:
<<b>>tcProtocol<</b>>
<<i>>Optional<</i>> - The full HTTP protocol and response line. HTTP/0.9
200 OK
If you don't specify this parameter HTTP/1.1 200 OK will be generated. 1.1
is determined by the cHTTPVersion value, which you can override.

*:ENDHELP
#ENDIF
*********************************************************************

tcProtocol=IIF(!EMPTY(tcProtocol),tcProtocol,"HTTP/"+THIS.chttpversion+" 200 OK")
   
THIS.oHTML.Write( tcProtocol + CRLF )

ENDFUNC
* EOF wwHTTPHeader::SetProtocol


*********************************************************************
FUNCTION GetOutput()
************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::GetOutput

*:Description:
Retrieves the output of the header if no Response object was passed in. The
data is generated into the internal Response object and GetOutput retrieves
that output as a string.

*:Returns:
String - all the content generated from the header including the trailing
blank header line.

*:ENDHELP
#ENDIF
*********************************************************************

*** Add an AutoSession Cookie if set
IF !EMPTY(THIS.oHTML.cAutoSessionCookie)
  THIS.AddCookie(THIS.oHTML.cAutoSessionCookieName,;
                 THIS.oHTML.cAutoSessionCookie,,;
                 IIF(THIS.oHTML.lAutoSessionCookiePersist,"NEVER","") )
ENDIF



THIS.oHTML.Write(CRLF)
RETURN THIS.oHTML.getoutput()
ENDFUNC
* EOF wwHTTPHeader::GetOutput


*********************************************************************
FUNCTION CompleteHeader()
*************************
#IF .F.
*:Help Documentation
*:Topic:
wwHTTPHeader::CompleteHeader

*:Description:
When you pass in a Response object when the wwHTTPHeader object is created
this object generates the HTTP output every time when you call one of the
methods in this class. Once the header is complete it's extremely important
that the trailing blank line gets generated and CompleteHeader() is meant
to do this.

*:ENDHELP
#ENDIF
*********************************************************************

*** Add an AutoSession Cookie if set
IF !EMPTY(THIS.oHTML.cAutoSessionCookie)
  THIS.AddCookie(THIS.oHTML.cAutoSessionCookieName,THIS.oHTML.cAutoSessionCookie,,;
                 IIF(THIS.oHTML.lAutoSessionCookiePersist,"NEVER","") )
ENDIF

THIS.oHTML.Write(CRLF)
* EOF wwHTTPHeader::CompleteHeader

ENDFUNC


ENDDEFINE
*EOC wwHTTPHeader


*************************************************************
DEFINE CLASS wwHTMLHeader AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2000
*:Contact: http://www.west-wind.com
*:Created: 07/17/2000
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwHTMLHeader

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
cHTMLTag = "<html>"
cDocType = [<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">]
cHeadSection = ""
cScriptSection = ""
cBodyTag = "<body>"
cStyleSheetBlock = ""
cJavaScriptBlock = ""
cVBScriptBlock = ""

*-- Internal HTML object used to send output
oHTML = .NULL.

*-- Internet property that's .T. if you passed in an exisiting Request object
lPassedHTMLObject = .F.

*********************************************************************
FUNCTION Init(loHTML)
*********************************************************************

IF VARTYPE(loHTML) = "O"
  THIS.oHTML = loHTML
ENDIF

ENDFUNC
* EOF wwHTTPHeader::Init


*********************************************************************
FUNCTION DefaultHeader(lcTitle)
*******************************
IF !EMPTY(lcTitle)
  THIS.AddTitle(lcTitle)
ENDIF
ENDFUNC                 
* EOF wwHMLHeader::DefaultHeader

************************************************************************
* wwHTMLHeader :: AddStyleSheet
****************************************
***  Function: adds a Cascading StyleSheet reference
************************************************************************
FUNCTION AddStyleSheet
LPARAMETERS lcUrl
THIS.cHeadSection = THIS.cHeadSection + ;
                    [<LINK rel="stylesheet" type="text/css" href="] + lcUrl + [">] +CRLF

ENDFUNC
*  wwHTMLHeader :: AddStyleSheet


************************************************************************
* wwHTMLHeader :: AddStyleSheetBlock
****************************************
***  Function: Adds a style sheet block into a <STYLE> section.
***            Typically you'll want to pass a single style 
***            into this.
***      Pass: lcStyleBlock -  Style Sheet text
************************************************************************
FUNCTION AddStyleSheetBlock
LPARAMETERS lcStyleBlock

THIS.cStyleSheetBlock = THIS.cStyleSheetBlock + ;
                    lcStyleBlock + CRLF
ENDFUNC
*  wwHTMLHeader :: AddStyleSheetLink


************************************************************************
* wwHTMLHeader :: AddTitle
****************************************
***  Function: Adds the <title> tag to the header
***      Pass: lcTitle 
************************************************************************
FUNCTION AddTitle
LPARAMETERS lcTitle

THIS.cHeadSection = THIS.cHeadSection + ;
              [<title>] + lcTitle + [</title>] + CRLF
             
ENDFUNC
*  wwHTMLHeader :: AddTitle

************************************************************************
* wwHTMLHeader :: AddScriptLink
****************************************
***  Function: Adds a link to an external script file. 
***      Pass: lcUrl      -   URL to load from
***            lcLanguage -   Script Language used (VBScript, JavaScript)
************************************************************************
FUNCTION AddScriptLink
LPARAMETERS lcUrl,lcLanguage

THIS.cHeadSection = THIS.cHeadSection + ;
   "<SCRIPT " + IIF(!EMPTY(lcLanguage),[ language="] + lcLanguage + [" ],[]) + ;
   [src="] + lcUrl + ["></SCRIPT>] +CRLF

ENDFUNC
*  wwHTMLHeader :: AddScriptLink

************************************************************************
* wwHTMLHeader :: AddJavaScript
****************************************
***  Function: Adds a script block
************************************************************************
FUNCTION AddJavaScript
LPARAMETERS lcScript

THIS.cJavaScriptBlock = THIS.cJavaScriptBlock + lcScript + CRLF

ENDFUNC
*  wwHTMLHeader :: AddJavaScript


************************************************************************
* wwHTMLHeader :: AddVBScript
****************************************
***  Function: Adds a script block
***      Pass: lcScript
************************************************************************
FUNCTION AddVBScript
LPARAMETERS lcScript

THIS.cVBScriptBlock = THIS.cVBScriptBlock + lcScript + CRLF

ENDFUNC
*  wwHTMLHeader :: AddVBScript


************************************************************************
* wwHTMLHeader :: AddMetaTag
****************************************
***  Function: Adds a Meta Tag
***      Pass: lcName  -  Name of the tag to add
***            lcValue -  Value to set it to
************************************************************************
FUNCTION AddMetaTag
LPARAMETERS lcName, lcValue

THIS.cHeadSection = THIS.cHeadSection + ;
              [<meta name="] + lcName + [" content="] + lcValue + [">] + CRLF

ENDFUNC
*  wwHTMLHeader :: AddMetaTag


************************************************************************
* wwHTMLHeader :: AddPageRefresh
****************************************
***  Function: Adds a Meta Refresh tag that causes a page to
***            reload
***      Pass: lcURL      -  The URL to refresh to
***            lnRefresh  -  in secs - when to refresh the page
************************************************************************
FUNCTION AddPageRefresh
LPARAMETERS lcUrl, lnRefresh

IF EMPTY(lnRefresh)
   lnRefresh = 1
ENDIF
IF EMPTY(lcUrl)
   lcUrl = ""
ELSE
   lcUrl = [;URL=] + lcUrl
ENDIF
THIS.cHeadSection = THIS.cHeadSection + ;
   [<META HTTP-EQUIV="Refresh" CONTENT="] + TRANSFORM(lnRefresh) + lcUrl + [">] +CRLF

ENDFUNC
*  wwHTMLHeader :: AddPageRefresh


************************************************************************
* wwHTMLHeader :: GetOutput
****************************************
***  Function: Returns the output from the header. If THIS.oHTML was
***            passed in, the output is written into the Response object,
***            otherwise the value is returned.
***    Return: Header output, or nothing if oHTML was passed in.
************************************************************************
FUNCTION GetOutput
LOCAL lcOutput

lcHeadSection = THIS.cHeadSection 

IF !EMPTY(THIS.cStyleSheetBlock)
   lcHeadSection = lcHeadSection + "<STYLE>" + CRLF + ;
                         	       THIS.cStyleSheetBlock + ;
                         	       "</STYLE>" + CRLF
ENDIF
   
IF !EMPTY(THIS.cJavaScriptBlock)
   lcHeadSection = lcHeadSection + ;
        [<script language="JavaScript">] + CRLF + ;
        THIS.cJavaScriptBlock + CRLF + ;
        [</script>] + CRLF
ENDIF
        
IF !EMPTY(THIS.cVBScriptBlock)
   lcHeadSection = lcHeadSection + ;
        [<script language="VBScript">] + CRLF + ;
        THIS.cVBScriptBlock + CRLF + ;
        [</script>] + CRLF
ENDIF

lcOutput = IIF(EMPTY(THIS.cDocType), "", THIS.cDocType + CRLF) + ;
       THIS.cHTMLTag + CRLF + ;
       IIF(!EMPTY(lcHeadSection),"<head>" +CRLF + lcHeadSection + "</head>" + CRLF,"") + ;
       THIS.cBodyTag +CRLF

IF !ISNULL(THIS.oHTML)
   RETURN THIS.oHTML.Write(lcOutput)
ENDIF   

RETURN lcOutput
ENDFUNC
*  wwHTMLHeader :: GetOutput


ENDDEFINE
*EOC wwHTMLHeader 
