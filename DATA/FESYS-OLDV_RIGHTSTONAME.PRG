***************** Begin View Definition OLDV_RIGHTSTONAME ***************


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



CREATE SQL VIEW "OLDV_RIGHTSTONAME" ; 
	AS SELECT *;
	FROM fesys!apprites;
	WHERE Apprites.cgroup_id = ?vp_cGroup_id AND;
		UPPER(Apprites.cname) = UPPER(?vp_cName)

DBSetProp('OLDV_RIGHTSTONAME', 'View', 'UpdateType', 1)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'WhereType', 3)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'SendUpdates', .F.)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'Tables', '')
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'Prepared', .F.)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'FetchSize', 100)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'ParameterList', "vp_cGroup_id,'C';vp_cName,'C'")
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'Comment', "")
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_RIGHTSTONAME', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_RIGHTSTONAME
	GoExplorer.odbcx.Validate("OLDV_RIGHTSTONAME","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME","VIEW",;
		"VFECDESCRIPT","Oldv Rightstoname Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cGroup_id
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECDESCRIPT","Vp Cgroup Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFENVPSIZE",16) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cGroup_id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_cName
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECDESCRIPT","Vp Cname View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFENVPSIZE",40) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.vp_cName","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for OLDV_RIGHTSTONAME
*** Props for the OLDV_RIGHTSTONAME.cgroup_id field.
DBSetProp('OLDV_RIGHTSTONAME.cgroup_id', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_RIGHTSTONAME.cgroup_id', 'Field', 'Updatable', .F.)
DBSetProp('OLDV_RIGHTSTONAME.cgroup_id', 'Field', 'UpdateName', 'fesys!apprites.cgroup_id')
DBSetProp('OLDV_RIGHTSTONAME.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_RIGHTSTONAME.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cgroup_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_RIGHTSTONAME.cname field.
DBSetProp('OLDV_RIGHTSTONAME.cname', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_RIGHTSTONAME.cname', 'Field', 'Updatable', .F.)
DBSetProp('OLDV_RIGHTSTONAME.cname', 'Field', 'UpdateName', 'fesys!apprites.cname')
DBSetProp('OLDV_RIGHTSTONAME.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for OLDV_RIGHTSTONAME.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.cname","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_RIGHTSTONAME.nrights field.
DBSetProp('OLDV_RIGHTSTONAME.nrights', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_RIGHTSTONAME.nrights', 'Field', 'Updatable', .F.)
DBSetProp('OLDV_RIGHTSTONAME.nrights', 'Field', 'UpdateName', 'fesys!apprites.nrights')
DBSetProp('OLDV_RIGHTSTONAME.nrights', 'Field', 'DataType', "N(1)")
*** DBCX Field Properties for OLDV_RIGHTSTONAME.nrights
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECDESCRIPT","Nrights Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECFRMCAPTN","Nrights") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECDLGCAPTN","Nrights") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECGRDCAPTN","Nrights") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECRPTCAPTN","Nrights") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMTOOLTIP","Nrights") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMSTATUSTXT","Nrights") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_RIGHTSTONAME.nrights","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
