***************** Begin View Definition LV_GROUPS ***************


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



CREATE SQL VIEW "LV_GROUPS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT appgroups.cgroup_id,;
		appgroups.cname,;
		appgroups.mdescript,;
		appgroups.timestamp_column;
	FROM dbo.appgroups Appgroups;
	ORDER BY Appgroups.cname

DBSetProp('LV_GROUPS', 'View', 'UpdateType', 1)
DBSetProp('LV_GROUPS', 'View', 'WhereType', 3)
DBSetProp('LV_GROUPS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_GROUPS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_GROUPS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_GROUPS', 'View', 'MaxRecords', -1)
DBSetProp('LV_GROUPS', 'View', 'Tables', 'dbo.appgroups')
DBSetProp('LV_GROUPS', 'View', 'Prepared', .F.)
DBSetProp('LV_GROUPS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_GROUPS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_GROUPS', 'View', 'FetchSize', -1)
DBSetProp('LV_GROUPS', 'View', 'Comment', "")
DBSetProp('LV_GROUPS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_GROUPS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_GROUPS
	GoExplorer.odbcx.Validate("LV_GROUPS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS","VIEW",;
		"VFECDESCRIPT","Lv Groups Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_GROUPS
*** Props for the LV_GROUPS.cgroup_id field.
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'UpdateName', 'dbo.appgroups.cgroup_id')
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'Caption', "Group Id")
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
DBSetProp('LV_GROUPS.cgroup_id', 'Field', 'DefaultValue', "GUID()")
*** DBCX Field Properties for LV_GROUPS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_GROUPS.cname field.
DBSetProp('LV_GROUPS.cname', 'Field', 'KeyField', .F.)
DBSetProp('LV_GROUPS.cname', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPS.cname', 'Field', 'UpdateName', 'dbo.appgroups.cname')
DBSetProp('LV_GROUPS.cname', 'Field', 'RuleExpression', "NOT EMPTY(cname)")
DBSetProp('LV_GROUPS.cname', 'Field', 'RuleText', "'Group Name must be entered.'")
DBSetProp('LV_GROUPS.cname', 'Field', 'Caption', "Group Name")
DBSetProp('LV_GROUPS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for LV_GROUPS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECFRMCAPTN","Group Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECDLGCAPTN","Group Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECGRDCAPTN","Group Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECRPTCAPTN","Group Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFEMTOOLTIP","Group Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFEMSTATUSTXT","Group Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_GROUPS.mdescript field.
DBSetProp('LV_GROUPS.mdescript', 'Field', 'KeyField', .F.)
DBSetProp('LV_GROUPS.mdescript', 'Field', 'Updatable', .T.)
DBSetProp('LV_GROUPS.mdescript', 'Field', 'UpdateName', 'dbo.appgroups.mdescript')
DBSetProp('LV_GROUPS.mdescript', 'Field', 'RuleExpression', "NOT EMPTY( mdescript)")
DBSetProp('LV_GROUPS.mdescript', 'Field', 'RuleText', "'Description must be entered.'")
DBSetProp('LV_GROUPS.mdescript', 'Field', 'Caption', "Description")
DBSetProp('LV_GROUPS.mdescript', 'Field', 'DataType', "M")
*** DBCX Field Properties for LV_GROUPS.mdescript
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECDESCRIPT","Mdescript Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECFRMCAPTN","Description") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECDLGCAPTN","Description") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECGRDCAPTN","Description") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECRPTCAPTN","Description") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFEMTOOLTIP","Description") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFEMSTATUSTXT","Description") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.mdescript","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_GROUPS.timestamp_column field.
DBSetProp('LV_GROUPS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_GROUPS.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_GROUPS.timestamp_column', 'Field', 'UpdateName', 'dbo.appgroups.timestamp_column')
DBSetProp('LV_GROUPS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_GROUPS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_GROUPS.timestamp_column","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
