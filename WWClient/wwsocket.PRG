**************************************************
*-- Class:        wwsocket (c:\wwapps\wc3\classes\wwipstuff_deprecated.vcx)
*-- ParentClass:  custom
*-- BaseClass:    custom
*-- Time Stamp:   01/28/08 03:32:07 PM
*
#INCLUDE "c:\wwapps\wc3\wconnect.h"
*
DEFINE CLASS wwsocket AS CUSTOM


	*-- Socket timeout used to determine when an operation fails due to timeout.
	ntimeout = 10
	*-- Error Number
	nerror = 0
	*-- Error Message if an error occurred.
	cerrormsg = ""
	*-- Strips CHR(0) NULLS from the received buffer. Otherwise the full buffer will be passed back which is padded with CHR(0)'s.
	lstripnulls = .T.
	llogsession = .F.
	clogtext = ""
	olog = .NULL.
	nbuffersize = 512
	*-- Size of data read on the last Receive() operation.
	nlastreadsize = 0
	NAME = "wwsocket"

	*-- Internal Log string property
	PROTECTED clog


	*-- Connects to a socket on a server.
	PROCEDURE CONNECT
	LPARAMETERS lcServer, lnPort

	IF THIS.llogsession
		THIS.clog = ""
	ENDIF

	DECLARE INTEGER wwSocketConnect ;
		IN wwIPStuff.DLL ;
		STRING lpDomain,;
		INTEGER dwPort,;
		STRING @lpError

	lcError = SPACE(512)
	lnResult = wwSocketConnect(lcServer, INT(lnPort),@lcError)
	IF lnResult = 0
		THIS.nerror = -1
		THIS.cerrormsg = TRIM(STRTRAN(lcError,CHR(0)))
		RETURN .F.
	ENDIF

	RETURN .T.
	ENDPROC


	*-- Sends data to a socket on the server.
	PROCEDURE SEND
	LPARAMETERS lcInput

	IF THIS.llogsession
		THIS.LOG(lcInput,"CLIENT:")
	ENDIF

	lnSize = LEN(lcInput)

	DECLARE INTEGER wwSocketSend ;
		IN wwIPStuff.DLL ;
		STRING lpInput,;
		STRING @lcError,;
		INTEGER dwSeconds,;
		INTEGER dwSize

	lcError = SPACE(512)
	lnResult = wwSocketSend(lcInput,@lcError,THIS.ntimeout,lnSize)
	IF lnResult = 0
		THIS.nerror = -1
		THIS.cerrormsg = lcError && if any
		RETURN .F.
	ENDIF

	RETURN .T.
	ENDPROC


	*-- Receives data from a socket
	PROCEDURE receive
	LPARAMETERS lnSize

	IF EMPTY(lnSize)
		lnSize = THIS.nbuffersize
	ENDIF
	lcOutputBuffer = SPACE(lnSize)

	DECLARE INTEGER wwSocketRecv ;
		IN wwIPStuff.DLL ;
		STRING @lpOutput,;
		STRING @lcError,;
		INTEGER dwSeconds

	lcError = SPACE(512)
	lnBytes = wwSocketRecv(@lcOutputBuffer,@lcError,THIS.ntimeout)
	IF !EMPTY(lcError) OR lnBytes < 0
		THIS.nlastreadsize = 0
		THIS.cerrormsg = STRTRAN(lcError,CHR(0))
		THIS.nerror = -1
		RETURN ""
	ENDIF
	THIS.nlastreadsize = lnBytes

	IF THIS.lstripnulls
		lcOutputBuffer = STRTRAN(lcOutputBuffer,CHR(0),"")
	ENDIF

	IF THIS.llogsession
		THIS.LOG(lcOutputBuffer,"SERVER:")
	ENDIF

	RETURN lcOutputBuffer
	ENDPROC


	*-- High level method that connects to a socket, sends data and receives a result then disconnects from the socket. Great for various XML services.
	PROCEDURE socketsend
	LPARAMETERS lcInput, lcServer, lnServerPort, lnConnectTimeOut, lcError
	LOCAL lcHTTPResponse, lnResult

	lcHTTPResponse = SPACE(65335)
	lcError = SPACE(1024)
	IF EMPTY(lnConnectTimeOut)
		lnConnectTimeOut = 10
	ENDIF

	DECLARE INTEGER wwSocket ;
		IN wwIPStuff.DLL ;
		STRING lcInput,;
		STRING @lcOutput,;
		STRING @lcError,;
		STRING lcDomain,;
		INTEGER lnPort,;
		INTEGER lnTimeout


	lnResult =  wwsocket(lcInput,@lcHTTPResponse,@lcError,;
		lcServer,lnServerPort,lnConnectTimeOut)
	IF lnResult # 0
		THIS.nerror = lnResult
	ENDIF

	lcError = TRIM(lcError)

	RETURN TRIM(lcHTTPResponse)
	ENDPROC


	*-- Disconnects from a socket on the server.
	PROCEDURE disconnect

	DECLARE wwSocketClose IN wwIPStuff.DLL

	wwSocketClose()
	ENDPROC


	*-- Sends a string to a socket and waits for a response and returns the value.
	PROCEDURE sendreceive
	LPARAMETERS lcInput, lnSize
	LOCAL llResult, lcReceive

	IF !THIS.SEND(lcInput)
		RETURN ""
	ENDIF

	lcOutput = THIS.receive(lnSize)
	IF THIS.nerror = -1
		RETURN ""
	ENDIF

	RETURN lcOutput
	ENDPROC


	PROCEDURE LOG
	LPARAMETERS lcString,lcPrefix

	IF EMPTY(lcPrefix)
		lcPrefix = ""
	ENDIF

	THIS.clog = THIS.clog + lcPrefix + lcString
	ENDPROC


	PROCEDURE getlog

	RETURN THIS.clog
	ENDPROC


	PROCEDURE LISTEN
	LPARAMETERS lnPort, lnTimeout

	IF VARTYPE(lnTimeout) # "N"
		lnTimeout = 10
	ENDIF

	DECLARE INTEGER wwSocketListen ;
		IN wwIPStuff.DLL ;
		INTEGER nPort,STRING @cError, INTEGER nTimeout

	lcError = SPACE(255)
	lnResult = wwSocketListen(lnPort,@lcError,lnTimeout)
	IF lnResult # 1
		THIS.nerror = -1
		THIS.cerrormsg = lcError && if any
		RETURN .F.
	ENDIF

	RETURN .T.
	ENDPROC


	*-- A receive method that keeps retrieving input until a specified character is found based on the timeout specified.
	PROCEDURE waitfor
	LPARAMETERS lcSearch,lnSize
	LOCAL lcResult

	THIS.nerror = 0

	lcResult = ""
	DO WHILE ATC(lcSearch,lcResult) < 1
		lcResult = lcResult + THIS.receive(lnSize)
		IF THIS.nerror # 0
			RETURN ""
		ENDIF
	ENDDO

	RETURN lcResult
	ENDPROC


	*-- Waits for the specified number of bytes from the socket, by using Receive() in a loop.
	PROCEDURE waitforsize
	LPARAMETERS lnSize
	LOCAL lnTotalRead, lnlnextRead, lcResult

	IF EMPTY(lnSize)
		lnSize = THIS.nbuffersize
	ENDIF

	lnTotalRead = 0
	lnNextRead  = lnSize
	lcOutput    = ''

	DO WHILE lnTotalRead < lnSize AND THIS.nerror = 0 AND THIS.nlastreadsize > 0
		lcOutput        = lcOutput + LEFT( THIS.receive( lnNextRead ),THIS.nlastreadsize )
		lnTotalRead     = lnTotalRead + THIS.nlastreadsize
		lnNextRead      = lnNextRead  - THIS.nlastreadsize
	ENDDO

	IF LEN(lcOutput) # lnSize
		IF THIS.nerror = 0
			THIS.nerror = -1
			THIS.cerrormsg = "Buffer size doesn't match output size"
		ENDIF
	ENDIF

	RETURN lcOutput
	ENDPROC


	PROCEDURE INIT
	#IF SHAREWARE
			WAIT WINDOW NOWAIT ;
			"Welcome to West Wind Internet Protocols..." + CHR(13) + ;
			"This is a shareware copy of wwSocket." + CHR(13)+ CHR(13) +;
			"Please register your copy."
	#ENDIF
	ENDPROC


	PROCEDURE DESTROY
	THIS.disconnect()
	ENDPROC


	*-- Closes the socket.
	PROCEDURE CLOSE
	ENDPROC


ENDDEFINE
*
*-- EndDefine: wwsocket
**************************************************
