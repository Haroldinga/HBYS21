***************** Begin View Definition TAKIPTALEBIVIEW ***************


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



CREATE SQL VIEW "TAKIPTALEBIVIEW" ; 
 REMOTE CONNECT "HBYSReportConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Takip_Yolu,;
		Icramudurlugu.IMNo,;
		Icradosya.Ihtarname_Tarihi,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Icradosyahesabi.Takip_Alacak_Hesabi,;
		CAST(STR(Icradosyahesabi.temerrut_faizi_orani,5,2) AS CHARACTER(5)) AS temerrut_faizi_orani,;
		Icradosyahesabi.Temerrut_Faizi_Aciklamasi,;
		Icradosya.Icra_Dosya_No AS grapor_sablonu,;
		Icradosya.Icra_Dosya_No AS gzarf_sablonu,;
		CAST(SPACE(13) AS CHARACTER(13)) AS barkod;
	FROM {oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		LEFT OUTER JOIN dbo.IcraMudurlugu Icramudurlugu;
			ON Icradosya.IcraMudurlugu_Id = Icramudurlugu.IcraMudurlugu_Id}

DBSetProp('TAKIPTALEBIVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'WhereType', 3)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'Tables', 'dbo.IcraDosya,dbo.IcraDosyaHesabi')
DBSetProp('TAKIPTALEBIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'V';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C'")
DBSetProp('TAKIPTALEBIVIEW', 'View', 'Comment', "")
DBSetProp('TAKIPTALEBIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAKIPTALEBIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for TAKIPTALEBIVIEW
	GoExplorer.odbcx.Validate("TAKIPTALEBIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW","VIEW",;
		"VFECDESCRIPT","Takiptalebiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","Rtrim(IcraDosya.Icra_Dosya_NO) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TAKIPTALEBIVIEW
*** Props for the TAKIPTALEBIVIEW.icradosya_id field.
DBSetProp('TAKIPTALEBIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('TAKIPTALEBIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('TAKIPTALEBIVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('TAKIPTALEBIVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.buro_dosya_no field.
DBSetProp('TAKIPTALEBIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('TAKIPTALEBIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for TAKIPTALEBIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.icra_dosya_no field.
DBSetProp('TAKIPTALEBIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TAKIPTALEBIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.muvekkil_adi field.
DBSetProp('TAKIPTALEBIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('TAKIPTALEBIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.dosya_tipi field.
DBSetProp('TAKIPTALEBIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('TAKIPTALEBIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.borc_tipi field.
DBSetProp('TAKIPTALEBIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('TAKIPTALEBIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.borc_evragi field.
DBSetProp('TAKIPTALEBIVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.borc_evragi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('TAKIPTALEBIVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borç Evraðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borç Evraðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borç Evraðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borç Evraðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borç Evraðý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borç Evraðý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.icramudurlugu_adi field.
DBSetProp('TAKIPTALEBIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('TAKIPTALEBIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.adliye_adi field.
DBSetProp('TAKIPTALEBIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('TAKIPTALEBIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.takip_yolu field.
DBSetProp('TAKIPTALEBIVIEW.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPTALEBIVIEW.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('TAKIPTALEBIVIEW.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_yolu","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.imno field.
DBSetProp('TAKIPTALEBIVIEW.imno', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.imno', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.imno', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IMNo')
DBSetProp('TAKIPTALEBIVIEW.imno', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.imno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECDESCRIPT","Imno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECFRMCAPTN","Imno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECDLGCAPTN","Imno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECGRDCAPTN","Imno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECRPTCAPTN","Imno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFEMTOOLTIP","Imno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFEMSTATUSTXT","Imno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.imno","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.ihtarname_tarihi field.
DBSetProp('TAKIPTALEBIVIEW.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.ihtarname_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('TAKIPTALEBIVIEW.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TAKIPTALEBIVIEW.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýhtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýhtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýhtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýhtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýhtarname Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýhtarname Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.risk_yoneticisi_adi field.
DBSetProp('TAKIPTALEBIVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('TAKIPTALEBIVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.alacakli_bilgisi field.
DBSetProp('TAKIPTALEBIVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.alacakli_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('TAKIPTALEBIVIEW.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TAKIPTALEBIVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacaklý Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacaklý Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacaklý Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacaklý Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacaklý Bilgisi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacaklý Bilgisi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.borclu_bilgisi field.
DBSetProp('TAKIPTALEBIVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.borclu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('TAKIPTALEBIVIEW.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TAKIPTALEBIVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.vekil_bilgisi field.
DBSetProp('TAKIPTALEBIVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.vekil_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPTALEBIVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('TAKIPTALEBIVIEW.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TAKIPTALEBIVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the TAKIPTALEBIVIEW.takip_alacak_hesabi field.
DBSetProp('TAKIPTALEBIVIEW.takip_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.takip_alacak_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPTALEBIVIEW.takip_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacak_Hesabi')
DBSetProp('TAKIPTALEBIVIEW.takip_alacak_hesabi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TAKIPTALEBIVIEW.takip_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Takip Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Takip Alacak Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Takip Alacak Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Takip Alacak Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Takip Alacak Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Takip Alacak Hesabý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacak Hesabý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.temerrut_faizi_orani field.
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_orani', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_orani', 'Field', 'UpdateName', 'temerrut_faizi_orani')
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_orani', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.temerrut_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi Oraný                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi Oraný                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi field.
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Aciklamasi')
DBSetProp('TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Açýklamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Açýklamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Açýklamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Açýklamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Açýklamasý                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Açýklamasý                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.grapor_sablonu field.
DBSetProp('TAKIPTALEBIVIEW.grapor_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.grapor_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.grapor_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TAKIPTALEBIVIEW.grapor_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for TAKIPTALEBIVIEW.grapor_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECDESCRIPT","Grapor Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECFRMCAPTN","Grapor Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECDLGCAPTN","Grapor Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECGRDCAPTN","Grapor Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECRPTCAPTN","Grapor Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFEMTOOLTIP","Grapor Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFEMSTATUSTXT","Grapor Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFECOBJTYPE","ioleboundcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.grapor_sablonu","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.gzarf_sablonu field.
DBSetProp('TAKIPTALEBIVIEW.gzarf_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.gzarf_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.gzarf_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TAKIPTALEBIVIEW.gzarf_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for TAKIPTALEBIVIEW.gzarf_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECDESCRIPT","Gzarf Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECFRMCAPTN","Gzarf Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECDLGCAPTN","Gzarf Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECGRDCAPTN","Gzarf Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECRPTCAPTN","Gzarf Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFEMTOOLTIP","Gzarf Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFEMSTATUSTXT","Gzarf Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFECOBJTYPE","ioleboundcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.gzarf_sablonu","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the TAKIPTALEBIVIEW.barkod field.
DBSetProp('TAKIPTALEBIVIEW.barkod', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTALEBIVIEW.barkod', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTALEBIVIEW.barkod', 'Field', 'UpdateName', 'barkod')
DBSetProp('TAKIPTALEBIVIEW.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for TAKIPTALEBIVIEW.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAKIPTALEBIVIEW.barkod","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
