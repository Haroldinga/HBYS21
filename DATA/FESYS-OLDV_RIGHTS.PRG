***************** Begin View Definition OLDV_RIGHTS ***************


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



CREATE SQL VIEW "OLDV_RIGHTS" ; 
	AS SELECT apprites.cgroup_id,;
		apprites.cname,;
		apprites.nrights;
	FROM fesys!apprites;
	WHERE Apprites.cgroup_id = ?v_groups.cGroup_Id

DBSetProp('OLDV_RIGHTS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_RIGHTS', 'View', 'WhereType', 3)
DBSetProp('OLDV_RIGHTS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_RIGHTS', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_RIGHTS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_RIGHTS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_RIGHTS', 'View', 'Tables', 'fesys!apprites')
DBSetProp('OLDV_RIGHTS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_RIGHTS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_RIGHTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_RIGHTS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_RIGHTS', 'View', 'Comment', "")
DBSetProp('OLDV_RIGHTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_RIGHTS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_RIGHTS
	GoExplorer.odbcx.Validate("OLDV_RIGHTS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS","VIEW",;
		"VFECDESCRIPT","Oldv Rights Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_RIGHTS
*** Props for the OLDV_RIGHTS.cgroup_id field.
DBSetProp('OLDV_RIGHTS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_RIGHTS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_RIGHTS.cgroup_id', 'Field', 'UpdateName', 'fesys!apprites.cgroup_id')
DBSetProp('OLDV_RIGHTS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_RIGHTS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_RIGHTS.cname field.
DBSetProp('OLDV_RIGHTS.cname', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_RIGHTS.cname', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_RIGHTS.cname', 'Field', 'UpdateName', 'fesys!apprites.cname')
DBSetProp('OLDV_RIGHTS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for OLDV_RIGHTS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_RIGHTS.nrights field.
DBSetProp('OLDV_RIGHTS.nrights', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_RIGHTS.nrights', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_RIGHTS.nrights', 'Field', 'UpdateName', 'fesys!apprites.nrights')
DBSetProp('OLDV_RIGHTS.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for OLDV_RIGHTS.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECFRMCAPTN","Nrights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECDLGCAPTN","Nrights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECGRDCAPTN","Nrights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECRPTCAPTN","Nrights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFEMTOOLTIP","Nrights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFEMSTATUSTXT","Nrights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTS.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
