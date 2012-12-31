***************** Begin View Definition LV_USERS ***************


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



CREATE SQL VIEW "LV_USERS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT appusers.cuserid,;
		appusers.cfirst_name,;
		appusers.clast_name,;
		appusers.cpassword,;
		appusers.dlastchanged,;
		appusers.ladministrator,;
		appusers.cgroup_id,;
		appusers.moldpasswords,;
		appusers.linactive,;
		appusers.timestamp_column,;
		appusers.user_id;
	FROM dbo.appusers Appusers

DBSetProp('LV_USERS', 'View', 'UpdateType', 1)
DBSetProp('LV_USERS', 'View', 'WhereType', 3)
DBSetProp('LV_USERS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_USERS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_USERS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_USERS', 'View', 'MaxRecords', -1)
DBSetProp('LV_USERS', 'View', 'Tables', 'dbo.appusers')
DBSetProp('LV_USERS', 'View', 'Prepared', .F.)
DBSetProp('LV_USERS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_USERS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_USERS', 'View', 'FetchSize', -1)
DBSetProp('LV_USERS', 'View', 'Comment', "")
DBSetProp('LV_USERS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_USERS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_USERS
	GoExplorer.odbcx.Validate("LV_USERS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS","VIEW",;
		"VFECDESCRIPT","Lv Users Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_USERS
*** Props for the LV_USERS.cuserid field.
DBSetProp('LV_USERS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('LV_USERS.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.cuserid', 'Field', 'UpdateName', 'dbo.appusers.cuserid')
DBSetProp('LV_USERS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_USERS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_USERS.cfirst_name field.
DBSetProp('LV_USERS.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.cfirst_name', 'Field', 'UpdateName', 'dbo.appusers.cfirst_name')
DBSetProp('LV_USERS.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for LV_USERS.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECFRMCAPTN","First Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECDLGCAPTN","First Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECGRDCAPTN","First Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECRPTCAPTN","First Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFEMTOOLTIP","First Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","First Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_USERS.clast_name field.
DBSetProp('LV_USERS.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.clast_name', 'Field', 'UpdateName', 'dbo.appusers.clast_name')
DBSetProp('LV_USERS.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for LV_USERS.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECFRMCAPTN","Last Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECDLGCAPTN","Last Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECGRDCAPTN","Last Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECRPTCAPTN","Last Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFEMTOOLTIP","Last Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFEMSTATUSTXT","Last Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_USERS.cpassword field.
DBSetProp('LV_USERS.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.cpassword', 'Field', 'UpdateName', 'dbo.appusers.cpassword')
DBSetProp('LV_USERS.cpassword', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_USERS.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECFRMCAPTN","Password") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECDLGCAPTN","Password") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECGRDCAPTN","Password") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECRPTCAPTN","Password") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFEMTOOLTIP","Password") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFEMSTATUSTXT","Password") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_USERS.dlastchanged field.
DBSetProp('LV_USERS.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.dlastchanged', 'Field', 'UpdateName', 'dbo.appusers.dlastchanged')
DBSetProp('LV_USERS.dlastchanged', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_USERS.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Last Changed") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Last Changed") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Last Changed") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Last Changed") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Last Changed") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Last Changed") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_USERS.ladministrator field.
DBSetProp('LV_USERS.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.ladministrator', 'Field', 'UpdateName', 'dbo.appusers.ladministrator')
DBSetProp('LV_USERS.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_USERS.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECFRMCAPTN","Administrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECDLGCAPTN","Administrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECGRDCAPTN","Administrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECRPTCAPTN","Administrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFEMTOOLTIP","Administrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Administrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the LV_USERS.cgroup_id field.
DBSetProp('LV_USERS.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.cgroup_id', 'Field', 'UpdateName', 'dbo.appusers.cgroup_id')
DBSetProp('LV_USERS.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for LV_USERS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the LV_USERS.moldpasswords field.
DBSetProp('LV_USERS.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.moldpasswords', 'Field', 'UpdateName', 'dbo.appusers.moldpasswords')
DBSetProp('LV_USERS.moldpasswords', 'Field', 'DataType', "M")
*** DBCX Field Properties for LV_USERS.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Oldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Oldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Oldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Oldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Oldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Oldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the LV_USERS.linactive field.
DBSetProp('LV_USERS.linactive', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.linactive', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.linactive', 'Field', 'UpdateName', 'dbo.appusers.linactive')
DBSetProp('LV_USERS.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_USERS.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECFRMCAPTN","Inactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECDLGCAPTN","Inactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECGRDCAPTN","Inactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECRPTCAPTN","Inactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFEMTOOLTIP","Inactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFEMSTATUSTXT","Inactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the LV_USERS.timestamp_column field.
DBSetProp('LV_USERS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.timestamp_column', 'Field', 'UpdateName', 'dbo.appusers.timestamp_column')
DBSetProp('LV_USERS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_USERS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.timestamp_column","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the LV_USERS.user_id field.
DBSetProp('LV_USERS.user_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_USERS.user_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_USERS.user_id', 'Field', 'UpdateName', 'dbo.appusers.User_Id')
DBSetProp('LV_USERS.user_id', 'Field', 'DataType', "C(36)")
DBSetProp('LV_USERS.user_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for LV_USERS.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_USERS.user_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
