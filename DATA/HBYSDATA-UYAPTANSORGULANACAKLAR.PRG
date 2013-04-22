***************** Begin View Definition UYAPTANSORGULANACAKLAR ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "UYAPTANSORGULANACAKLAR" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Id,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Takip_Yolu,;
		Icradosya.TakipSekli_Id,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Id,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.Gelis_Tarihi,;
		Borclu.Borclu_Id,;
		Borclu.Rehber_Id,;
		Borclu.TcKimlik_No,;
		Borclu.Ticaret_Sicil_No,;
		Borclu.Borclu_Adi,;
		Adres.Adres_Tipi,;
		Adres.Adres,;
		Malbilgisi.MalBilgisi_Id,;
		Malbilgisi.Mal_Tipi,;
		Malbilgisi.Mal_Bilgisi,;
		Malbilgisi.Menkul_Bilgisi,;
		Malbilgisi.Banka_Hesap_No,;
		Malbilgisi.Arac_Tipi,;
		Malbilgisi.Plaka_No,;
		Malbilgisi.Mulk_Tipi;
	FROM {oj{oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk;
		LEFT OUTER JOIN dbo.Adres Adres;
			ON Borclu.Rehber_Id = Adres.Adres_Fk};
		LEFT OUTER JOIN dbo.MalBilgisi Malbilgisi;
			ON Borclu.Borclu_Id = Malbilgisi.Borclu_Id}

DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'UpdateType', 1)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'WhereType', 3)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'MaxRecords', -1)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'Tables', 'dbo.IcraDosya,dbo.Borclu,dbo.Adres,dbo.MalBilgisi')
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'Prepared', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'FetchSize', -1)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'ParameterList', "vp_Icra_Dosya_No,'V';vp_Buro_Dosya_No,'V';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C';vp_Gelis_Tarihi1,'D';vp_Gelis_Tarihi2,'D';vp_TcKimlik_No,'C';vp_Adres,'L';vp_Isyeri,'L';vp_Arac,'L';vp_Gayrimenkul,'L'")
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'Comment', "")
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPTANSORGULANACAKLAR', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPTANSORGULANACAKLAR
	GoExplorer.odbcx.Validate("UYAPTANSORGULANACAKLAR","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR","VIEW",;
		"VFECDESCRIPT","Uyaptansorgulanacaklar Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Büro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Büro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Büro Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Büro Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!adliyelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECLUTAG","adliye_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMLUFIELDS","adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Adliyelookupview.adliye_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gelis_Tarihi1
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECDESCRIPT","Vp Gelis Tarihi1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gelis_Tarihi2
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECDESCRIPT","Vp Gelis Tarihi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_TcKimlik_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECDESCRIPT","Vp Tckimlik No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_TcKimlik_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adres
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECDESCRIPT","Vp Adres View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECFRMCAPTN","Adres Bilgisi Olmayanlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECDLGCAPTN","Adres Bilgisi Olmayanlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFEMTOOLTIP","Adres Bilgisi Olmayanlar                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFEMSTATUSTXT","Adres Bilgisi Olmayanlar                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Adres","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Isyeri
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECDESCRIPT","Vp Isyeri View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECFRMCAPTN","Ýþyeri Bilgisi Olmayanlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECDLGCAPTN","Ýþyeri Bilgisi Olmayanlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFEMTOOLTIP","Ýþyeri Bilgisi Olmayanlar                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFEMSTATUSTXT","Ýþyeri Bilgisi Olmayanlar                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Isyeri","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Arac
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECDESCRIPT","Vp Arac View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECFRMCAPTN","Araç Bilgisi Olmayanlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECDLGCAPTN","Araç Bilgisi Olmayanlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFEMTOOLTIP","Araç Bilgisi Olmayanlar                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFEMSTATUSTXT","Araç Bilgisi Olmayanlar                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Arac","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Gayrimenkul
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECDESCRIPT","Vp Gayrimenkul View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECFRMCAPTN","Gayrimenkul Bilgisi Olmayanlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECDLGCAPTN","Gayrimenkul Bilgisi Olmayanlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFEMTOOLTIP","Gayrimenkul Bilgisi Olmayanlar                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFEMSTATUSTXT","Gayrimenkul Bilgisi Olmayanlar                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.vp_Gayrimenkul","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for UYAPTANSORGULANACAKLAR
*** Props for the UYAPTANSORGULANACAKLAR.buro_dosya_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('UYAPTANSORGULANACAKLAR.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Büro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Büro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Büro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Büro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Büro Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Büro Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.buro_dosya_no","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.icra_dosya_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('UYAPTANSORGULANACAKLAR.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.muvekkil_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Uvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Uvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Uvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Uvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Uvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Uvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.muvekkil_adi field.
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('UYAPTANSORGULANACAKLAR.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.dosya_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.takip_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.takip_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.takip_yolu field.
DBSetProp('UYAPTANSORGULANACAKLAR.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('UYAPTANSORGULANACAKLAR.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takip_yolu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.takipsekli_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.takipsekli_id', 'Field', 'UpdateName', 'dbo.IcraDosya.TakipSekli_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takip Þekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takip Þekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takip Þekli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takip Þekli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takip Þekli                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takip Þekli                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.takipsekli_id","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.borc_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borc_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.icramudurlugu_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.icramudurlugu_adi field.
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('UYAPTANSORGULANACAKLAR.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.adliye_adi field.
DBSetProp('UYAPTANSORGULANACAKLAR.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('UYAPTANSORGULANACAKLAR.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adliye_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the UYAPTANSORGULANACAKLAR.dosya_statusu field.
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('UYAPTANSORGULANACAKLAR.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.dosya_statusu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.gelis_tarihi field.
DBSetProp('UYAPTANSORGULANACAKLAR.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('UYAPTANSORGULANACAKLAR.gelis_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.gelis_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.borclu_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_id', 'Field', 'KeyField', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_id', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Id                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Id                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_id","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.rehber_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.rehber_id', 'Field', 'UpdateName', 'dbo.Borclu.Rehber_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.rehber_id","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.tckimlik_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('UYAPTANSORGULANACAKLAR.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tc Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tc Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.tckimlik_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.ticaret_sicil_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('UYAPTANSORGULANACAKLAR.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.borclu_adi field.
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('UYAPTANSORGULANACAKLAR.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.borclu_adi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.adres_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.adres_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.adres_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.adres_tipi', 'Field', 'UpdateName', 'dbo.Adres.Adres_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.adres_tipi', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.adres_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECDESCRIPT","Adres Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECFRMCAPTN","Adres Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECDLGCAPTN","Adres Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECGRDCAPTN","Adres Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECRPTCAPTN","Adres Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFEMTOOLTIP","Adres Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFEMSTATUSTXT","Adres Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres_tipi","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.adres field.
DBSetProp('UYAPTANSORGULANACAKLAR.adres', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.adres', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.adres', 'Field', 'UpdateName', 'dbo.Adres.Adres')
DBSetProp('UYAPTANSORGULANACAKLAR.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFEMTOOLTIP","Adres                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFEMSTATUSTXT","Adres                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.adres","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.malbilgisi_id field.
DBSetProp('UYAPTANSORGULANACAKLAR.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.malbilgisi_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('UYAPTANSORGULANACAKLAR.malbilgisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.malbilgisi_id","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.mal_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_tipi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.mal_bilgisi field.
DBSetProp('UYAPTANSORGULANACAKLAR.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('UYAPTANSORGULANACAKLAR.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mal_bilgisi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.menkul_bilgisi field.
DBSetProp('UYAPTANSORGULANACAKLAR.menkul_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.menkul_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.menkul_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Menkul_Bilgisi')
DBSetProp('UYAPTANSORGULANACAKLAR.menkul_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.menkul_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECDESCRIPT","Menkul Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECFRMCAPTN","Menkul Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECDLGCAPTN","Menkul Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECGRDCAPTN","Menkul Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECRPTCAPTN","Menkul Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFEMTOOLTIP","Menkul Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Menkul Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.menkul_bilgisi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.banka_hesap_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.banka_hesap_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.banka_hesap_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.banka_hesap_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Banka_Hesap_No')
DBSetProp('UYAPTANSORGULANACAKLAR.banka_hesap_no', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.banka_hesap_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECDESCRIPT","Banka Hesap No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECFRMCAPTN","Banka Hesap No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECDLGCAPTN","Banka Hesap No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECGRDCAPTN","Banka Hesap No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECRPTCAPTN","Banka Hesap No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFEMTOOLTIP","Banka Hesap No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFEMSTATUSTXT","Banka Hesap No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.banka_hesap_no","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.arac_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.arac_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.arac_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.arac_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Arac_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.arac_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.arac_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECDESCRIPT","Arac Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECFRMCAPTN","Araç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECDLGCAPTN","Araç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECGRDCAPTN","Araç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECRPTCAPTN","Araç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFEMTOOLTIP","Araç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFEMSTATUSTXT","Araç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.arac_tipi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.plaka_no field.
DBSetProp('UYAPTANSORGULANACAKLAR.plaka_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.plaka_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.plaka_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Plaka_No')
DBSetProp('UYAPTANSORGULANACAKLAR.plaka_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.plaka_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECDESCRIPT","Plaka No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECFRMCAPTN","Plaka No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECDLGCAPTN","Plaka No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECGRDCAPTN","Plaka No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECRPTCAPTN","Plaka No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFEMTOOLTIP","Plaka No                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFEMSTATUSTXT","Plaka No                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.plaka_no","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the UYAPTANSORGULANACAKLAR.mulk_tipi field.
DBSetProp('UYAPTANSORGULANACAKLAR.mulk_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPTANSORGULANACAKLAR.mulk_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPTANSORGULANACAKLAR.mulk_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mulk_Tipi')
DBSetProp('UYAPTANSORGULANACAKLAR.mulk_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPTANSORGULANACAKLAR.mulk_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECDESCRIPT","Mulk Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECFRMCAPTN","Mülk Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECDLGCAPTN","Mülk Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECGRDCAPTN","Mülk Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECRPTCAPTN","Mülk Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFEMTOOLTIP","Mülk Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFEMSTATUSTXT","Mülk Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPTANSORGULANACAKLAR.mulk_tipi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
