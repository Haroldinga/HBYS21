***************** Begin View Definition REMOTE_APPGROUPS ***************


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



CREATE SQL VIEW "REMOTE_APPGROUPS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Appgroups.cgroup_id,;
		Appgroups.cname,;
		Appgroups.mdescript,;
		Appgroups.timestamp_column;
	FROM dbo.appgroups Appgroups

DBSetProp('REMOTE_APPGROUPS', 'View', 'UpdateType', 1)
DBSetProp('REMOTE_APPGROUPS', 'View', 'WhereType', 1)
DBSetProp('REMOTE_APPGROUPS', 'View', 'FetchMemo', .T.)
DBSetProp('REMOTE_APPGROUPS', 'View', 'SendUpdates', .T.)
DBSetProp('REMOTE_APPGROUPS', 'View', 'UseMemoSize', 255)
DBSetProp('REMOTE_APPGROUPS', 'View', 'MaxRecords', -1)
DBSetProp('REMOTE_APPGROUPS', 'View', 'Tables', 'dbo.appgroups')
DBSetProp('REMOTE_APPGROUPS', 'View', 'Prepared', .F.)
DBSetProp('REMOTE_APPGROUPS', 'View', 'CompareMemo', .T.)
DBSetProp('REMOTE_APPGROUPS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REMOTE_APPGROUPS', 'View', 'FetchSize', -1)
DBSetProp('REMOTE_APPGROUPS', 'View', 'Comment', "")
DBSetProp('REMOTE_APPGROUPS', 'View', 'BatchUpdateCount', 1)
DBSetProp('REMOTE_APPGROUPS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REMOTE_APPGROUPS
	GoExplorer.odbcx.Validate("REMOTE_APPGROUPS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS","VIEW",;
		"VFECDESCRIPT","Remote Appgroups Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for REMOTE_APPGROUPS
*** Props for the REMOTE_APPGROUPS.cgroup_id field.
DBSetProp('REMOTE_APPGROUPS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('REMOTE_APPGROUPS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPGROUPS.cgroup_id', 'Field', 'UpdateName', 'dbo.appgroups.cgroup_id')
DBSetProp('REMOTE_APPGROUPS.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for REMOTE_APPGROUPS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPGROUPS.cname field.
DBSetProp('REMOTE_APPGROUPS.cname', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPGROUPS.cname', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPGROUPS.cname', 'Field', 'UpdateName', 'dbo.appgroups.cname')
DBSetProp('REMOTE_APPGROUPS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for REMOTE_APPGROUPS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPGROUPS.mdescript field.
DBSetProp('REMOTE_APPGROUPS.mdescript', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPGROUPS.mdescript', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPGROUPS.mdescript', 'Field', 'UpdateName', 'dbo.appgroups.mdescript')
DBSetProp('REMOTE_APPGROUPS.mdescript', 'Field', 'DataType', "M")
*** DBCX Field Properties for REMOTE_APPGROUPS.mdescript
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECDESCRIPT","Mdescript Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECFRMCAPTN","Mdescript") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECDLGCAPTN","Mdescript") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECGRDCAPTN","Mdescript") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECRPTCAPTN","Mdescript") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFEMTOOLTIP","Mdescript") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFEMSTATUSTXT","Mdescript") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.mdescript","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPGROUPS.timestamp_column field.
DBSetProp('REMOTE_APPGROUPS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPGROUPS.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPGROUPS.timestamp_column', 'Field', 'UpdateName', 'dbo.appgroups.timestamp_column')
DBSetProp('REMOTE_APPGROUPS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for REMOTE_APPGROUPS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPGROUPS.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
