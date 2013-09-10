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
	AS SELECT Tahsilat.Tahsilat_Tarihi,;
		Muvekkil.Muvekkil_Adi,;
		Icradosya.Borc_Tipi,;
		Personel.Is_Unvani,;
		Personel.Personel_Adi,;
		Tahsilat.Tahsilat_Miktari;
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
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Tables', 'dbo.Muvekkil')
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'ParameterList', "vp_Baslangic_Tarihi,'D';vp_Bitis_Tarihi,'D';vp_Muvekkil_Adi,'C';vp_Borc_Tipi,'C';vp_Is_Unvani,'C';vp_TarihGruplama,'I';vp_MuvekkilSorgula,'L';vp_BorcTipiSorgula,'L';vp_IsUnvaniSorgula,'L'")
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'Comment', "")
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAHSILATANALIZIVIEW', 'View', 'ShareConnection', .T.)
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
		"VFECFRMCAPTN","Baslangýç Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Baslangýç Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Baslangýç Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Baslangic_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Baslangýç Tarihi                                     ") &&Status Bar Text
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
		"VFEMDEFAULT","DATE()-DAY(DATE())+1") &&Default Expression
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
		"VFECFRMCAPTN","Bitiþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Bitiþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Bitiþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Bitiþ Tarihi                                         ") &&Status Bar Text
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
		"VFEMCOMPARETO","Muvekkil.Muvekkil_Adi") &&Compare to Field/Expression
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
 
	*** DBCX View Parameter Properties for vp_TarihGruplama
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECDESCRIPT","Vp Tarihgruplama View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECFRMCAPTN","Tarih Gruplama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECDLGCAPTN","Tarih Gruplama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMTOOLTIP","Tarih Gruplama                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMSTATUSTXT","Tarih Gruplama                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMDEFAULT","1") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_TarihGruplama","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_MuvekkilSorgula
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkilsorgula View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Sorgula") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Sorgula") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Sorgula                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Sorgula                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFEMDEFAULT",".t.") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_MuvekkilSorgula","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_BorcTipiSorgula
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECDESCRIPT","Vp Borctipisorgula View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi Sorgula") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi Sorgula") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi Sorgula                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi Sorgula                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFEMDEFAULT",".t.") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_BorcTipiSorgula","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_IsUnvaniSorgula
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECDESCRIPT","Vp Isunvanisorgula View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECFRMCAPTN","Ýþ Ünvaný Sorgula") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECDLGCAPTN","Ýþ Ünvaný Sorgula") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFEMTOOLTIP","Ýþ Ünvaný Sorgula                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFEMSTATUSTXT","Ýþ Ünvaný Sorgula                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFEMDEFAULT",".t.") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.vp_IsUnvaniSorgula","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for TAHSILATANALIZIVIEW
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
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.tahsilat_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATANALIZIVIEW.muvekkil_adi field.
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
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
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
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
 
*** Props for the TAHSILATANALIZIVIEW.personel_adi field.
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('TAHSILATANALIZIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATANALIZIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TAHSILATANALIZIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adi") &&Status Bar Text
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
 
