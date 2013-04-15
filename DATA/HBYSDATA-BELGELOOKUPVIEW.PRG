***************** Begin View Definition BELGELOOKUPVIEW ***************


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



CREATE SQL VIEW "BELGELOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Belge.Belge_Id,;
		Belge.Belge_Fk,;
		Belge.Belge_Adi,;
		Belge.Belge_Tarihi,;
		Belge.Belge_Tipi,;
		Belge.Borca_Esas_Evrak,;
		Belge.Belge_Yonu,;
		Belge.Belge_Formati,;
		Belge.Belge_Konumu,;
		Belge.Aciklama;
	FROM dbo.Belge Belge

DBSetProp('BELGELOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BELGELOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('BELGELOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BELGELOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('BELGELOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BELGELOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BELGELOOKUPVIEW', 'View', 'Tables', 'dbo.Belge')
DBSetProp('BELGELOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BELGELOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BELGELOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BELGELOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('BELGELOOKUPVIEW', 'View', 'ParameterList', "vp_Belge_Fk,'C'")
DBSetProp('BELGELOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BELGELOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BELGELOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BELGELOOKUPVIEW
	GoExplorer.odbcx.Validate("BELGELOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","BelgeLookupView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Belge_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Belge Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECFRMCAPTN","Belge FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECDLGCAPTN","Belge FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMTOOLTIP","Belge FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Belge FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMCOMPARETO","Belge_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!belgelookupview.belgetrh
	GoExplorer.odbcx.AddViewIndex("hbysdata!belgelookupview","belgetrh","BELGE_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgelookupview.belgetrh","INDEX",;
		"VFECDESCRIPT","Belgetrh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgelookupview.belgetrh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgelookupview.belgetrh","INDEX",;
		"VFECTAGCAPTN","Belgetrh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgelookupview.belgetrh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for BELGELOOKUPVIEW
*** Props for the BELGELOOKUPVIEW.belge_id field.
DBSetProp('BELGELOOKUPVIEW.belge_id', 'Field', 'KeyField', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_id', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_id', 'Field', 'UpdateName', 'dbo.Belge.Belge_Id')
DBSetProp('BELGELOOKUPVIEW.belge_id', 'Field', 'DataType', "C(36)")
DBSetProp('BELGELOOKUPVIEW.belge_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECDESCRIPT","Belge Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECFRMCAPTN","Belge ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECDLGCAPTN","Belge ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECGRDCAPTN","Belge ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECRPTCAPTN","Belge ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFEMTOOLTIP","Belge ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFEMSTATUSTXT","Belge ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_fk field.
DBSetProp('BELGELOOKUPVIEW.belge_fk', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_fk', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_fk', 'Field', 'UpdateName', 'dbo.Belge.Belge_Fk')
DBSetProp('BELGELOOKUPVIEW.belge_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECDESCRIPT","Belge Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECFRMCAPTN","Belge FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECDLGCAPTN","Belge FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECGRDCAPTN","Belge FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECRPTCAPTN","Belge FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFEMTOOLTIP","Belge FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFEMSTATUSTXT","Belge FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_adi field.
DBSetProp('BELGELOOKUPVIEW.belge_adi', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_adi', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_adi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Adi')
DBSetProp('BELGELOOKUPVIEW.belge_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECDESCRIPT","Belge Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECFRMCAPTN","Belge Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECDLGCAPTN","Belge Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECGRDCAPTN","Belge Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECRPTCAPTN","Belge Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFEMTOOLTIP","Belge Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFEMSTATUSTXT","Belge Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_tarihi field.
DBSetProp('BELGELOOKUPVIEW.belge_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_tarihi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Tarihi')
DBSetProp('BELGELOOKUPVIEW.belge_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECDESCRIPT","Belge Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECFRMCAPTN","Belge Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECDLGCAPTN","Belge Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECGRDCAPTN","Belge Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECRPTCAPTN","Belge Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFEMTOOLTIP","Belge Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFEMSTATUSTXT","Belge Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFECQFINDTAG","belgetrh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_tipi field.
DBSetProp('BELGELOOKUPVIEW.belge_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_tipi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Tipi')
DBSetProp('BELGELOOKUPVIEW.belge_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECDESCRIPT","Belge Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECFRMCAPTN","Belge Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECDLGCAPTN","Belge Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECGRDCAPTN","Belge Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECRPTCAPTN","Belge Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMTOOLTIP","Belge Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMSTATUSTXT","Belge Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!belgetipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECLUTAG","belge_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMLUFIELDS","belge_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMLUUPDTEXP","Belgetipilookupview.belge_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.borca_esas_evrak field.
DBSetProp('BELGELOOKUPVIEW.borca_esas_evrak', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.borca_esas_evrak', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.borca_esas_evrak', 'Field', 'UpdateName', 'dbo.Belge.Borca_Esas_Evrak')
DBSetProp('BELGELOOKUPVIEW.borca_esas_evrak', 'Field', 'DataType', "L")
*** DBCX Field Properties for BELGELOOKUPVIEW.borca_esas_evrak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECDESCRIPT","Borca Esas Evrak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECFRMCAPTN","Borca Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECDLGCAPTN","Borca Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECGRDCAPTN","Borca Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECRPTCAPTN","Borca Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFEMTOOLTIP","Borca Esas Evrak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFEMSTATUSTXT","Borca Esas Evrak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.borca_esas_evrak","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_yonu field.
DBSetProp('BELGELOOKUPVIEW.belge_yonu', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_yonu', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_yonu', 'Field', 'UpdateName', 'dbo.Belge.Belge_Yonu')
DBSetProp('BELGELOOKUPVIEW.belge_yonu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_yonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECDESCRIPT","Belge Yonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECFRMCAPTN","Belge Yönü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECDLGCAPTN","Belge Yönü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECGRDCAPTN","Belge Yönü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECRPTCAPTN","Belge Yönü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFEMTOOLTIP","Belge Yönü                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFEMSTATUSTXT","Belge Yönü                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFEMINLIST",'"Gelen ","Giden "') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_yonu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_formati field.
DBSetProp('BELGELOOKUPVIEW.belge_formati', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_formati', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_formati', 'Field', 'UpdateName', 'dbo.Belge.Belge_Formati')
DBSetProp('BELGELOOKUPVIEW.belge_formati', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_formati
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECDESCRIPT","Belge Formati Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECFRMCAPTN","Belge Formatý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECDLGCAPTN","Belge Formatý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECGRDCAPTN","Belge Formatý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECRPTCAPTN","Belge Formatý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFEMTOOLTIP","Belge Formatý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFEMSTATUSTXT","Belge Formatý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFEMINLIST",'"Döküman","Ses","Resim","Video"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_formati","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.belge_konumu field.
DBSetProp('BELGELOOKUPVIEW.belge_konumu', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.belge_konumu', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.belge_konumu', 'Field', 'UpdateName', 'dbo.Belge.Belge_Konumu')
DBSetProp('BELGELOOKUPVIEW.belge_konumu', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for BELGELOOKUPVIEW.belge_konumu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECDESCRIPT","Belge Konumu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECFRMCAPTN","Belge Konumu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECDLGCAPTN","Belge Konumu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECGRDCAPTN","Belge Konumu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECRPTCAPTN","Belge Konumu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFEMTOOLTIP","Belge Konumu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFEMSTATUSTXT","Belge Konumu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.belge_konumu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the BELGELOOKUPVIEW.aciklama field.
DBSetProp('BELGELOOKUPVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('BELGELOOKUPVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('BELGELOOKUPVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Belge.Aciklama')
DBSetProp('BELGELOOKUPVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for BELGELOOKUPVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGELOOKUPVIEW.aciklama","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
