FUNCTION ePostaGonder

	LPARAMETERS;
		tcKime, ;
		tcBilgi, ;
		tcKonu, ;
		tcMesaj, ;
		tcIlisik

	LOCAL ;
		loApp, ;
		loPersonel, ;
		loBuro

	*debugmode()

    IF PCOUNT()<5 OR ISNULL(tcIlisik)
       tcIlisik=""
    ENDIF   

	= MsgSvc("NOWAIT", ALLTRIM(tcKime) + " G�nderiliyor..")

	loApp	   = FindApplication()
	loPersonel = loApp.oPersonel
	loBuro	   = loApp.oBuro

	DO wwSmtp
	LOCAL loSmtp AS wwSmtp
	loSmtp = CREATEOBJECT("wwSmtp",0)  && Default 2

	*loSmtp.cMailServer = "Localhost"
	*loSmtp.cMailServer = "mail.bayri.org:26" && loBuro.gdnPosta_Sunucusu

	*loSmtp.cUsername = "alirizap@bayri.org" && loBuro.Kullanici_Adi
	*loSmtp.cPassword = "arpb2310"           && loBuro.Parola
	*loSmtp.cSenderName= "SASA Bilgi ��lem"  && loPersonel.personel_Adi 
	*loSmtp.cSenderEmail = "alirizap@bayri.org"  && loPersonel.e_Posta

	WITH loSmtp
		.cMailServer = ALLTRIM(loBuro.gdnPosta_Sunucusu)
		.lUseSsl	 = loBuro.useSSL
		*.nMailMode	 = 0
		.nTimeout	 = 25 && *** Timeout in seconds

		*** Optional authentication if server requires it  		
		.cUsername = ALLTRIM(loBuro.Kullanici_Adi)
		.cPassword = ALLTRIM(loBuro.Parola)

		IF NOT NullOrEmpty(loPersonel.e_Posta_Kullanici_Adi)
			.cUsername	  = ALLTRIM(loPersonel.e_Posta_Kullanici_Adi)
		ENDIF
		IF NOT NullOrEmpty(loPersonel.e_Posta_Parola)
			.cPassword	  = ALLTRIM(loPersonel.e_Posta_Parola)
		ENDIF

		.cSenderName  = "Semiramis - " + ALLTRIM(loBuro.Buro_Adi)  &&ALLTRIM(loPersonel.personel_Adi)
		.cSenderEmail = ALLTRIM(loPersonel.e_Posta)
		.cRecipient	  = ALLTRIM(tcKime)
		.cCcList	  = ALLTRIM(tcBilgi)
		*.cContentType = "text/html" && 		*** Optional - custom content type - text/plain by default
		.cSubject	  = ALLTRIM(tcKonu)
		.cMessage	  = ALLTRIM(tcMesaj)

		*** Optionally attach files
		.cAttachment = ALLTRIM(tcIlisik)

		*** Optional - a couple of options
		*loSmtp.cReplyTo = "james@cranky.com"
		*loSmtp.cPriority = "High"
	ENDWITH

	*** Add any custom headers that properties don't cover
	loSmtp.AddHeader("x-mailer", "My Custom Smtp Client V1.01")

	*** Send it
	*loSmtp.SendmailAsync()

	llResult = loSmtp.Sendmail()
	
	IF llResult
		WAIT WINDOW "Mail sent..." NOWAIT
	ELSE
		*WAIT WINDOW "Mail sending failed: " NOWAIT
		WAIT WINDOW loSmtp.cErrorMsg
	ENDIF

	RETURN llResult

