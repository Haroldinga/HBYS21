***************** Begin View Definition MASRAFTIPILISTVIEW ***************


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



CREATE SQL VIEW "MASRAFTIPILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Masraftipi.MasrafTipi_Id,;
		Masraftipi.Masraf_Tipi,;
		Masraftipi.Masraf_Miktari,;
		Masraftipi.Uygulama_Tipi,;
		Masraftipi.Uygulama_Asamasi;
	FROM dbo.MasrafTipi Masraftipi

DBSetProp('MASRAFTIPILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'Tables', 'dbo.MasrafTipi')
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'ParameterList', "vp_MasrafTipi_Id,'C';vp_Masraf_Tipi,'C';vp_Uygulama_Tipi,'C';vp_Uygulama_Asamasi,'C'")
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'Comment', "")
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MASRAFTIPILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MASRAFTIPILISTVIEW
	GoExplorer.odbcx.Validate("MASRAFTIPILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW","VIEW",;
		"VFECDESCRIPT","Masraftipilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MasrafTipi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Masraftipi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECFRMCAPTN","Masraftipi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECDLGCAPTN","Masraftipi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMTOOLTIP","Masraftipi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Masraftipi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMCOMPARETO","MasrafTipi_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_MasrafTipi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Masraf_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Masraf Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Masraf_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Masraf_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Uygulama_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Uygulama Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Uygulama_Asamasi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECDESCRIPT","Vp Uygulama Asamasi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MASRAFTIPILISTVIEW
*** Props for the MASRAFTIPILISTVIEW.masraftipi_id field.
DBSetProp('MASRAFTIPILISTVIEW.masraftipi_id', 'Field', 'KeyField', .T.)
DBSetProp('MASRAFTIPILISTVIEW.masraftipi_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILISTVIEW.masraftipi_id', 'Field', 'UpdateName', 'dbo.MasrafTipi.MasrafTipi_Id')
DBSetProp('MASRAFTIPILISTVIEW.masraftipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MASRAFTIPILISTVIEW.masraftipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MASRAFTIPILISTVIEW.masraftipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECDESCRIPT","Masraftipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi ID                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi ID                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraftipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MASRAFTIPILISTVIEW.masraf_tipi field.
DBSetProp('MASRAFTIPILISTVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILISTVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILISTVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.MasrafTipi.Masraf_Tipi')
DBSetProp('MASRAFTIPILISTVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFTIPILISTVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MASRAFTIPILISTVIEW.masraf_miktari field.
DBSetProp('MASRAFTIPILISTVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILISTVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILISTVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.MasrafTipi.Masraf_Miktari')
DBSetProp('MASRAFTIPILISTVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MASRAFTIPILISTVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMINPUTMASK","99,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.masraf_miktari","FIELD",;
		"VFEMFORMAT","KR") &&Format
ENDIF
 
*** Props for the MASRAFTIPILISTVIEW.uygulama_tipi field.
DBSetProp('MASRAFTIPILISTVIEW.uygulama_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILISTVIEW.uygulama_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILISTVIEW.uygulama_tipi', 'Field', 'UpdateName', 'dbo.MasrafTipi.Uygulama_Tipi')
DBSetProp('MASRAFTIPILISTVIEW.uygulama_tipi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MASRAFTIPILISTVIEW.uygulama_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDESCRIPT","Uygulama Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECGRDCAPTN","Uygulama Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECRPTCAPTN","Uygulama Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMINLIST",'"Otomatik","Standart"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MASRAFTIPILISTVIEW.uygulama_asamasi field.
DBSetProp('MASRAFTIPILISTVIEW.uygulama_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILISTVIEW.uygulama_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILISTVIEW.uygulama_asamasi', 'Field', 'UpdateName', 'dbo.MasrafTipi.Uygulama_Asamasi')
DBSetProp('MASRAFTIPILISTVIEW.uygulama_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFTIPILISTVIEW.uygulama_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDESCRIPT","Uygulama Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECGRDCAPTN","Uygulama Aþamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECRPTCAPTN","Uygulama Aþamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTABLE","hbysdata!icradosyaasamasilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTAG","dosya_asamasi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUFIELDS","dosya_asamasi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUUPDTEXP","Icradosyaasamasilookupview.dosya_asamasi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
