#INCLUDE ..\INCLUDE\VFE.H
*#INCLUDE VFE.H

PROCEDURE UyapDosyasiOlustur
	LPARAMETERS tcIcra_Dosya_No, tcBuro_Dosya_No

	LOCAL loUyapDosyaBizObj, ;
		loUyapDosyaRec

	LOCAL loUyapVekilBizObj AS "UyapVekilViewBizObj", ;
		loUyapVekilRec

	LOCAL loUyapAlacakliBizObj, ;
		loUyapAlacakliRec

	LOCAL loUyapBorcluBizObj, ;
		loUyapBorcluRec

	LOCAL loUyapAlacakBizObj, ;
		loUyapAlacakRec

	LOCAL lcMuvekkil_Id, ;
		lcVekil_Fk, ;
		lcIcraDosya_Id, ;
		lnVekilKisi_Id, ;
		lnj

	LOCAL lcAlacak_Aciklamasi, ;
		lcAlacak_Adi, ;
		lcAlacak_Tutari, ;
		To_Alacak_Adi, ;
		To_Alacak_Tutari

LOCAL lnAdres_Id, ;
	lnAlacakKalemi_Id, ;
	lnKisiKurumBilgileri_Id, ;
	lnKisiTumBilgileri_Id, ;
	lnTaraf_Id, ;
	lnk

	*debugmode()

	loUyapDosyaBizObj = CREATEOBJECT("UyapDosyaViewBizObj")

	**Dosya
	IF VARTYPE(loUyapDosyaBizObj) = T_OBject AND TYPE("loUyapDosyaBizObj.Name") = T_Character
		WITH loUyapDosyaBizObj
			.SetParameter("vp_Icra_Dosya_No", tcIcra_Dosya_No)
			.SetParameter("vp_Buro_Dosya_No", tcBuro_Dosya_No)

			IF .REQUERY() = Requery_Success AND .RecordCount > 0
				loUyapDosyaRec = .GetValues()

				WITH loUyapDosyaRec
					TEXT PRETEXT 8 
<dosya dosyaTuru="0" takipTuru="|.TakipTipi_Uyap_Kodu|" takipYolu="|.TakipYolu_Uyap_Kodu|" takipSekli="|.TakipSekli_Uyap_Kodu|" alacaklininTalepEttigiHak="|.Talep_Edilen_Hak|" BK84MaddeUygulansin="|IIF(.Bk84Madde_Uygulansin,"E","H")|" dosyaTipi="Genel Icra Dairesi" aciklama48e9="Haciz" BSMVUygulansin="|IIF(.BSMV_Uygulansin,"E","H")|" KKDFUygulansin="|IIF(.KKDF_Uygulansin,"E","H")|" dosyaBelirleyicisi="|ALLTRIM(.Borclu_Adi)|"> 
					ENDTEXT
				ENDWITH

				lcIcraDosya_Id = .GetField("IcraDosya_Id")
				lcVekil_Fk	   = .GetField("IcraDosya_Id")
				lcMuvekkil_Id  = .GetField("Muvekkil_Id")

				lnVekilKisi_Id			= 0
				lnKisiTumBilgileri_Id	= 0
				lnAdres_Id				= 0
				lnKisiKurumBilgileri_Id	= 0

				** Vekil
				loUyapVekilRec=NULL
				loUyapVekilBizObj = CREATEOBJECT("UyapVekilViewBizObj")
				IF VARTYPE(loUyapVekilBizObj) = T_OBject AND TYPE("loUyapVekilBizObj.Name") = T_Character
					WITH loUyapVekilBizObj
						.SetParameter("vp_Vekil_Fk", lcVekil_Fk)
						IF .REQUERY() = Requery_Success AND .RecordCount > 0
							loUyapVekilRec = .GetValues()
						ELSE
							.SetParameter("vp_Vekil_Fk", lcMuvekkil_Id)
							IF .REQUERY() = Requery_Success AND .RecordCount > 0
								loUyapVekilRec = .GetValues()
							ENDIF
						ENDIF

						IF VARTYPE(loUyapVekilRec) = T_OBject
							.SelectCursor

							SCAN
								lnVekilKisi_Id		  = lnVekilKisi_Id + 1
								lnKisiTumBilgileri_Id = lnKisiTumBilgileri_Id + 1
								lnAdres_Id			  = lnAdres_Id + 1

								.SetField("VekilKisi_Id", "VekilKisi_" + ALLTRIM(STR(lnVekilKisi_Id, 2)))
								.SetField("KisiTumBilgileri_Id", "KisiTumBilgileri_" + ALLTRIM(STR(lnKisiTumBilgileri_Id, 2)))
								.SetField("Adres_Id", "Adres_" + ALLTRIM(STR(lnAdres_Id, 2)))

								loUyapVekilRec = .GetValues()
								WITH loUyapVekilRec
									TEXT PRETEXT 8 
     <VekilKisi id="|ALLTRIM(.VekilKisi_Id)|"> 
        <vekil kurumAvukatiMi="|IIF(.Vekil_Tipi='Kurum','E','H')|" avukatlikBuroAdi="|CHRTRAN(RTRIM(.Buro_Adi),"&","-")|" baroNo="|RTRIM(.Baro_Sicil_No)|" borcluVekiliMi="|IIF(.Borclu_Vekili,'E','H')|" tbbNo="|RTRIM(.TBB_No)|" bakanlikDosyaNo="" vekilTipi="|IIF(NullOrEmpty(.Vekil_Tipi),'S',SUBSTR(.Vekil_Tipi,1,1))|" vergiNo="|RTrim(.Vergi_No)|" sigortaliMi="|IIF(EMPTY(.SSK_No),'H','E')|" /> 
        <kisiTumBilgileri kayitNo="" soyadi="|SUBSTR(ALLTRIM(.soyadi),RAT(' ',ALLTRIM(.Soyadi)))|" ybnNfsKayitliOldgYer="" id="|ALLTRIM(.KisiTumBilgileri_id)|" aileSiraNo="|RTRIM(.AileSiraNo)|" cuzdanNo="|RTRIM(.CuzdanNo)|" babaAdi="|RTRIM(.Baba_Adi)|" anaAdi="|RTRIM(.Ana_Adi)|" adi="|SUBSTR(RTRIM(.adi),1,RAT(' ',RTRIM(.adi)))|" tcKimlikNo="|RTRIM(.TcKimlik_No)|" oncekiSoyadi="" cinsiyeti="|SUBSTR(.Cinsiyeti,1,1)|" ciltNo="|RTRIM(.Cilt_No)|" cuzdanSeriNo="|RTRIM(.CuzdanSeriNo)|" siraNo="|RTRIM(.Sira_No)|" mahKoy="|RTRIM(.MahKoy)|" dogumYeri="|RTRIM(.Dogum_Yeri)|" /> 
        <adres elektronikPostaAdresi="|RTRIM(.e_posta)|" postaKodu="|RTRIM(.Posta_Kodu)|" adresTuruAciklama="|RTRIM(.AdresTuruAciklama)|" cepTelefon="|RTRIM(.CepTelefon)|" il="|RTRIM(.il)|" fax="|RTRIM(.Faks)|" id="|ALLTRIM(.Adres_Id)|" ilKodu="|ALLTRIM(.ilKodu)|" ilce="|RTRIM(.ilce)|" adres="|RTRIM(.adres)|" telefon="|RTRIM(.Telefon)|" ilceKodu="|ALLTRIM(.ilceKodu)|" adresTuru="|RTRIM(.adresTuru)|" /> 
     </VekilKisi> 
									ENDTEXT
								ENDWITH &&WITH loUyapVekilRec
							ENDSCAN
						ENDIF

						.RELEASE()
					ENDWITH && WITH loUyapVekilBizObj
					loUyapVekilBizObj = NULL
				ENDIF  && IF VARTYPE(loUyapVekilBizObj) = T_OBject AND TYPE("loUyapVekilBizObj.Name") = T_Character

				lnTaraf_Id = lnVekilKisi_Id

				**Muvekkil
				loUyapAlacakliRec=NULL
				loUyapAlacakliBizObj = CREATEOBJECT("UyapAlacakliViewBizObj")
				IF VARTYPE(loUyapAlacakliBizObj) = T_OBject AND TYPE("loUyapAlacakliBizObj.Name") = T_Character
					WITH loUyapAlacakliBizObj
						.SetParameter("vp_Alacakli_Fk", lcIcraDosya_Id)
						IF .REQUERY() = Requery_Success AND .RecordCount > 0
							loUyapAlacakliRec = .GetValues()
						ENDIF

						IF VARTYPE(loUyapAlacakliRec) = T_OBject
							.SelectCursor

							SCAN
								lnTaraf_Id				= lnTaraf_Id + 1
								lnKisiKurumBilgileri_Id	= lnKisiKurumBilgileri_Id + 1
								lnAdres_Id				= lnAdres_Id + 1

								.SetField("Taraf_Id", "taraf_" + ALLTRIM(STR(lnTaraf_Id, 2)))
								.SetField("KisiKurumBilgileri_Id", "KisiKurumBilgileri_" + ALLTRIM(STR(lnKisiKurumBilgileri_Id, 2)))
								.SetField("Adres_Id", "Adres_" + ALLTRIM(STR(lnAdres_Id, 2)))

								loUyapAlacakliRec = .GetValues()
								WITH loUyapAlacakliRec
									TEXT PRETEXT 8 
      <taraf id="|ALLTRIM(.Taraf_Id)|"> 
        <kisiKurumBilgileri ad="|RTRIM(.ad)|" id="|ALLTRIM(.KisiKurumBilgileri_Id)|"> 
          <kurum ticaretSicilNoVerildigiYer="" harcDurumu="|.harcDurumu|" ticaretSicilNo="|RTRIM(.TicaretSicilNo)|" kurumAdi="|RTRIM(.KurumAdi)|" kamuOzel="|IIF(.KamuOzel = 'Kamu', "K", "O")|" vergiDairesi="|RTRIM(.VergiDairesi)|" sskIsyeriSicilNo="|RTRIM(.sskisyerisicilNo)|" vergiNo="|rtrim(.VergiNo)|" /> 
          <adres elektronikPostaAdresi="|RTRIM(.e_Posta)|" postaKodu="|RTRIM(.postakodu)|" adresTuruAciklama="|.adresTuruAciklama|" cepTelefon="|RTRIM(.ceptelefon)|" il="|RTRIM(.il)|" fax="|RTRIM(.Fax)|" id="|ALLTRIM(.Adres_Id)|" ilKodu="|ALLTRIM(.ilKodu)|" ilce="|RTRIM(.Ilce)|" adres="|RTRIM(.Adres)|" telefon="|RTRIM(.telefon)|" ilceKodu="|ALLTRIM(.ilcekodu)|" adresTuru="|RTRIM(.AdresTuru)|" /> 
        </kisiKurumBilgileri> 
        <rolTur Rol="ALACAKLI" rolID="21" /> 
									ENDTEXT

									FOR lnj = 1 TO lnVekilKisi_Id
										TEXT PRETEXT 8 
        <ref to="VekilKisi" id="VekilKisi_|ALLTRIM(STR(lnj))|" /> 
										ENDTEXT
									NEXT lnj

									TEXT PRETEXT 8 
      </taraf> 
									ENDTEXT
								ENDWITH &&WITH loUyapAlacakliRec
							ENDSCAN
						ENDIF

						.RELEASE()
					ENDWITH && WITH loUyapAlacakliBizObj
					loUyapAlacakliBizObj = NULL
				ENDIF  && IF VARTYPE(loUyapAlacakliBizObj) = T_OBject AND TYPE("loUyapAlacakliBizObj.Name") = T_Character

				** Borclu
				loUyapBorcluRec=NULL
				loUyapBorcluBizObj = CREATEOBJECT("UyapBorcluViewBizObj")
				IF VARTYPE(loUyapBorcluBizObj) = T_OBject AND TYPE("loUyapBorcluBizObj.Name") = T_Character
					WITH loUyapBorcluBizObj
						.SetParameter("vp_Borclu_Fk", lcIcraDosya_Id)
						IF .REQUERY() = Requery_Success AND .RecordCount > 0
							loUyapBorcluRec = .GetValues()
						ENDIF

						IF VARTYPE(loUyapBorcluRec) = T_OBject
							.SelectCursor

							SCAN
								lnTaraf_Id				= lnTaraf_Id + 1
								lnKisiKurumBilgileri_Id	= lnKisiKurumBilgileri_Id + 1
								lnKisiTumBilgileri_Id	= lnKisiTumBilgileri_Id + 1
								lnAdres_Id				= lnAdres_Id + 1

								.SetField("Taraf_Id", "taraf_" + ALLTRIM(STR(lnTaraf_Id, 2)))
								.SetField("KisiKurumBilgileri_Id", "KisiKurumBilgileri_" + ALLTRIM(STR(lnKisiKurumBilgileri_Id, 2)))
								.SetField("KisiTumBilgileri_Id", "KisiTumBilgileri_" + ALLTRIM(STR(lnKisiTumBilgileri_Id, 2)))
								.SetField("Adres_Id", "Adres_" + ALLTRIM(STR(lnAdres_Id, 2)))

								loUyapBorcluRec = .GetValues()
								WITH loUyapBorcluRec
									TEXT PRETEXT 8 
      <taraf id="|ALLTRIM(.Taraf_Id)|"> 
        <kisiKurumBilgileri ad="|RTRIM(.ad)|" id="|ALLTRIM(.KisiKurumBilgileri_Id)|"> 
          <kisiTumBilgileri kayitNo="|RTRIM(.KayitNo)|" soyadi="|SUBSTR(ALLTRIM(.soyadi),RAT(' ',ALLTRIM(.Soyadi)))|" ybnNfsKayitliOldgYer="" id="|allTRIM(.KisiTumBilgileri_Id)|" aileSiraNo="|RTRIM(.ailesirano)|" cuzdanNo="|RTRIM(.CuzdanNo)|" babaAdi="|RTRIM(.BabaAdi)|" anaAdi="|RTRIM(.AnaAdi)|" dogumTarihi="|.DogumTarihi|" adi="|SUBSTR(RTRIM(.ad),1,RAT(' ',RTRIM(.ad)))|" tcKimlikNo="|RTRIM(.TcKimlikNo)|" cinsiyeti="|IIF(NULLOREMPTY(SUBSTR(.Cinsiyeti,1,1)),'E',SUBSTR(.Cinsiyeti,1,1))|" ciltNo="|RTRIM(.CiltNo)|" cuzdanSeriNo="|RTRIM(.CuzdanSeriNo)|" siraNo="|RTRIM(.SiraNo)|" mahKoy="|RTRIM(.MahKoy)|" dogumYeri="|RTRIM(.DogumYeri)|" /> 
          <adres elektronikPostaAdresi="|RTRIM(.elektronikpostaadresi)|" postaKodu="|RTRIM(.postakodu)|" adresTuruAciklama="|.adresTuruAciklama|" cepTelefon="|RTRIM(.ceptelefon)|" il="|RTRIM(.il)|" fax="|RTRIM(.Fax)|" id="|ALLTRIM(.Adres_Id)|" ilKodu="|ALLTRIM(.ilKodu)|" ilce="|RTRIM(.Ilce)|" adres="|RTRIM(.Adres)|" telefon="|RTRIM(.telefon)|" ilceKodu="|ALLTRIM(.ilcekodu)|" adresTuru="|RTRIM(.AdresTuru)|" /> 
        </kisiKurumBilgileri> 
        <rolTur Rol="|ALLTRIM(.Rol)|" rolID="|ALLTRIM(.Rol_Id)|" /> 
      </taraf> 
									ENDTEXT
								ENDWITH &&WITH loUyapBorcluRec
							ENDSCAN
						ENDIF

						.RELEASE()
					ENDWITH && WITH loUyapBorcluBizObj
					loUyapBorcluBizObj = NULL
				ENDIF  && IF VARTYPE(loUyapBorcluBizObj) = T_OBject AND TYPE("loUyapBorcluBizObj.Name") = T_Character

				lnAlacakKalemi_Id = 0
				** Alacak
				loUyapAlacakRec=NULL
				loUyapAlacakBizObj = CREATEOBJECT("UyapAlacakViewBizObj")
				IF VARTYPE(loUyapAlacakBizObj) = T_OBject AND TYPE("loUyapAlacakBizObj.Name") = T_Character
					WITH loUyapAlacakBizObj
						.SetParameter("vp_IcraDosya_Id", lcIcraDosya_Id)
						IF .REQUERY() = Requery_Success AND .RecordCount > 0
							loUyapAlacakRec = .GetValues()
						ENDIF

						IF VARTYPE(loUyapAlacakRec) = T_OBject
							.SelectCursor

							WITH loUyapAlacakRec
								** Asil_Alacak
								** Gecikme_Faizi_Tutari - Gecikme_Faizi_Aciklamasi
								** Temerrut_Faizi_Tutari - Temerrut_Faizi_Aciklamasi

								lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1

								TEXT PRETEXT 8 
      <digerAlacak tutarTur="|ALLTRIM(.TutarTur)|" tutar="|.Tutar|" alacakNo="|.AlacakNo|" digerAlacakAciklama="|RTRIM(.DigerAlacakAciklama)|" id="|ALLTRIM(.Alacak_Id)|" tutarAdi="|RTRIM(.TutarAdi)|" tarih="|.Tarih|"> 
        <alacakKalemi alacakKalemKodTuru="1" alacakKalemKod="3" tutarTur="PRBRMTL" alacakKalemKodAciklama="Diðer Asýl Alacaðý" aciklama="" alacakKalemTutar="|.Asil_Alacak|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|.Asil_Alacak|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Diðer Asýl Alacaðý"> 
								ENDTEXT

								FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
									TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
									ENDTEXT
								NEXT lnk

								TEXT PRETEXT 8 
          <faiz faizOran="|.Temerrut_Faizi_Orani|" id="faiz_1" faizTipKod="FAIZT00003" faizTipKodAciklama="Diðer" baslangicTarihi="20/09/2012" faizSureTip="2" /> 
        </alacakKalemi> 
								ENDTEXT

								FOR lnj = 1 TO 10
									lcAlacak_Adi		= "TO_Alacak_Adi_" + ALLTRIM(STR(lnj))
									lcAlacak_Tutari		= "TO_Alacak_Tutari_" + ALLTRIM(STR(lnj))
									lcAlacak_Aciklamasi	= "TO_Alacak_Aciklamasi_" + ALLTRIM(STR(lnj))

									To_Alacak_Adi	 = .&lcAlacak_Adi
									To_Alacak_Tutari = .&lcAlacak_Tutari

									IF To_Alacak_Tutari > 0.1
										lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1
										TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="1" alacakKalemKod="3" tutarTur="PRBRMTL" alacakKalemKodAciklama="|RTRIM(To_Alacak_Adi)|" aciklama="" alacakKalemTutar="|TO_Alacak_Tutari|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|TO_Alacak_Tutari|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Diðer Asýl Alacaðý"> 
										ENDTEXT

										FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
											TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
											ENDTEXT
										NEXT lnk

										TEXT PRETEXT 8 
        </alacakKalemi> 
										ENDTEXT
									ENDIF
								NEXT lnj

								** Takip_Alacagi
								** TS_Vekalet_Ucreti
								IF .Ts_Vekalet_Ucreti > 0.1
									lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1

									TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="0" alacakKalemKod="8707" tutarTur="PRBRMTL" alacakKalemKodAciklama="Vekalet Ücreti" aciklama="" alacakKalemTutar="|.TS_Vekalet_Ucreti|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|.TS_Vekalet_Ucreti|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Vekalet Ücreti"> 
									ENDTEXT

									FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
										TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
										ENDTEXT
									NEXT lnk

									TEXT PRETEXT 8 
        </alacakKalemi> 
									ENDTEXT
								ENDIF

								** Takip_Faizi_Tutari - Takip_Faizi_Aciklamasi
								IF .Takip_Faizi_Tutari > 0.1
									lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1

									TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="2" alacakKalemKod="6" tutarTur="PRBRMTL" alacakKalemKodAciklama="Diðer Faiz Alacaðý" aciklama="" alacakKalemTutar="|.Takip_Faizi_Tutari|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|.Takip_Faizi_Tutari|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Diðer Faiz Alacaðý"> 
									ENDTEXT

									FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
										TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
										ENDTEXT
									NEXT lnk

									TEXT PRETEXT 8 
        </alacakKalemi> 
									ENDTEXT
								ENDIF

								** TS_Harc_Tutari
								IF .Ts_Harc_Tutari >= 0.1
									lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1

									TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="0" alacakKalemKod="8733" tutarTur="PRBRMTL" alacakKalemKodAciklama="Harç" aciklama="" alacakKalemTutar="|.Ts_Harc_Tutari|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|.TS_Harc_Tutari|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Harç"> 
									ENDTEXT

									FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
										TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
										ENDTEXT
									NEXT lnk

									TEXT PRETEXT 8 
        </alacakKalemi> 
									ENDTEXT
								ENDIF

								** TS_Masraf_Tutari
								IF .Ts_Masraf_Tutari > 0.1
									lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1
									TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="0" alacakKalemKod="9728" tutarTur="PRBRMTL" alacakKalemKodAciklama="Masraf" aciklama="" alacakKalemTutar="|.Ts_Masraf_Tutari|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|.TS_Masraf_Tutari|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Masraf"> 
									ENDTEXT

									FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
										TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
										ENDTEXT
									NEXT lnk

									TEXT PRETEXT 8 
        </alacakKalemi> 
									ENDTEXT
								ENDIF

								FOR lnj = 1 TO 5
									lcAlacak_Adi		= "TS_Alacak_Adi_" + ALLTRIM(STR(lnj))
									lcAlacak_Tutari		= "TS_Alacak_Tutari_" + ALLTRIM(STR(lnj))
									lcAlacak_Aciklamasi	= "TS_Alacak_Aciklamasi_" + ALLTRIM(STR(lnj))

									To_Alacak_Adi	 = .&lcAlacak_Adi
									To_Alacak_Tutari = .&lcAlacak_Tutari

									IF .&lcAlacak_Tutari > 0.1
										lnAlacakKalemi_Id = lnAlacakKalemi_Id + 1

										TEXT PRETEXT 8 
        <alacakKalemi alacakKalemKodTuru="1" alacakKalemKod="3" tutarTur="PRBRMTL" alacakKalemKodAciklama="|RTRIM(To_Alacak_Adi)|" aciklama="" alacakKalemTutar="|TO_Alacak_Tutari|" id="alacakKalemi_|ALLTRIM(STR(lnAlacakKalemi_Id))|" alacakKalemIlkTutar="|To_Alacak_Tutari|" tutarAdi="TL - Türk Lirasý" alacakKalemAdi="Diðer Asýl Alacaðý"> 
										ENDTEXT

										FOR lnk = lnVekilKisi_Id + 1 TO lnTaraf_Id
											TEXT PRETEXT 8 
        <ref to="taraf" id="taraf_|ALLTRIM(STR(lnk))|" /> 
											ENDTEXT
										NEXT lnk


										TEXT PRETEXT 8 
        </alacakKalemi> 
										ENDTEXT
									ENDIF
								NEXT lnj

								** Toplam Alacak
								** Kalan Alacak

								TEXT PRETEXT 8 
      </digerAlacak> 
								ENDTEXT
							ENDWITH &&WITH loUyapAlacakRec

						ENDIF

						.RELEASE()
					ENDWITH && WITH loUyapAlacakBizObj
					loUyapAlacakBizObj = NULL
				ENDIF  && IF VARTYPE(loUyapAlacakBizObj) = T_OBject AND TYPE("loUyapAlacakBizObj.Name") = T_Character

				** Dosya
				TEXT PRETEXT 8 
    </dosya> 		
				ENDTEXT
			ENDIF
			.RELEASE()
		ENDWITH   && WITH loUyapDosyaBizObj
		loUyapDosyaBizObj = NULL
	ENDIF

	RETURN




	*!*		* Dosya
	*!*		m.DosyaTuru	 = 0
	*!*		m.TakipTuru	 = .TakipTipi_Uyap_Kodu   && Ödeme Emri Viewden OE_Ornek_Adi ný çýkar
	*!*		m.TakipYolu	 = .TakipYolu_Uyap_Kodu   && DosyaTipinde ve her dosyada tutulsun
	*!*		m.TakipSekli = .TakipSekli_Uyap_Kodu  && DosyaTipinde ve her dosyada tutulsun

	*!*		m.alacaklininTalepEttigiHak = DosyaTipi.Talep_Edilen_Hak && DosyaTipinde ve her dosya hesabýnda tutulsun

	*!*		m.BK84MaddeUygulansin = "H"  && DosyaTipinde ve her dosya hesabýnda tutulsun,aldýðý paralar BK 84. madde gereðince önce faiz ve masraflara mahsup edebilir.

	*!*		m.DosyaTipi	   = "Genel Icra Dairesi"
	*!*		m.Aciklama48e9 = "Haciz"   &&  DosyaTipinde tutulsun, alacaðýn ne þekilde tahsil edileceðine iliþkin açýklama

	*!*		m.BSMVUygulansin = "E"    && DosyaTipinde tutulsun, Banka Sigortalarý ve Mevduat Vergisi
	*!*		m.KKDFUygulansin = "H"	&& DosyaTipinde tutulsun, Kaynak Kullanýmý Destekleme Fonu

	*!*		m.dosyaBelirleyicisi = .Borclu_Adi

	*!*		** Vekil Kiþi  ( 1 den fazla vekil olabilir)
	*!*		m.Id = "VekilKisi_1"

	*!*		*** Vekil
	*!*		m.baroNo		   = Personel.Baro_Sicil_No
	*!*		m.tbbNo			   = "9867" 		&& Personel Tablosunda okutulsun
	*!*		m.avukatlikBuroAdi = Buro.Buro_Adi
	*!*		m.tcKimlikNo	   = Personel.TcKimlik_No
	*!*		m.vergiNo		   = Personel.Vergi_No
	*!*		m.vekilTipi		   = "S"    	&& && Personel Tablosunda okutulsun, Serbest, Baro, Kurum
	*!*		m.bakanlikDosyaNo  = ""
	*!*		m.kurumAvukatiMi   = "H" 		&& && Personel Tablosunda okutulsun,  Evet, Hayýr
	*!*		m.sigortaliMi	   = "H"	    && && Personel Tablosunda okutulsun,  Evet, Hayýr
	*!*		m.borcluVekiliMi   = "H"		&& && Vekil Tablosunda okutulsun, Evet, Hayýr


	*!*		*** kisiTumBilgileri
	*!*		m.kayitNo			   = ""
	*!*		m.soyadi			   = Personel.Personel_Adi
	*!*		m.ybnNfsKayitliOldgYer = ""
	*!*		m.Id				   = "kisiKurumBilgileri_1"
	*!*		m.aileSiraNo		   = ""
	*!*		m.cuzdanNo			   = ""
	*!*		m.babaAdi			   = ""
	*!*		m.anaAdi			   = ""
	*!*		m.adi				   = Personel.Personel_Adi
	*!*		m.tcKimlikNo		   = Personel.TcKimlik_No
	*!*		m.oncekiSoyadi		   = ""
	*!*		m.cinsiyeti			   = Personel.cinsiyeti
	*!*		m.ciltNo			   = ""
	*!*		m.cuzdanSeriNo		   = ""
	*!*		m.siraNo			   = ""
	*!*		m.mahKoy			   = ""
	*!*		m.dogumYeri			   = ""

	*!*		*** Adres
	*!*		m.elektronikPostaAdresi	= Personel.e_Posta
	*!*		postaKodu				= Buro.Posta_Kodu
	*!*		adresTuruAciklama		= "Yurt Ýçi Ýkametgah Adresi"   && Adres Tipi olarak okut
	*!*		cepTelefon				= Personel.Cep_Tel_No         && Telefon alanlarýndan ülke kodu kalksýn tel hanesi 20 hane olsun
	*!*		il						= Buro.Il_Adi
	*!*		fax						= Buro.Faks
	*!*		ID						= "adres_1"
	*!*		ilKodu					= "6"  						&& ÝlUyapKodu dosyasýndan alýnsýn
	*!*		ilce					= Buro.Ilce_Adi
	*!*		adres					= Buro.adres
	*!*		telefon					= Buro.Tel
	*!*		ilceKodu				= "25"						&& ÝlUyapKodu dosyasýndan alýnsýn
	*!*		adresTuru				= "ADRTR00001"				&& Adres Tipi dosyasýndan alýnsýn


	*!*		** Taraf 	 (1 den fazla taraf olur)
	*!*		ID = "taraf_3"   		&& neden taraf1 deðil de 3 ? Sanýrým ilk iki taraf vekillere için

	*!*		*** kisiKurumBilgileri 
	*!*		ad = IcraDosya.Muvekkil_Adi
	*!*		ID = "kisiKurumBilgileri_3"

	*!*		**** kurum 
	*!*		ticaretSicilNoVerildigiYer = ""
	*!*		harcDurumu				   = "1"     && (0 | 1)  "1"
	*!*		ticaretSicilNo			   = Muvekkil.Ticaret_Sicil_No
	*!*		kurumAdi				   = Muvekkil.Muvekkil_Adi
	*!*		kamuOzel				   = IIF(Muvekkil.Muvekkil_Tipi = 'Kamu', "K", "O")
	*!*		vergiDairesi			   = Muvekkil.Vergi_Dairesi
	*!*		sskIsyeriSicilNo		   = ""
	*!*		vergiNo					   = Muvekkil.Vergi_No

	*!*		**** adres 
	*!*		elektronikPostaAdresi = Muvekkil.e_Posta
	*!*		postaKodu			  = adres.Posta_Kodu
	*!*		adresTuruAciklama	  = "Yurt Ýçi Ýkametgah Adresi"  && && Adres Tipi olarak okut
	*!*		cepTelefon			  = ""
	*!*		il					  = adres.Il_Adi
	*!*		fax					  = ""
	*!*		ID					  = "adres_3"
	*!*		ilKodu				  = "34"   && ÝlUyapKodu dosyasýndan alýnsýn
	*!*		ilce				  = adres.Ilce_Adi
	*!*		adres				  = adres.adres
	*!*		telefon				  = Muvekkil.Iletisim_Telefonu
	*!*		ilceKodu			  = "29"    && ÝlUyapKodu dosyasýndan alýnsýn
	*!*		adresTuru			  = "ADRTR00001"  && Adres Tipi dosyasýndan alýnsýn


	*!*		*** rolTur 
	*!*		Rol	  = "ALACAKLI"    && Rol v RolId, TarafTipi tablosundan alýnacak
	*!*		rolID = "21"

	*!*		*** ref 
	*!*		TO = "VekilKisi"
	*!*		ID = "VekilKisi_1"

	*!*		*** ref 
	*!*		TO = "VekilKisi"
	*!*		ID = "VekilKisi_2"



	*!*		** taraf 
	*!*		ID = "taraf_4"

	*!*		*** kisiKurumBilgileri 
	*!*		ad = "ALÝ OSMAN GENCER"
	*!*		ID = "kisiKurumBilgileri_4"

	*!*		**** kisiTumBilgileri 
	*!*		kayitNo				 = ""
	*!*		soyadi				 = "GENCER"
	*!*		ybnNfsKayitliOldgYer = ""
	*!*		ID					 = "kisiTumBilgileri_4"
	*!*		aileSiraNo			 = ""
	*!*		cuzdanNo			 = ""
	*!*		babaAdi				 = ""
	*!*		anaAdi				 = ""
	*!*		dogumTarihi			 = ""
	*!*		adi					 = "ALÝ OSMAN"
	*!*		tcKimlikNo			 = "51316366236"
	*!*		cinsiyeti			 = "E"
	*!*		ciltNo				 = ""
	*!*		cuzdanSeriNo		 = ""
	*!*		siraNo				 = ""
	*!*		mahKoy				 = ""
	*!*		dogumYeri			 = ""

	*!*		**** adres 
	*!*		elektronikPostaAdresi = ""
	*!*		postaKodu			  = ""
	*!*		adresTuruAciklama	  = "Yurt Ýçi Ýkametgah Adresi"
	*!*		cepTelefon			  = ""
	*!*		il					  = "ANKARA"
	*!*		fax					  = ""
	*!*		ID					  = "adres_4"
	*!*		ilKodu				  = "6"
	*!*		ilce				  = "ETÝMESGUT"
	*!*		adres				  = "MALAZGÝRT MAH.MERAL SOKAK NO:1/16"
	*!*		telefon				  = ""
	*!*		ilceKodu			  = "11"
	*!*		adresTuru			  = "ADRTR00001"

	*!*		*** rolTur 
	*!*		Rol	  = "ARACIKÝÞÝKURUM"
	*!*		rolID = "71"


	*!*		** taraf 
	*!*		ID = "taraf_5"

	*!*		*** kisiKurumBilgileri 
	*!*		ad = "HASAN ÇETÝN"
	*!*		ID = "kisiKurumBilgileri_5"

	*!*		**** kisiTumBilgileri 
	*!*		kayitNo				 = ""
	*!*		soyadi				 = Rehber.adi
	*!*		ybnNfsKayitliOldgYer = ""
	*!*		ID					 = "kisiTumBilgileri_5"
	*!*		aileSiraNo			 = ""
	*!*		cuzdanNo			 = ""
	*!*		babaAdi				 = ""
	*!*		anaAdi				 = ""
	*!*		dogumTarihi			 = ""
	*!*		adi					 = Rehber.adi
	*!*		tcKimlikNo			 = Rehber.TcKimlik_No
	*!*		cinsiyeti			 = Rehber.cinsiyeti
	*!*		ciltNo				 = ""
	*!*		cuzdanSeriNo		 = ""
	*!*		siraNo				 = ""
	*!*		mahKoy				 = ""
	*!*		dogumYeri			 = ""

	*!*		**** adres 
	*!*		elektronikPostaAdresi = ""
	*!*		postaKodu			  = adres.Posta_Kodu
	*!*		adresTuruAciklama	  = "Yurt Ýçi Ýkametgah Adresi"
	*!*		cepTelefon			  = ""
	*!*		il					  = adres.Il_Adi
	*!*		fax					  = ""
	*!*		ID					  = "adres_3"
	*!*		ilKodu				  = "34"   && IlUyapKodu dosyasýndan alýnsýn
	*!*		ilce				  = adres.Ilce_Adi
	*!*		adres				  = adres.adres
	*!*		telefon				  = Rehber.Iletisim_Telefonu
	*!*		ilceKodu			  = "29"    && IlUyapKodu dosyasýndan alýnsýn
	*!*		adresTuru			  = "ADRTR00001"  && Adres Tipi dosyasýndan alýnsýn

	*!*		*** rolTur 
	*!*		Rol	  = "BORÇLU/MÜFLÝS"   &&TarafTipi Dosyasýndan
	*!*		rolID = "22"


	*!*		** digerAlacak 
	*!*		tutarTur			= "PRBRMTL"     && DovizTipi.Uyap_Kodu
	*!*		tutar				= "8348.45"  &&IcraDosyaHesabi.TakipAlacagi
	*!*		alacakNo			= "1"
	*!*		digerAlacakAciklama	= IcraDosya.BorcEvragi && Borç dayanaðý olsun mu ? "ÝHTARNAME,HESAP ÖZETÝ, ihtiyaç KREDÝsi HESABI  SÖZLEÞMESÝ"
	*!*		ID					= "digerAlacak_6"
	*!*		tutarAdi			= "TL - Türk Lirasý"   && DovizTipi.Aciklama
	*!*		tarih				= IcraDosya.TakipTarihi  &&"14/08/2012"

	*!*		*** alacakKalemi 
	*!*		alacakKalemKodTuru	   = "1"                  && AlacakKodu.Kod_Turu
	*!*		alacakKalemKod		   = "3"                  && AlacakKodu.Kod
	*!*		tutarTur			   = "PRBRMTL"		      && DovizTipi.Uyap_Kodu
	*!*		alacakKalemKodAciklama = "Diðer Asýl Alacaðý" && AlacakKodu.Aciklama
	*!*		aciklama			   = ""
	*!*		alacakKalemTutar	   = "8348.45"            && IcraDosyaHesabi.To-Alacak-Tutari-1
	*!*		ID					   = "alacakKalemi_1"
	*!*		alacakKalemIlkTutar	   = "8348.45"			  && IcraDosyaHesabi.To-Alacak-Tutari-1

	*!*		tutarAdi	   = "TL - Türk Lirasý"   && DovizTipi.Aciklama
	*!*		alacakKalemAdi = "Diðer Asýl Alacaðý" && IcraDosyaHesabi.To-Alacak-Adi-1

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_3"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_4"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_5"

	*!*		**** faiz 
	*!*		faizOran		   = "21.72"
	*!*		ID				   = "faiz_1"
	*!*		faizTipKod		   = "FAIZT00003"
	*!*		faizTipKodAciklama = "Diðer"
	*!*		baslangicTarihi	   = "20/09/2012"
	*!*		faizSureTip		   = "2"

	*!*		*** alacakKalemi 
	*!*		alacakKalemKodTuru	   = "2"
	*!*		alacakKalemKod		   = "6"
	*!*		tutarTur			   = "PRBRMTL"
	*!*		alacakKalemKodAciklama = "Faiz 1 14/08/2012-20/09/2012 arasý 37 Gü"
	*!*		aciklama			   = ""
	*!*		alacakKalemTutar	   = "183.81"
	*!*		ID					   = "alacakKalemi_2"
	*!*		alacakKalemIlkTutar	   = "183.81"
	*!*		tutarAdi			   = "TL - Türk Lirasý"
	*!*		alacakKalemAdi		   = "Diðer Faiz Alacaðý"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_3"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_4"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_5"

	*!*		*** alacakKalemi 
	*!*		alacakKalemKodTuru	   = "0"
	*!*		alacakKalemKod		   = "5"
	*!*		tutarTur			   = "PRBRMTL"
	*!*		alacakKalemKodAciklama = "BSMVÝht.SnrkiFaizin"
	*!*		aciklama			   = ""
	*!*		alacakKalemTutar	   = "9.19"
	*!*		ID					   = "alacakKalemi_3"
	*!*		alacakKalemIlkTutar	   = "9.19"
	*!*		tutarAdi			   = "TL - Türk Lirasý"
	*!*		alacakKalemAdi		   = "Diðer Masraf Alacaðý"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_3"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_4"

	*!*		**** ref 
	*!*		TO = "taraf"
	*!*		ID = "taraf_5"


	*!*		RETURN       