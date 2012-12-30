***************** Begin View Definition PERSONELTAHSILATIVIEW ***************


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



CREATE SQL VIEW "PERSONELTAHSILATIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Personel.Personel_Adi,;
		Personel.Is_Unvani,;
		Muvekkil.Muvekkil_Adi,;
		Icradosya.Borc_Tipi,;
		Tahsilathedefi.Tahsilat_Hedefi,;
		Tahsilat.Tahsilat_Miktari AS aylik_tahsilat,;
		Tahsilat.Tahsilat_Miktari AS gunluk_tahsilat,;
		Tahsilathedefi.Prim_Hesabi;
	FROM {oj{oj dbo.Tahsilat Tahsilat;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Tahsilat.Tahsilat_Fk = Icradosya.IcraDosya_Id;
		INNER JOIN dbo.Personel Personel;
			ON Tahsilat.Personel_Id = Personel.Personel_Id;
		FULL JOIN dbo.Departman Departman;
			ON Personel.Departman_Adi = Departman.Departman_Adi};
		LEFT OUTER JOIN dbo.TahsilatHedefi Tahsilathedefi;
			ON Departman.Departman_Id = Tahsilathedefi.TahsilatHedefi_Fk};
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Icradosya.Muvekkil_Id = Muvekkil.Muvekkil_Id

DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'UpdateType', 1)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'WhereType', 3)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'Tables', 'dbo.Personel,dbo.Muvekkil,dbo.IcraDosya,dbo.Tahsilat')
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'Prepared', .F.)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'FetchSize', -1)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'ParameterList', "vp_Tahsilat_Tarihi,'D';vp_Is_Unvani,'V';vp_Muvekkil_Id,'C';vp_Borc_Tipi,'V'")
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'Comment', "")
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERSONELTAHSILATIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for PERSONELTAHSILATIVIEW
	GoExplorer.odbcx.Validate("PERSONELTAHSILATIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW","VIEW",;
		"VFECDESCRIPT","Personeltahsilatiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMDEFAULT","Date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Is_Unvani
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDESCRIPT","Vp Is Unvani View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECFRMCAPTN","Is Unvani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDLGCAPTN","Is Unvani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMTOOLTIP","Is Unvani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMSTATUSTXT","Is Unvani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMCOMPARETO","Personel.Is_Unvani") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya_Muvekkil_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for PERSONELTAHSILATIVIEW
*** Props for the PERSONELTAHSILATIVIEW.personel_adi field.
DBSetProp('PERSONELTAHSILATIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('PERSONELTAHSILATIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.is_unvani field.
DBSetProp('PERSONELTAHSILATIVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.is_unvani', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('PERSONELTAHSILATIVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.muvekkil_adi field.
DBSetProp('PERSONELTAHSILATIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('PERSONELTAHSILATIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.borc_tipi field.
DBSetProp('PERSONELTAHSILATIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('PERSONELTAHSILATIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.tahsilat_hedefi field.
DBSetProp('PERSONELTAHSILATIVIEW.tahsilat_hedefi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.tahsilat_hedefi', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.tahsilat_hedefi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Tahsilat_Hedefi')
DBSetProp('PERSONELTAHSILATIVIEW.tahsilat_hedefi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.tahsilat_hedefi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECDESCRIPT","Tahsilat Hedefi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Hedefi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Hedefi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Hedefi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Hedefi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Hedefi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Hedefi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.tahsilat_hedefi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.aylik_tahsilat field.
DBSetProp('PERSONELTAHSILATIVIEW.aylik_tahsilat', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.aylik_tahsilat', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.aylik_tahsilat', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('PERSONELTAHSILATIVIEW.aylik_tahsilat', 'Field', 'DataType', "Y")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.aylik_tahsilat
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECDESCRIPT","Aylik Tahsilat Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECFRMCAPTN","Aylýk Tahsilat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECDLGCAPTN","Aylýk Tahsilat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECGRDCAPTN","Aylýk Tahsilat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECRPTCAPTN","Aylýk Tahsilat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFEMTOOLTIP","Aylýk Tahsilat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFEMSTATUSTXT","Aylýk Tahsilat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.aylik_tahsilat","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.gunluk_tahsilat field.
DBSetProp('PERSONELTAHSILATIVIEW.gunluk_tahsilat', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.gunluk_tahsilat', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.gunluk_tahsilat', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('PERSONELTAHSILATIVIEW.gunluk_tahsilat', 'Field', 'DataType', "Y")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.gunluk_tahsilat
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECDESCRIPT","Gunluk Tahsilat Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECFRMCAPTN","Günlük Tahsilat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECDLGCAPTN","Günlük Tahsilat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECGRDCAPTN","Günlük Tahsilat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECRPTCAPTN","Günlük Tahsilat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFEMTOOLTIP","Günlük Tahsilat                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFEMSTATUSTXT","Günlük Tahsilat                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.gunluk_tahsilat","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the PERSONELTAHSILATIVIEW.prim_hesabi field.
DBSetProp('PERSONELTAHSILATIVIEW.prim_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.prim_hesabi', 'Field', 'Updatable', .F.)
DBSetProp('PERSONELTAHSILATIVIEW.prim_hesabi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Prim_Hesabi')
DBSetProp('PERSONELTAHSILATIVIEW.prim_hesabi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELTAHSILATIVIEW.prim_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECDESCRIPT","Prim Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECFRMCAPTN","Prim Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECDLGCAPTN","Prim Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECGRDCAPTN","Prim Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECRPTCAPTN","Prim Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFEMTOOLTIP","Prim Hesabý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFEMSTATUSTXT","Prim Hesabý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!PERSONELTAHSILATIVIEW.prim_hesabi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
