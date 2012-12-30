***************** Begin View Definition RESIMVIEW ***************


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



CREATE SQL VIEW "RESIMVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Resim.Resim_Id,;
		Resim.Resim_Adi,;
		Resim.Resim_Tipi,;
		Resim.Resim;
	FROM dbo.Resim Resim

DBSetProp('RESIMVIEW', 'View', 'UpdateType', 1)
DBSetProp('RESIMVIEW', 'View', 'WhereType', 1)
DBSetProp('RESIMVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('RESIMVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('RESIMVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('RESIMVIEW', 'View', 'MaxRecords', -1)
DBSetProp('RESIMVIEW', 'View', 'Tables', 'dbo.Resim')
DBSetProp('RESIMVIEW', 'View', 'Prepared', .F.)
DBSetProp('RESIMVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('RESIMVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RESIMVIEW', 'View', 'FetchSize', -1)
DBSetProp('RESIMVIEW', 'View', 'ParameterList', "vp_Resim_Id,'C'")
DBSetProp('RESIMVIEW', 'View', 'Comment', "")
DBSetProp('RESIMVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('RESIMVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for RESIMVIEW
	GoExplorer.odbcx.Validate("RESIMVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW","VIEW",;
		"VFECDESCRIPT","Resimview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Resim_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Resim Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECFRMCAPTN","Resim Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECDLGCAPTN","Resim Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFEMTOOLTIP","Resim Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFEMSTATUSTXT","Resim Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.vp_Resim_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for RESIMVIEW
*** Props for the RESIMVIEW.resim_id field.
DBSetProp('RESIMVIEW.resim_id', 'Field', 'KeyField', .T.)
DBSetProp('RESIMVIEW.resim_id', 'Field', 'Updatable', .T.)
DBSetProp('RESIMVIEW.resim_id', 'Field', 'UpdateName', 'dbo.Resim.Resim_Id')
DBSetProp('RESIMVIEW.resim_id', 'Field', 'DataType', "C(36)")
DBSetProp('RESIMVIEW.resim_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for RESIMVIEW.resim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECDESCRIPT","Resim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECFRMCAPTN","Resim ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECDLGCAPTN","Resim ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECGRDCAPTN","Resim ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECRPTCAPTN","Resim ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFEMTOOLTIP","Resim ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFEMSTATUSTXT","Resim ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the RESIMVIEW.resim_adi field.
DBSetProp('RESIMVIEW.resim_adi', 'Field', 'KeyField', .F.)
DBSetProp('RESIMVIEW.resim_adi', 'Field', 'Updatable', .T.)
DBSetProp('RESIMVIEW.resim_adi', 'Field', 'UpdateName', 'dbo.Resim.Resim_Adi')
DBSetProp('RESIMVIEW.resim_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for RESIMVIEW.resim_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECDESCRIPT","Resim Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECFRMCAPTN","Resim Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECDLGCAPTN","Resim Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECGRDCAPTN","Resim Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECRPTCAPTN","Resim Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFEMTOOLTIP","Resim Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFEMSTATUSTXT","Resim Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the RESIMVIEW.resim_tipi field.
DBSetProp('RESIMVIEW.resim_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RESIMVIEW.resim_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RESIMVIEW.resim_tipi', 'Field', 'UpdateName', 'dbo.Resim.Resim_Tipi')
DBSetProp('RESIMVIEW.resim_tipi', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for RESIMVIEW.resim_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECDESCRIPT","Resim Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECFRMCAPTN","Resim Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECDLGCAPTN","Resim Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECGRDCAPTN","Resim Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECRPTCAPTN","Resim Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFEMTOOLTIP","Resim Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFEMSTATUSTXT","Resim Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the RESIMVIEW.resim field.
DBSetProp('RESIMVIEW.resim', 'Field', 'KeyField', .F.)
DBSetProp('RESIMVIEW.resim', 'Field', 'Updatable', .T.)
DBSetProp('RESIMVIEW.resim', 'Field', 'UpdateName', 'dbo.Resim.Resim')
DBSetProp('RESIMVIEW.resim', 'Field', 'DataType', "M")
*** DBCX Field Properties for RESIMVIEW.resim
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECDESCRIPT","Resim Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECFRMCAPTN","Resim") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECDLGCAPTN","Resim") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECGRDCAPTN","Resim") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECRPTCAPTN","Resim") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFEMTOOLTIP","Resim") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFEMSTATUSTXT","Resim") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RESIMVIEW.resim","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
