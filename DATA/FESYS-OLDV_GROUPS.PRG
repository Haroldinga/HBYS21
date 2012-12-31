***************** Begin View Definition OLDV_GROUPS ***************


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



CREATE SQL VIEW "OLDV_GROUPS" ; 
	AS SELECT appgroups.cgroup_id,;
		appgroups.cname,;
		appgroups.mdescript;
	FROM fesys!appgroups;
	ORDER BY Appgroups.cname

DBSetProp('OLDV_GROUPS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_GROUPS', 'View', 'WhereType', 3)
DBSetProp('OLDV_GROUPS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_GROUPS', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_GROUPS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_GROUPS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_GROUPS', 'View', 'Tables', 'fesys!appgroups')
DBSetProp('OLDV_GROUPS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_GROUPS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_GROUPS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_GROUPS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_GROUPS', 'View', 'Comment', "")
DBSetProp('OLDV_GROUPS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_GROUPS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_GROUPS
	GoExplorer.odbcx.Validate("OLDV_GROUPS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS","VIEW",;
		"VFECDESCRIPT","Oldv Groups Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_GROUPS
*** Props for the OLDV_GROUPS.cgroup_id field.
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'UpdateName', 'fesys!appgroups.cgroup_id')
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'Caption', "Group Id")
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
DBSetProp('OLDV_GROUPS.cgroup_id', 'Field', 'DefaultValue', "GUID()")
*** DBCX Field Properties for OLDV_GROUPS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_GROUPS.cname field.
DBSetProp('OLDV_GROUPS.cname', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_GROUPS.cname', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPS.cname', 'Field', 'UpdateName', 'fesys!appgroups.cname')
DBSetProp('OLDV_GROUPS.cname', 'Field', 'RuleExpression', "NOT EMPTY(cname)")
DBSetProp('OLDV_GROUPS.cname', 'Field', 'RuleText', "'Group Name must be entered.'")
DBSetProp('OLDV_GROUPS.cname', 'Field', 'Caption', "Group Name")
DBSetProp('OLDV_GROUPS.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for OLDV_GROUPS.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECFRMCAPTN","Group Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECDLGCAPTN","Group Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECGRDCAPTN","Group Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECRPTCAPTN","Group Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFEMTOOLTIP","Group Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFEMSTATUSTXT","Group Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_GROUPS.mdescript field.
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'UpdateName', 'fesys!appgroups.mdescript')
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'RuleExpression', "NOT EMPTY( mdescript)")
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'RuleText', "'Description must be entered.'")
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'Caption', "Description")
DBSetProp('OLDV_GROUPS.mdescript', 'Field', 'DataType', "M")
*** DBCX Field Properties for OLDV_GROUPS.mdescript
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECDESCRIPT","Mdescript Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECFRMCAPTN","Description") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECDLGCAPTN","Description") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECGRDCAPTN","Description") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECRPTCAPTN","Description") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFEMTOOLTIP","Description") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFEMSTATUSTXT","Description") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_GROUPS.mdescript","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
