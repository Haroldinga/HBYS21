***************** Begin View Definition LV_RIGHTS ***************


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



CREATE SQL VIEW "LV_RIGHTS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT apprites.cgroup_id,;
		apprites.cname,;
		apprites.nrights,;
		apprites.timestamp_column;
	FROM dbo.apprites Apprites;
	WHERE Apprites.cgroup_id = ( ?v_groups.cGroup_Id )

DBSetProp('LV_RIGHTS', 'View', 'UpdateType', 1)
DBSetProp('LV_RIGHTS', 'View', 'WhereType', 3)
DBSetProp('LV_RIGHTS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_RIGHTS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_RIGHTS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_RIGHTS', 'View', 'MaxRecords', -1)
DBSetProp('LV_RIGHTS', 'View', 'Tables', 'dbo.apprites')
DBSetProp('LV_RIGHTS', 'View', 'Prepared', .F.)
DBSetProp('LV_RIGHTS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_RIGHTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_RIGHTS', 'View', 'FetchSize', -1)
DBSetProp('LV_RIGHTS', 'View', 'Comment', "")
DBSetProp('LV_RIGHTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_RIGHTS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_RIGHTS
	GoExplorer.odbcx.Validate("LV_RIGHTS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS","VIEW",;
		"VFECDESCRIPT","Lv Rights Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_RIGHTS
*** Props for the LV_RIGHTS.cgroup_id field.
DBSetProp('LV_RIGHTS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('LV_RIGHTS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_RIGHTS.cgroup_id', 'Field', 'UpdateName', 'dbo.apprites.cgroup_id')
DBSetProp('LV_RIGHTS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for LV_RIGHTS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTS.cname field.
DBSetProp('LV_RIGHTS.cname', 'Field', 'KeyField', .T.)
DBSetProp('LV_RIGHTS.cname', 'Field', 'Updatable', .T.)
DBSetProp('LV_RIGHTS.cname', 'Field', 'UpdateName', 'dbo.apprites.cname')
DBSetProp('LV_RIGHTS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for LV_RIGHTS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECFRMCAPTN","Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECDLGCAPTN","Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECGRDCAPTN","Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECRPTCAPTN","Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFEMTOOLTIP","Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFEMSTATUSTXT","Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTS.nrights field.
DBSetProp('LV_RIGHTS.nrights', 'Field', 'KeyField', .F.)
DBSetProp('LV_RIGHTS.nrights', 'Field', 'Updatable', .T.)
DBSetProp('LV_RIGHTS.nrights', 'Field', 'UpdateName', 'dbo.apprites.nrights')
DBSetProp('LV_RIGHTS.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for LV_RIGHTS.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECFRMCAPTN","Rights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECDLGCAPTN","Rights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECGRDCAPTN","Rights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECRPTCAPTN","Rights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFEMTOOLTIP","Rights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFEMSTATUSTXT","Rights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_RIGHTS.timestamp_column field.
DBSetProp('LV_RIGHTS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_RIGHTS.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_RIGHTS.timestamp_column', 'Field', 'UpdateName', 'dbo.apprites.timestamp_column')
DBSetProp('LV_RIGHTS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_RIGHTS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_RIGHTS.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
