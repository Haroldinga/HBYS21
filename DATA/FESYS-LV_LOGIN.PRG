***************** Begin View Definition LV_LOGIN ***************


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



CREATE SQL VIEW "LV_LOGIN" ; 
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
	FROM dbo.appusers Appusers;
	ORDER BY Appusers.cuserid

DBSetProp('LV_LOGIN', 'View', 'UpdateType', 1)
DBSetProp('LV_LOGIN', 'View', 'WhereType', 3)
DBSetProp('LV_LOGIN', 'View', 'FetchMemo', .T.)
DBSetProp('LV_LOGIN', 'View', 'SendUpdates', .T.)
DBSetProp('LV_LOGIN', 'View', 'UseMemoSize', 255)
DBSetProp('LV_LOGIN', 'View', 'MaxRecords', -1)
DBSetProp('LV_LOGIN', 'View', 'Tables', 'dbo.appusers')
DBSetProp('LV_LOGIN', 'View', 'Prepared', .F.)
DBSetProp('LV_LOGIN', 'View', 'CompareMemo', .T.)
DBSetProp('LV_LOGIN', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_LOGIN', 'View', 'FetchSize', -1)
DBSetProp('LV_LOGIN', 'View', 'Comment', "")
DBSetProp('LV_LOGIN', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_LOGIN', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_LOGIN
	GoExplorer.odbcx.Validate("LV_LOGIN","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN","VIEW",;
		"VFECDESCRIPT","Lv Login Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_LOGIN
*** Props for the LV_LOGIN.cuserid field.
DBSetProp('LV_LOGIN.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('LV_LOGIN.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.cuserid', 'Field', 'UpdateName', 'dbo.appusers.cuserid')
DBSetProp('LV_LOGIN.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_LOGIN.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECGRDCAPTN","Userid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECRPTCAPTN","Userid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.cfirst_name field.
DBSetProp('LV_LOGIN.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.cfirst_name', 'Field', 'UpdateName', 'dbo.appusers.cfirst_name')
DBSetProp('LV_LOGIN.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for LV_LOGIN.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECFRMCAPTN","First Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECDLGCAPTN","First Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECGRDCAPTN","First Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECRPTCAPTN","First Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFEMTOOLTIP","First Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","First Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.clast_name field.
DBSetProp('LV_LOGIN.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.clast_name', 'Field', 'UpdateName', 'dbo.appusers.clast_name')
DBSetProp('LV_LOGIN.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for LV_LOGIN.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECFRMCAPTN","Last Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECDLGCAPTN","Last Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECGRDCAPTN","Last Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECRPTCAPTN","Last Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFEMTOOLTIP","Last Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFEMSTATUSTXT","Last Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.cpassword field.
DBSetProp('LV_LOGIN.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.cpassword', 'Field', 'UpdateName', 'dbo.appusers.cpassword')
DBSetProp('LV_LOGIN.cpassword', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_LOGIN.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECFRMCAPTN","Password") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECDLGCAPTN","Password") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECGRDCAPTN","Password") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECRPTCAPTN","Password") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFEMTOOLTIP","Password") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFEMSTATUSTXT","Password") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.dlastchanged field.
DBSetProp('LV_LOGIN.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.dlastchanged', 'Field', 'UpdateName', 'dbo.appusers.dlastchanged')
DBSetProp('LV_LOGIN.dlastchanged', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_LOGIN.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Lastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Lastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Lastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Lastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Lastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Lastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.ladministrator field.
DBSetProp('LV_LOGIN.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.ladministrator', 'Field', 'UpdateName', 'dbo.appusers.ladministrator')
DBSetProp('LV_LOGIN.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_LOGIN.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECFRMCAPTN","Administrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECDLGCAPTN","Administrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECGRDCAPTN","Administrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECRPTCAPTN","Administrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFEMTOOLTIP","Administrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Administrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.cgroup_id field.
DBSetProp('LV_LOGIN.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.cgroup_id', 'Field', 'UpdateName', 'dbo.appusers.cgroup_id')
DBSetProp('LV_LOGIN.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for LV_LOGIN.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.moldpasswords field.
DBSetProp('LV_LOGIN.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.moldpasswords', 'Field', 'UpdateName', 'dbo.appusers.moldpasswords')
DBSetProp('LV_LOGIN.moldpasswords', 'Field', 'DataType', "M")
*** DBCX Field Properties for LV_LOGIN.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Oldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Oldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Oldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Oldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Oldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Oldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.linactive field.
DBSetProp('LV_LOGIN.linactive', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.linactive', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.linactive', 'Field', 'UpdateName', 'dbo.appusers.linactive')
DBSetProp('LV_LOGIN.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_LOGIN.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECFRMCAPTN","Inactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECDLGCAPTN","Inactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECGRDCAPTN","Inactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECRPTCAPTN","Inactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFEMTOOLTIP","Inactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFEMSTATUSTXT","Inactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.timestamp_column field.
DBSetProp('LV_LOGIN.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.timestamp_column', 'Field', 'UpdateName', 'dbo.appusers.timestamp_column')
DBSetProp('LV_LOGIN.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_LOGIN.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.timestamp_column","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the LV_LOGIN.user_id field.
DBSetProp('LV_LOGIN.user_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGIN.user_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGIN.user_id', 'Field', 'UpdateName', 'dbo.appusers.User_Id')
DBSetProp('LV_LOGIN.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for LV_LOGIN.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGIN.user_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
