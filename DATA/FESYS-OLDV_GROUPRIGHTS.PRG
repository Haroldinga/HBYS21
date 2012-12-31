***************** Begin View Definition OLDV_GROUPRIGHTS ***************


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



CREATE SQL VIEW "OLDV_GROUPRIGHTS" ; 
	AS SELECT apprites.cgroup_id,;
		apprites.cname,;
		apprites.nrights;
	FROM fesys!apprites;
	WHERE Apprites.cgroup_id = ?vp_cGroup_Id

DBSetProp('OLDV_GROUPRIGHTS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'WhereType', 3)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'Tables', 'fesys!apprites')
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'ParameterList', "vp_cGroup_Id,'C'")
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'Comment', "")
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_GROUPRIGHTS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_GROUPRIGHTS
	GoExplorer.odbcx.Validate("OLDV_GROUPRIGHTS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS","VIEW",;
		"VFECDESCRIPT","Oldv Grouprights Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cGroup_Id
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Cgroup Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFENVPSIZE",16) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.vp_cGroup_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for OLDV_GROUPRIGHTS
*** Props for the OLDV_GROUPRIGHTS.cgroup_id field.
DBSetProp('OLDV_GROUPRIGHTS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_GROUPRIGHTS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPRIGHTS.cgroup_id', 'Field', 'UpdateName', 'fesys!apprites.cgroup_id')
DBSetProp('OLDV_GROUPRIGHTS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_GROUPRIGHTS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_GROUPRIGHTS.cname field.
DBSetProp('OLDV_GROUPRIGHTS.cname', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_GROUPRIGHTS.cname', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPRIGHTS.cname', 'Field', 'UpdateName', 'fesys!apprites.cname')
DBSetProp('OLDV_GROUPRIGHTS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for OLDV_GROUPRIGHTS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_GROUPRIGHTS.nrights field.
DBSetProp('OLDV_GROUPRIGHTS.nrights', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_GROUPRIGHTS.nrights', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPRIGHTS.nrights', 'Field', 'UpdateName', 'fesys!apprites.nrights')
DBSetProp('OLDV_GROUPRIGHTS.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for OLDV_GROUPRIGHTS.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECFRMCAPTN","Nrights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECDLGCAPTN","Nrights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECGRDCAPTN","Nrights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECRPTCAPTN","Nrights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMTOOLTIP","Nrights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMSTATUSTXT","Nrights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPRIGHTS.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
