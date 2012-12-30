***************** Begin View Definition ILETISIMVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "ILETISIMVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Iletisim.Iletisim_Id,;
		Iletisim.Iletisim_Fk,;
		Iletisim.Adi_Soyadi,;
		Iletisim.Gorevi,;
		Iletisim.Yakinligi,;
		Iletisim.Telefon_Tipi,;
		Iletisim.Ulke_Kodu,;
		Iletisim.Telefon_No,;
		Iletisim.Dahili_No,;
		Iletisim.Telefon_Statusu,;
		Iletisim.e_Posta,;
		Iletisim.Notlar;
	FROM dbo.Iletisim Iletisim

DBSetProp('ILETISIMVIEW', 'View', 'UpdateType', 1)
DBSetProp('ILETISIMVIEW', 'View', 'WhereType', 3)
DBSetProp('ILETISIMVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ILETISIMVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ILETISIMVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ILETISIMVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ILETISIMVIEW', 'View', 'Tables', 'dbo.Iletisim')
DBSetProp('ILETISIMVIEW', 'View', 'Prepared', .F.)
DBSetProp('ILETISIMVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('ILETISIMVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ILETISIMVIEW', 'View', 'FetchSize', -1)
DBSetProp('ILETISIMVIEW', 'View', 'ParameterList', "vp_Iletisim_Fk,'C'")
DBSetProp('ILETISIMVIEW', 'View', 'Comment', "")
DBSetProp('ILETISIMVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ILETISIMVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ILETISIMVIEW
	GoExplorer.odbcx.Validate("ILETISIMVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW","VIEW",;
		"VFECDESCRIPT","Iletisimview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Iletisim_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Iletisim Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECFRMCAPTN","Iletisim Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECDLGCAPTN","Iletisim Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFEMTOOLTIP","Iletisim Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Iletisim Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.vp_Iletisim_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ILETISIMVIEW
*** Props for the ILETISIMVIEW.iletisim_id field.
DBSetProp('ILETISIMVIEW.iletisim_id', 'Field', 'KeyField', .T.)
DBSetProp('ILETISIMVIEW.iletisim_id', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.iletisim_id', 'Field', 'UpdateName', 'dbo.Iletisim.Iletisim_Id')
DBSetProp('ILETISIMVIEW.iletisim_id', 'Field', 'DataType', "C(36)")
DBSetProp('ILETISIMVIEW.iletisim_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ILETISIMVIEW.iletisim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECDESCRIPT","Iletisim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECFRMCAPTN","Ýletiþim ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECDLGCAPTN","Ýletiþim ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECGRDCAPTN","Ýletiþim ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECRPTCAPTN","Ýletiþim ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMTOOLTIP","Ýletiþim ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMSTATUSTXT","Ýletiþim ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.iletisim_fk field.
DBSetProp('ILETISIMVIEW.iletisim_fk', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.iletisim_fk', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.iletisim_fk', 'Field', 'UpdateName', 'dbo.Iletisim.Iletisim_Fk')
DBSetProp('ILETISIMVIEW.iletisim_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ILETISIMVIEW.iletisim_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECDESCRIPT","Iletisim Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECFRMCAPTN","Ýletiþim FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECDLGCAPTN","Ýletiþim FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECGRDCAPTN","Ýletiþim FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECRPTCAPTN","Ýletiþim FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMTOOLTIP","Ýletiþim FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMSTATUSTXT","Ýletiþim FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.iletisim_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.adi_soyadi field.
DBSetProp('ILETISIMVIEW.adi_soyadi', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.adi_soyadi', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.adi_soyadi', 'Field', 'UpdateName', 'dbo.Iletisim.Adi_Soyadi')
DBSetProp('ILETISIMVIEW.adi_soyadi', 'Field', 'DataType', "C(50)")
DBSetProp('ILETISIMVIEW.adi_soyadi', 'Field', 'DefaultValue', "'Kendisi'")
*** DBCX Field Properties for ILETISIMVIEW.adi_soyadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECDESCRIPT","Adi Soyadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECFRMCAPTN","Telefon Sahibi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECDLGCAPTN","Telefon Sahibi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECGRDCAPTN","Telefon Sahibi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECRPTCAPTN","Telefon Sahibi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMTOOLTIP","Telefon Sahibi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMSTATUSTXT","Telefon Sahibi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.adi_soyadi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.gorevi field.
DBSetProp('ILETISIMVIEW.gorevi', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.gorevi', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.gorevi', 'Field', 'UpdateName', 'dbo.Iletisim.Gorevi')
DBSetProp('ILETISIMVIEW.gorevi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ILETISIMVIEW.gorevi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECDESCRIPT","Gorevi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECFRMCAPTN","Görevi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECDLGCAPTN","Görevi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECGRDCAPTN","Görevi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECRPTCAPTN","Görevi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFEMTOOLTIP","Görevi                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFEMSTATUSTXT","Görevi                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.gorevi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.yakinligi field.
DBSetProp('ILETISIMVIEW.yakinligi', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.yakinligi', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.yakinligi', 'Field', 'UpdateName', 'dbo.Iletisim.Yakinligi')
DBSetProp('ILETISIMVIEW.yakinligi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ILETISIMVIEW.yakinligi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECDESCRIPT","Yakinligi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECFRMCAPTN","Yakýnlýðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECDLGCAPTN","Yakýnlýðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECGRDCAPTN","Yakýnlýðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECRPTCAPTN","Yakýnlýðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFEMTOOLTIP","Yakýnlýðý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFEMSTATUSTXT","Yakýnlýðý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.yakinligi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.telefon_tipi field.
DBSetProp('ILETISIMVIEW.telefon_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.telefon_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.telefon_tipi', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_Tipi')
DBSetProp('ILETISIMVIEW.telefon_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILETISIMVIEW.telefon_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECDESCRIPT","Telefon Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECFRMCAPTN","Telefon Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECDLGCAPTN","Telefon Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECGRDCAPTN","Telefon Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECRPTCAPTN","Telefon Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMTOOLTIP","Telefon Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMSTATUSTXT","Telefon Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!telefontipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLUTAG","telefon_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMLUFIELDS","telefon_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMLUUPDTEXP","Telefontipilookupview.telefon_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.ulke_kodu field.
DBSetProp('ILETISIMVIEW.ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.ulke_kodu', 'Field', 'UpdateName', 'dbo.Iletisim.Ulke_Kodu')
DBSetProp('ILETISIMVIEW.ulke_kodu', 'Field', 'DataType', "C(3)")
DBSetProp('ILETISIMVIEW.ulke_kodu', 'Field', 'DefaultValue', "'90'")
*** DBCX Field Properties for ILETISIMVIEW.ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECDESCRIPT","Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Ülke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Ülke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Ülke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Ülke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Ülke Kodu                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Ülke Kodu                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.ulke_kodu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.telefon_no field.
DBSetProp('ILETISIMVIEW.telefon_no', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.telefon_no', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.telefon_no', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_No')
DBSetProp('ILETISIMVIEW.telefon_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILETISIMVIEW.telefon_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECDESCRIPT","Telefon No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECFRMCAPTN","Telefon No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECDLGCAPTN","Telefon No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECGRDCAPTN","Telefon No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECRPTCAPTN","Telefon No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMTOOLTIP","Telefon No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMSTATUSTXT","Telefon No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ILETISIMVIEW.dahili_no field.
DBSetProp('ILETISIMVIEW.dahili_no', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.dahili_no', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.dahili_no', 'Field', 'UpdateName', 'dbo.Iletisim.Dahili_No')
DBSetProp('ILETISIMVIEW.dahili_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for ILETISIMVIEW.dahili_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECDESCRIPT","Dahili No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECFRMCAPTN","Dahili No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECDLGCAPTN","Dahili No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECGRDCAPTN","Dahili No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECRPTCAPTN","Dahili No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFEMTOOLTIP","Dahili No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFEMSTATUSTXT","Dahili No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.dahili_no","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.telefon_statusu field.
DBSetProp('ILETISIMVIEW.telefon_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.telefon_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.telefon_statusu', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_Statusu')
DBSetProp('ILETISIMVIEW.telefon_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILETISIMVIEW.telefon_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECDESCRIPT","Telefon Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECFRMCAPTN","Telefon Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECDLGCAPTN","Telefon Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECGRDCAPTN","Telefon Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECRPTCAPTN","Telefon Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMTOOLTIP","Telefon Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMSTATUSTXT","Telefon Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!telefonstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLUTAG","telefon_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMLUFIELDS","telefon_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMLUUPDTEXP","Telefonstatusulookupview.telefon_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.e_posta field.
DBSetProp('ILETISIMVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Iletisim.e_Posta')
DBSetProp('ILETISIMVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ILETISIMVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","ePosta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","ePosta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","ePosta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","ePosta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","ePosta                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","ePosta                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.e_posta","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the ILETISIMVIEW.notlar field.
DBSetProp('ILETISIMVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('ILETISIMVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('ILETISIMVIEW.notlar', 'Field', 'UpdateName', 'dbo.Iletisim.Notlar')
DBSetProp('ILETISIMVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for ILETISIMVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILETISIMVIEW.notlar","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
