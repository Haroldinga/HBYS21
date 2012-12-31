***************** Begin View Definition REMOTE_APPRITES ***************


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



CREATE SQL VIEW "REMOTE_APPRITES" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Apprites.cgroup_id,;
		Apprites.cname,;
		Apprites.nrights,;
		Apprites.timestamp_column;
	FROM dbo.apprites Apprites

DBSetProp('REMOTE_APPRITES', 'View', 'UpdateType', 1)
DBSetProp('REMOTE_APPRITES', 'View', 'WhereType', 1)
DBSetProp('REMOTE_APPRITES', 'View', 'FetchMemo', .T.)
DBSetProp('REMOTE_APPRITES', 'View', 'SendUpdates', .T.)
DBSetProp('REMOTE_APPRITES', 'View', 'UseMemoSize', 255)
DBSetProp('REMOTE_APPRITES', 'View', 'MaxRecords', -1)
DBSetProp('REMOTE_APPRITES', 'View', 'Tables', 'dbo.apprites')
DBSetProp('REMOTE_APPRITES', 'View', 'Prepared', .F.)
DBSetProp('REMOTE_APPRITES', 'View', 'CompareMemo', .T.)
DBSetProp('REMOTE_APPRITES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REMOTE_APPRITES', 'View', 'FetchSize', -1)
DBSetProp('REMOTE_APPRITES', 'View', 'Comment', "")
DBSetProp('REMOTE_APPRITES', 'View', 'BatchUpdateCount', 1)
DBSetProp('REMOTE_APPRITES', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REMOTE_APPRITES
	GoExplorer.odbcx.Validate("REMOTE_APPRITES","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES","VIEW",;
		"VFECDESCRIPT","Remote Apprites Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for REMOTE_APPRITES
*** Props for the REMOTE_APPRITES.cgroup_id field.
DBSetProp('REMOTE_APPRITES.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('REMOTE_APPRITES.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPRITES.cgroup_id', 'Field', 'UpdateName', 'dbo.apprites.cgroup_id')
DBSetProp('REMOTE_APPRITES.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for REMOTE_APPRITES.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPRITES.cname field.
DBSetProp('REMOTE_APPRITES.cname', 'Field', 'KeyField', .T.)
DBSetProp('REMOTE_APPRITES.cname', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPRITES.cname', 'Field', 'UpdateName', 'dbo.apprites.cname')
DBSetProp('REMOTE_APPRITES.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for REMOTE_APPRITES.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPRITES.nrights field.
DBSetProp('REMOTE_APPRITES.nrights', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPRITES.nrights', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPRITES.nrights', 'Field', 'UpdateName', 'dbo.apprites.nrights')
DBSetProp('REMOTE_APPRITES.nrights', 'Field', 'DataType', "N(3)")
*** DBCX Field Properties for REMOTE_APPRITES.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECFRMCAPTN","Nrights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECDLGCAPTN","Nrights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECGRDCAPTN","Nrights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECRPTCAPTN","Nrights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFEMTOOLTIP","Nrights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFEMSTATUSTXT","Nrights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPRITES.timestamp_column field.
DBSetProp('REMOTE_APPRITES.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPRITES.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPRITES.timestamp_column', 'Field', 'UpdateName', 'dbo.apprites.timestamp_column')
DBSetProp('REMOTE_APPRITES.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for REMOTE_APPRITES.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPRITES.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
