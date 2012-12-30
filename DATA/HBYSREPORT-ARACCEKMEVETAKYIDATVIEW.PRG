***************** Begin View Definition ARACCEKMEVETAKYIDATVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "ARACCEKMEVETAKYIDATVIEW" ; 
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
		Icradosya.Icra_Dosya_No AS grapor_sablonu,;
		Icradosya.Icra_Dosya_No AS gzarf_sablonu,;
		CAST(SPACE(13) AS CHARACTER(13)) AS barkod;
	FROM {oj{oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		INNER JOIN dbo.Muamele Muamele;
			ON Icradosya.IcraDosya_Id = Muamele.Muamele_Fk;
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk};
		LEFT OUTER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id}

DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'UpdateType', 1)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'WhereType', 3)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'Prepared', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'FetchSize', -1)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'C';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C';vp_Borclu_Adi,'C';vp_Muamele_Id,'C';vp_Muamele_Tarihi,'D';vp_Muzekkere_Adi,'C'")
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'Comment', "")
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ARACCEKMEVETAKYIDATVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ARACCEKMEVETAKYIDATVIEW
	GoExplorer.odbcx.Validate("ARACCEKMEVETAKYIDATVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW","VIEW",;
		"VFECDESCRIPT","AracCekmeVeTakyidatView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Buro_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Icra_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borclu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Borclu.Borclu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Borclu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFENVPSIZE",8) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muamele_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muzekkere_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muzekkere Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muzekkere_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ARACCEKMEVETAKYIDATVIEW
*** Props for the ARACCEKMEVETAKYIDATVIEW.icradosya_id field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.buro_dosya_no field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.icra_dosya_no field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.dosyano field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosyano', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosyano', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosyano', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosyano', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.dosyano
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECDESCRIPT","Dosyano Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECFRMCAPTN","Dosyano") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECDLGCAPTN","Dosyano") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECGRDCAPTN","Dosyano") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECRPTCAPTN","Dosyano") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFEMTOOLTIP","Dosyano") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFEMSTATUSTXT","Dosyano") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosyano","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.muvekkil_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.dosya_tipi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borc_tipi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borc_evragi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_evragi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borc Evragi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borc Evragi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.icra_dairesi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dairesi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dairesi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.icra_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.icra_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECDESCRIPT","Icra Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECFRMCAPTN","Icra Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECDLGCAPTN","Icra Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECGRDCAPTN","Icra Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECRPTCAPTN","Icra Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFEMTOOLTIP","Icra Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFEMSTATUSTXT","Icra Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.icra_dairesi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the ARACCEKMEVETAKYIDATVIEW.adliye_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacaklý Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacaklý Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacaklý Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacaklý Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacaklý Bilgisi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacaklý Bilgisi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.asil_alacak field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.asil_alacak', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.asil_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asýl Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asýl Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asýl Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asýl Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asýl Alacak                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asýl Alacak                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.asil_alacak","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.takip_alacagi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.takip_alacagi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.takip_alacagi', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacaðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacaðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacaðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacaðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacaðý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacaðý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.takip_alacagi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.toplam_alacak field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.toplam_alacak', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.toplam_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.toplam_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.toplam_alacak","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.kalan_alacak field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.kalan_alacak', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.kalan_alacak', 'Field', 'DataType', "N(12,2)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.tckimlik_no field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECDESCRIPT","Borclu Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Borçlu Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Borçlu Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Borçlu Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Borçlu Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Borçlu Tckimlik No                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Borçlu Tckimlik No                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_tckimlik_no","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Borclu Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Borçlu Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Borçlu Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Borçlu Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Borçlu Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Borçlu Ticaret Sicil No                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Borçlu Ticaret Sicil No                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_adresi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_adresi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adresi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adresi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_adresi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.adres_statusu field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adres_statusu', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adres_statusu', 'Field', 'UpdateName', 'dbo.Rehber.Adres_Statusu')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.adres_statusu","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Tarihi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Borclu Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Borçlu Doðum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Borçlu Doðum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Borçlu Doðum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Borçlu Doðum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Borçlu Doðum Tarihi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Doðum Tarihi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.borclu_dogum_tarihi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.muamele_id field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_id', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Id')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.muamele_tarihi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muamele_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muamele_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.muzekkere_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muzekkere_adi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Muzekkere Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Muzekkere Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Muzekkere Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Muzekkere Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Muzekkere Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Muzekkere Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muzekkere_adi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.mal_tipi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tipi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tipi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.mal_bilgisi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Bilgisi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.mal_tutari field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tutari', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tutari', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tutari')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutarý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutarý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.mal_tutari","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the ARACCEKMEVETAKYIDATVIEW.muhatap_adi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.muhatap_adresi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adresi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adresi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.haciz_tarihi field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.haciz_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Haciz_Tarihi')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.haciz_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Maas_Muvafakat_Miktari')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat Miktarý                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat Miktarý                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.grapor_sablonu field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.grapor_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.grapor_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.grapor_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.grapor_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.grapor_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECDESCRIPT","Grapor Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECFRMCAPTN","Grapor Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECDLGCAPTN","Grapor Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECGRDCAPTN","Grapor Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECRPTCAPTN","Grapor Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFEMTOOLTIP","Grapor Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFEMSTATUSTXT","Grapor Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.grapor_sablonu","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECDESCRIPT","Gzarf Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECFRMCAPTN","Gzarf Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECDLGCAPTN","Gzarf Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECGRDCAPTN","Gzarf Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECRPTCAPTN","Gzarf Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFEMTOOLTIP","Gzarf Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFEMSTATUSTXT","Gzarf Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.gzarf_sablonu","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the ARACCEKMEVETAKYIDATVIEW.barkod field.
DBSetProp('ARACCEKMEVETAKYIDATVIEW.barkod', 'Field', 'KeyField', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.barkod', 'Field', 'Updatable', .F.)
DBSetProp('ARACCEKMEVETAKYIDATVIEW.barkod', 'Field', 'UpdateName', 'barkod')
DBSetProp('ARACCEKMEVETAKYIDATVIEW.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for ARACCEKMEVETAKYIDATVIEW.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!ARACCEKMEVETAKYIDATVIEW.barkod","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
