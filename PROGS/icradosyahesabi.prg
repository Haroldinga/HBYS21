#INCLUDE ..\INCLUDE\VFE.H
*#INCLUDE VFE.H

LPARAMETERS ;
	tuParameter, ;
	loIcraDosyaHesabiRec, ;
	tcHesap_Tipi

LOCAL ;
	loApp, ;
	loIcraDosyaBizObj, ;
	loIcraDosyaVal, ;
	loIcraDosyaHesabiBizObj, ;
	loHesapSekliBizObj,;
	lcIcraDosya_Id, ;
	lcDosyaTipi_Id, ;
	lcMuvekkil_Id, ;
	ldVade_Tarihi, ;
	ldIhtarname_Tarihi, ;
	ldTakip_Tarihi, ;
	llnewobject, ;
	llreturn, ;
	To_Alacak_Adi, ;
	To_Alacak_Hesabi, ;
	To_Alacak_Tutari, ;
	To_Alacak_Aciklamasi, ;
	Ts_Alacak_Adi, ;
	Ts_Alacak_Hesabi, ;
	Ts_Alacak_Tutari, ;
	Ts_Alacak_Aciklamasi



PRIVATE ;
    loHesapSekliRec,;
	Asil_Alacak, ;
	Gecikme_Faizi_Orani, ;
	Gecikme_Faizi_Tutari, ;
	Gecikme_Faizi_Aciklamasi, ;
	Temerrut_Faizi_Orani, ;
	Temerrut_Faizi_Tutari, ;
	Temerrut_Faizi_Aciklamasi, ;
	To_Alacak_Adi_1, To_Alacak_Adi_2, To_Alacak_Adi_3, To_Alacak_Adi_4, To_Alacak_Adi_5, To_Alacak_Adi_6, To_Alacak_Adi_7, To_Alacak_Adi_8, To_Alacak_Adi_9, To_Alacak_Adi_10, ;
	To_Alacak_Tutari_1, To_Alacak_Tutari_2, To_Alacak_Tutari_3, To_Alacak_Tutari_4, To_Alacak_Tutari_5, To_Alacak_Tutari_6, To_Alacak_Tutari_7, To_Alacak_Tutari_8, To_Alacak_Tutari_9, To_Alacak_Tutari_10, ;
	To_Alacak_Aciklamasi_1, To_Alacak_Aciklamasi_2, To_Alacak_Aciklamasi_3, To_Alacak_Aciklamasi_4, To_Alacak_Aciklamasi_5, To_Alacak_Aciklamasi_6, To_Alacak_Aciklamasi_7, To_Alacak_Aciklamasi_8, To_Alacak_Aciklamasi_9, To_Alacak_Aciklamasi_10, ;
	Takip_Alacagi, ;
	Takip_Alacak_Hesabi, ;
	Toplam_Alacak_Hesabi, ;
	Ts_Vekalet_Ucreti, ;
	Takip_Faizi_Orani, ;
	Takip_Faizi_Tutari, ;
	Takip_Faizi_Aciklamasi, ;
	Ts_Harc_Tutari, ;
	Ts_Masraf_Tutari, ;
	Tahsil_Harci, ;
	Ts_Alacak_Adi_1, Ts_Alacak_Adi_2, Ts_Alacak_Adi_3, Ts_Alacak_Adi_4, Ts_Alacak_Adi_5, ;
	Ts_Alacak_Tutari_1, Ts_Alacak_Tutari_2, Ts_Alacak_Tutari_3, Ts_Alacak_Tutari_4, Ts_Alacak_Tutari_5, ;
	Ts_Alacak_Aciklamasi_1, Ts_Alacak_Aciklamasi_2, Ts_Alacak_Aciklamasi_3, Ts_Alacak_Aciklamasi_4, Ts_Alacak_Aciklamasi_5, ;
	Ts_Tahsilat_Tutari, ;
	Toplam_Alacak, ;
	Indirim_Tutari, ;
	Kalan_Alacak, ;
	Alacakli_Bilgisi, ;
	Vekil_Bilgisi, ;
	Borclu_Bilgisi


*Debugmode()

llreturn = .T.
DO CASE
	CASE VARTYPE(tuParameter) = T_Object
		** loIcraDosyaVal g�nderilmi�, Icradosyabizobj ye gerek yok
		loIcraDosyaVal = tuParameter
		lcIcraDosya_Id = loIcraDosyaVal.IcraDosya_Id
	CASE VARTYPE(tuParameter) = T_Character  && IcraDosya_Id G�nderilmi�.. ��eri�ine Versiyon20 den bakabilirsin
		llreturn = .F.
	OTHERWISE
		llreturn = .F.
ENDCASE

IF NOT llreturn
	RETURN llreturn
ENDIF


WITH loIcraDosyaVal
	lcIcraDosya_Id	   = .IcraDosya_Id
	lcDosyaTipi_Id	   = .DosyaTipi_Id
	lcMuvekkil_Id	   = .Muvekkil_Id
	ldVade_Tarihi	   = .Vade_Tarihi
	ldIhtarname_Tarihi = .Ihtarname_Tarihi
	ldTakip_Tarihi	   = .Takip_Tarihi
ENDWITH

loHesapSekliBizObj = CREATEOBJECT("AlacakHesapSekliViewBizObj")
WITH loHesapSekliBizObj
	.setparameter("vp_HesapSekli_Fk", lcDosyaTipi_Id)
	.REQUERY()
	loHesapSekliRec = .GetValues()
ENDWITH
loHesapSekliBizObj = NULL

*** As�l Alacak
m.Asil_Alacak = GetAsil_Alacak(lcIcraDosya_Id, ldTakip_Tarihi)
m.Asil_Alacak = ROUND(m.Asil_Alacak, 2)
WITH loIcraDosyaHesabiRec
	.Asil_Alacak = m.Asil_Alacak
ENDWITH


*** Gecikme_Faizi_Tutari
m.Gecikme_Faizi_Orani	   = 0
m.Gecikme_Faizi_Tutari	   = 0
m.Gecikme_Faizi_Aciklamasi = ""
loFaizBilgisi			   = getFaiz(m.Asil_Alacak, ldVade_Tarihi, ldIhtarname_Tarihi, "GECIKME", lcDosyaTipi_Id, lcIcraDosya_Id)
IF NOT ISNULL(loFaizBilgisi)
	WITH loFaizBilgisi
		m.Gecikme_Faizi_Orani	   = .Faiz_Orani
		m.Gecikme_Faizi_Tutari	   = .Faiz_Tutari
		m.Gecikme_Faizi_Aciklamasi = NVL(.Faiz_Aciklamasi, "")
	ENDWITH
ENDIF
m.Gecikme_Faizi_Tutari = ROUND(m.Gecikme_Faizi_Tutari, 2)
WITH loIcraDosyaHesabiRec
    IF tcHesap_Tipi="�zel Hesap"
	   	m.Gecikme_Faizi_Tutari	  = .Gecikme_Faizi_Tutari
    ENDIF 

	.Gecikme_Faizi_Orani	  = m.Gecikme_Faizi_Orani
	.Gecikme_Faizi_Tutari	  = m.Gecikme_Faizi_Tutari
	.Gecikme_Faizi_Aciklamasi = m.Gecikme_Faizi_Aciklamasi
ENDWITH

*** Temerrut_Faiz_Tutari
m.Temerrut_Faizi_Orani		= 0
m.Temerrut_Faizi_Tutari		= 0
m.Temerrut_Faizi_Aciklamasi	= ""
loFaizBilgisi				= getFaiz(m.Asil_Alacak, ldIhtarname_Tarihi, ldTakip_Tarihi, "TEMERRUT", lcDosyaTipi_Id, lcIcraDosya_Id)
IF NOT ISNULL(loFaizBilgisi)
	WITH loFaizBilgisi
		m.Temerrut_Faizi_Orani		= .Faiz_Orani
		m.Temerrut_Faizi_Tutari		= .Faiz_Tutari
		m.Temerrut_Faizi_Aciklamasi	= NVL(.Faiz_Aciklamasi, "")
	ENDWITH
ENDIF
m.Temerrut_Faizi_Tutari = ROUND(m.Temerrut_Faizi_Tutari, 2)
WITH loIcraDosyaHesabiRec
    IF tcHesap_Tipi="�zel Hesap"
	   	m.Temerrut_Faizi_Tutari	  = .Temerrut_Faizi_Tutari
    ENDIF 
  
	.Temerrut_Faizi_Orani	   = m.Temerrut_Faizi_Orani
	.Temerrut_Faizi_Tutari	   = m.Temerrut_Faizi_Tutari
	.Temerrut_Faizi_Aciklamasi = m.Temerrut_Faizi_Aciklamasi
ENDWITH


*** To_Alacak_Adi_1, TO_Alacak_Tutari_1......
STORE 0 TO m.To_Alacak_Tutari_1, m.To_Alacak_Tutari_2, m.To_Alacak_Tutari_3, m.To_Alacak_Tutari_4, ;
	m.To_Alacak_Tutari_5, m.To_Alacak_Tutari_6, m.To_Alacak_Tutari_7, m.To_Alacak_Tutari_8, ;
	m.To_Alacak_Tutari_9, m.To_Alacak_Tutari_10

loAlacakHesabiRec = GetToAlacak(lcIcraDosya_Id, lcDosyaTipi_Id)
FOR i = 1 TO 10
	m.To_Alacak_Adi		   = "TO_Alacak_Adi_" + ALLTRIM(STR(i))
	m.To_Alacak_Hesabi	   = "TO_Alacak_Hesabi_" + ALLTRIM(STR(i))
	m.To_Alacak_Tutari	   = "TO_Alacak_Tutari_" + ALLTRIM(STR(i))
	m.To_Alacak_Aciklamasi = "TO_Alacak_Aciklamasi_" + ALLTRIM(STR(i))

	WITH loAlacakHesabiRec
		m.&To_Alacak_Adi		= .&To_Alacak_Adi
		m.&To_Alacak_Hesabi		= .&To_Alacak_Hesabi
		m.&To_Alacak_Tutari		= .&To_Alacak_Tutari
		m.&To_Alacak_Aciklamasi	= .&To_Alacak_Aciklamasi
	ENDWITH

	WITH loIcraDosyaHesabiRec
	    IF tcHesap_Tipi="�zel Hesap"
			m.&To_Alacak_Tutari	   = .&To_Alacak_Tutari
			IF nullOrEmpty(m.&To_Alacak_Tutari)
     		  m.&To_Alacak_Tutari=0  
			ENDIF 
        ENDIF 

		.&To_Alacak_Adi		   = m.&To_Alacak_Adi
		.&To_Alacak_Hesabi	   = m.&To_Alacak_Hesabi
		.&To_Alacak_Tutari	   = m.&To_Alacak_Tutari
		.&To_Alacak_Aciklamasi = m.&To_Alacak_Aciklamasi
	ENDWITH
NEXT i

*** Takip_Alacagi
m.Takip_Alacagi = m.Asil_Alacak + m.Gecikme_Faizi_Tutari + m.Temerrut_Faizi_Tutari + ;
	m.To_Alacak_Tutari_1 + m.To_Alacak_Tutari_2 + m.To_Alacak_Tutari_3 + ;
	m.To_Alacak_Tutari_4 + m.To_Alacak_Tutari_5 + m.To_Alacak_Tutari_6 + ;
	m.To_Alacak_Tutari_7 + m.To_Alacak_Tutari_8 + m.To_Alacak_Tutari_9 + ;
	m.To_Alacak_Tutari_10

WITH loIcraDosyaHesabiRec
	.Takip_Alacagi = m.Takip_Alacagi
ENDWITH

*** TS_Vekalet_Ucreti
m.Ts_Vekalet_Ucreti	= getVekaletUcreti(m.Takip_Alacagi, lcDosyaTipi_Id, lcIcraDosya_Id)
m.Ts_Vekalet_Ucreti	= ROUND(m.Ts_Vekalet_Ucreti, 2)
WITH loIcraDosyaHesabiRec
	.Ts_Vekalet_Ucreti = m.Ts_Vekalet_Ucreti
ENDWITH

*** Takip_Faizi_Tutari
m.Takip_Faizi_Orani		 = 0
m.Takip_Faizi_Tutari	 = 0
m.Takip_Faizi_Aciklamasi = ""
loFaizBilgisi			 = getFaiz(m.Takip_Alacagi, ldTakip_Tarihi, DATE(), "TAKIP", lcDosyaTipi_Id, lcIcraDosya_Id, tcHesap_Tipi, loIcraDosyaHesabiRec.Indirimli_Takip_Faizi_Orani)
IF NOT ISNULL(loFaizBilgisi)
	WITH loFaizBilgisi
		m.Takip_Faizi_Orani		 = .Faiz_Orani
		m.Takip_Faizi_Tutari	 = .Faiz_Tutari
		m.Takip_Faizi_Aciklamasi = NVL(.Faiz_Aciklamasi, "")
	ENDWITH
ENDIF
m.Takip_Faizi_Tutari = ROUND(m.Takip_Faizi_Tutari, 2)
WITH loIcraDosyaHesabiRec
	.Takip_Faizi_Orani		= m.Takip_Faizi_Orani
	.Takip_Faizi_Tutari		= m.Takip_Faizi_Tutari
	.Takip_Faizi_Aciklamasi	= m.Takip_Faizi_Aciklamasi
ENDWITH

*** Harc_Tutari
m.Tahsil_Harci	 = 0
m.Ts_Harc_Tutari = GetHarcTutari(lcIcraDosya_Id)
m.Ts_Harc_Tutari = ROUND(m.Ts_Harc_Tutari, 2)
m.Tahsil_Harci	 = ROUND(m.Tahsil_Harci, 2) && m.Tahsil_Harci Private de�i�ken... Get Harc Tutari fonsiyonunda hesaplaniyor

WITH loIcraDosyaHesabiRec
	.Ts_Harc_Tutari	= m.Ts_Harc_Tutari
	.Tahsil_Harci	= m.Tahsil_Harci
ENDWITH

*** Masraf_Tutari
m.Ts_Masraf_Tutari = GetMasrafTutari(lcIcraDosya_Id)
m.Ts_Masraf_Tutari = ROUND(m.Ts_Masraf_Tutari, 2)
WITH loIcraDosyaHesabiRec
	.Ts_Masraf_Tutari = m.Ts_Masraf_Tutari
ENDWITH

*** Ts_Alacak_Adi_1, Ts_Alacak_Tutari_1...
loAlacakHesabiRec = NULL
STORE 0 TO m.Ts_Alacak_Tutari_1, m.Ts_Alacak_Tutari_2, m.Ts_Alacak_Tutari_3, m.Ts_Alacak_Tutari_4, ;
	m.Ts_Alacak_Tutari_5

loAlacakHesabiRec = GetTSAlacak(lcIcraDosya_Id, lcDosyaTipi_Id)
FOR i = 1 TO 5
	m.Ts_Alacak_Adi		   = "Ts_Alacak_Adi_" + ALLTRIM(STR(i))
	m.Ts_Alacak_Hesabi	   = "Ts_Alacak_Hesabi_" + ALLTRIM(STR(i))
	m.Ts_Alacak_Tutari	   = "Ts_Alacak_Tutari_" + ALLTRIM(STR(i))
	m.Ts_Alacak_Aciklamasi = "Ts_Alacak_Aciklamasi_" + ALLTRIM(STR(i))

	WITH loAlacakHesabiRec
		m.&Ts_Alacak_Adi		= .&Ts_Alacak_Adi
		m.&Ts_Alacak_Hesabi		= .&Ts_Alacak_Hesabi
		m.&Ts_Alacak_Tutari		= .&Ts_Alacak_Tutari
		m.&Ts_Alacak_Aciklamasi	= .&Ts_Alacak_Aciklamasi
	ENDWITH

	WITH loIcraDosyaHesabiRec
		.&Ts_Alacak_Adi		   = m.&Ts_Alacak_Adi
		.&Ts_Alacak_Hesabi	   = m.&Ts_Alacak_Hesabi
		.&Ts_Alacak_Tutari	   = m.&Ts_Alacak_Tutari
		.&Ts_Alacak_Aciklamasi = m.&Ts_Alacak_Aciklamasi
	ENDWITH
NEXT i

*** Tahsilat Toplam�
m.Ts_Tahsilat_Tutari = GetTahsilatTutari(lcIcraDosya_Id, ldTakip_Tarihi)
m.Ts_Tahsilat_Tutari = ROUND(m.Ts_Tahsilat_Tutari, 2)
WITH loIcraDosyaHesabiRec
	.Ts_Tahsilat_Tutari = m.Ts_Tahsilat_Tutari
ENDWITH

**** Takip D��me S�ras� ve Toplam Alacak hesab�
m.Toplam_Alacak = m.Takip_Alacagi + m.Ts_Vekalet_Ucreti + m.Takip_Faizi_Tutari + ;
	m.Ts_Harc_Tutari + m.Ts_Masraf_Tutari + m.Tahsil_Harci + m.Ts_Alacak_Tutari_1 + ;
	m.Ts_Alacak_Tutari_2 + m.Ts_Alacak_Tutari_3 + m.Ts_Alacak_Tutari_4 + ;
	m.Ts_Alacak_Tutari_5   &&- m.Ts_Tahsilat_Tutari  Bug!!

WITH loIcraDosyaHesabiRec
	.Toplam_Alacak = m.Toplam_Alacak
ENDWITH

*** Indirim Tutari
m.Indirim_Tutari = 0
WITH loIcraDosyaHesabiRec
	.Indirim_Tutari = 0
ENDWITH

***** Kalan Alacak Hesab�
m.Kalan_Alacak = m.Toplam_Alacak - m.Ts_Tahsilat_Tutari  && Indirim Tutar� ikinci hesapta d���lecek

WITH loIcraDosyaHesabiRec
	.Kalan_Alacak = m.Kalan_Alacak
ENDWITH


*** Takip_Alacak_Hesabi
m.Takip_Alacak_Hesabi = GetTakipAlacakHesabi()
WITH loIcraDosyaHesabiRec
	.Takip_Alacak_Hesabi = m.Takip_Alacak_Hesabi
ENDWITH

*** Toplam_Alacak_Hesabi
m.Toplam_Alacak_Hesabi = GetToplamAlacakHesabi()
WITH loIcraDosyaHesabiRec
	.Toplam_Alacak_Hesabi = m.Toplam_Alacak_Hesabi
ENDWITH

*** Alacakli Bilgisi
m.Alacakli_Bilgisi = getAlacakliBilgisi(lcIcraDosya_Id)
WITH loIcraDosyaHesabiRec
	.Alacakli_Bilgisi = m.Alacakli_Bilgisi
ENDWITH

*** Vekil_Bilgisi
m.Vekil_Bilgisi = GetVekilBilgisi(lcIcraDosya_Id, lcMuvekkil_Id)
WITH loIcraDosyaHesabiRec
	.Vekil_Bilgisi = m.Vekil_Bilgisi
ENDWITH

*** Bor�lu Bilgisi
m.Borclu_Bilgisi = getBorcluBilgisi(lcIcraDosya_Id)
WITH loIcraDosyaHesabiRec
	.Borclu_Bilgisi = m.Borclu_Bilgisi
ENDWITH

RETURN .T.





