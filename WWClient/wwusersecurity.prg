#include wconnect.h
SET PROCEDURE TO wwUserSecurity Additive

*************************************************************
DEFINE CLASS wwUserSecurity AS Custom
*************************************************************
* Author: Rick Strahl
*         (c) West Wind Technologies, 2005
* Contact: http://www.west-wind.com
* Created: 09/22/2005
*************************************************************

*** Stock Properties

*-- The user data for the current active user. This object contains all the field values of the user table
ouser = .NULL.

*-- Alias of the user file.
calias = "usersecurity"

*-- Filename for the user file.
cfilename = "usersecurity"

*-- Holds error messages when lError = True or when any methods return False.
cerrormsg = ""

*-- Error Flag. True when an error occurs during any operation.  tSet but not required as most methods return True or False.
lerror = .F.

*-- Internal flag used to determine whether a the current user is a new entry.
PROTECTED lnewuser
lnewuser = .F.

*-- The default value when the account should time out in days. Leave this value at 0 to force the account to never timeout.
ndefaultaccounttimeout = 30

*-- 0 - Use user table. 2 - Use NT Authentication.
nauthenticationmode = 0

*-- Domain name when using NT Authentication for request.
cdomain = "."

*-- Minimum length of the password.
nminpasswordlength = 4

*-- Determines wheter usernames and passwords are case sensitive. The default is .F.
lcasesensitive = .F.


*-- Tries to logon a user. If the user logon is successfull (return .T.) the user record is set to the selected user. This method is like GetUser, but uses  Username/Password instead of PK and updates the LastOn timestamp.
************************************************************************
* wwUserSecurity  :: Authenticate
****************************************
***  Function: Authenticates the specified user based on Username/Password
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Authenticate()
LPARAMETER lcusername, lcpassword

*** Authentication against user file
IF  .NOT. THIS.getuser(lcusername,lcpassword)
   RETURN .F.
ENDIF
IF  .NOT. THIS.ouser.ACTIVE
   THIS.seterror("This user account is not active or has expired.")
   RETURN .F.
ENDIF
IF  .NOT. EMPTY(THIS.ouser.expireson) .AND. THIS.ouser.expireson<DATE()
   THIS.ouser.ACTIVE = .F.
   THIS.saveuser()
   THIS.seterror("This user account has expired.")
   RETURN .F.
ENDIF

*** Now that we have the user update his stats
THIS.ouser.laston = DATETIME()
THIS.ouser.logoncount = THIS.ouser.logoncount+1

*** And save the changes
THIS.SaveUser()

ENDFUNC
*  wwUserSecurity  :: Authenticate


************************************************************************
* wwUserSecurity  :: GetUser
****************************************
***  Function: Retrieves a user data record object without affecting the 
***            currently active user. Pass in a PK or Username and Password. 
***            GetUser always returns a record unless the record cannot be found. Use Logon to check for Active and Expired status.
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetUser(lcPK, lcPassword)

*** lcPK could also be the username

THIS.lError = .F.

IF .NOT. THIS.OPEN()
   THIS.lError = .T.
   THIS.SetError("Couldn't open "+THIS.cfilename)
   RETURN .F.
ENDIF

THIS.lNewUser = .F.

*** Allow retrieving a blank user record
IF lcPK="BLANK"
   SCATTER BLANK MEMO NAME THIS.ouser
   RETURN .T.
ENDIF


*** If 2 parameters we have username and password
*** Otherwise it's a PK
IF PCOUNT()>1
   IF THIS.lCaseSensitive
      LOCATE FOR username=PADR(lcPK, LEN(username)) .AND.  ;
                 PASSWORD = PADR(lcPassword, LEN(password))
   ELSE
      LOCATE FOR LOWER(username)=PADR(LOWER(lcPK), LEN(username)) .AND.  ;
                 LOWER(PASSWORD) = PADR(LOWER(lcPassword), LEN(password))
   ENDIF

   *** Found: Load the record into THIS.oUser
   IF FOUND()
      SCATTER MEMO NAME THIS.ouser
      RETURN .T.
   ENDIF
   
   *** No match - return blank user object and error message
   THIS.SetError("Invalid Password or Username")
   SCATTER BLANK MEMO NAME THIS.ouser
   RETURN .F.
ENDIF

*** A PK was passed in
LOCATE FOR pk = PADR(lcPK,LEN(pk))

*** Found: set THIS.oUser record
IF FOUND()
   SCATTER MEMO NAME THIS.ouser
   RETURN .T.
ENDIF

*** No match - blank user record and error message
THIS.SetError("Invalid Password or Username")
SCATTER BLANK MEMO NAME THIS.ouser

RETURN .F.
ENDFUNC
*  wwUserSecurity  :: GetUser

************************************************************************
* wwUserSecurity ::  GetUserByUsername
****************************************
***  Function: retrieves a user object by username
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION GetUserByUsername(lcUsername)

THIS.lError = .F.

IF .NOT. THIS.OPEN()
   THIS.lError = .T.
   THIS.SetError("Couldn't open "+THIS.cfilename)
   RETURN .F.
ENDIF

IF EMPTY(lcUsername)
   this.SetError("Can't pass empty username.")
   RETURN .F.
ENDIF   

IF THIS.lCaseSensitive
   LOCATE FOR username=PADR(lcUsername, LEN(username)) 
ELSE
   LOCATE FOR UPPER(username)=PADR(UPPER(lcUsername), LEN(username))
ENDIF

*** Found: Load the record into THIS.oUser
IF FOUND()
   SCATTER MEMO NAME THIS.ouser
   RETURN .T.
ENDIF
   
*** No match - return blank user object and error message
THIS.SetError("Invalid Password or Username")
SCATTER BLANK MEMO NAME THIS.ouser
RETURN .F.
ENDFUNC
*  wwUserSecurity ::  GetUserByUsername

************************************************************************
* wwUserSecurity  :: SaveUser
****************************************
*-- Saves the currently active user to file. Saves the oUser member to the database.
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION SaveUser()
LOCAL lcUsername, lnFieldSize
THIS.lError = .F.

*** Validate User
IF LEN(TRIM(THIS.ouser.PASSWORD)) < THIS.nMinPasswordLength
   THIS.seterror("Password must be at least " + TRANSFORM(THIS.nMinPasswordLength) + " characters.")
   RETURN .F.
ENDIF
IF EMPTY(THIS.ouser.FULLNAME)
   THIS.ouser.FULLNAME = THIS.ouser.username
ENDIF

*** Now let's save it
IF !THIS.OPEN()
	RETURN .F.
ENDIF

lnFieldSize = FSIZE("username",this.cAlias)
lcUserName = this.oUser.username

IF THIS.lnewuser
   IF THIS.lCaseSensitive
      LOCATE FOR username=PADR(lcUserName,lnFieldSize)
   ELSE
      LOCATE FOR LOWER(username)=PADR(LOWER(lcUserName), lnFieldSize)
   ENDIF
   IF FOUND()
      THIS.seterror("Username already in use")
      RETURN .F.
   ENDIF
   APPEND BLANK
ELSE
   IF THIS.lCaseSensitive
      LOCATE FOR username=PADR(lcUserName, lnFieldSize) .AND. pk<> THIS.ouser.pk
   ELSE
      LOCATE FOR username=PADR(LOWER(lcUserName), lnFieldSize) .AND. pk<> THIS.ouser.pk
   ENDIF
   IF FOUND()
      THIS.seterror("Username already in use")
      RETURN .F.
   ENDIF
   LOCATE FOR pk=THIS.ouser.pk
   IF  .NOT. FOUND()
      THIS.seterror("User not found")
      RETURN .F.
   ENDIF
ENDIF

GATHER MEMO NAME THIS.ouser

RETURN .T.
ENDFUNC
*  wwUserSecurity  :: SaveUser


************************************************************************
* wwUserSecurity  :: NewUser
****************************************
*-- Creates a new user record and stores it in the user data.
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION NewUser()

*** Creates a new empty user record in THIS.oUser

*** Get a blank user object
THIS.GetUser("BLANK")

*** Fill it with default values
THIS.oUser.PK = SYS(2015)
THIS.oUser.created = DATETIME()

IF THIS.nDefaultAccountTimeout>0
   THIS.oUser.expireson = DATE()+THIS.nDefaultAccountTimeout
ENDIF

THIS.oUser.ACTIVE = .T.
THIS.lNewUser = .T.
ENDFUNC
*  wwUserSecurity  :: NewUser


************************************************************************
* wwUserSecurity  :: Open
****************************************
*-- Opens the user file and/or selects it into cAlias. If the table is already open this method only selects the Alias.
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Open(lcFileName, llReOpen, llNonSilent)

IF USED(THIS.cAlias) .AND. .NOT. llReOpen
    SELECT (THIS.cAlias)
    RETURN .T.
ENDIF

IF USED(THIS.cAlias)
    USE IN (THIS.cAlias)
ENDIF

THIS.cFilename = FORCEEXT(IIF(EMPTY(lcFileName), THIS.cFilename,lcFileName), "dbf")

IF !FILE(THIS.cFilename)
    IF  llNonSilent
        THIS.cFilename = GETFILE('dbf', 'Web User File:', 'Open', 0)
    ELSE
        this.CreateTable()
        IF !USED(this.cAlias)
            RETURN .F.
        ENDIF
        
        THIS.lError = .T.
	    THIS.SetError("Couldn't open "+THIS.cfilename)
        RETURN .F.
    ENDIF
ENDIF

USE (THIS.cFilename) ALIAS (THIS.cAlias) IN 0
SELECT (THIS.cAlias)

*** Initialize the user record to a blank entry
THIS.GetUser("BLANK")

RETURN .T.
ENDFUNC
*  wwUserSecurity  :: Open

************************************************************************
* wwUserSecurity  :: Close
****************************************
*-- Closes the user file or selects it.
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Close()

IF USED(this.calias)
   USE IN (this.calias)
ENDIF

ENDFUNC
*  wwUserSecurity  :: Close

************************************************************************
* wwUserSecurity  :: SetError
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
PROTECTED PROCEDURE SetError(lcMessage)

IF PCOUNT() = 0
  THIS.lError = .F.
  THIS.cErrorMsg = ""
  RETURN 
ENDIF  

this.lerror = .T.
this.cerrormsg = lcmessage

ENDFUNC
*  wwUserSecurity  :: SetError   


************************************************************************
* wwUserSecurity  :: DeleteUser
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION DeleteUser()

 this.lerror = .F.
 IF  .NOT. this.open()
    this.seterror("Couldn't open the user table")
    RETURN .F.
 ENDIF
 LOCATE FOR pk=this.ouser.pk
 IF  .NOT. FOUND()
    this.seterror("User not found.")
    RETURN .F.
 ENDIF
 DELETE
 RETURN .T.

ENDFUNC
*  wwUserSecurity  :: DeleteUser


************************************************************************
* wwUserSecurity  :: Reindex
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Reindex()
LPARAMETER llUpdateStructure

THIS.OPEN()
THIS.CLOSE()
THIS.lerror = .F.

IF Openexclusive(THIS.cfilename,THIS.calias)
    PACK
    DELETE TAG ALL
    INDEX ON pk TAG pk
    INDEX ON username TAG username
    INDEX ON PASSWORD TAG PASSWORD
    INDEX ON lower(username) tag LUserName
    INDEX ON DELETED() TAG DELETED
ELSE
    THIS.seterror("Unable to get exclusive access to user file.")
ENDIF

THIS.CLOSE()
THIS.OPEN()
ENDFUNC
*  wwUserSecurity  :: Reindex

************************************************************************
* wwUserSecurity  :: CreateTable
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateTable(lcFileName)

IF EMPTY(lcFilename)
   lcFilename = THIS.cFileName
ELSE
   THIS.cFileName = lcFilename
ENDIF

lcTmpFile = SYS(2015)

IF FILE(lcFileName) AND THIS.OPEN(,,.t.)
   COPY TO (lcTmpFile)
   llUpdate = .T.
ELSE
   THIS.cFileName = lcFilename
   llUpdate = .F.
ENDIF

CREATE TABLE (lcFilename) ;
   (pk C (10), ;
   username C (15), ;
   PASSWORD C (15),  ;
   FULLNAME C (40), ;
   MappedId C (15), ;
   email M, ;
   notes M, ;
   properties M, ;
   LOG M,  ;
   admin L, ;
   created T, ;
   laston T, ;
   logoncount I, ;
   ACTIVE L, ;
   expireson D)

IF llUpdate
   APPEND FROM (lcTmpFile)
   ERASE (lcTmpFile+".dbf")
ENDIF

USE
THIS.REINDEX()
ENDFUNC
*  wwUserSecurity  :: CreateTable


************************************************************************
* wwUserSecurity  :: AuthenticateNt
****************************************
   *-- Checks the username and password against NT logon.
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION AuthenticateNt()
LPARAMETER lcUsername, lcPassword, lcDomain, lnFlags

THIS.seterror()

IF EMPTY(lcDomain)
   lcDomain = THIS.cDomain
ENDIF         
 
#define LOGON32_LOGON_INTERACTIVE   2
#define LOGON32_LOGON_NETWORK       3
#define LOGON32_LOGON_BATCH         4
#define LOGON32_LOGON_SERVICE       5

#define LOGON32_PROVIDER_DEFAULT    0

IF EMPTY(lnFlags)
   lnFlags = LOGON32_LOGON_INTERACTIVE
ENDIF

DECLARE INTEGER LogonUser in WIN32API ;
       String lcUser,;
       String lcServer,;
       String lcPassword,;
       INTEGER dwLogonType,;
       Integer dwProvider,;
       Integer @dwToken
       
lnToken = 0
lnResult = LogonUser(lcUsername,lcDomain,lcPassword,;
                     lnFlags,LOGON32_PROVIDER_DEFAULT,@lnToken) 

DECLARE INTEGER CloseHandle IN WIN32API INTEGER
CloseHandle(lnToken)

IF lnResult = 0
   THIS.seterror("NT Login Authentication failed.")
ENDIF

RETURN IIF(lnResult=1,.T.,.F.)
ENDFUNC
*  wwUserSecurity  :: AuthenticateNt


PROCEDURE Init
   #IF .F.
   WAIT WINDOW NOWAIT ;
     "Welcome to West Wind User Security Class..." + CHR(13) + ;
     "This is a shareware copy of wwUserSecurity."+ CHR(13)+ CHR(13) +;
     "Please register your copy."
   #ENDIF
ENDPROC

ENDDEFINE
*
*-- EndDefine: wwusersecurity
**************************************************
