#INCLUDE ..\INCLUDE\VFE.H
* 

PROCEDURE Semiramis
	IF FILE("HBYS.exe")
		IF VARTYPE(_SCREEN.oMyHandler) <> T_Object
			_SCREEN.ADDOBJECT("oMyHandler", "MyHandler")
		ENDIF

		LOCAL Parallel AS Parallel
		Parallel = NEWOBJECT("Parallel", "ParallelFox.vcx")

		Parallel.SetWorkerCount(1)
		Parallel.OnError("Do MyErrorhandler with nError, cMethod, nLine, cMessage, cCode")
		Parallel.StartWorkers("HBYS.Exe", , .T.)

		Parallel.BINDEVENT("UpdateProgress", _SCREEN.oMyHandler, "DisplayProgress")
		Parallel.BindEvent("ReturnError", _SCREEN.oMyHandler, "HandleError")

		Parallel.DO("SemiramisIsYap", "Semiramis.prg", .T.)

		*   Parallel.Wait()
		*	Parallel.StopWorkers()
		*	SCREEN.REMOVEOBJECT("oMyhandler")
	ENDIF

	RETURN


PROCEDURE MyErrorhandler(nError, cMethod, nLine, cMessage, cCode)
	* Handle error here.
	MESSAGEBOX("Error No :" + STR(nError) + CHR(13) + "Method : " + cMethod + CHR(13) + "Line No:" + STR(nLine) + CHR(13) + "Message : " + cMessage + CHR(13) + "Code : " + cCode)
	_VFP.STATUSBAR = "Error No :" + STR(nError) + "-" + "Method : " + cMethod + "-" + "Line No : " + STR(nLine) + "-" + "Message : " + cMessage + "-" + "Code : " + cCode
ENDPROC



DEFINE CLASS MyHandler AS CUSTOM

	PROCEDURE DisplayProgress
		LPARAMETERS lnPercent, lcMessage

		_VFP.STATUSBAR = lcMessage &&+ " " + STR(lnPercent)
	ENDPROC

	PROCEDURE HandleError(nError, cMethod, nLine, cMessage, cCode)
		* Handle error here.
		_VFP.STATUSBAR = "Error No :"+STR(nError)+"-"+"Method : "+cMethod+"-"+"Line No : "+STR(nline)+"-"+"Message : "+cMessage+"-"+"Code : "+cCode

		MESSAGEBOX("Error No :"+STR(nError)+CHR(13)+"Method : "+cMethod+CHR(13)+"Line No:"+STR(nline)+CHR(13)+"Message : "+cMessage+CHR(13)+"Code : "+cCode)
	ENDPROC

ENDDEFINE


PROCEDURE SemiramisIsAta
	LPARAMETERS ;
		tcOlay_Adi, ;
		tcDosya_Id, ;
		tcIsKurali_Parametresi

	LOCAL loIsTakvimiBizObj AS 'IsTakvimiListViewBizObj', ;
		loSemiramisBizObj AS 'SemiramisListViewBizObj', ;
		loSession AS "Session"

	LOCAL lcErrorMessage, ;
		lnOk, ;
		lnoldDS, ;
		loApp, ;
		loBizRule, ;
		loSemiramisVal

	*Debugmode()

	loApp = FindApplication() && loApplication &&_SCREEN.APPLICATION

	lnoldDS	  = SET("Datasession")
	loSession = CREATEOBJECT("Session")
	SET DATASESSION TO loSession.DATASESSIONID
	loApp.GetUserPreferences(loSession.DATASESSIONID)

	* Instantiate the Semiramis business object
	loSemiramisBizObj = CREATEOBJECT('SemiramisListViewBizObj')

	* Instantiate the IsTakvimi business object
	loIsTakvimiBizObj = CREATEOBJECT('IsTakvimiListViewBizObj')

	IF VARTYPE(loSemiramisBizObj) = T_Object AND VARTYPE(loIsTakvimiBizObj) = T_Object
		WITH loSemiramisBizObj
			.SetParameter("vp_Olay_Adi", ALLTRIM(tcOlay_Adi))
			.SetParameter("vp_Aktif", .T.)

			IF .REQUERY() = Requery_Success AND .RecordCount > 0

				.NAVIGATE("First")
				lnOk = FILE_OK
				DO WHILE lnOk = FILE_OK

					loSemiramisVal = .GetValues()

					IF NOT NULLOrEmpty(loSemiramisVal.IsKurali_Adi) AND ;
							loSemiramisVal.Eylem = "Ýþ Takvimine At"   && Ýþ Takvimine At

						WITH loIsTakvimiBizObj
							IF .New() = FILE_OK
								.SetField("Olay_Adi",			   loSemiramisVal.Olay_Adi)
								.SetField("Islem_Adi",			   loSemiramisVal.Islem_Adi)
								.SetField("IsKurali_Adi",		   loSemiramisVal.IsKurali_Adi)
								.SetField("IsKurali_Parametresi",  tcIsKurali_Parametresi)
								.SetField("Atama_Tipi",			   "Semiramis")
								.SetField("Semiramis_Isi",		   loSemiramisVal.Semiramis_Isi)
								.SetField("Personel_Id",		   loSemiramisVal.Personel_Id)
								.SetField("Personel_Adi",		   loSemiramisVal.Personel_Adi)
								.SetField("Dosya_Id",			   tcDosya_Id)
								.SetField("Atanan_Tarih",		   DATE())
								.SetField("Planlanan_Tarih",	   DATE() + iif(NullOrEmpty(loSemiramisVal.Hedef_Sure),0,loSemiramisVal.Hedef_Sure))
								.SetField("Islem_Statusu",		   "Atandý")
								.SetField("Bilgilendirme_Emaili",  loSemiramisVal.Bilgilendirme_Emaili)

								IF .SAVE() <> FILE_OK
									lcErrorMessage = .GetErrorMessage()
								ENDIF
							ENDIF

						ENDWITH
					ENDIF

					lnOk = .NAVIGATE("next")

				ENDDO
			ENDIF

		ENDWITH

		loSemiramisBizObj.RELEASE()
		loSemiramisBizObj = .NULL.

		loIsTakvimiBizObj.RELEASE()
		loIsTakvimiBizObj = .NULL.
	ENDIF

	SET DATASESSION TO lnoldDS

	RETURN .T.


PROCEDURE SemiramisIsYap
	LOCAL loIsTakvimiBizObj AS 'IsTakvimiListViewBizObj', ;
		loSession AS "Session", ;
		loApp

	LOCAL loSemiramisBizObj AS 'SemiramisListViewBizObj'

	LOCAL llResult, ;
		lnOk, ;
		lnoldDS, ;
		loBizRule, ;
		loIsTakvimiVal, ;
		coldError

* ***!* iþareti paralel processingi iptal için kaldýrýlan satýrlarý gösteriyor     
**!*	loApp = NEWOBJECT('HBYS.HBYSApplicationObject', 'AAPP.vcx', 'HBYS.exe', "ALIPOLAT", "ppp", .F.)

**!*	LOCAL Worker AS Worker
**!*	Worker = NEWOBJECT("Worker", "ParallelFox.vcx")

**!*	coldError = ON("ERROR")
**!*	*ON ERROR Worker.ReturnError(nError, cMethod, nLine, cMessage, cCode)
**!* 	ON ERROR Worker.ReturnError(ERROR(), SYS(16), LINENO(1), MESSAGE(), MESSAGE(1))

**!*	IF Worker.IsWorker()
**!*		Worker.UpdateProgress(1, "Semiramis Ýþe Baþladý... % 1")
**!*	ENDIF

**!*	Worker.Sleep(2000)
**!*	Worker.UpdateProgress(10, "Semiramis Ýþe Devam Ediyor... % 10")
    
    loApp     =FindApplication()
    
	lnoldDS	  = SET("Datasession")
	loSession = CREATEOBJECT("Session")
	SET DATASESSION TO loSession.DATASESSIONID
	loApp.GetUserPreferences(loSession.DATASESSIONID)

**!*	Worker.Sleep(2000)
**!*	Worker.UpdateProgress(20, "Semiramis Ýþe Devam Ediyor... % 20")

	loSemiramisBizObj = CREATEOBJECT('SemiramisListViewBizObj')
**!*	loSemiramisBizObj = loApp.oBizObjs.ADD("SemiramisListViewBizObj")

	IF VARTYPE(loSemiramisBizObj) = T_Object AND TYPE([SemiramisBizObj.Name]) = T_Character
		WITH loSemiramisBizObj
			.SetParameter("vp_Aktif", .T.)
			.SetParameter("vp_Eylem", "Ýcra Et")

			IF .REQUERY() = Requery_Success AND .RecordCount > 0
				IF .ScanProcess("IslemYap") > 0
					**!*IF Worker.IsWorker()
						*Worker.UpdateProgress(50, "Semiramis Görevi -> " + ALLTRIM(.Islem_Adi) + " Tamamlandi...")
					**!*ENDIF
				ENDIF
			ENDIF

			.RELEASE()
		ENDWITH
	ENDIF
	loSemiramisBizObj =	NULL

**!*	Worker.Sleep(2000)
**!*	Worker.UpdateProgress(50,  "Semiramis Ýþe Devam Ediyor... % 50")

	loIsTakvimiBizObj = CREATEOBJECT('IsTakvimiListViewBizObj')
**!*	loIsTakvimiBizObj = loApp.oBizObjs.ADD("IsTakvimiListViewBizObj")

	IF VARTYPE(loIsTakvimiBizObj) = T_Object AND TYPE([loIsTakvimiBizObj.Name]) = T_Character
		WITH loIsTakvimiBizObj
		    .Setparameter("vp_Planlanan_Tarih",DATE())
			.SetParameter("vp_Semiramis_Isi", .T.)
			.SetParameter("vp_Islem_Statusu", "Atandý")

			IF .REQUERY() = Requery_Success AND .RecordCount > 0
				IF .ScanProcess("IslemYap") > 0
**!*					IF Worker.IsWorker()
						*Worker.UpdateProgress(50, "Semiramis Görevi -> " + ALLTRIM(.Islem_Adi) + " Tamamlandi...")
**!*					ENDIF
				ENDIF
			ENDIF

**!*			Worker.UpdateProgress(60,  "Semiramis Ýþe Devam Ediyor... % 60")

			.SetParameter("vp_Islem_Statusu", "Beklemede")
			IF .REQUERY() = Requery_Success AND .RecordCount > 0
				IF .ScanProcess("IslemYap") > 0
**!*					IF Worker.IsWorker()
						*Worker.UpdateProgress(50, "Semiramis Görevi -> " + ALLTRIM(.Islem_Adi) + " Tamamlandi...")
**!*					ENDIF
				ENDIF
			ENDIF

			.RELEASE()
		ENDWITH
	ENDIF
	loIsTakvimiBizObj = NULL

	SET DATASESSION TO lnoldDS

**!*	Worker.Sleep(2000)
**!*	Worker.UpdateProgress(70, "Semiramis Ýþe Devam Ediyor... % 70", .T.)

**!*	IF Worker.IsWorker()
**!*		loApp.Cleanup()
**!*		loApp.RELEASE()
**!*		RELEASE loApp
**!*	ENDIF

**!*	Worker.Sleep(2000)
**!*	Worker.UpdateProgress(100, "Semiramis Görevi Tamamladý... % 100", .T.)


**!*	ON ERROR &coldError

	RETURN .T.



	*** SemiramisIsAta modulunden çýkarýlan kýsým
	*!*		IF loSemiramisVal.Eylem = "Ýcra Et"   && Ýcra Et
	*!*			loBizRule = CREATEOBJECT(loSemiramisVal.IsKurali_Adi, tcIcraDosya_Id, tcIsKurali_Parametresi)

	*!*			WITH loBizRule
	*!*				.Execute
	*!*				.RELEASE()
	*!*			ENDWITH
	*!*			loBizRule = NULL

	*!*			WITH loSemiramisVal
	*!*				IF NOT NULLOrEmpty(.Bilgilendirme_Emaili)
	*!*					loMailInfo = ExtractMailInfo(.Bilgilendirme_Emaili)
	*!*					WITH loMailInfo
	*!*						epostagonder(.cKime, .cBilgi, .cKonu, .cMesaj)
	*!*					ENDWITH
	*!*				ENDIF
	*!*			ENDWITH
	*!*		ENDIF





	*** Islemyap ta çýkarýlan kýsým
	*!*				IF .REQUERY() = Requery_Success AND .RecordCount > 0
	*!*				   .ScanProcess("IslemYap")
	*!*				   
	*!*					.NAVIGATE("First")
	*!*					lnOk = FILE_OK

	*!*					DO WHILE lnOk = FILE_OK
	*!*						loIsTakvimiVal = .GetValues()

	*!*						llResult = .F.
	*!*						WITH loIsTakvimiVal
	*!*							IF NOT NULLOrEmpty(.IsKurali_Adi)
	*!*								loBizRule = CREATEOBJECT(ALLTRIM(.IsKurali_Adi), .IsKurali_Parametresi)

	*!*								IF VARTYPE(loBizRule) = T_Object
	*!*									WITH loBizRule
	*!*										llResult = .Execute()
	*!*										.RELEASE()
	*!*									ENDWITH
	*!*									loBizRule = NULL
	*!*								ENDIF

	*!*							ENDIF

	*!*							IF Worker.IsWorker()
	*!*								Worker.UpdateProgress(50, "Semiramis Görevi -> " + ALLTRIM(.Islem_Adi) + " Tamamlandi...")
	*!*							ENDIF
	*!*						ENDWITH

	*!*						IF llResult = .T.
	*!*							.SetField("Islem_Statusu", "Tamamlandý")
	*!*							.SetField("Gerceklesme_Tarihi", DATE())
	*!*							.SAVE()
	*!*						ENDIF

	*!*						lnOk = .NAVIGATE("Next")
	*!*					ENDDO

	*!*				ENDIF



















