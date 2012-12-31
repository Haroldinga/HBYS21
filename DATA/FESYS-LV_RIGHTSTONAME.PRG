***************** Begin View Definition LV_RIGHTSTONAME ***************


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



CREATE SQL VIEW "LV_RIGHTSTONAME" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT apprites.cgroup_id,;
		apprites.cname,;
		apprites.nrights,;
		apprites.timestamp_column;
	FROM dbo.apprites Apprites;
	WHERE Apprites.cgroup_id = ( ?vp_cGroup_id ) AND;
		UPPER(Apprites.cname) = UPPER(?vp_cName)

DBSetProp('LV_RIGHTSTONAME', 'View', 'UpdateType', 1)
DBSetProp('LV_RIGHTSTONAME', 'View', 'WhereType', 3)
DBSetProp('LV_RIGHTSTONAME', 'View', 'FetchMemo', .T.)
DBSetProp('LV_RIGHTSTONAME', 'View', 'SendUpdates', .F.)
DBSetProp('LV_RIGHTSTONAME', 'View', 'UseMemoSize', 255)
DBSetProp('LV_RIGHTSTONAME', 'View', 'MaxRecords', -1)
DBSetProp('LV_RIGHTSTONAME', 'View', 'Tables', 'dbo.apprites')
DBSetProp('LV_RIGHTSTONAME', 'View', 'Prepared', .F.)
DBSetProp('LV_RIGHTSTONAME', 'View', 'CompareMemo', .T.)
DBSetProp('LV_RIGHTSTONAME', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_RIGHTSTONAME', 'View', 'FetchSize', -1)
DBSetProp('LV_RIGHTSTONAME', 'View', 'ParameterList', "vp_cGroup_id,'C';vp_cName,'C'")
DBSetProp('LV_RIGHTSTONAME', 'View', 'Comment', "")
DBSetProp('LV_RIGHTSTONAME', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_RIGHTSTONAME', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_RIGHTSTONAME
	GoExplorer.odbcx.Validate("LV_RIGHTSTONAME","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME","VIEW",;
		"VFECDESCRIPT","Lv Rightstoname Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cGroup_id
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECDESCRIPT","Vp Cgroup Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFENVPSIZE",16) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_cName
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECDESCRIPT","Vp Cname View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECFRMCAPTN","Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECDLGCAPTN","Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFENVPSIZE",40) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMTOOLTIP","Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMSTATUSTXT","Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for LV_RIGHTSTONAME
*** Props for the LV_RIGHTSTONAME.cgroup_id field.
DBSetProp('LV_RIGHTSTONAME.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('LV_RIGHTSTONAME.cgroup_id', 'Field', 'Updatable', .F.)
DBSetProp('LV_RIGHTSTONAME.cgroup_id', 'Field', 'UpdateName', 'dbo.apprites.cgroup_id')
DBSetProp('LV_RIGHTSTONAME.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for LV_RIGHTSTONAME.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTSTONAME.cname field.
DBSetProp('LV_RIGHTSTONAME.cname', 'Field', 'KeyField', .T.)
DBSetProp('LV_RIGHTSTONAME.cname', 'Field', 'Updatable', .F.)
DBSetProp('LV_RIGHTSTONAME.cname', 'Field', 'UpdateName', 'dbo.apprites.cname')
DBSetProp('LV_RIGHTSTONAME.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for LV_RIGHTSTONAME.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECFRMCAPTN","Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECDLGCAPTN","Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECGRDCAPTN","Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECRPTCAPTN","Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFEMTOOLTIP","Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFEMSTATUSTXT","Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTSTONAME.nrights field.
DBSetProp('LV_RIGHTSTONAME.nrights', 'Field', 'KeyField', .F.)
DBSetProp('LV_RIGHTSTONAME.nrights', 'Field', 'Updatable', .F.)
DBSetProp('LV_RIGHTSTONAME.nrights', 'Field', 'UpdateName', 'dbo.apprites.nrights')
DBSetProp('LV_RIGHTSTONAME.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for LV_RIGHTSTONAME.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECFRMCAPTN","Rights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECDLGCAPTN","Rights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECGRDCAPTN","Rights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECRPTCAPTN","Rights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMTOOLTIP","Rights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMSTATUSTXT","Rights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTSTONAME.timestamp_column field.
DBSetProp('LV_RIGHTSTONAME.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_RIGHTSTONAME.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_RIGHTSTONAME.timestamp_column', 'Field', 'UpdateName', 'dbo.apprites.timestamp_column')
DBSetProp('LV_RIGHTSTONAME.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_RIGHTSTONAME.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTSTONAME.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
