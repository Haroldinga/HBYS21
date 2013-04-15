***************** Begin View Definition RAPORLISTESIVIEW ***************


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



CREATE SQL VIEW "RAPORLISTESIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.RaporListesi_Id,;
		Raporlistesi.RaporListesi_Fk,;
		Raporlistesi.Rapor_Adi,;
		Raporlistesi.Rapor_Tipi,;
		Raporlistesi.Talep_Ifadesi,;
		Raporlistesi.Zarf_Adi,;
		Raporlistesi.Baski_Adedi,;
		Raporlistesi.Dokuman_Arsivle,;
		Raporlistesi.Gonderi_Takibi,;
		Raporlistesi.Gonderi_Tipi,;
		Raporlistesi.Barkod_Bas,;
		Raporlistesi.Barkod_Tipi;
	FROM dbo.RaporListesi Raporlistesi

DBSetProp('RAPORLISTESIVIEW', 'View', 'UpdateType', 1)
DBSetProp('RAPORLISTESIVIEW', 'View', 'WhereType', 3)
DBSetProp('RAPORLISTESIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('RAPORLISTESIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('RAPORLISTESIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('RAPORLISTESIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('RAPORLISTESIVIEW', 'View', 'Tables', 'dbo.RaporListesi')
DBSetProp('RAPORLISTESIVIEW', 'View', 'Prepared', .F.)
DBSetProp('RAPORLISTESIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('RAPORLISTESIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RAPORLISTESIVIEW', 'View', 'FetchSize', -1)
DBSetProp('RAPORLISTESIVIEW', 'View', 'ParameterList', "vp_RaporListesi_Fk,'C';vp_Rapor_Adi,'C'")
DBSetProp('RAPORLISTESIVIEW', 'View', 'Comment', "")
DBSetProp('RAPORLISTESIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('RAPORLISTESIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for RAPORLISTESIVIEW
	GoExplorer.odbcx.Validate("RAPORLISTESIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW","VIEW",;
		"VFECDESCRIPT","Raporlistesiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_RaporListesi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Raporlistesi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Raporlistesi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Raporlistesi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFENVPSIZE",16) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Raporlistesi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Raporlistesi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_RaporListesi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Rapor_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Rapor Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECFRMCAPTN","Rapor Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECDLGCAPTN","Rapor Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFEMTOOLTIP","Rapor Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Rapor Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.vp_Rapor_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for RAPORLISTESIVIEW
*** Props for the RAPORLISTESIVIEW.raporlistesi_id field.
DBSetProp('RAPORLISTESIVIEW.raporlistesi_id', 'Field', 'KeyField', .T.)
DBSetProp('RAPORLISTESIVIEW.raporlistesi_id', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.raporlistesi_id', 'Field', 'UpdateName', 'dbo.RaporListesi.RaporListesi_Id')
DBSetProp('RAPORLISTESIVIEW.raporlistesi_id', 'Field', 'DataType', "C(36)")
DBSetProp('RAPORLISTESIVIEW.raporlistesi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for RAPORLISTESIVIEW.raporlistesi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECDESCRIPT","Raporlistesi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECFRMCAPTN","RaporListesi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECDLGCAPTN","RaporListesi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECGRDCAPTN","RaporListesi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECRPTCAPTN","RaporListesi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFEMTOOLTIP","RaporListesi ID                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFEMSTATUSTXT","RaporListesi ID                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.raporlistesi_fk field.
DBSetProp('RAPORLISTESIVIEW.raporlistesi_fk', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.raporlistesi_fk', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.raporlistesi_fk', 'Field', 'UpdateName', 'dbo.RaporListesi.RaporListesi_Fk')
DBSetProp('RAPORLISTESIVIEW.raporlistesi_fk', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for RAPORLISTESIVIEW.raporlistesi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECDESCRIPT","Raporlistesi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECFRMCAPTN","RaporListesi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECDLGCAPTN","RaporListesi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECGRDCAPTN","RaporListesi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECRPTCAPTN","RaporListesi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFEMTOOLTIP","RaporListesi FK                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFEMSTATUSTXT","RaporListesi FK                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.raporlistesi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.rapor_adi field.
DBSetProp('RAPORLISTESIVIEW.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.rapor_adi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('RAPORLISTESIVIEW.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for RAPORLISTESIVIEW.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Rapor Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Rapor Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Rapor Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Rapor Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Rapor Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Rapor Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.rapor_tipi field.
DBSetProp('RAPORLISTESIVIEW.rapor_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.rapor_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.rapor_tipi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Tipi')
DBSetProp('RAPORLISTESIVIEW.rapor_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for RAPORLISTESIVIEW.rapor_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECDESCRIPT","Rapor Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECFRMCAPTN","Rapor Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECDLGCAPTN","Rapor Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECGRDCAPTN","Rapor Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECRPTCAPTN","Rapor Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMTOOLTIP","Rapor Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMSTATUSTXT","Rapor Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!raportipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECLUTAG","rapor_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMLUFIELDS","rapor_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMLUUPDTEXP","Raportipilookupview.rapor_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.rapor_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.talep_ifadesi field.
DBSetProp('RAPORLISTESIVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.RaporListesi.Talep_Ifadesi')
DBSetProp('RAPORLISTESIVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for RAPORLISTESIVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.zarf_adi field.
DBSetProp('RAPORLISTESIVIEW.zarf_adi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.zarf_adi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.zarf_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Zarf_Adi')
DBSetProp('RAPORLISTESIVIEW.zarf_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for RAPORLISTESIVIEW.zarf_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECDESCRIPT","Zarf Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECFRMCAPTN","Zarf Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECDLGCAPTN","Zarf Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECGRDCAPTN","Zarf Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECRPTCAPTN","Zarf Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMTOOLTIP","Zarf Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMSTATUSTXT","Zarf Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECLUTABLE","hbysdata!zarftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMLUUPDTEXP","Zarftipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.zarf_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.baski_adedi field.
DBSetProp('RAPORLISTESIVIEW.baski_adedi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.baski_adedi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.baski_adedi', 'Field', 'UpdateName', 'dbo.RaporListesi.Baski_Adedi')
DBSetProp('RAPORLISTESIVIEW.baski_adedi', 'Field', 'DataType', "I")
DBSetProp('RAPORLISTESIVIEW.baski_adedi', 'Field', 'DefaultValue', "1")
*** DBCX Field Properties for RAPORLISTESIVIEW.baski_adedi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECDESCRIPT","Baski Adedi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECFRMCAPTN","Baský Adedi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECDLGCAPTN","Baský Adedi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECGRDCAPTN","Baský Adedi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECRPTCAPTN","Baský Adedi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFEMTOOLTIP","Baský Adedi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFEMSTATUSTXT","Baský Adedi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.baski_adedi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.dokuman_arsivle field.
DBSetProp('RAPORLISTESIVIEW.dokuman_arsivle', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.dokuman_arsivle', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.dokuman_arsivle', 'Field', 'UpdateName', 'dbo.RaporListesi.Dokuman_Arsivle')
DBSetProp('RAPORLISTESIVIEW.dokuman_arsivle', 'Field', 'DataType', "L")
*** DBCX Field Properties for RAPORLISTESIVIEW.dokuman_arsivle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECDESCRIPT","Dokuman Arsivle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECFRMCAPTN","Döküman Arþivle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECDLGCAPTN","Döküman Arþivle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECGRDCAPTN","Döküman Arþivle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECRPTCAPTN","Döküman Arþivle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFEMTOOLTIP","Döküman Arþivle                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFEMSTATUSTXT","Döküman Arþivle                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.dokuman_arsivle","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.gonderi_takibi field.
DBSetProp('RAPORLISTESIVIEW.gonderi_takibi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.gonderi_takibi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.gonderi_takibi', 'Field', 'UpdateName', 'dbo.RaporListesi.Gonderi_Takibi')
DBSetProp('RAPORLISTESIVIEW.gonderi_takibi', 'Field', 'DataType', "L")
*** DBCX Field Properties for RAPORLISTESIVIEW.gonderi_takibi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECDESCRIPT","Gonderi Takibi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECFRMCAPTN","Gönderi Takibi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECDLGCAPTN","Gönderi Takibi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECGRDCAPTN","Gönderi Takibi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECRPTCAPTN","Gönderi Takibi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFEMTOOLTIP","Gönderi Takibi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Takibi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_takibi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.gonderi_tipi field.
DBSetProp('RAPORLISTESIVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.RaporListesi.Gonderi_Tipi')
DBSetProp('RAPORLISTESIVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for RAPORLISTESIVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!gonderitipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECLUTAG","gonderi_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMLUFIELDS","gonderi_tipi, gonderi_kodu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Gonderitipilookupview.gonderi_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.barkod_bas field.
DBSetProp('RAPORLISTESIVIEW.barkod_bas', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.barkod_bas', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.barkod_bas', 'Field', 'UpdateName', 'dbo.RaporListesi.Barkod_Bas')
DBSetProp('RAPORLISTESIVIEW.barkod_bas', 'Field', 'DataType', "L")
*** DBCX Field Properties for RAPORLISTESIVIEW.barkod_bas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECDESCRIPT","Barkod Bas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECFRMCAPTN","Barkod Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECDLGCAPTN","Barkod Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECGRDCAPTN","Barkod Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECRPTCAPTN","Barkod Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFEMTOOLTIP","Barkod Bas") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFEMSTATUSTXT","Barkod Bas") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_bas","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the RAPORLISTESIVIEW.barkod_tipi field.
DBSetProp('RAPORLISTESIVIEW.barkod_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORLISTESIVIEW.barkod_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORLISTESIVIEW.barkod_tipi', 'Field', 'UpdateName', 'dbo.RaporListesi.Barkod_Tipi')
DBSetProp('RAPORLISTESIVIEW.barkod_tipi', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for RAPORLISTESIVIEW.barkod_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECDESCRIPT","Barkod Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECFRMCAPTN","Barkod Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECDLGCAPTN","Barkod Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECGRDCAPTN","Barkod Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECRPTCAPTN","Barkod Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMTOOLTIP","Barkod Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMSTATUSTXT","Barkod Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!barkodtipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECLUTAG","barkod_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMLUFIELDS","barkod_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMLUUPDTEXP","Barkodtipilookupview.barkod_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORLISTESIVIEW.barkod_tipi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
