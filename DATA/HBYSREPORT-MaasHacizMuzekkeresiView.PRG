***************** Begin View Definition MaasHacizMuzekkeresiView ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "MaasHacizMuzekkeresiView" ; 
 REMOTE CONNECT "HBYSReportConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Icra_Dosya_No AS dosyano,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.IcraMudurlugu_Adi AS icra_dairesi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Asil_Alacak,;
		Icradosyahesabi.Takip_Alacagi,;
		Icradosyahesabi.Toplam_Alacak,;
		Icradosyahesabi.Kalan_Alacak,;
		Borclu.Borclu_Adi,;
		Borclu.TcKimlik_No,;
		Borclu.TcKimlik_No AS borclu_tckimlik_no,;
		Borclu.Ticaret_Sicil_No AS borclu_ticaret_sicil_no,;
		Rehber.Iletisim_Adresi AS borclu_adresi,;
		Rehber.Adres_Statusu,;
		Rehber.Dogum_Tarihi AS borclu_dogum_tarihi,;
		Muamele.Muamele_Id,;
		Muamele.Muamele_Tarihi,;
		Muamele.Muzekkere_Adi,;
		Muamele.Mal_Tipi,;
		Muamele.Mal_Bilgisi,;
		Muamele.Mal_Tutari,;
		Muamele.Muhatap_Adi,;
		Muamele.Muhatap_Adresi,;
		Muamele.Haciz_Tarihi,;
		Muamele.Maas_Muvafakat_Miktari,;
		CAST(SPACE(0) AS VARCHAR(50)) AS vekil_adi,;
		CAST(0 AS NUMERIC(6,2)) AS pul_masrafi,;
		Icradosya.Icra_Dosya_No AS grapor_sablonu,;
		Icradosya.Icra_Dosya_No AS gzarf_sablonu,;
		CAST(SPACE(13) AS CHARACTER(13)) AS barkod;
	FROM {oj{oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		INNER JOIN dbo.Muamele Muamele;
			ON Icradosya.IcraDosya_Id = Muamele.Muamele_Fk;
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Borclu.Borclu_Id = Muamele.Borclu_Id};
		LEFT OUTER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id}

DBSetProp('MaasHacizMuzekkeresiView', 'View', 'UpdateType', 1)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'WhereType', 3)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'FetchMemo', .T.)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'SendUpdates', .F.)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'UseMemoSize', 255)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'MaxRecords', -1)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'Prepared', .F.)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'CompareMemo', .T.)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'FetchSize', -1)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'C';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C';vp_Borclu_Adi,'C';vp_Muamele_Id,'C';vp_Muamele_Tarihi,'D';vp_Muzekkere_Adi,'C'")
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'Comment', "")
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'BatchUpdateCount', 1)
DBSetProp('MaasHacizMuzekkeresiView', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MaasHacizMuzekkeresiView
	GoExplorer.odbcx.Validate("MaasHacizMuzekkeresiView","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView","VIEW",;
		"VFECDESCRIPT","MaasHacizMuzekkeresiView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Buro_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Icra_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMINPUTMASK","9999/9999999999") &&Input Mask
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borclu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Borclu.Borclu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Borclu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muzekkere_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muzekkere Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MaasHacizMuzekkeresiView
*** Props for the MaasHacizMuzekkeresiView.icradosya_id field.
DBSetProp('MaasHacizMuzekkeresiView.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('MaasHacizMuzekkeresiView.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('MaasHacizMuzekkeresiView.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('MaasHacizMuzekkeresiView.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.buro_dosya_no field.
DBSetProp('MaasHacizMuzekkeresiView.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('MaasHacizMuzekkeresiView.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.icra_dosya_no field.
DBSetProp('MaasHacizMuzekkeresiView.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('MaasHacizMuzekkeresiView.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MaasHacizMuzekkeresiView.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.dosyano field.
DBSetProp('MaasHacizMuzekkeresiView.dosyano', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.dosyano', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.dosyano', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MaasHacizMuzekkeresiView.dosyano', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.dosyano
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECDESCRIPT","Dosyano Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECFRMCAPTN","Dosyano") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECDLGCAPTN","Dosyano") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECGRDCAPTN","Dosyano") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECRPTCAPTN","Dosyano") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFEMTOOLTIP","Dosyano") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFEMSTATUSTXT","Dosyano") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosyano","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.muvekkil_adi field.
DBSetProp('MaasHacizMuzekkeresiView.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('MaasHacizMuzekkeresiView.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.dosya_tipi field.
DBSetProp('MaasHacizMuzekkeresiView.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('MaasHacizMuzekkeresiView.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borc_tipi field.
DBSetProp('MaasHacizMuzekkeresiView.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('MaasHacizMuzekkeresiView.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borc_evragi field.
DBSetProp('MaasHacizMuzekkeresiView.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borc_evragi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('MaasHacizMuzekkeresiView.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borc Evragi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borc Evragi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borc_evragi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.icramudurlugu_adi field.
DBSetProp('MaasHacizMuzekkeresiView.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MaasHacizMuzekkeresiView.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('MaasHacizMuzekkeresiView.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.icra_dairesi field.
DBSetProp('MaasHacizMuzekkeresiView.icra_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.icra_dairesi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.icra_dairesi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('MaasHacizMuzekkeresiView.icra_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.icra_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECDESCRIPT","Icra Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECFRMCAPTN","Icra Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECDLGCAPTN","Icra Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECGRDCAPTN","Icra Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECRPTCAPTN","Icra Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFEMTOOLTIP","Icra Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFEMSTATUSTXT","Icra Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.icra_dairesi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MaasHacizMuzekkeresiView.adliye_adi field.
DBSetProp('MaasHacizMuzekkeresiView.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('MaasHacizMuzekkeresiView.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('MaasHacizMuzekkeresiView.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.risk_yoneticisi_adi field.
DBSetProp('MaasHacizMuzekkeresiView.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('MaasHacizMuzekkeresiView.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.alacakli_bilgisi field.
DBSetProp('MaasHacizMuzekkeresiView.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.alacakli_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('MaasHacizMuzekkeresiView.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacaklý Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacaklý Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacaklý Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacaklý Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacaklý Bilgisi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacaklý Bilgisi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.vekil_bilgisi field.
DBSetProp('MaasHacizMuzekkeresiView.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.vekil_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('MaasHacizMuzekkeresiView.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_bilgisi field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('MaasHacizMuzekkeresiView.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.asil_alacak field.
DBSetProp('MaasHacizMuzekkeresiView.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.asil_alacak', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('MaasHacizMuzekkeresiView.asil_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asýl Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asýl Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asýl Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asýl Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asýl Alacak                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asýl Alacak                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.asil_alacak","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.takip_alacagi field.
DBSetProp('MaasHacizMuzekkeresiView.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.takip_alacagi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('MaasHacizMuzekkeresiView.takip_alacagi', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacaðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacaðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacaðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacaðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacaðý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacaðý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.takip_alacagi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.toplam_alacak field.
DBSetProp('MaasHacizMuzekkeresiView.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.toplam_alacak', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.toplam_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak')
DBSetProp('MaasHacizMuzekkeresiView.toplam_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.toplam_alacak","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.kalan_alacak field.
DBSetProp('MaasHacizMuzekkeresiView.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.kalan_alacak', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('MaasHacizMuzekkeresiView.kalan_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.kalan_alacak","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_adi field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('MaasHacizMuzekkeresiView.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.tckimlik_no field.
DBSetProp('MaasHacizMuzekkeresiView.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('MaasHacizMuzekkeresiView.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.tckimlik_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_tckimlik_no field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('MaasHacizMuzekkeresiView.borclu_tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECDESCRIPT","Borclu Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Borçlu Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Borçlu Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Borçlu Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Borçlu Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Borçlu Tckimlik No                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Borçlu Tckimlik No                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_tckimlik_no","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Borclu Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Borçlu Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Borçlu Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Borçlu Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Borçlu Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Borçlu Ticaret Sicil No                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Borçlu Ticaret Sicil No                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_adresi field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('MaasHacizMuzekkeresiView.borclu_adresi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adresi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adresi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_adresi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.adres_statusu field.
DBSetProp('MaasHacizMuzekkeresiView.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.adres_statusu', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.adres_statusu', 'Field', 'UpdateName', 'dbo.Rehber.Adres_Statusu')
DBSetProp('MaasHacizMuzekkeresiView.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.adres_statusu","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.borclu_dogum_tarihi field.
DBSetProp('MaasHacizMuzekkeresiView.borclu_dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_dogum_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.borclu_dogum_tarihi', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Tarihi')
DBSetProp('MaasHacizMuzekkeresiView.borclu_dogum_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.borclu_dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Borclu Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Borçlu Doðum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Borçlu Doðum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Borçlu Doðum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Borçlu Doðum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Borçlu Doðum Tarihi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Doðum Tarihi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.borclu_dogum_tarihi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.muamele_id field.
DBSetProp('MaasHacizMuzekkeresiView.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muamele_id', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muamele_id', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Id')
DBSetProp('MaasHacizMuzekkeresiView.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_id","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.muamele_tarihi field.
DBSetProp('MaasHacizMuzekkeresiView.muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muamele_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('MaasHacizMuzekkeresiView.muamele_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muamele_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.muzekkere_adi field.
DBSetProp('MaasHacizMuzekkeresiView.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muzekkere_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('MaasHacizMuzekkeresiView.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Müzekkere Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Müzekkere Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muzekkere_adi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.mal_tipi field.
DBSetProp('MaasHacizMuzekkeresiView.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tipi')
DBSetProp('MaasHacizMuzekkeresiView.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tipi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.mal_bilgisi field.
DBSetProp('MaasHacizMuzekkeresiView.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_bilgisi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Bilgisi')
DBSetProp('MaasHacizMuzekkeresiView.mal_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_bilgisi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.mal_tutari field.
DBSetProp('MaasHacizMuzekkeresiView.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_tutari', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.mal_tutari', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tutari')
DBSetProp('MaasHacizMuzekkeresiView.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutarý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutarý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.mal_tutari","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the MaasHacizMuzekkeresiView.muhatap_adi field.
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.muhatap_adresi field.
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adresi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adresi')
DBSetProp('MaasHacizMuzekkeresiView.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.muhatap_adresi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.haciz_tarihi field.
DBSetProp('MaasHacizMuzekkeresiView.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.haciz_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Haciz_Tarihi')
DBSetProp('MaasHacizMuzekkeresiView.haciz_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.haciz_tarihi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.maas_muvafakat_miktari field.
DBSetProp('MaasHacizMuzekkeresiView.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.maas_muvafakat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Maas_Muvafakat_Miktari')
DBSetProp('MaasHacizMuzekkeresiView.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat Miktarý                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat Miktarý                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.vekil_adi field.
DBSetProp('MaasHacizMuzekkeresiView.vekil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.vekil_adi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.vekil_adi', 'Field', 'UpdateName', 'Vekil_Adi')
DBSetProp('MaasHacizMuzekkeresiView.vekil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.vekil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECDESCRIPT","Vekil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECFRMCAPTN","Vekil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECDLGCAPTN","Vekil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECGRDCAPTN","Vekil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECRPTCAPTN","Vekil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFEMTOOLTIP","Vekil Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFEMSTATUSTXT","Vekil Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.vekil_adi","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.pul_masrafi field.
DBSetProp('MaasHacizMuzekkeresiView.pul_masrafi', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.pul_masrafi', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.pul_masrafi', 'Field', 'UpdateName', 'pul_masrafi')
DBSetProp('MaasHacizMuzekkeresiView.pul_masrafi', 'Field', 'DataType', "N(8,2)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.pul_masrafi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECDESCRIPT","Pul Masrafi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECFRMCAPTN","Pul Masrafý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECDLGCAPTN","Pul Masrafý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECGRDCAPTN","Pul Masrafý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECRPTCAPTN","Pul Masrafý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFEMTOOLTIP","Pul Masrafý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFEMSTATUSTXT","Pul Masrafý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.pul_masrafi","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.grapor_sablonu field.
DBSetProp('MaasHacizMuzekkeresiView.grapor_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.grapor_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.grapor_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MaasHacizMuzekkeresiView.grapor_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.grapor_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECDESCRIPT","Grapor Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECFRMCAPTN","Grapor Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECDLGCAPTN","Grapor Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECGRDCAPTN","Grapor Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECRPTCAPTN","Grapor Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFEMTOOLTIP","Grapor Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFEMSTATUSTXT","Grapor Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.grapor_sablonu","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.gzarf_sablonu field.
DBSetProp('MaasHacizMuzekkeresiView.gzarf_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.gzarf_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.gzarf_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MaasHacizMuzekkeresiView.gzarf_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.gzarf_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECDESCRIPT","Gzarf Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECFRMCAPTN","Gzarf Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECDLGCAPTN","Gzarf Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECGRDCAPTN","Gzarf Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECRPTCAPTN","Gzarf Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFEMTOOLTIP","Gzarf Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFEMSTATUSTXT","Gzarf Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.gzarf_sablonu","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the MaasHacizMuzekkeresiView.barkod field.
DBSetProp('MaasHacizMuzekkeresiView.barkod', 'Field', 'KeyField', .F.)
DBSetProp('MaasHacizMuzekkeresiView.barkod', 'Field', 'Updatable', .F.)
DBSetProp('MaasHacizMuzekkeresiView.barkod', 'Field', 'UpdateName', 'barkod')
DBSetProp('MaasHacizMuzekkeresiView.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for MaasHacizMuzekkeresiView.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MaasHacizMuzekkeresiView.barkod","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
