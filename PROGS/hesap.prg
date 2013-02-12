#INCLUDE ..\INCLUDE\VFE.H

*#INCLUDE VFE.H


*==============================================================================
* Procedure:		Asil_Alacak
* Purpose:			.F.
* Author:			Ali R�za
* Parameters:		None
* Returns:			None
* Added:			06/13/2011
*==============================================================================
FUNCTION getAsil_Alacak

	LPARAMETERS tcIcraDosya_Id, tdTakip_Tarihi

	LOCAL ;
		lnAsil_Alacak, ;
		loAlacakBizObj, ;
		loApp

	LOCAL lnTahsilat_Tutari, ;
		loTahsilatBizobj

	lnAsil_Alacak = 0
	loApp		  = FindApplication()

	*	WITH loApp
	*		loAlacakBizObj = .Getbizobj("AlacakViewListBizObj")
	*	ENDWITH

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loAlacakBizObj = _SCREEN.ACTIVEFORM.Getbizobj("AlacakViewListBizObj")
	ELSE
		loAlacakBizObj = loApp.Getbizobj("AlacakViewListBizObj")
	ENDIF

	IF VARTYPE(loAlacakBizObj) = T_Object AND TYPE([loAlacakBizObj.Name]) = T_Character
		lnAsil_Alacak = loAlacakBizObj.CalculateSum("Belge_Miktari")
	ELSE
		loAlacakBizObj = CREATEOBJECT("AlacakViewListBizObj")
		WITH loAlacakBizObj
			.setparameter("vp_Alacak_Fk", tcIcraDosya_Id)
			IF .REQUERY() = Requery_Success
				lnAsil_Alacak = .CalculateSum("Belge_Miktari")
			ENDIF
			*.RELEASE()
		ENDWITH
	ENDIF

	*loAlacakBizObj = NULL

	**************************************************
	* Takip �ncesi Tahsilat Varsa As�l Alacaktan D��
	**************************************************
	lnTahsilat_Tutari = 0

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loTahsilatBizobj = _SCREEN.ACTIVEFORM.Getbizobj("TahsilatViewBizObj")
	ELSE
		loTahsilatBizobj = loApp.Getbizobj("TahsilatViewBizObj")
	ENDIF

	IF VARTYPE(loTahsilatBizobj) = T_Object AND TYPE([loTahsilatBizObj.Name]) = T_Character
		lnTahsilat_Tutari = loTahsilatBizobj.CalculateSum("Tahsilat_Miktari For Tahsilat_Tarihi<" + Date2StrictDate(tdTakip_Tarihi))
	ELSE
		loTahsilatBizobj = CREATEOBJECT("TahsilatViewBizObj")
		WITH loTahsilatBizobj
			.setparameter("vp_Tahsilat_Fk", tcIcraDosya_Id)
			.REQUERY()
			lnTahsilat_Tutari = .CalculateSum("Tahsilat_Miktari For Tahsilat_Tarihi<" + Date2StrictDate(tdTakip_Tarihi))
			.RELEASE()
		ENDWITH
	ENDIF
	loTahsilatBizobj = NULL

	IF lnTahsilat_Tutari > 0
		lnAsil_Alacak = lnAsil_Alacak - lnTahsilat_Tutari
	ENDIF
	**************************************************

	RETURN lnAsil_Alacak



	*==============================================================================
	* Procedure:		GetFaiz
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetFaiz

	LPARAMETERS ;
		tnAsil_Miktar, ;
		tdHesap_Baslama_Tarihi, ;
		tdHesap_Bitis_Tarihi, ;
		tcHesap_Donemi, ;
		tcDosyaTipi_Id, ;
		tcIcraDosya_Id, ;
		tcHesap_Tipi, ;
		tnTakip_Faizi_Indirim_Orani

	LOCAL ;
		loApp, ;
		llNewFaizTipiBizObj, ;
		loFaizTipiBizObj, ;
		llNewObject, ;
		loFaizBizObj, ;
		llNewAlacakBizObj, ;
		loAlacakBizObj, ;
		loDosyaTipiBizObj, ;
		llNewDosyaTipiBizObj, ;
		loFaizBilgisi, ;
		lnFaiz_Tutari, ;
		lnRow, ;
		ldFaiz_Baslama_Tarihi, ;
		ldFaiz_Bitis_Tarihi, ;
		lnGecikme_Faizi, ;
		lnTemerrut_Faizi, ;
		lnTakip_Faizi, ;
		lcUygulama_Tipi, ;
		lnYillik_Gun_sayisi, ;
		lnOran, ;
		lnGun, ;
		lnResult, ;
		llReqResult, ;
		lcFaiz_Tipi, ;
		lnAlacakCursRecno, ;
		lcHesap_Tipi, ;
		lnIndirimli_Takip_Faizi_Orani


	*debugmode()

	IF PCOUNT() < 7
		lcHesap_Tipi				  = "Standart Hesap"
		lnIndirimli_Takip_Faizi_Orani = 0
	ELSE
		lcHesap_Tipi				  = tcHesap_Tipi
		lnIndirimli_Takip_Faizi_Orani = tnTakip_Faizi_Indirim_Orani
	ENDIF

	loFaizBilgisi = NULL

	IF EMPTY(tdHesap_Baslama_Tarihi) OR ;
			EMPTY(tdHesap_Bitis_Tarihi) OR ;
			tdHesap_Baslama_Tarihi >= tdHesap_Bitis_Tarihi
		RETURN loFaizBilgisi
	ENDIF

	DIMENSION aFaizBilgisi(1)

	loFaizBilgisi = CREATEOBJECT("Faiz")

	loApp = FindApplication()

	llNewObject	 = .F.
	loFaizBizObj = loApp.Getbizobj("FaizOraniListViewBizObj")
	IF VARTYPE(loFaizBizObj) = T_Object AND TYPE([loFaizBizObj.Name]) = T_Character
	ELSE
		llNewObject	 = .T.
		loFaizBizObj = CREATEOBJECT("FaizOraniListViewBizObj")
	ENDIF

	llNewAlacakBizObj = .F.

	** loAlacakBizObj	  = loApp.Getbizobj("AlacakViewListBizObj")

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loAlacakBizObj	  = _SCREEN.ACTIVEFORM.Getbizobj("AlacakViewListBizObj")
	ELSE
		loAlacakBizObj	  = loApp.Getbizobj("AlacakViewListBizObj")
	ENDIF

	IF VARTYPE(loAlacakBizObj) = T_Object AND TYPE([loAlacakBizObj.Name]) = T_Character
	ELSE
		llNewAlacakBizObj = .T.
		loAlacakBizObj	  = CREATEOBJECT("AlacakViewListBizObj")
		WITH loAlacakBizObj
			.setparameter("vp_Alacak_Fk", tcIcraDosya_Id)
			.REQUERY()
		ENDWITH
	ENDIF

	WITH loAlacakBizObj
		lnAlacakCursRecno = .oCursor.RECNO

		lnResult = .NAVIGATE("FIRST")

		DO WHILE lnResult = File_Ok OR lnResult = File_Bof
			lcAlacak_Id	= .GetField("Alacak_Id")
			lcFaiz_Tipi	= ALLTRIM(.GetField("Faiz_Tipi"))

			llReqResult = .F.
			WITH loFaizBizObj
				.setparameter("vp_FaizOrani_Fk", lcAlacak_Id) && �zel Faiz Oran� tan�mlanm�� olabilir
				IF .REQUERY() = Requery_Success AND .recordcount > 0
					.ListToArray(@aFaizBilgisi, "Baslama_Tarihi,Gecikme_Faizi,Temerrut_Faizi,Takip_Faizi,Uygulama_Tipi,Yillik_Gun_Sayisi")
					llReqResult = .T.
				ENDIF

				IF NOT llReqResult AND NOT NullOrEmpty(lcFaiz_Tipi)
					llNewFaizTipiBizObj	= .F.

					*!*						loFaizTipiBizObj	= loApp.Getbizobj("FaizTipiListViewBizObj")

					*!*						IF VARTYPE(loFaizTipiBizObj) = T_Object AND TYPE([loFaizTipiBizObj.Name]) = T_Character
					*!*						ELSE
					*!*							llNewFaizTipiObj = .T.
					*!*							loFaizTipiBizObj = CREATEOBJECT("FaizTipiListViewBizObj")
					*!*						ENDIF

					loFaizTipiBizObj = CREATEOBJECT("FaizTipiListViewBizObj")

					WITH loFaizTipiBizObj
						.setparameter("vp_Faiz_Tipi", lcFaiz_Tipi)
						IF .REQUERY() = Requery_Success AND .recordcount > 0
							.ListToArray(@aFaizBilgisi, "Baslama_Tarihi,Faiz_Orani,Faiz_Orani,Faiz_Orani,Uygulama_Tipi,Yillik_Gun_Sayisi")
							llReqResult = .T.
						ENDIF

						IF llNewFaizTipiBizObj
							*	.RELEASE()
						ENDIF
					ENDWITH
					loFaizTipiBizObj = NULL
				ENDIF

				IF NOT llReqResult
					.setparameter("vp_FaizOrani_Fk", tcDosyaTipi_Id)
					IF .REQUERY() = Requery_Success AND .recordcount > 0
						.ListToArray(@aFaizBilgisi, "Baslama_Tarihi,Gecikme_Faizi,Temerrut_Faizi,Takip_Faizi,Uygulama_Tipi,Yillik_Gun_Sayisi")
						llReqResult = .T.
					ENDIF
				ENDIF

				IF NOT llReqResult && Dosya Tipindeki faiz Tan�m�na bak
					llNewDosyaTipiBizObj = .F.
					loDosyaTipiBizObj	 = loApp.Getbizobj("DosyaTipiViewBizObj")
					IF VARTYPE(loDosyaTipiBizObj) = T_Object AND TYPE([loDosyaTipiBizObj.Name]) = T_Character
					ELSE
						llNewDosyaTipiBizObj = .T.
						loDosyaTipiBizObj	 = CREATEOBJECT("DosyaTipiViewBizObj")
					ENDIF
					WITH loDosyaTipiBizObj
						.setparameter("vp_DosyaTipi_Id", tcDosyaTipi_Id)
						IF .REQUERY() = Requery_Success AND .recordcount > 0
							DO CASE
								CASE tcHesap_Donemi = "GECIKME"
									lcFaiz_Tipi = ALLTRIM(.GetField("Gecikme_Faizi_Tipi"))
								CASE tcHesap_Donemi = "TEMERRUT"
									lcFaiz_Tipi = ALLTRIM(.GetField("Temerrut_Faizi_Tipi"))
								CASE tcHesap_Donemi = "TAKIP"
									lcFaiz_Tipi = ALLTRIM(.GetField("Takip_Faizi_Tipi"))
							ENDCASE
						ENDIF
						IF llNewDosyaTipiBizObj
							.RELEASE()
						ENDIF
					ENDWITH
					loDosyaTipiBizObj = NULL

					*!*						llNewFaizTipiBizObj	= .F.
					*!*						loFaizTipiBizObj	= loApp.Getbizobj("FaizTipiListViewBizObj")
					*!*						IF VARTYPE(loFaizTipiBizObj) = T_Object AND TYPE([loFaizTipiBizObj.Name]) = T_Character
					*!*						ELSE
					*!*							llNewFaizTipiObj = .T.
					*!*							loFaizTipiBizObj = CREATEOBJECT("FaizTipiListViewBizObj")
					*!*						ENDIF

					loFaizTipiBizObj = CREATEOBJECT("FaizTipiListViewBizObj")

					WITH loFaizTipiBizObj
						.setparameter("vp_Faiz_Tipi", lcFaiz_Tipi)
						IF .REQUERY() = Requery_Success AND .recordcount > 0
							.ListToArray(@aFaizBilgisi, "Baslama_Tarihi,Faiz_Orani,Faiz_Orani,Faiz_Orani,Uygulama_Tipi,Yillik_Gun_Sayisi")
						ENDIF
						IF llNewFaizTipiBizObj
							*	.RELEASE()
						ENDIF
					ENDWITH
					loFaizTipiBizObj = NULL
				ENDIF
			ENDWITH


			lnFaiz_Tutari = 0
			lnRow		  = ALEN(aFaizBilgisi, 1)
			WITH loFaizBilgisi
				FOR i = 1 TO lnRow
					ldFaiz_Baslama_Tarihi = aFaizBilgisi(i, 1)

					IF i < lnRow
						ldFaiz_Bitis_Tarihi = aFaizBilgisi(i + 1, 1) - 1
					ELSE
						ldFaiz_Bitis_Tarihi = tdHesap_Bitis_Tarihi
					ENDIF

					lnGecikme_Faizi		= aFaizBilgisi(i, 2)
					lnTemerrut_Faizi	= aFaizBilgisi(i, 3)
					lnTakip_Faizi		= aFaizBilgisi(i, 4)
					lcUygulama_Tipi		= aFaizBilgisi(i, 5)
					lnYillik_Gun_sayisi	= aFaizBilgisi(i, 6)

					IF NOT EMPTY(.Faiz_Aciklamasi)
						.Faiz_Aciklamasi = .Faiz_Aciklamasi + ", "
					ENDIF

					*.Faiz_Aciklamasi = .Faiz_Aciklamasi + DTOC(ldFaiz_Baslama_Tarihi) + " itibaren %"
					.Faiz_Aciklamasi = .Faiz_Aciklamasi + DTOC(tdHesap_Baslama_Tarihi) + " - " + DTOC(tdHesap_Bitis_Tarihi) + " arasi %"

					DO CASE
						CASE tcHesap_Donemi = "GECIKME"
							.Faiz_Orani		 = lnGecikme_Faizi
							.Faiz_Aciklamasi = .Faiz_Aciklamasi + TRANSFORM(lnGecikme_Faizi, "99.99")
						CASE tcHesap_Donemi = "TEMERRUT"
							.Faiz_Orani		 = lnTemerrut_Faizi
							.Faiz_Aciklamasi = .Faiz_Aciklamasi + TRANSFORM(lnTemerrut_Faizi, "99.99")
						OTHERWISE
							IF lcHesap_Tipi = "�ndirimli Hesap"
								lnTakip_Faizi = lnIndirimli_Takip_Faizi_Orani
							ENDIF

							.Faiz_Orani		 = lnTakip_Faizi
							.Faiz_Aciklamasi = .Faiz_Aciklamasi + TRANSFORM(lnTakip_Faizi, "99.99")

					ENDCASE
					lnOran = .Faiz_Orani

					IF tdHesap_Baslama_Tarihi > ldFaiz_Baslama_Tarihi
						ldFaiz_Baslama_Tarihi = tdHesap_Baslama_Tarihi
					ENDIF

					IF ldFaiz_Bitis_Tarihi > tdHesap_Bitis_Tarihi
						ldFaiz_Bitis_Tarihi = tdHesap_Bitis_Tarihi
					ENDIF

					lnGun = ldFaiz_Bitis_Tarihi - ldFaiz_Baslama_Tarihi

					IF lnGun > 0
						lnFaiz_Tutari = lnFaiz_Tutari + ;
							tnAsil_Miktar * (1.0 * lnOran / 100.0) * (lnGun / lnYillik_Gun_sayisi)
					ENDIF
				NEXT i
				.Faiz_Tutari = .Faiz_Tutari + lnFaiz_Tutari
			ENDWITH

			lnResult = .NAVIGATE("NEXT")
		ENDDO

		.oCursor.GO(lnAlacakCursRecno)

		IF llNewAlacakBizObj
			*.Release
		ENDIF

		IF llNewObject
			loFaizBizObj.RELEASE()
		ENDIF
	ENDWITH

	loFaizBizObj   = NULL
	*loAlacakBizObj = NULL

	RETURN loFaizBilgisi


DEFINE CLASS Faiz AS CUSTOM
	Faiz_Orani		= 0.0
	Faiz_Tutari		= 0.0
	Faiz_Aciklamasi	= ""
ENDDEFINE


*==============================================================================
* Procedure:		getVekaletUcreti
* Purpose:			.F.
* Author:			F1 Technologies
* Parameters:		None
* Returns:			None
* Added:			06/13/2011
*==============================================================================
FUNCTION getVekaletUcreti

	LPARAMETERS ;
		tnTakip_Alacagi, ;
		tcDosyaTipi_Id, ;
		tcIcraDosya_Id

	LOCAL ;
		loApp, ;
		loVekaletBizObj, ;
		loVekaletOrani, ;
		llNewObject, ;
		lnVekaletUcreti, ;
		lnTakipAlacagi, ;
		lnDilimFarki, ;
		lcVekaletiUcretiDilimi2, ;
		lcVekaletiUcretiDilimi1, ;
		lnBorcluVekaletOrani, ;
		lnResult

	*debugmode()

	llNewObject	= .F.
	loApp		= FindApplication()

	WITH loApp
		loVekaletBizObj = .Getbizobj("VekaletUcretiListViewBizObj")
	ENDWITH

	IF VARTYPE(loVekaletBizObj) = T_Object AND TYPE([loVekaletBizObj.Name]) = T_Character
	ELSE
		llNewObject		= .T.
		loVekaletBizObj	= CREATEOBJECT("VekaletUcretiListViewBizObj")
	ENDIF

	lnResult = 99
	WITH loVekaletBizObj
		.setparameter("vp_VekaletUcreti_Fk", tcIcraDosya_Id)   && Dosyaya �zel Vekalet �creti tan�mlanm�� m�
		IF .REQUERY() = Requery_Success AND .recordcount > 0
			lnResult = .NAVIGATE("FIRST") && Assume find latest date
		ELSE
			.setparameter("vp_VekaletUcreti_Fk", tcDosyaTipi_Id)  && Dosya Tipine �zel vekalet �creti Tan�mlanm�� m�
			IF .REQUERY() = Requery_Success AND .recordcount > 0
				lnResult = .NAVIGATE("FIRST") && Assume find latest date
			ELSE
				.resetparameters()
				.setparameter("vp_Vekalet_Ucreti_Tipi", "Resmi Vekalet �creti")   && Resmi Vekalet �cretini kullan
				IF .REQUERY() = Requery_Success AND .recordcount > 0
					lnResult = .NAVIGATE("FIRST") && Assume find latest date
				ENDIF
			ENDIF
		ENDIF

		IF INLIST(lnResult, File_Ok, File_Bof)
			loVekaletOrani = .GetValues()
		ENDIF

		IF llNewObject
			.RELEASE()
		ENDIF

	ENDWITH
	loVekaletBizObj = NULL

	lnVekaletUcreti	= 0
	lnTakipAlacagi	= tnTakip_Alacagi

	IF VARTYPE(loVekaletOrani) = T_Object
		WITH loVekaletOrani
			IF lnTakipAlacagi > .Vekalet_Ucreti_Dilimi_8
				lnDilimFarki	= lnTakipAlacagi - .Vekalet_Ucreti_Dilimi_8
				lnVekaletUcreti	= lnVekaletUcreti + lnDilimFarki * (.Vekalet_Ucreti_Orani_9 / 100.0)
			ENDIF

			FOR i = 8 TO 1
				lcVekaletiUcretiDilimi2	= "Vekalet_Ucreti_Dilimi_" + ALLTRIM(STR(i))
				lcVekaletiUcretiDilimi1	= "Vekalet_Ucreti_Dilimi_" + ALLTRIM(STR(i - 1))
				lnBorcluVekaletOrani	= "Vekalet_Ucreti_Orani_" + + ALLTRIM(STR(i))

				IF lnTakipAlacagi > .&lcVekaletUcretiDilimi1
					IF lnTakipAlacagi > .&lcVekaletUcretiDilimi2
						lnDilimFarki = .&lcVekaletUcretiDilimi2 - .&lcVekaletUcretiDilimi1
					ELSE
						lnDilimFarki = lnTakipAlacagi - .&lcVekaletUcretiDilimi1
					ENDIF
					lnVekaletUcreti = lnVekaletUcreti + lnDilimFarki * (.&lnBorcluVekaletOrani / 100.0)
				ENDIF
			NEXT i

			IF lnTakipAlacagi > 0
				IF lnTakipAlacagi > .Vekalet_Ucreti_Dilimi_1
					lnDilimFarki = .Vekalet_Ucreti_Dilimi_1
				ELSE
					lnDilimFarki = lnTakipAlacagi
				ENDIF
				lnVekaletUcreti = lnVekaletUcreti + lnDilimFarki * (.Vekalet_Ucreti_Orani_1 / 100.0)
			ENDIF

			lnVekaletUcreti = MAX(lnVekaletUcreti, .Minimum_Vekalet_Ucreti)
		ENDWITH
	ENDIF

	IF ISNULL(lnVekaletUcreti)
		lnVekaletUcreti = 0
	ENDIF

	RETURN lnVekaletUcreti


	*==============================================================================
	* Procedure:		GetAlacakliBilgisi
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION getAlacakliBilgisi

	LPARAMETERS ;
		tcIcraDosya_Id

	LOCAL ;
		loApp, ;
		loAlacakliBizObj, ;
		loMuvekkilBizObj, ;
		loMuvekkilRec, ;
		lcMuvekkil_Id, ;
		llNewAlacakli, ;
		llNewMuvekkil, ;
		lcAlacakli_Bilgisi, ;
		lnAdet

	lcAlacakli_Bilgisi = ""
	loApp			   = FindApplication()

	llNewAlacakli = .F.

	*WITH loApp
	*	loAlacakliBizObj    = .Getbizobj("AlacakliViewBizObj")
	*ENDWITH

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loAlacakliBizObj    = _SCREEN.ACTIVEFORM.Getbizobj("AlacakliViewBizObj")
	ELSE
		loAlacakliBizObj    = loApp.Getbizobj("AlacakliViewBizObj")
	ENDIF

	IF VARTYPE(loAlacakliBizObj) = T_Object AND TYPE([loAlacakliBizObj.Name]) = T_Character
	ELSE
		llNewAlacakli	 = .T.
		loAlacakliBizObj = CREATEOBJECT("AlacakliViewBizObj")
		WITH loAlacakliBizObj
			.setparameter("vp_Alacakli_Fk", tcIcraDosya_Id)
			.REQUERY()
		ENDWITH
	ENDIF

	llNewMuvekkil = .F.
	WITH loApp
		loMuvekkilBizObj    = .Getbizobj("MuvekkilEditViewBizObj")
	ENDWITH
	IF VARTYPE(loMuvekkilBizObj) = T_Object AND TYPE([loMuvekkilBizObj.Name]) = T_Character
	ELSE
		llNewMuvekkil	 = .T.
		loMuvekkilBizObj = CREATEOBJECT("MuvekkilEditViewBizObj")
	ENDIF

	DIMENSION aMuvekkilId(1)

	WITH loAlacakliBizObj
		lnAdet = .ListToArray(@aMuvekkilId, "Muvekkil_Id")
	ENDWITH

	FOR i = 1 TO lnAdet
		lcMuvekkil_Id = aMuvekkilId(i)
		WITH loMuvekkilBizObj
			.setparameter("vp_Muvekkil_Id", lcMuvekkil_Id)
			IF .REQUERY() = Requery_Success AND .recordcount > 0
				loMuvekkilRec = .GetValues()
				WITH loMuvekkilRec
					lcAlacakli_Bilgisi = lcAlacakli_Bilgisi + ;
						N2B(.Muvekkil_Adi) + " " + N2B(.TcKimlik_No) + " " + N2B(.Vergi_Dairesi) + " " + N2B(.Vergi_No) + " \par " + ;
						N2B(.Iletisim_Adresi) + " \par "
				ENDWITH
			ENDIF
		ENDWITH
	NEXT i

	IF llNewMuvekkil
		loMuvekkilBizObj.RELEASE()
	ENDIF

	IF llNewAlacakli
		loAlacakliBizObj.RELEASE()
	ENDIF

	loMuvekkilBizObj = NULL
	*	loAlacakliBizObj = NULL

	RETURN lcAlacakli_Bilgisi



	*==============================================================================
	* Procedure:		GetVekilBilgisi
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetVekilBilgisi

	LPARAMETERS ;
		tcIcraDosya_Id, ;
		tcMuvekkil_Id

	LOCAL ;
		loApp, ;
		loVekilBizobj, ;
		loPersonelBizObj, ;
		loPersRec, ;
		loBuroBizObj, ;
		loBuroRec, ;
		lcVekil_Bilgisi, ;
		llNewVekil, ;
		llNewPersonel, ;
		llNewBuro, ;
		lcPersonel_Id, ;
		lcBanka_Hesap_No

	*debugmode()

	lcVekil_Bilgisi	= ""
	loApp			= FindApplication()

	llNewVekil = .F.
	WITH loApp
		loVekilBizobj    = .Getbizobj("VekilViewBizObj")
	ENDWITH
	IF VARTYPE(loVekilBizobj) = T_Object AND TYPE([loVekilBizObj.Name]) = T_Character
	ELSE
		llNewVekil	  = .T.
		loVekilBizobj = CREATEOBJECT("VekilViewBizObj")
	ENDIF

	llNewPersonel = .F.
	WITH loApp
		loPersonelBizObj    = .Getbizobj("PersonelViewBizObj")
	ENDWITH
	IF VARTYPE(loPersonelBizObj) = T_Object AND TYPE([loPersonelBizObj.Name]) = T_Character
	ELSE
		llNewPersonel	 = .T.
		loPersonelBizObj = CREATEOBJECT("PersonelViewBizObj")
	ENDIF


	WITH loVekilBizobj
		.setparameter("vp_Vekil_Fk", tcIcraDosya_Id) && dosyaya �zel m�vekkil tan�m�
		IF .REQUERY() = Requery_Success AND .recordcount > 0
		ELSE
			.setparameter("vp_Vekil_Fk", tcMuvekkil_Id)
			.REQUERY()
		ENDIF

		lcBanka_Hesap_No = ""

		lnOk = .NAVIGATE("First")
		DO WHILE lnOk = File_Ok OR lnOk = File_Bof
			lcPersonel_Id	 = .GetField("Personel_Id")

			IF NullOrEmpty(lcBanka_Hesap_No)
				lcBanka_Hesap_No = .GetField("Banka_Hesap_No")
			ENDIF

			WITH loPersonelBizObj
				.setparameter("vp_Personel_Id", lcPersonel_Id)
				IF .REQUERY() = Requery_Success AND .recordcount > 0
					loPersRec = .GetValues()

					WITH loPersRec
						lcVekil_Bilgisi = lcVekil_Bilgisi + ;
							N2B(.Gorev_Adi) + " " + N2B(.Personel_Adi) + " " + ;
							N2B(.Vergi_Dairesi) + " " + N2B(.Vergi_No) + " " + ;
							N2B(.Ssk_No) + " \par "
					ENDWITH
				ENDIF
			ENDWITH
			lnOk = .NAVIGATE("next")
		ENDDO

		IF llNewPersonel
			loPersonelBizObj.RELEASE()
		ENDIF

		loBuroRec = loApp.oBuro
		WITH loBuroRec
			*!*				lcVekil_Bilgisi = lcVekil_Bilgisi + ;
			*!*					N2B(.Buro_adi) + " " + N2B(.Adres) + " " + N2B(.Il_adi) + " " + N2B(.Ilce_Adi) + " " + N2B(lcBanka_Hesap_No)+ " \par "

			lcVekil_Bilgisi = lcVekil_Bilgisi + ;
				N2B(.Buro_adi) + " " + N2B(.Adres) + " " + N2B(.Il_adi)  + " \par " + ;
				IIF(!NullOrEmpty(.Tel),"Tel : "+Rtrim(.Tel),"") +" "+IIF(!NullOrEmpty(.e_Posta),"e-Mail : "+Rtrim(.e_Posta),"") + " \par "+;
				N2B(lcBanka_Hesap_No) + " \par "
		ENDWITH

		IF llNewVekil
			.RELEASE()
		ENDIF
	ENDWITH

	loVekilBizobj	 = NULL
	loPersonelBizObj = NULL
	loBuroBizObj	 = NULL

	RETURN lcVekil_Bilgisi



	*==============================================================================
	* Procedure:		GetBorcluBilgisi
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION getBorcluBilgisi

	LPARAMETERS ;
		tcIcraDosya_Id

	LOCAL ;
		loApp, ;
		loBorcluBizObj, ;
		loRehberBizObj, ;
		loRehberRec, ;
		lcRehber_Id, ;
		llNewBorclu, ;
		llNewRehber, ;
		lcBorclu_Bilgisi, ;
		lnAdet

	lcBorclu_Bilgisi = ""
	loApp			 = FindApplication()

	llNewBorclu = .F.
	*WITH loApp
	*	loBorcluBizObj    = .Getbizobj("BorcluViewBizObj")
	*ENDWITH

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loBorcluBizObj    = _SCREEN.ACTIVEFORM.Getbizobj("BorcluViewBizObj")
	ELSE
		loBorcluBizObj    = loApp.Getbizobj("BorcluViewBizObj")
	ENDIF

	IF VARTYPE(loBorcluBizObj) = T_Object AND TYPE([loBorcluBizObj.Name]) = T_Character
	ELSE
		llNewBorclu	   = .T.
		loBorcluBizObj = CREATEOBJECT("BorcluViewBizObj")
		WITH loBorcluBizObj
			.setparameter("vp_Borclu_Fk", tcIcraDosya_Id)
			.REQUERY()
		ENDWITH
	ENDIF

	llNewRehber = .F.
	WITH loApp
		loRehberBizObj    = .Getbizobj("RehberViewBizObj")
	ENDWITH
	IF VARTYPE(loRehberBizObj) = T_Object AND TYPE([loRehberBizObj.Name]) = T_Character
	ELSE
		llNewRehber	   = .T.
		loRehberBizObj = CREATEOBJECT("RehberViewBizObj")
	ENDIF

	DIMENSION aRehberId(1)

	WITH loBorcluBizObj
		lnAdet = .ListToArray(@aRehberId, "Rehber_Id")
	ENDWITH

	FOR i = 1 TO lnAdet
		lcRehber_Id = aRehberId(i)
		
		IF NOT NullOrEmpty(lcRehber_Id)
		WITH loRehberBizObj
			.setparameter("vp_Rehber_Id", lcRehber_Id)
			IF .REQUERY() = Requery_Success AND .recordcount > 0
				loRehberRec = .GetValues()
				WITH loRehberRec
					lcBorclu_Bilgisi = lcBorclu_Bilgisi + ;
						N2B(.Adi) + " " + N2B(.TcKimlik_No) + " \par " + ;
						N2B(.Iletisim_Adresi) + " \par "
					&&N2B(.Ev_Adresi)+" "+N2B(.Ev_Adresi_Il_Adi)+" "+N2B(.Ev_Adresi_Ilce_Adi)+" \par "
				ENDWITH
			ENDIF
		ENDWITH
		ENDIF 
	NEXT i

	IF llNewRehber
		loRehberBizObj.RELEASE()
	ENDIF
	IF llNewBorclu
		loBorcluBizObj.RELEASE()
	ENDIF

	loRehberBizObj = NULL
	*loBorcluBizObj = NULL

	RETURN lcBorclu_Bilgisi


	*==============================================================================
	* Procedure:		getTOAlacak
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/14/2011
	*==============================================================================
FUNCTION getTOAlacak
	LPARAMETERS ;
		tcIcraDosya_Id, ;
		tcDosyaTipi_Id

	LOCAL ;
		loApp, ;
		loTOAlacakRec, ;
		loHesapSekliBizObj, ;
		loIcraDosyaHesabiBizObj, ;
		llNewIcraDosyaHesabi, ;
		TO_Alacak_Adi, ;
		TO_Alacak_Hesabi, ;
		TO_Alacak_Tutari, ;
		TO_Alacak_Aciklamasi, ;
		lcTO_Alacak_Adi, ;
		lcTO_Alacak_Hesabi, ;
		lnTO_Alacak_Tutari, ;
		lcTO_Alacak_Aciklamasi

	loTOAlacakRec = CREATEOBJECT("TOAlacak")
	loApp		  = FindApplication()

	llNewIcraDosyaHesabi = .F.

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loIcraDosyaHesabiBizObj = _SCREEN.ACTIVEFORM.Getbizobj("IcraDosyaHesabiViewBizObj")
	ELSE
		loIcraDosyaHesabiBizObj = loApp.Getbizobj("IcraDosyaHesabiViewBizObj")
	ENDIF

	IF VARTYPE(loIcraDosyaHesabiBizObj) = T_Object AND TYPE([loIcraDosyaHesabiBizObj.Name]) = T_Character
	ELSE
		llNewIcraDosyaHesabi	= .T.
		loIcraDosyaHesabiBizObj	= CREATEOBJECT("IcraDosyaHesabiViewBizObj")
		WITH loIcraDosyaHesabiBizObj
			.setparameter("vp_IcraDosyaHesabi_Fk", tcIcraDosya_Id)
			IF .REQUERY() = Requery_Success AND .recordcount > 0
			ELSE
				RETURN .NULL.
			ENDIF
		ENDWITH
	ENDIF


*!*		llNewHesapSekli = .F.
*!*		WITH loApp
*!*			loHesapSekliBizObj = .Getbizobj("AlacakHesapSekliViewBizObj")
*!*		ENDWITH

*!*		IF VARTYPE(loHesapSekliBizObj) = T_Object AND TYPE([loHesapSekliBizObj.Name]) = T_Character
*!*		ELSE
*!*			llNewHesapSekli	   = .T.
*!*			loHesapSekliBizObj = CREATEOBJECT("AlacakHesapSekliViewBizObj")
*!*		ENDIF

*!*		WITH loHesapSekliBizObj
*!*			.setparameter("vp_HesapSekli_Fk", tcDosyaTipi_Id)
*!*			.REQUERY()
*!*			loHesapSekliRec = .GetValues()
*!*			IF llNewHesapSekli
*!*				.RELEASE()
*!*			ENDIF
*!*		ENDWITH
*!*		loHesapSekliBizObj = NULL

	WITH loHesapSekliRec && Private Variable
		FOR i = 1 TO 10
			TO_Alacak_Adi		 = "To_Alacak_Adi_" + ALLTRIM(STR(i))
			TO_Alacak_Hesabi	 = "To_Alacak_Hesabi_" + ALLTRIM(STR(i))
			TO_Alacak_Tutari	 = "To_Alacak_Tutari_" + ALLTRIM(STR(i))
			TO_Alacak_Aciklamasi = "To_Alacak_Aciklamasi_" + ALLTRIM(STR(i))

			IF NullOrEmpty(.&TO_Alacak_Hesabi)
				IF NullOrEmpty(.&TO_Alacak_Adi)
					lnTO_Alacak_Tutari = 0
				ELSE
					lnTO_Alacak_Tutari = loIcraDosyaHesabiBizObj.GetField(TO_Alacak_Tutari)
				ENDIF
			ELSE
				IF NullOrEmpty(CHRTRAN(ALLTRIM(.&TO_Alacak_Hesabi), "0123456789.", ""))
					lnTO_Alacak_Tutari = loIcraDosyaHesabiBizObj.GetField(TO_Alacak_Tutari)
				ELSE
					lnTO_Alacak_Tutari = EVALUATE(.&TO_Alacak_Hesabi)
				ENDIF
			ENDIF

			lcTO_Alacak_Adi		   = .&TO_Alacak_Adi
			lcTO_Alacak_Hesabi	   = .&TO_Alacak_Hesabi
			lnTO_Alacak_Tutari	   = ROUND(lnTO_Alacak_Tutari, 2)
			lcTO_Alacak_Aciklamasi = .&TO_Alacak_Aciklamasi

			WITH loTOAlacakRec
				.&TO_Alacak_Adi		   = lcTO_Alacak_Adi
				.&TO_Alacak_Hesabi	   = lcTO_Alacak_Hesabi
				.&TO_Alacak_Tutari	   = lnTO_Alacak_Tutari
				.&TO_Alacak_Aciklamasi = lcTO_Alacak_Aciklamasi
			ENDWITH
		NEXT i
	ENDWITH

	IF llNewIcraDosyaHesabi
		loIcraDosyaHesabiBizObj.RELEASE()
	ENDIF
	*	loIcraDosyaHesabiBizObj = NULL

	RETURN loTOAlacakRec


DEFINE CLASS TOAlacak AS CUSTOM
	TO_Alacak_Adi_1		   = ""
	TO_Alacak_Hesabi_1	   = ""
	TO_Alacak_Tutari_1	   = 0
	TO_Alacak_Aciklamasi_1 = ""

	TO_Alacak_Adi_2		   = ""
	TO_Alacak_Hesabi_2	   = ""
	TO_Alacak_Tutari_2	   = 0
	TO_Alacak_Aciklamasi_2 = ""

	TO_Alacak_Adi_3		   = ""
	TO_Alacak_Hesabi_3	   = ""
	TO_Alacak_Tutari_3	   = 0
	TO_Alacak_Aciklamasi_3 = ""

	TO_Alacak_Adi_4		   = ""
	TO_Alacak_Hesabi_4	   = ""
	TO_Alacak_Tutari_4	   = 0
	TO_Alacak_Aciklamasi_4 = ""

	TO_Alacak_Adi_5		   = ""
	TO_Alacak_Hesabi_5	   = ""
	TO_Alacak_Tutari_5	   = 0
	TO_Alacak_Aciklamasi_5 = ""

	TO_Alacak_Adi_6		   = ""
	TO_Alacak_Hesabi_6	   = ""
	TO_Alacak_Tutari_6	   = 0
	TO_Alacak_Aciklamasi_6 = ""

	TO_Alacak_Adi_7		   = ""
	TO_Alacak_Hesabi_7	   = ""
	TO_Alacak_Tutari_7	   = 0
	TO_Alacak_Aciklamasi_7 = ""

	TO_Alacak_Adi_8		   = ""
	TO_Alacak_Hesabi_8	   = ""
	TO_Alacak_Tutari_8	   = 0
	TO_Alacak_Aciklamasi_8 = ""

	TO_Alacak_Adi_9		   = ""
	TO_Alacak_Hesabi_9	   = ""
	TO_Alacak_Tutari_9	   = 0
	TO_Alacak_Aciklamasi_9 = ""

	TO_Alacak_Adi_10		= ""
	TO_Alacak_Hesabi_10		= ""
	TO_Alacak_Tutari_10		= 0
	TO_Alacak_Aciklamasi_10	= ""
ENDDEFINE




*==============================================================================
* Procedure:		getTSAlacak
* Purpose:			.F.
* Author:			F1 Technologies
* Parameters:		None
* Returns:			None
* Added:			06/14/2011
*==============================================================================
FUNCTION getTSAlacak
	LPARAMETERS ;
		tcIcraDosya_Id, ;
		tcDosyaTipi_Id

	LOCAL ;
		loApp, ;
		loTsAlacakRec, ;
		loHesapSekliBizObj, ;
		loIcraDosyaHesabiBizObj, ;
		llNewIcraDosyaHesabi, ;
		Ts_Alacak_Adi, ;
		Ts_Alacak_Hesabi, ;
		Ts_Alacak_Tutari, ;
		Ts_Alacak_Aciklamasi, ;
		lcTs_Alacak_Adi, ;
		lcTs_Alacak_Hesabi, ;
		lnTs_Alacak_Tutari, ;
		lcTs_Alacak_Aciklamasi

	loTsAlacakRec = CREATEOBJECT("TSAlacak")
	loApp		  = FindApplication()

	llNewIcraDosyaHesabi = .F.
	*	WITH loApp
	*		loIcraDosyaHesabiBizObj = .Getbizobj("IcraDosyaHesabiViewBizObj")
	*	ENDWITH

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loIcraDosyaHesabiBizObj = _SCREEN.ACTIVEFORM.Getbizobj("IcraDosyaHesabiViewBizObj")
	ELSE
		loIcraDosyaHesabiBizObj = loApp.Getbizobj("IcraDosyaHesabiViewBizObj")
	ENDIF

	IF VARTYPE(loIcraDosyaHesabiBizObj) = T_Object AND TYPE([loIcraDosyaHesabiBizObj.Name]) = T_Character
	ELSE
		llNewIcraDosyaHesabi	= .T.
		loIcraDosyaHesabiBizObj	= CREATEOBJECT("IcraDosyaHesabiViewBizObj")
		WITH loIcraDosyaHesabiBizObj
			.setparameter("vp_IcraDosyaHesabi_Fk", tcIcraDosya_Id)
			IF .REQUERY() = Requery_Success AND .recordcount > 0
			ELSE
				RETURN .NULL.
			ENDIF
		ENDWITH
	ENDIF

*!*		llNewHesapSekli = .F.
*!*		WITH loApp
*!*			loHesapSekliBizObj = .Getbizobj("AlacakHesapSekliViewBizObj")
*!*		ENDWITH

*!*		IF VARTYPE(loHesapSekliBizObj) = T_Object AND TYPE([loHesapSekliBizObj.Name]) = T_Character
*!*		ELSE
*!*			llNewHesapSekli	   = .T.
*!*			loHesapSekliBizObj = CREATEOBJECT("AlacakHesapSekliViewBizObj")
*!*		ENDIF

*!*		WITH loHesapSekliBizObj
*!*			.setparameter("vp_HesapSekli_Fk", tcDosyaTipi_Id)
*!*			.REQUERY()
*!*			loHesapSekliRec = .GetValues()
*!*			IF llNewHesapSekli
*!*				.RELEASE()
*!*			ENDIF
*!*		ENDWITH
*!*		loHesapSekliBizObj = NULL

	WITH loHesapSekliRec   &&Private variable
		FOR i = 1 TO 5
			Ts_Alacak_Adi		 = "Ts_Alacak_Adi_" + ALLTRIM(STR(i))
			Ts_Alacak_Hesabi	 = "Ts_Alacak_Hesabi_" + ALLTRIM(STR(i))
			Ts_Alacak_Tutari	 = "Ts_Alacak_Tutari_" + ALLTRIM(STR(i))
			Ts_Alacak_Aciklamasi = "Ts_Alacak_Aciklamasi_" + ALLTRIM(STR(i))

			IF NullOrEmpty(.&Ts_Alacak_Hesabi)
				IF NullOrEmpty(.&Ts_Alacak_Adi)
					lnTs_Alacak_Tutari = 0
				ELSE
					lnTs_Alacak_Tutari = loIcraDosyaHesabiBizObj.GetField(Ts_Alacak_Tutari)
				ENDIF
			ELSE
				IF NullOrEmpty(CHRTRAN(ALLTRIM(.&Ts_Alacak_Hesabi), "0123456789.", ""))
					lnTs_Alacak_Tutari = loIcraDosyaHesabiBizObj.GetField(Ts_Alacak_Tutari)
				ELSE
					lnTs_Alacak_Tutari = EVALUATE(.&Ts_Alacak_Hesabi)
				ENDIF
			ENDIF

			lcTs_Alacak_Adi		   = .&Ts_Alacak_Adi
			lcTs_Alacak_Hesabi	   = .&Ts_Alacak_Hesabi
			lnTs_Alacak_Tutari	   = ROUND(lnTs_Alacak_Tutari, 2)
			lcTs_Alacak_Aciklamasi = .&Ts_Alacak_Aciklamasi

			WITH loTsAlacakRec
				.&Ts_Alacak_Adi		   = lcTs_Alacak_Adi
				.&Ts_Alacak_Hesabi	   = lcTs_Alacak_Hesabi
				.&Ts_Alacak_Tutari	   = lnTs_Alacak_Tutari
				.&Ts_Alacak_Aciklamasi = lcTs_Alacak_Aciklamasi
			ENDWITH
		NEXT i
	ENDWITH

	IF llNewIcraDosyaHesabi
		loIcraDosyaHesabiBizObj.RELEASE()
	ENDIF
	*	loIcraDosyaHesabiBizObj = NULL

	RETURN loTsAlacakRec


DEFINE CLASS TsAlacak AS CUSTOM
	Ts_Alacak_Adi_1		   = ""
	Ts_Alacak_Hesabi_1	   = ""
	Ts_Alacak_Tutari_1	   = 0
	Ts_Alacak_Aciklamasi_1 = ""

	Ts_Alacak_Adi_2		   = ""
	Ts_Alacak_Hesabi_2	   = ""
	Ts_Alacak_Tutari_2	   = 0
	Ts_Alacak_Aciklamasi_2 = ""

	Ts_Alacak_Adi_3		   = ""
	Ts_Alacak_Hesabi_3	   = ""
	Ts_Alacak_Tutari_3	   = 0
	Ts_Alacak_Aciklamasi_3 = ""

	Ts_Alacak_Adi_4		   = ""
	Ts_Alacak_Hesabi_4	   = ""
	Ts_Alacak_Tutari_4	   = 0
	Ts_Alacak_Aciklamasi_4 = ""

	Ts_Alacak_Adi_5		   = ""
	Ts_Alacak_Hesabi_5	   = ""
	Ts_Alacak_Tutari_5	   = 0
	Ts_Alacak_Aciklamasi_5 = ""
ENDDEFINE


*==============================================================================
* Procedure:		GetMasrafTutari
* Purpose:			.F.
* Author:			F1 Technologies
* Parameters:		None
* Returns:			None
* Added:			06/13/2011
*==============================================================================
FUNCTION GetMasrafTutari

	LPARAMETERS tcIcraDosya_Id

	LOCAL loApp, ;
		loMasrafBizObj, ;
		lnMasraf_Tutari

	lnMasraf_Tutari = 0

	loApp = FindApplication()

	*	loMasrafBizObj  = loApp.Getbizobj("MasrafViewBizObj")

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loMasrafBizObj  = _SCREEN.ACTIVEFORM.Getbizobj("MasrafViewBizObj")
	ELSE
		loMasrafBizObj  = loApp.Getbizobj("MasrafViewBizObj")
	ENDIF

	IF VARTYPE(loMasrafBizObj) = T_Object AND TYPE([loMasrafBizObj.Name]) = T_Character
		lnMasraf_Tutari = loMasrafBizObj.CalculateSum("Masraf_Miktari")
	ELSE
		loMasrafBizObj = CREATEOBJECT("MasrafViewBizObj")
		WITH loMasrafBizObj
			.setparameter("vp_Masraf_Fk", tcIcraDosya_Id)
			.REQUERY()
			lnMasraf_Tutari = .CalculateSum("Masraf_Miktari")
			.RELEASE()
		ENDWITH
	ENDIF
	*	loMasrafBizObj  = NULL

	RETURN lnMasraf_Tutari



	*==============================================================================
	* Procedure:		GetTahsilatTutari
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetTahsilatTutari
	LPARAMETERS ;
		tcIcraDosya_Id, tdTakip_Tarihi

	LOCAL ;
		loApp, ;
		loTahsilatBizobj, ;
		lnTahsilat_Tutari

	lnTahsilat_Tutari = 0

	loApp = FindApplication()

	*loTahsilatBizobj = loApp.Getbizobj("TahsilatViewBizObj")

	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loTahsilatBizobj = _SCREEN.ACTIVEFORM.Getbizobj("TahsilatViewBizObj")
	ELSE
		loTahsilatBizobj = loApp.Getbizobj("TahsilatViewBizObj")
	ENDIF

	IF VARTYPE(loTahsilatBizobj) = T_Object AND TYPE([loTahsilatBizObj.Name]) = T_Character
		lnTahsilat_Tutari = loTahsilatBizobj.CalculateSum("Tahsilat_Miktari For Tahsilat_Tarihi>=" + Date2StrictDate(tdTakip_Tarihi))
	ELSE
		loTahsilatBizobj = CREATEOBJECT("TahsilatViewBizObj")
		WITH loTahsilatBizobj
			.setparameter("vp_Tahsilat_Fk", tcIcraDosya_Id)
			.REQUERY()
			lnTahsilat_Tutari = .CalculateSum("Tahsilat_Miktari For Tahsilat_Tarihi>=" + Date2StrictDate(tdTakip_Tarihi))
			.RELEASE()
		ENDWITH
	ENDIF
	*loTahsilatBizobj = NULL

	RETURN lnTahsilat_Tutari



	*==============================================================================
	* Procedure:		GetHarcTutari
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetHarcTutari
	LPARAMETERS ;
		tcIcraDosya_Id

	LOCAL ;
		loApp, ;
		loHarcOraniBizObj, ;
		loHarcOraniRec, ;
		loHarcBizObj, ;
		llNewObject, ;
		lcHarc_Tipi, ;
		lnHarc_Miktari, ;
		lnHarc_Mikt, ;
		lnHarc_Orani, ;
		lnHarc_Tutari, ;
		lnPesin_Harc, ;
		lnTahsil_Harci, ;
		lnOk


	*:Global Tahsil_Harci

	lnHarc_Tutari = 0
	lnPesin_Harc  = 0

	loApp = FindApplication()

	llNewObject	 = .F.

	*	loHarcBizObj = loApp.Getbizobj("HarcListViewBizObj")
	IF TYPE("_Screen.ActiveForm") = T_Object AND PEMSTATUS(_SCREEN.ACTIVEFORM, "Getbizobj", 5)
		loHarcBizObj = _SCREEN.ACTIVEFORM.Getbizobj("HarcListViewBizObj")
	ELSE
		loHarcBizObj = loApp.Getbizobj("HarcListViewBizObj")
	ENDIF

	IF VARTYPE(loHarcBizObj) = T_Object AND TYPE([loHarcbizobj.name]) = T_Character
	ELSE
		llNewObject	 = .T.
		loHarcBizObj = CREATEOBJECT("HarcListViewBizObj")
		WITH loHarcBizObj
			.setparameter("vp_Harc_Fk", tcIcraDosya_Id)
			.REQUERY()
		ENDWITH
	ENDIF

	WITH loHarcBizObj
		lnHarc_Miktari = 0.0
		lnHarc_Orani   = 0.0
		lnPesin_Harc   = 0.0
		lnTahsil_Harci = 0.0

		lnOk = .NAVIGATE("First")
		DO WHILE lnOk = File_Ok OR lnOk = File_Bof
			lcHarc_Tipi	   = .GetField("Harc_Tipi")
			lnHarc_Orani   = .GetField("Harc_Orani")
			lnHarc_Miktari = .GetField("Harc_Miktari")

			IF lnHarc_Orani > 0
				lnHarc_Mikt = ROUND((m.Takip_Alacagi * lnHarc_Orani), 2)

				IF ABS(lnHarc_Miktari - lnHarc_Mikt) > 1
					lnHarc_Miktari = lnHarc_Mikt

					.setfield("Harc_Miktari", lnHarc_Miktari)

					.SAVE()
				ENDIF
			ENDIF


			IF ALLTRIM(lcHarc_Tipi) = "Pe�in Har�"
				lnPesin_Harc = lnHarc_Miktari
			ENDIF

			IF INLIST(ALLTRIM(lcHarc_Tipi), "Haciz �ncesi Tahsil Harc�", "Tahsilat Harc�")
				lnTahsil_Harci = lnHarc_Miktari
			ENDIF

			lnOk = .NAVIGATE("next")
		ENDDO

		m.Tahsil_Harci = lnTahsil_Harci - lnPesin_Harc  && m.Tahsil_Harci Private de�i�ken

		lnHarc_Tutari = .CalculateSum([Harc_Miktari For Harc_Tipi<>'Haciz �ncesi Tahsil Harc�' And Harc_Tipi<>'Tahsilat Harc�']) && Tahsilat Harci ayr� bir kalem halinde hesaplan�r

		IF llNewObject
			.RELEASE()
		ENDIF
	ENDWITH
	*	loHarcBizObj = NULL

	RETURN lnHarc_Tutari


	*==============================================================================
	* Procedure:		GetTakipAlacakHesabi
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetTakipAlacakHesabi

	LOCAL ;
		lcTakip_Alacak_Hesabi

	lcTakip_Alacak_Hesabi = ;
		TRANSFORM(m.Asil_Alacak, "999,999,999.99") + " As�l Alacak" + "\par " + ;
		IIF(m.Gecikme_Faizi_Tutari > 0, TRANSFORM(m.Gecikme_Faizi_Tutari, "999,999,999.99") + " Akdi Gecikme Faizi " + m.Gecikme_Faizi_Aciklamasi + " \par ", "") + ;
		TRANSFORM(m.Temerrut_Faizi_Tutari, "999,999,999.99") + " Temerr�t Faizi " + m.Temerrut_Faizi_Aciklamasi + " \par " + ;
		IIF(m.TO_Alacak_Tutari_1 > 0, TRANSFORM(m.TO_Alacak_Tutari_1, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_1), m.TO_Alacak_Adi_1, m.TO_Alacak_Aciklamasi_1) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_2 > 0, TRANSFORM(m.TO_Alacak_Tutari_2, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_2), m.TO_Alacak_Adi_2, m.TO_Alacak_Aciklamasi_2) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_3 > 0, TRANSFORM(m.TO_Alacak_Tutari_3, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_3), m.TO_Alacak_Adi_3, m.TO_Alacak_Aciklamasi_3) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_4 > 0, TRANSFORM(m.TO_Alacak_Tutari_4, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_4), m.TO_Alacak_Adi_4, m.TO_Alacak_Aciklamasi_4) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_5 > 0, TRANSFORM(m.TO_Alacak_Tutari_5, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_5), m.TO_Alacak_Adi_5, m.TO_Alacak_Aciklamasi_5) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_6 > 0, TRANSFORM(m.TO_Alacak_Tutari_6, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_6), m.TO_Alacak_Adi_6, m.TO_Alacak_Aciklamasi_6) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_7 > 0, TRANSFORM(m.TO_Alacak_Tutari_7, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_7), m.TO_Alacak_Adi_7, m.TO_Alacak_Aciklamasi_7) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_8 > 0, TRANSFORM(m.TO_Alacak_Tutari_8, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_8), m.TO_Alacak_Adi_8, m.TO_Alacak_Aciklamasi_8) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_9 > 0, TRANSFORM(m.TO_Alacak_Tutari_9, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_9), m.TO_Alacak_Adi_9, m.TO_Alacak_Aciklamasi_9) + "\par ", "") + ;
		IIF(m.TO_Alacak_Tutari_10 > 0, TRANSFORM(m.TO_Alacak_Tutari_10, "999,999,999.99") + " " + IIF(NOE(m.TO_Alacak_Aciklamasi_10), m.TO_Alacak_Adi_10, m.TO_Alacak_Aciklamasi_10) + "\par ", "") + ;
		"-------------- " + "\par " + ;
		TRANSFORM(m.Takip_Alacagi, "999,999,999.99") + " Takip Alaca��" &&+"\par"

	RETURN lcTakip_Alacak_Hesabi


	*==============================================================================
	* Procedure:		GetToplamAlacakHesabi
	* Purpose:			.F.
	* Author:			F1 Technologies
	* Parameters:		None
	* Returns:			None
	* Added:			06/13/2011
	*==============================================================================
FUNCTION GetToplamAlacakHesabi

	LOCAL ;
		lcToplam_Alacak_Hesabi

	lcToplam_Alacak_Hesabi = ;
		ALLTRIM(TRANSFORM(m.Takip_Alacagi, "999,999,999.99")) + " TL Takip Alaca�� + " + ;
		ALLTRIM(TRANSFORM(m.Ts_Vekalet_Ucreti, "999,999,999.99")) + " TL Vekalet �creti + " + ;
		ALLTRIM(TRANSFORM(m.Ts_Harc_Tutari, "999,999,999.99")) + " TL Di�er Har� Tutar� + " + ;
		ALLTRIM(TRANSFORM(m.Ts_Masraf_Tutari, "999,999,999.99")) + " TL Masraf Tutar� + " + ;
		ALLTRIM(TRANSFORM(m.Tahsil_Harci, "999,999,999.99")) + " TL Tahsil_Harc� + " + ;
		ALLTRIM(TRANSFORM(m.Takip_Faizi_Tutari, "999,999,999.99")) + " TL Takip Faizi Tutar�" + ;
		IIF(m.Ts_Alacak_Tutari_1 > 0, ALLTRIM(TRANSFORM(m.Ts_Alacak_Tutari_1, "999,999,999.99")) + " TL " + RTRIM(IIF(NOE(m.Ts_Alacak_Aciklamasi_1), m.Ts_Alacak_Adi_1, m.Ts_Alacak_Aciklamasi_1)) + " + ", "") + ;
		IIF(m.Ts_Alacak_Tutari_2 > 0, ALLTRIM(TRANSFORM(m.Ts_Alacak_Tutari_2, "999,999,999.99")) + " TL " + RTRIM(IIF(NOE(m.Ts_Alacak_Aciklamasi_2), m.Ts_Alacak_Adi_2, m.Ts_Alacak_Aciklamasi_2)) + " + ", "") + ;
		IIF(m.Ts_Alacak_Tutari_3 > 0, ALLTRIM(TRANSFORM(m.Ts_Alacak_Tutari_3, "999,999,999.99")) + " TL " + RTRIM(IIF(NOE(m.Ts_Alacak_Aciklamasi_3), m.Ts_Alacak_Adi_3, m.Ts_Alacak_Aciklamasi_3)) + " + ", "") + ;
		IIF(m.Ts_Alacak_Tutari_4 > 0, ALLTRIM(TRANSFORM(m.Ts_Alacak_Tutari_4, "999,999,999.99")) + " TL " + RTRIM(IIF(NOE(m.Ts_Alacak_Aciklamasi_4), m.Ts_Alacak_Adi_4, m.Ts_Alacak_Aciklamasi_4)) + " + ", "") + ;
		IIF(m.Ts_Alacak_Tutari_5 > 0, ALLTRIM(TRANSFORM(m.Ts_Alacak_Tutari_5, "999,999,999.99")) + " TL " + RTRIM(IIF(NOE(m.Ts_Alacak_Aciklamasi_5), m.Ts_Alacak_Adi_5, m.Ts_Alacak_Aciklamasi_5)) + " + ", "") + ;
		ALLTRIM(TRANSFORM(m.Toplam_Alacak, "999,999,999.99")) + " TL Toplam Alacak" + ;
		TRANSFORM((m.Takip_Alacagi * (1.0 * m.Takip_Faizi_Orani / 100.0)) / 365.0, "9999.99") + " TL. G�nl�k Faiz"

	RETURN lcToplam_Alacak_Hesabi








