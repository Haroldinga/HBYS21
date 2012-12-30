#INCLUDE WCONNECT.H
   


*** The following PRG contains:
*** A self loading stub program that can be used to run 
*** as the code 'hot swapper' after the main EXe has unloaded
***
*** Following the stub is the actual CodeUpdate class 
************************************************************************
* CodeUpdate
****************************************
***  Function: Hot swaps an EXE file by running a Zip Exe file that
***            unzips the update files.
***    Assume: The original application has quit and is no longer 
***            loaded and running.
***      Pass: lcExeFile     -   The main application EXE file to run
***                              (wwReader70.exe)
***            lcUpdateFile  -   The updated EXE(Auto-Zip) file (full path)
***                              that contains the update files
***                              (d:\temp\updates\wwReaderUpdate.exe)
***            lcApplication -   Display name of the application
************************************************************************
LPARAMETER lcExeFile, lcUpdateFile, lcApplicationName

SET PROCEDURE TO wwCodeUpdate ADDIT
SET PROCEDURE TO wwUtils ADDIT
SET PROCEDURE TO wwHTTP ADDIT
SET PROCEDURE TO wwAPI ADdit
SET CLASSLIB TO wwDialogs addit

*** Default - just load classes and exit
IF EMPTY(lcEXEFILE)
  * WAIT WINDOW TIMEOUT 5 "No Exe file specified on command line..."
   RETURN
ENDIF
IF EMPTY(lcUpdateFile) OR !FILE(lcUpdateFile)
   WAIT WINDOW TIMEOUT 5 "Invalid Update File Path specified on command line..."
ENDIF

loVersion = CREATEOBJECT("wwCodeUpdate")
loVersion.cExeFile = lcExeFile  

IF !EMPTY(lcApplicationName)
   loVersion.cApplicationName = lcApplicationName
ENDIF

*** Swap the Exe Files
loVersion.SwapExes(lcUpdateFile) 

RETURN




*************************************************************
DEFINE CLASS wwCodeUpdate AS RELATION
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2000
*:Contact: http://www.west-wind.com
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
wwServer::GetProcessID

*:Description:

*:Example:

*:Remarks:
Server Update file looks as follows:
<?xml version="1.0" ?> 
<codeupdate>
  <version>3.9975</version> 
  <fileurl>http://www.west-wind.com/files/updates/wwHelp_400_update.exe</fileurl> 
  <filesize>750</filesize> 
  <minversion>3.90</minversion> 
  <usermessage>Version 4.0 (pre-release 3.9975) of West Wind HTML Help Builder is now available for download. File Size: 780kb This update includes support for Visual Studio.NET via an Add-In, SnagIt screen captures, improved MS Word exports, FTP Project Upload and many user interface enhancements throughout the Help Builder IDE. Please make sure you shut down all instances of Help Builder including instances that might be running inside of Visual Studio .NET via user activated Add-In.</usermessage> 
</codeupdate>

The only required keys are <version> and <fileurl> with the others optional.

*:SeeAlso:


*:ENDHELP
#ENDIF

cVersionUrl = ""
cVersionType = "C"

*** Our application's info - used for restart and dialogs
cExeFile = ""
cCommandLineParameters = ""
cApplicationName = "the application"
cDownloadPath = ".\CodeUpdate\"
cUpdateExeCommandLine = ""

lUnZipFile = .F.
cErrorMsg = ""
lError = .F.

*** Downloaded values from XML file
vOnlineVersion = ""
cOnlineFileUrl = ""
nFileSize = 0
vOnlineMinVersion = ""
cUserMessage = ""

lShowDialog = .T.
nConnectTimeout = 10

*** Allows access configuration of HTTP
*** settings. Call CreateHTTPClient to
*** create an instance of this object to
*** manipulate
oHTTP = NULL

PROTECTED cXML
cXML = ""
cAppStartpath = ""

************************************************************************
* wwCodeUpdate :: Init
*********************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION Init

THIS.cAppStartPath = GetAppStartPath()

ENDFUNC
* wwCodeUpdate :: Init

************************************************************************
* wwCodeUpdate :: GetVersionInfo
*********************************
***  Function: Retrieves online XML file and parses the Version and
***            download URL from the result
***    Assume: Sets these properties from XML retrieved:
***            vOnlineVersion
***            cOnlineFileUrl
***      Pass: lnVersion   -   Current Version Number/or string
***    Return: Numeric: Online Version number or 0 on failure
************************************************************************
FUNCTION GetVersionInfo
LOCAL loIP, lcVersionType, lcXML, lnSize, lcVersion

THIS.SetError()

lcVersionType = THIS.cVersionType

IF ISNULL(THIS.oHTTP)
   loIP = THIS.CreateHTTPClient()
ELSE
   loIP = THIS.oHTTP   
ENDIF

loIP.lShowDialog = .F.

lcXML = loIP.HTTPGet(This.cVersionUrl)

IF loIP.nError # 0
   THIS.SetError(loIp.cErrorMsg)
   RETURN IIF(lcVersionType = "C","",0)
ENDIF

IF lcXML <> "<?xml" 
   THIS.SetError("Missing or invalid XML returned from server")
   RETURN IIF(lcVersionType = "C","",0)
ENDIF

lcVersion = Extract(lcXML,"<version>","</version>")
IF EMPTY(lcVersion)
	   THIS.SetError("No version number found in XML")
   RETURN IIF(lcVersionType = "C","",0)
ENDIF

THIS.vOnlineVersion = IIF(lcVersionType="C",lcVersion,VAL(lcVersion))

lcVersion = Extract(lcXML,"<minversion>","</minversion>")
THIS.vOnlineMinVersion = IIF(lcVersionType="C",lcVersion,VAL(lcVersion))

THIS.cOnlineFileUrl = Extract(lcXML,"<fileurl>","</fileurl>")
THIS.nFileSize = VAL( Extract(lcXML,"<filesize>","</filesize>") )
THIS.cUserMessage = Extract(lcXML,"<usermessage>","</usermessage>")

*** Save the XML just in case
THIS.cXML = lcXML

RETURN THIS.vOnlineVersion
ENDFUNC
* wwCodeUpdate :: GetVersion

************************************************************************
* wwCodeUpdate :: CompareVersions
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION IsUpToDate(lvVersion)

IF lvVersion >= this.vOnlineVersion
   RETURN .T.
ENDIF

IF EMPTY( this.vOnlineMinVersion ) OR ;
   this.vOnlineVersion <= lvVersion
   RETURN .T.
ENDIF

RETURN .F.
ENDFUNC
*  wwCodeUpdate :: CompareVersions

************************************************************************
* wwCodeUpdate :: CheckVersionAndUpdate
***************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CheckVersionAndUpdate
LPARAMETERS lvVersion

lvNewVersion = THIS.GetVersion()

IF lvNewVersion > lvVersion
   THIS.DownloadUpdate()
   THIS.RunUpdateExe()
ENDIF

ENDFUNC
* wwCodeUpdate :: CheckVersionAndUpdate

************************************************************************
* wwCodeUpdate :: DownloadUpdate
*********************************
***  Function: Downloads the actual file from the Web site.
***    Assume:
***      Pass: llCheckForExistingVersion
***    Return: .T. or .F.
************************************************************************
FUNCTION DownloadUpdate
LPARAMETER llCheckforExistingVersion
LOCAL loIP, lcData, lnSize, loUrl

IF llCheckForExistingVersion
   lcFile = File2Var(THIS.cDownloadPath + "fileversion.xml")
   lcVersion = Extract(lcFile,"<version>","</version>")
   IF IIF(THIS.cVersionType="C",lcVersion,VAL(lcVersion)) = THIS.vOnlineVersion
      RETURN .T. && File was already downloaded
   ENDIF
ENDIF

IF ISNULL(THIS.oHTTP)
   loIP = THIS.CreateHTTPClient()
ELSE
   loIP = THIS.oHTTP
ENDIF   

loIP.lShowDialog = THIS.lShowDialog

*** Break down the URL into its components
loUrl = loIP.InternetCrackUrl(THIS.cOnlineFileUrl)
IF ISNULL(loUrl)
   RETURN .F.
ENDIF

*** Must use low level commands so we can download directly to file
IF loIP.HTTPConnect(loUrl.cServer,"","",IIF(lower(loUrl.cProtocol)="https",.T.,.F.)) # 0
   THIS.SetError(loIP.cErrorMsg)
   RETURN .F.
ENDIF   

lcTFile = THIS.cDownloadPath + JUSTFNAME(STRTRAN(THIS.cOnlineFileUrl,"/","\"))
lcData = ""
lnSize = 0

*** Create a temporary directory if it doesn't exist
IF !ISDIR(THIS.cDownloadPath)
   MD (THIS.cDownloadPath) 
ENDIF   

IF loIp.HTTPGetEx( TRIM(loUrl.cPath),@lcData,@lnSize,,lcTFile) # 0
   THIS.SetError(loIP.cErrorMsg)
   RETURN .F.
ENDIF   

File2Var(THIS.cDownloadPath + "fileversion.xml",;
         [<?xml version="1.0"?><version>]+ TRANS(THIS.vOnlineVersion) +[</version>])

ENDFUNC
* wwCodeUpdate :: DownloadUpdate

************************************************************************
* wwCodeUpdate :: RunUpdateExe
*********************************
***  Function: Runs the update exe or self-extracting zip that causes
***            the files to be updated.
***      Pass: lcUpdateExe - Full command line for Exe or script
***    Return: nothing - QUITs the application
************************************************************************
FUNCTION RunUpdateExe
LPARAMETER lcUpdateExe,lcCommandLine

IF EMPTY(lcUpdateExe)
   lcUpdateExe = THIS.cUpdateExeCommandLine
ENDIF

*MESSAGEBOX(lcUpdateExe+CHR(13) + lcCommandLine)

IF !EMPTY(lcCommandLine)
   *** If a command line was passed we're using CreateProcess!
   CreateProcess(lcUpdateExe,lcCommandLine)
ELSE
   *** Run external program to copy in the files
   lcParms = [RUN /N1 ] + lcUpdateExe  
   *Messagebox(lcParms)
   &lcParms
ENDIF

*** Required if READ EVENTS IS ACTIVE
*** otherwise EXE won't release

CLEAR EVENTS 
DOEVENTS

ON ERROR *
DOEVENTS

CLEAR ALL
DOEVENTS
RELEASE ALL

DOEVENTS
QUIT    

ENDFUNC
* wwCodeUpdate :: RunUpdateExe




************************************************************************
* wwCodeUpdate :: SwapExes
****************************************
***  Function: Hot swaps an EXE file by running a Zip Exe file that
***            unzips the update files.
***    Assume: The original application has quit and is no longer 
***            loaded and running.
***            Meant to be run as a mainline method
***      Pass: lcUpdateFile  -   The updated EXE(Auto-Zip) file (full path)
***                              that contains the update files
***    Return: nothing
************************************************************************
FUNCTION SwapExes
LPARAMETER lcUpdateFile
LOCAL loSafety, OP

loSafety = CREATEOBJECT("wwEnv","SAFETY","OFF")

*_screen.visible = .F.

IF EMPTY(lcUpdateFile)
    lcUpdateFile = SYS(5) + CurDir() + [codeupdate\Codeupdate.exe /auto ] +;
                   SYS(5) + CURDIR()  
ENDIF

*** Configure the notification dialog
OP = CREATEOBJECT("wwProgressFormTopLevel")  && "wwProgressForm"
OP.AlwaysOnTop = .t.
OP.Width = 350
OP.SetCaption("File Update")
OP.SetDescription("Updating files for " + THIS.cApplicationName + "...")
OP.HideProgressBar()
op.Show()


*** Force the form to update
DOEVENTS

*** Allow the application some time to go away
inkey(5,"HM")

*** Execute the RUN command and wait
lcParms = [RUN /n7] + lcUpdateFile 
&lcParms

*** Wait for 5 seconds to allow unzipping to complete 
*** This should be plenty of time
op.SetDescription([Getting ready to restart ] +;
                  THIS.cApplicationName + [...])
inkey(5,"HM")

*** Make sure the new Exe exists - if not wait longer
IF !FILE(THIS.cExeFile)
  *** Wait 5 more seconds 
  INKEY(5,"HM")
ENDIF

*** And start up the EXE
lcParms = [RUN /n1 ] + THIS.cExeFile + ;
          IIF(!EMPTY(THIS.cCommandLineParameters)," " + THIS.cCommandLineParameters,"")
&lcParms

RETURN
*  wwCodeUpdate :: UpdateExe

************************************************************************
* wwCodeUpdate :: CreateHTTPClient
****************************************
***  Function:
***    Assume:
***      Pass:
***    Return:
************************************************************************
FUNCTION CreateHTTPClient()
THIS.oHTTP = CREATEOBJECT("CU_wwHTTP")
THIS.oHTTP.nConnectTimeout = THIS.nConnectTimeout
RETURN THIS.oHTTP
ENDFUNC
*  wwCodeUpdate :: CreateHTTPClient

************************************************************************
* wwCodeUpdate :: SetError
*********************************
PROTECTED FUNCTION SetError
LPARAMETERS lcErrorMsg

IF PCOUNT() = 0
   THIS.lError = ""
   THIS.cErrorMsg = ""
ELSE
   THIS.lError = .T.
   THIS.cErrorMsg = lcErrorMsg
ENDIF   

ENDFUNC
* wwCodeUpdate :: SetError

ENDDEFINE




*****************************************************
DEFINE CLASS CU_wwHTTP as wwHTTP
**************************************

*** Custom properties dealing with display 
*** of download information
lShowDialog = .F.
oProgressForm = .NULL.
cCaption = "Downloading Update"
nContentSize = 0

************************************************************************
* CU_wwHTTP :: OnHTTPBufferUpdate
************************************
***  Function: HTTP Progress Event Handler
***    Assume: Relies on wwDialogs.vcx for Progress Form
***      Pass:
***    Return:
************************************************************************
FUNCTION OnHTTPBufferUpdate
LPARAMETERS lnbytes,lnbufferreads,lccurrentchunk

DO CASE
  *** If this is the 0 chunk it's HTTP Header
  CASE lnBufferReads = 0
       THIS.nContentSize = VAL( EXTRACT(lcCurrentChunk,CHR(13)+CHR(10) + "Content-length: ",CHR(13)) )
       DO CASE 
         CASE THIS.nContentSize > 90000
              THIS.nHTTPWorkBufferSize = 16484
         CASE THIS.nContentSize > 40000 
              THIS.nHTTPWorkBufferSize = 8182
       ENDCASE
       RETURN
  CASE lnBufferReads = -1
       *** Done
       RETURN
  OTHERWISE
       DOEVENTS
       
ENDCASE

IF THIS.lShowDialog
   IF lnBufferReads=1
      THIS.oProgressForm = CREATEOBJECT("wwProgressFormTopLevel")
      THIS.oProgressForm.SetCaption(THIS.cCaption)
      THIS.oProgressForm.ShowCancelButton()
      this.oProgressForm.AlwaysOnTop = .t.
      THIS.oProgressForm.Show()
   ENDIF

   IF THIS.oProgressForm.lCancelled
       THIS.lHTTPCancelDownload = .T. 
   ENDIF
   
   THIS.oProgressForm.SetDescription("Received from " + THIS.cserver + ":" +CHR(13) +;
                          LTRIM( TRANSFORM(lnBytes,"999,999,999") ) + " of " +;
                          LTRIM(TRANSFORM(THIS.nContentSize,"999,999,999"))+ " bytes")
   THIS.oProgressForm.SetProgress(lnBytes/THIS.nContentSize * 100)                          
ENDIF

ENDFUNC

   
ENDDEFINE

