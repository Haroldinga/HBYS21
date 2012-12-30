SET PROCEDURE TO wwCache ADDITIVE

*************************************************************
DEFINE CLASS wwCache AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2005
*:Contact: http://www.west-wind.com
*:Updated: 07/25/2005
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class wwCache

*:Description:
This class serves as a simple caching mechanisms for strings. You can use 
it to store HTML - entire HTML responses or HTML fragments - and XML 
content or any other information that you might not want to regenerate on 
every hit, but rather recycle. You can even recycle data in XML format for 
say queries that take a long time to run but don't return extensive amounts
 of data and then use CURSORTOXML and XMLTOCURSOR to store and retrieve the
 data from the cache.

In Web Connection the cache object is instantiated on the the Server object
 and is always available as:

<<pre>>Server.oCache<</pre>>

in process requests.

*:Remarks:
The cache is implemented as a cursor, so the contents of the cache is not 
permanently stored on disk, but stored in temporary files.

Category list items are case sensitive

*:HelpId:
1241884
*:Filename:
_1190UUSWK
*:ENDHELP
#ENDIF

*** Properties
cCacheCursor = "__wwCache"

*** If set the Cache uses a shared DBF file. Make sure this filename
*** incldues the .dbf extension
cFixedFileName = ""   &&"__wwcache.dbf"

nDefaultCacheTimeout = 1800


************************************************************************
* wwCache :: Open
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwCache::Open

*:Description:
Opens the cache cursor. Either creates it or just uses it if already open.

The wwCache class uses a cursor, so each instance of Web Connection uses 
the same

*:SeeAlso:
Class wwCache

*:HelpId:
1241885
*:Filename:
_1190UUSX8
*:ENDHELP
#ENDIF
************************************************************************
FUNCTION Open()

IF !USED(this.cCacheCursor)
   IF EMPTY(this.cFixedFilename)
      CREATE CURSOR (THIS.cCacheCursor) ;
         (;
            Key C(236),;
            Content M,;
            XML   M,;
            Entered T,;
            Expires T, ;
            Accesses   I;   
         )
         *      INDEX ON EXPIRES TAG Expires
         INDEX ON KEY TAG Key 
   ELSE
      IF FILE(this.cFixedFilename)
         SELECT 0
         USE (this.cFixedFilename) ALIAS (this.cCacheCursor) SHARED
      ELSE
         CREATE TABLE (THIS.cFixedFileName) ;
         (;
            Key C(40),;
            Content M,;
            XML   M,;
            Entered T,;
            Expires T, ;
            Accesses   I;   
         )
         *      INDEX ON EXPIRES TAG Expires
         INDEX ON KEY TAG Key 
         USE
         USE (this.cFixedFileName) ALIAS (this.cCacheCursor) SHARED
      ENDIF
   ENDIF         
ENDIF

SELECT (THIS.cCacheCursor)

ENDFUNC
*  wwCache :: Create

************************************************************************
* wwCache :: GetItem
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwCache::GetItem

*:Description:
Retrieves an item by key from the cache.

*:Parameters:
<<b>>lcKey as String<</b>>
The key of the cached value to retrieve.

*:Returns:
returns the Cache content or NULL if the key doesn't exist

*:SeeAlso:
Class wwCache

*:HelpId:
1241886
*:Filename:
_1190UUSXW
*:ENDHELP
#ENDIF
************************************************************************
FUNCTION GetItem(lcKey) 
LOCAL lcOldAlias, lcContent

IF EMPTY(lcKey)
   lcKey = THIS.GetRequestSpecificKey()
ENDIF

lcOldAlias = ALIAS()
THIS.Open()

IF INDEXSEEK(LOWER(lcKey),.T.,THIS.cCacheCursor,"Key")

   IF Expires >= DATETIME()   
      lcContent = Content

      REPLACE ACCESSES WITH ACCESSES + 1
   ELSE
      DELETE  && Expired
      lcContent = NULL   
   ENDIF
ELSE
   lcContent = NULL
ENDIF

IF !EMPTY(lcOldAlias) AND USED(lcOldAlias)
   SELECT (lcOldAlias)
ENDIF

RETURN lcContent
ENDFUNC
*  wwCache :: GetItem

************************************************************************
* wwCache :: Remove
****************************************
***  Function: Removes an entry from the Cache
***    Assume:
***      Pass: lcKey - the key to remove
***    Return:
************************************************************************
FUNCTION Remove(lcKey)
LOCAL lcOldAlias, lcContent

IF EMPTY(lcKey)
   lcKey = THIS.GetRequestSpecificKey()
ENDIF

lcOldAlias = ALIAS()
THIS.Open()

IF INDEXSEEK(LOWER(lcKey),.T.,THIS.cCacheCursor,"Key")
   DELETE
ENDIF

IF !EMPTY(lcOldAlias)
   SELECT (lcOldAlias)
ENDIF

ENDFUNC
*  wwCache :: Remove

************************************************************************
* wwCache :: AddItem
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwCache::AddItem

*:Description:
This method adds an item to the cache.

*:Parameters:
<<b>>lcKey as String<</b>>
Key of the item to add.

<<b>>lcValue as String<</b>>
String value of the item to add.

<<b>>lnTimeoutSeconds as Integer<</b>>
Optional - The timeout in seconds for the item. if not specified the 
default cache timeout is used.

*:SeeAlso:
Class wwCache

*:HelpId:
1241887
*:Filename:
_1190UUSYK
*:ENDHELP
#ENDIF
************************************************************************
FUNCTION AddItem(lcKey, lcValue, lnTimeoutSeconds)

IF EMPTY(lnTimeoutSeconds)
   lnTimeoutSeconds = this.nDefaultCacheTimeout
ENDIF
IF EMPTY(lcKey) AND TYPE("Request") = "O"
   lcKey = THIS.GetRequestSpecificKey() 
ENDIF   


lcOldAlias = ALIAS()
THIS.Open()

IF INDEXSEEK(LOWER(lcKey),.T.,THIS.cCacheCursor,"Key")
   replace content WITH lcValue, Expires WITH DATETIME() + lnTimeoutSeconds,;
           entered WITH DATETIME(),Accesses WITH 0
ELSE
   INSERT INTO (THis.cCacheCursor) (Key,Content,Entered,Expires,Accesses) ;
          VALUES (LOWER(lcKey),lcValue,DATETIME(),DATETIME() + lnTimeoutSeconds,0)
ENDIF

IF !EMPTY(lcOldAlias)
   SELECT (lcOldAlias)
ENDIF

ENDFUNC
*  wwCache :: SetItem

************************************************************************
* wwCache :: IsCached
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwCache::IsCached

*:Description:
Determines whether an item is cached or not.

*:Parameters:
<<b>>lcKey<</b>>
The key to check for existance.

*:Returns:
.t. or .f.

*:SeeAlso:
Class wwCache

*:HelpId:
1241893
*:Filename:
_11A0LVDQD
*:ENDHELP
#ENDIF
************************************************************************
FUNCTION IsCached(lcKey)
LOCAL lcOldAlias
 
IF EMPTY(lcKey)
   lcKey = THIS.GetRequestSpecificKey()
ENDIF
 
lcOldAlias = ALIAS()
THIS.Open()

llCached = INDEXSEEK(LOWER(lcKey),.T.,THIS.cCacheCursor,"Key")
IF llCached AND Expires < DATETIME()   
   DELETE
   llCached = .f.
ENDIF

IF !EMPTY(lcOldAlias)
   SELECT (lcOldAlias)
ENDIF

RETURN llCached
ENDFUNC
*  wwCache :: IsCached

************************************************************************
* wwCache :: Expire
****************************************
#IF .F.
*:Help Documentation
*:Topic:
wwCache::Expire

*:Description:
Removes all expired entries from the cache data file.

NOTE:
Make sure you occasionally pack the Cache file!

*:SeeAlso:
Class wwCache

*:HelpId:
1241889
*:Filename:
_1190UUSZW
*:ENDHELP
#ENDIF
************************************************************************
FUNCTION Expire()
LOCAL lcOldAlias as String

lcOldAlias = ALIAS()

this.Open()
DELETE FROM (this.cCacheCursor) WHERE Expires < DATETIME()

IF !EMPTY(lcOldAlias)
   SELECT (lcOldAlias)
ENDIF

ENDFUNC
*  wwCache :: Expire

************************************************************************
* wwCache :: GetRequestSpecificKey
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetRequestSpecificKey()
RETURN LOWER(Request.ServerVariables("SCRIPT_NAME") + Request.cQueryString)
ENDFUNC
*  wwCache :: GetRequestSpecificKey


************************************************************************
* wwCache :: Reindex
****************************************
***  Function: Cleans up the Cached cursor if a fixed
***            file is used.
***      Pass:
***    Return:
************************************************************************
FUNCTION Reindex()

IF EMPTY(this.cFixedFileName)
   RETURN .T.
ENDIF
 
IF !OpenExclusive(this.cFixedFileName)
   RETURN .F.
ENDIF

DELETE FOR Expires < DATETIME()
DELETE TAG ALL
PACK
INDEX ON KEY TAG Key 
USE

ENDFUNC
*  wwCache :: Reindex

ENDDEFINE
