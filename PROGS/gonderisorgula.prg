#INCLUDE VFE.H


FUNCTION GonderiSorgula
	LPARAMETERS ;
		tcBarkod

	LOCAL ;
		loSoAp, ;
		loWSDL, ;
		lcWSDL, ;
		lcXML, ;
		lcResponseXML

	LOCAL loSorgu_Bilgisi AS "SorgBilgisi"

	LOCAL lcSorgu_Bilgisi, ;
		lcSonuc_Bilgisi, ;
		ldSonuc_Tarihi, ;
		lnLine, ;
		lnRow

	LOCAL lcImerk, ;
		lcIslem, ;
		lcSiraNo, ;
		lcTarih,;
		lcOldDate

	*:Global aSorgu_Bilgisi[1], ;
	i

	*debugmode()
	lcOldDate=SET("Date")

	lcSorgu_Bilgisi	= ""
	lcSonuc_Bilgisi	= ""
	ldSonuc_Tarihi	= {  /  /    }

	IF NOT NullOrEmpty(tcBarkod)

		= MsgSvc("NOWAIT", tcBarkod + " Sorgulaniyor..")

		DO wwSoap
		loSoAp = CREATEOBJECT('wwSoap')

		WITH loSoAp
			.lincludedataTypes	   = .T.
			.lParseReturnedObjects = .T.
			.cServerUrl			   = [https://interaktifkargo.ptt.gov.tr/WebServis/WSGonderiTakip]

			lcWSDL = [https://interaktifkargo.ptt.gov.tr/WebServis/WSGonderiTakip?wsdl]
			*!*			loWSDL=.Parseservicewsdl(lcWSDL,.T.)  && Force parsing of objects
			*!*			IF VARTYPE(loWSDL)=T_Object
			*!*	    		loWSDL.cServerUrl=[https://interaktifkargo.ptt.gov.tr/WebServis/WSGonderiTakip]
			*!*	    	ENDIF 	
		ENDWITH


		*** Create a FoxPro object from the WSDL Schema definition
		*loBarKod = loSoAp.CreateObjectFromSchema("tr_gov_ptt_obj_GonderiSorguInput")
		*loOutput = loSoAp.CreateObjectFromSchema("tr_gov_ptt_obj_GonderiSorguOutput")

		TEXT TO lcXML TEXTMERGE NOSHOW
<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsg="WSGonderiTakip">
   <soapenv:Header/>
   <soapenv:Body>
      <wsg:gonderiSorgula soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
         <input xsi:type="�ws:tr_gov_ptt_obj_GonderiSorguInput" xmlns:�ws="http://tr.gov.ptt.biz/IWSGonderiTakip.xsd">
            <barkod xsi:type="xsd:string">|tcbarkod|</barkod>
         </input>
      </wsg:gonderiSorgula>
   </soapenv:Body>
</soapenv:Envelope>
		ENDTEXT

		*!*	TEXT TO lcXML noshow
		*!*	<input xmlns:ns1="http://tr.gov.ptt.biz/IWSGonderiTakip.xsd"
		*!*	    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
		*!*	    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		*!*	     xsi:type="ns1:tr_gov_ptt_obj_GonderiSorguInput">
		*!*	  <barkod  xsi:type="xsd:string">TB02399239351</barkod>
		*!*	</input>
		*!*	ENDTEXT 

		WITH loSoAp
			.cRequestXml = lcXML
			.CallSoapServer()
			lcResponseXML = .cResponseXML
		ENDWITH

		i = 0
		DO WHILE .T.
			i		 = i + 1
			lcImerk	 = STREXTRACT(lcResponseXML, [IMERK xsi:type="xsd:string">], [</IMERK>], i)
			lcIslem	 = STREXTRACT(lcResponseXML, [<ISLEM xsi:type="xsd:string">], [</ISLEM>], i)
			lcTarih	 = STREXTRACT(lcResponseXML, [<ITARIH xsi:type="xsd:string">], [</ITARIH>], i)
			lcSiraNo = STREXTRACT(lcResponseXML, [<siraNo xsi:type="xsd:int">], [</siraNo>], i)
			IF EMPTY(lcImerk) OR i > 10
				EXIT
			ENDIF
			lcSorgu_Bilgisi = lcSorgu_Bilgisi + PADR(lcIslem, 50) + CHR(9) + lcTarih + CHR(9) + lcSiraNo + CR
		ENDDO

		**** 		
		IF ATC("Mazbata Teslim Listesine Eklendi", lcSorgu_Bilgisi) > 0
			DO CASE
				CASE ATC("AYNI KONUTTA YAKINA TESLiM", lcSorgu_Bilgisi) > 0
					lcSonuc_Bilgisi = "AYNI KONUTTA YAKINA TESLiM"
				CASE ATC("21.MAD. GORE MUHTARA TESLiM", lcSorgu_Bilgisi) > 0
					lcSonuc_Bilgisi = "21.MAD. GORE MUHTARA TESLiM"
				CASE ATC("MUHATABA BiZZAT TESLiM", lcSorgu_Bilgisi) > 0
					lcSonuc_Bilgisi = "MUHATABA BiZZAT TESLiM"
				OTHERWISE
					lcSonuc_Bilgisi = " iADE EDiLDi"
			ENDCASE

			lnLine = ALINES(aSorgu_Bilgisi, lcSorgu_Bilgisi, CHR(13))
			lnRow  = ASCAN(aSorgu_Bilgisi, lcSonuc_Bilgisi, -1, -1, 1, 13) &&Case Insensitive; Return row number; Exact OFF
            
            SET DATE BRITISH 
			IF lnRow > 0
				ldSonuc_Tarihi = CTOD(SUBSTR(aSorgu_Bilgisi(lnRow), 52, 10))
			ENDIF
		ENDIF
		****

	ENDIF

	loSorgu_Bilgisi = CREATEOBJECT("SorguBilgisi")

	WITH loSorgu_Bilgisi
		.cSorgu_Bilgisi	= lcSorgu_Bilgisi
		.cSonuc_Bilgisi	= lcSonuc_Bilgisi
		.dSonuc_Tarihi	= ldSonuc_Tarihi
	ENDWITH

    SET DATE &lcOldDate
    
	RETURN loSorgu_Bilgisi


DEFINE CLASS SorguBilgisi AS CUSTOM
	cSorgu_Bilgisi = ""
	cSonuc_Bilgisi = ""
	dSonuc_Tarihi  = {  /  /    }
ENDDEFINE





