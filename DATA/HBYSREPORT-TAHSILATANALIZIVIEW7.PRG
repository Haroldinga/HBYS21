***************** Begin View Definition TAHSILATANALIZIVIEW ***************


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



CREATE SQL VIEW "TAHSILATANALIZIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Gelis_Tarihi,;
		Tahsilat.Borclu_Adi,;
		Tahsilat.Tahsilat_Tarihi,;
		Tahsilat.Tahsilat_Tipi,;
		Icradosya.Muvekkil_Adi,;
		Tahsilat.Tahsilat_Miktari,;
		Tahsilat.Tahsilat_Statusu,;
		Tahsilat.Personel_Adi,;
		Personel.Is_Unvani,;
		IcraDosya.Hitam_Tarihi,;
		IcraDosya.Dosya_Statusu,;
		IcraDosya.Itiraz_Edildi,;
		IcraDosya.Bila_Tarihi,;
		IcraDosya.Kesinlesme_Tarihi;
	FROM {oj dbo.Tahsilat Tahsilat;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Tahsilat.Tahsilat_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.Personel Personel;
			ON Tahsilat.Personel_Id = Personel.Personel_Id};
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Icradosya.Muvekkil_Id = Muvekkil.Muvekkil_Id

DBSetProp('TAHSILATANALIZIVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'WhereType', 3)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Tables', 'dbo.IcraDosya,dbo.Tahsilat')
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'ParameterList', "vp_Baslangic_Tarihi,'D';vp_Bitis_Tarihi,'D';vp_Icra_Dosya_No,'C';vp_Buro_Dosya_No,'C';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Takip_Tipi,'C';"+;
"vp_Borc_Tipi,'C';vp_IcraMudurlugu_Id,'C';vp_Personel_Adi,'C';vp_Is_Unvani,'C';vp_TarihGrupla,'I';vp_MuvekkilGrupla,'L';vp_BorcTipiGrupla,'L';vp_IsUnvaniGrupla,'L';vp_Tahsilat_Tipi,'C';vp_Tahsilat_Statusu,'C';vp_ilk_Gelis_Tarihi,'D';vp_Son_Gelis_Tarihi,'D'")
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Comment', "")
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for TAHSILATANALIZIVIEW
	GoExplorer.odbcx.Validate("TAHSILATANALIZIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW","VIEW",;
		"VFECDESCRIPT","Tahsilatanaliziview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Baslangic_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Baslangic Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Tarihi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Tarihi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Bitis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Bitis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Son Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Son Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Son Tahsilat Tarihi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Son Tahsilat Tarihi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMDEFAULT","date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","LIBS\ADATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","LIBS\ADATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Buro_dosya_no) IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTAG","muvekkil_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi, borc_tipi                                                                         ") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Takip_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLUTAG","icramudurlugu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.IcraMudurlugu_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECLUTAG","personel_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Personellookupview.personel_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Personel_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Is_Unvani
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDESCRIPT","Vp Is Unvani View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECFRMCAPTN","Ýþ Unvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDLGCAPTN","Ýþ Unvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMTOOLTIP","Ýþ Unvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMSTATUSTXT","Ýþ Unvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMCOMPARETO","Personel.Is_Unvani") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_TarihGrupla
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECDESCRIPT","Vp Tarihgrupla View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECFRMCAPTN","Tarihgrupla") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECDLGCAPTN","Tarihgrupla") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMTOOLTIP","Tarihgrupla") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMSTATUSTXT","Tarihgrupla") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMDEFAULT","1") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGrupla","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_MuvekkilGrupla
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkilgrupla View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECFRMCAPTN","Muvekkilgrupla") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECDLGCAPTN","Muvekkilgrupla") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFEMTOOLTIP","Muvekkilgrupla") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFEMSTATUSTXT","Muvekkilgrupla") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilGrupla","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_BorcTipiGrupla
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECDESCRIPT","Vp Borctipigrupla View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECFRMCAPTN","Borctipigrupla") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECDLGCAPTN","Borctipigrupla") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFEMTOOLTIP","Borctipigrupla") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFEMSTATUSTXT","Borctipigrupla") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiGrupla","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_IsUnvaniGrupla
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECDESCRIPT","Vp Isunvanigrupla View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECFRMCAPTN","Isunvanigrupla") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECDLGCAPTN","Isunvanigrupla") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFEMTOOLTIP","Isunvanigrupla") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFEMSTATUSTXT","Isunvanigrupla") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniGrupla","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!tahsilattipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECLUTAG","tahsilat_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMLUFIELDS","tahsilat_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Tahsilattipilookupview.tahsilat_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Statusu
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Statusu View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Statüsü                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Statüsü                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECLUTABLE","hbysdata!tahsilatstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECLUTAG","tahsilat_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMLUFIELDS","tahsilat_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMLUUPDTEXP","Tahsilatstatusulookupview.tahsilat_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Statusu") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Tahsilat_Statusu","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_ilk_Gelis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Ilk Gelis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_ilk_Gelis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Son_Gelis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Son Gelis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Son Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Son Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Son Geliþ Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Son Geliþ Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMDEFAULT","Date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFECOPERATOR","<") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Son_Gelis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.burodosyno
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","burodosyno","BURO_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.burodosyno","INDEX",;
		"VFECDESCRIPT","Burodosyno Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.burodosyno","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.burodosyno","INDEX",;
		"VFECTAGCAPTN","Burodosyno") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.burodosyno","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.dosyatipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","dosyatipi","DOSYA_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.dosyatipi","INDEX",;
		"VFECDESCRIPT","Dosyatipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.dosyatipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.dosyatipi","INDEX",;
		"VFECTAGCAPTN","Dosyatipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.dosyatipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.borctipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","borctipi","BORC_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.borctipi","INDEX",;
		"VFECDESCRIPT","Borctipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.borctipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.borctipi","INDEX",;
		"VFECTAGCAPTN","Borctipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.borctipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.gelistarih
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","gelistarih","GELIS_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.gelistarih","INDEX",;
		"VFECDESCRIPT","Gelistarih Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.gelistarih","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.gelistarih","INDEX",;
		"VFECTAGCAPTN","Gelistarih") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.gelistarih","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
ENDIF 

***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.tahstarih
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","tahstarih","TAHSILAT_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstarih","INDEX",;
		"VFECDESCRIPT","Tahstarih Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstarih","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstarih","INDEX",;
		"VFECTAGCAPTN","Tahstarih") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstarih","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.tahstipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","tahstipi","TAHSILAT_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstipi","INDEX",;
		"VFECDESCRIPT","Tahstipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstipi","INDEX",;
		"VFECTAGCAPTN","Tahstipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahstipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!tahsilatanaliziview.tahsstatu
	GoExplorer.odbcx.AddViewIndex("hbysreport!tahsilatanaliziview","tahsstatu","TAHSILAT_STATUSU","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahsstatu","INDEX",;
		"VFECDESCRIPT","Tahsstatu Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahsstatu","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahsstatu","INDEX",;
		"VFECTAGCAPTN","Tahsstatu") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!tahsilatanaliziview.tahsstatu","INDEX",;
		"VFENDISPORDER",1) &&Display Order

*!* Field Level Properties for TAHSILATANALIZIVIEW
*** Props for the TAHSILATANALIZIVIEW.icradosya_id field.
DBSetProp('TAHSILATANALIZIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('TAHSILATANALIZIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('TAHSILATANALIZIVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","IcraDosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","IcraDosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","IcraDosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","IcraDosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","IcraDosya ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","IcraDosya ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.buro_dosya_no field.
DBSetProp('TAHSILATANALIZIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('TAHSILATANALIZIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECQFINDTAG","burodosyno") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.icra_dosya_no field.
DBSetProp('TAHSILATANALIZIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TAHSILATANALIZIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.dosya_tipi field.
DBSetProp('TAHSILATANALIZIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('TAHSILATANALIZIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECQFINDTAG","dosyatipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.takip_tipi field.
DBSetProp('TAHSILATANALIZIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('TAHSILATANALIZIVIEW.takip_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.borc_tipi field.
DBSetProp('TAHSILATANALIZIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('TAHSILATANALIZIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFECQFINDTAG","borctipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.icramudurlugu_adi field.
DBSetProp('TAHSILATANALIZIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'IcraMudurlugu_Adi')
DBSetProp('TAHSILATANALIZIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.gelis_tarihi field.
DBSetProp('TAHSILATANALIZIVIEW.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.gelis_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.gelis_tarihi', 'Field', 'UpdateName', 'Gelis_Tarihi')
DBSetProp('TAHSILATANALIZIVIEW.gelis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECQFINDTAG","gelistarih") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.borclu_adi field.
DBSetProp('TAHSILATANALIZIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Tahsilat.Borclu_Adi')
DBSetProp('TAHSILATANALIZIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.tahsilat_tarihi field.
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tarihi')
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tarihi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.tahsilat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFECQFINDTAG","tahstarih") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.tahsilat_tipi field.
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tipi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tipi')
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.tahsilat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFECQFINDTAG","tahstipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tipi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.muvekkil_adi field.
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.tahsilat_miktari field.
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_miktari', 'Field', 'DataType', "N(12)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.tahsilat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECDESCRIPT","Tahsilat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.tahsilat_statusu field.
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_statusu', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_statusu', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Statusu')
DBSetProp('TAHSILATANALIZIVIEW.tahsilat_statusu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.tahsilat_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECDESCRIPT","Tahsilat Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECFRMCAPTN","Tahsilat Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECDLGCAPTN","Tahsilat Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECGRDCAPTN","Tahsilat Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECRPTCAPTN","Tahsilat Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFEMTOOLTIP","Tahsilat Statüsü                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Statüsü                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFECQFINDTAG","tahsstatu") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_statusu","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.personel_adi field.
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Tahsilat.Personel_Adi')
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.is_unvani field.
DBSetProp('TAHSILATANALIZIVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.is_unvani', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('TAHSILATANALIZIVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
