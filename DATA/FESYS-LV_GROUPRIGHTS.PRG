***************** Begin View Definition LV_GROUPRIGHTS ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"FESYS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\FESYS"
ELSE
	SET DATABASE TO "FESYS"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "LV_GROUPRIGHTS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT apprites.cgroup_id,;
		apprites.cname,;
		apprites.nrights,;
		apprites.timestamp_column;
	FROM dbo.apprites Apprites;
	WHERE Apprites.cgroup_id = ( ?vp_cGroup_Id )

DBSetProp('LV_GROUPRIGHTS', 'View', 'UpdateType', 1)
DBSetProp('LV_GROUPRIGHTS', 'View', 'WhereType', 3)
DBSetProp('LV_GROUPRIGHTS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_GROUPRIGHTS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_GROUPRIGHTS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_GROUPRIGHTS', 'View', 'MaxRecords', -1)
DBSetProp('LV_GROUPRIGHTS', 'View', 'Tables', 'dbo.apprites')
DBSetProp('LV_GROUPRIGHTS', 'View', 'Prepared', .F.)
DBSetProp('LV_GROUPRIGHTS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_GROUPRIGHTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_GROUPRIGHTS', 'View', 'FetchSize', -1)
DBSetProp('LV_GROUPRIGHTS', 'View', 'ParameterList', "vp_cGroup_Id,'C'")
DBSetProp('LV_GROUPRIGHTS', 'View', 'Comment', "")
DBSetProp('LV_GROUPRIGHTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_GROUPRIGHTS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_GROUPRIGHTS
	GoExplorer.odbcx.Validate("LV_GROUPRIGHTS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS","VIEW",;
		"VFECDESCRIPT","Lv Grouprights Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cGroup_Id
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Cgroup Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFENVPSIZE",16) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for LV_GROUPRIGHTS
*** Props for the LV_GROUPRIGHTS.cgroup_id field.
DBSetProp('LV_GROUPRIGHTS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('LV_GROUPRIGHTS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPRIGHTS.cgroup_id', 'Field', 'UpdateName', 'dbo.apprites.cgroup_id')
DBSetProp('LV_GROUPRIGHTS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for LV_GROUPRIGHTS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_GROUPRIGHTS.cname field.
DBSetProp('LV_GROUPRIGHTS.cname', 'Field', 'KeyField', .T.)
DBSetProp('LV_GROUPRIGHTS.cname', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPRIGHTS.cname', 'Field', 'UpdateName', 'dbo.apprites.cname')
DBSetProp('LV_GROUPRIGHTS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for LV_GROUPRIGHTS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECFRMCAPTN","Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECDLGCAPTN","Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECGRDCAPTN","Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECRPTCAPTN","Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFEMTOOLTIP","Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFEMSTATUSTXT","Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_GROUPRIGHTS.nrights field.
DBSetProp('LV_GROUPRIGHTS.nrights', 'Field', 'KeyField', .F.)
DBSetProp('LV_GROUPRIGHTS.nrights', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPRIGHTS.nrights', 'Field', 'UpdateName', 'dbo.apprites.nrights')
DBSetProp('LV_GROUPRIGHTS.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for LV_GROUPRIGHTS.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECFRMCAPTN","Rights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECDLGCAPTN","Rights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECGRDCAPTN","Rights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECRPTCAPTN","Rights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMTOOLTIP","Rights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMSTATUSTXT","Rights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_GROUPRIGHTS.timestamp_column field.
DBSetProp('LV_GROUPRIGHTS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_GROUPRIGHTS.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_GROUPRIGHTS.timestamp_column', 'Field', 'UpdateName', 'dbo.apprites.timestamp_column')
DBSetProp('LV_GROUPRIGHTS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_GROUPRIGHTS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPRIGHTS.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
