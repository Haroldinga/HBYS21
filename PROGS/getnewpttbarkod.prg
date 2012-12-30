
#INCLUDE ..\INCLUDE\VFE.H

FUNCTION GetGivenPTTBarkod
	LPARAMETERS ;
		tcGonderi_Tipi, ;
		tcIcraDosya_Id, ;
		tcDokuman_Adi, ;
		tcMuhatap_Adi, ;
		tcMuamele_Id

	LOCAL ;
		loApp, ;
		loGonderiBizObj, ;
		lcBarkod

	* debugmode()

	**Gönderiden Sorgula
	lcBarkod = REPLICATE(" ", 12)

	loApp = FindApplication()

	loGonderiBizObj = CREATEOBJECT("GonderiViewBizObj")

	IF VARTYPE(tcDokuman_Adi) = T_Character
		WITH loGonderiBizObj
			IF VARTYPE(tcMuamele_Id) = T_Character AND NOT NullOrEmpty(tcMuamele_Id)
				.setparameter("vp_Muamele_Id", tcMuamele_Id)
			ELSE
				.setparameter("vp_Gonderi_Fk", tcIcraDosya_Id)
				.setparameter("vp_Gonderi_Adi", tcDokuman_Adi)
				.setparameter("vp_Gonderi_Tarihi", DATE())
				IF VARTYPE(tcMuhatap_Adi) = T_Character AND NOT NullOrEmpty(tcMuhatap_Adi)
					.setparameter("vp_Muhatap_Adi", tcMuhatap_Adi)
				ENDIF
			ENDIF
			
			IF .REQUERY() = Requery_Success AND .RecordCount > 0
				lcBarkod = .GetField("BarKod")
			ENDIF

			.RELEASE()
		ENDWITH
	ENDIF
	loGonderiBizObj = NULL

	RETURN lcBarkod


FUNCTION GetNewPTTbarkod
	LPARAMETERS ;
		tcGonderi_Tipi

	LOCAL ;
		loApp, ;
		loBarkodBizObj, ;
		lcGonderi_Kodu, ;
		lcPTT_Musteri_No, ;
		lcIlk_Gonderi_No, ;
		lcSon_Gonderi_No, ;
		lcSiradaki_Gonderi_No, ;
		lcBarkod, ;
		loFBC, ;
		lnLen

	*	debugmode()

	loApp = FindApplication()

	lcBarkod = REPLICATE(" ", 12)

	*** PTT barkod Havuzundan Sorgula
	loBarkodBizObj = CREATEOBJECT("PTTBarkodViewBizObj")

	WITH loBarkodBizObj
		i = 0
		.setparameter("vp_Gonderi_Tipi", tcGonderi_Tipi)
		DO WHILE i <= 10
			IF .REQUERY() = Requery_Success AND .RecordCount > 0

				lcGonderi_Kodu		  = .GetField("Gonderi_Kodu")
				lcPTT_Musteri_No	  = .GetField("PTT_Musteri_No")
				lcIlk_Gonderi_No	  = .GetField("Ilk_Gonderi_No")
				lcSon_Gonderi_No	  = .GetField("Son_Gonderi_No")
				lcSiradaki_Gonderi_No = .GetField("Siradaki_Gonderi_No")

				IF VAL(lcSiradaki_Gonderi_No) >= VAL(lcSon_Gonderi_No) && Yeni Barkod Numarasý alýnmalý
					EXIT
				ELSE
					lnLen				  = 12 - LEN(ALLTRIM(lcGonderi_Kodu) + ALLTRIM(lcPTT_Musteri_No))
					lcSiradaki_Gonderi_No = PADL(ALLTRIM(STR(VAL(lcSiradaki_Gonderi_No) + 1)), lnLen, "0")
					.SetField("Siradaki_Gonderi_No", lcSiradaki_Gonderi_No)
					IF .SAVE(.T., .F.) = File_Ok
						loFBC	 = CREATEOBJECT("FoxBarCode")
						lcBarkod = ALLTRIM(lcGonderi_Kodu) + ALLTRIM(lcPTT_Musteri_No) + lcSiradaki_Gonderi_No   && 2 + 4 + 6
						lcBarkod = LEFT(lcBarkod, 12)
						lcBarkod = lcBarkod + ALLTRIM(loFBC.CheckDigitEan(lcBarkod))
						loFBC	 = NULL
						EXIT
					ELSE
						.oCursor.FakeUpdate()  &&Clear Buffers
						* WAIT do some waiting
						= RAND(-1)
						lnRand = INT(RAND() * 1000)
						FOR j = 1 TO lnRand
						NEXT j
					ENDIF
				ENDIF
			ENDIF

			i = i + 1
		ENDDO
		.RELEASE()
	ENDWITH
	loBarkodBizObj = NULL

	RETURN lcBarkod
ENDFUNC


FUNCTION GetPTTBarkod
	LPARAMETERS ;
		tcGonderi_Tipi, ;
		tcIcraDosya_Id, ;
		tcDokuman_Adi, ;
		tcMuhatap_Adi, ;
		tcMuamele_Id

	LOCAL ;
		lcBarkod

	*debugmode()

	lcBarkod = REPLICATE(" ", 12)

	**Gönderiden Sorgula
	lcBarkod = GetGivenPTTBarkod(tcGonderi_Tipi, tcIcraDosya_Id, tcDokuman_Adi, tcMuhatap_Adi, tcMuamele_Id)

	IF NullOrEmpty(lcBarkod) &&OR lcBarkod=REPLICATE("0",12)
	ELSE
		RETURN lcBarkod
	ENDIF

	*** PTT barkod Havuzundan Sorgula
	lcBarkod = GetNewPTTbarkod(tcGonderi_Tipi)

	RETURN lcBarkod
ENDFUNC


