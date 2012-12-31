***************** Begin View Definition OLDV_USERS ***************


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



CREATE SQL VIEW "OLDV_USERS" ; 
	AS SELECT appusers.cuserid,;
		appusers.cfirst_name,;
		appusers.clast_name,;
		appusers.cpassword,;
		appusers.dlastchanged,;
		appusers.ladministrator,;
		appusers.cgroup_id,;
		appusers.moldpasswords,;
		appusers.linactive,;
		appusers.user_id;
	FROM fesys!appusers

DBSetProp('OLDV_USERS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_USERS', 'View', 'WhereType', 3)
DBSetProp('OLDV_USERS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_USERS', 'View', 'SendUpdates', .F.)
DBSetProp('OLDV_USERS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_USERS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_USERS', 'View', 'Tables', 'fesys!appusers')
DBSetProp('OLDV_USERS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_USERS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_USERS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_USERS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_USERS', 'View', 'Comment', "")
DBSetProp('OLDV_USERS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_USERS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_USERS
	GoExplorer.odbcx.Validate("OLDV_USERS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS","VIEW",;
		"VFECDESCRIPT","Oldv Users Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_USERS
*** Props for the OLDV_USERS.cuserid field.
DBSetProp('OLDV_USERS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_USERS.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.cuserid', 'Field', 'UpdateName', 'fesys!appusers.cuserid')
DBSetProp('OLDV_USERS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_USERS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.cfirst_name field.
DBSetProp('OLDV_USERS.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.cfirst_name', 'Field', 'UpdateName', 'fesys!appusers.cfirst_name')
DBSetProp('OLDV_USERS.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for OLDV_USERS.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECFRMCAPTN","Cfirst Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECDLGCAPTN","Cfirst Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECGRDCAPTN","Cfirst Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECRPTCAPTN","Cfirst Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFEMTOOLTIP","Cfirst Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","Cfirst Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.clast_name field.
DBSetProp('OLDV_USERS.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.clast_name', 'Field', 'UpdateName', 'fesys!appusers.clast_name')
DBSetProp('OLDV_USERS.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for OLDV_USERS.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECFRMCAPTN","Clast Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECDLGCAPTN","Clast Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECGRDCAPTN","Clast Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECRPTCAPTN","Clast Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFEMTOOLTIP","Clast Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFEMSTATUSTXT","Clast Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.cpassword field.
DBSetProp('OLDV_USERS.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.cpassword', 'Field', 'UpdateName', 'fesys!appusers.cpassword')
DBSetProp('OLDV_USERS.cpassword', 'Field', 'DataType', "C(30) NOCPTRANS")
*** DBCX Field Properties for OLDV_USERS.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECFRMCAPTN","Cpassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECDLGCAPTN","Cpassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECGRDCAPTN","Cpassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECRPTCAPTN","Cpassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFEMTOOLTIP","Cpassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFEMSTATUSTXT","Cpassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.dlastchanged field.
DBSetProp('OLDV_USERS.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.dlastchanged', 'Field', 'UpdateName', 'fesys!appusers.dlastchanged')
DBSetProp('OLDV_USERS.dlastchanged', 'Field', 'DataType', "D")
*** DBCX Field Properties for OLDV_USERS.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Dlastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Dlastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Dlastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Dlastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Dlastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Dlastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.ladministrator field.
DBSetProp('OLDV_USERS.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.ladministrator', 'Field', 'UpdateName', 'fesys!appusers.ladministrator')
DBSetProp('OLDV_USERS.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_USERS.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECFRMCAPTN","Ladministrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECDLGCAPTN","Ladministrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECGRDCAPTN","Ladministrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECRPTCAPTN","Ladministrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFEMTOOLTIP","Ladministrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Ladministrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.cgroup_id field.
DBSetProp('OLDV_USERS.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.cgroup_id', 'Field', 'UpdateName', 'fesys!appusers.cgroup_id')
DBSetProp('OLDV_USERS.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_USERS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.moldpasswords field.
DBSetProp('OLDV_USERS.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.moldpasswords', 'Field', 'UpdateName', 'fesys!appusers.moldpasswords')
DBSetProp('OLDV_USERS.moldpasswords', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for OLDV_USERS.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Moldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Moldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Moldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Moldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Moldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Moldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.linactive field.
DBSetProp('OLDV_USERS.linactive', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.linactive', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.linactive', 'Field', 'UpdateName', 'fesys!appusers.linactive')
DBSetProp('OLDV_USERS.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_USERS.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECFRMCAPTN","Linactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECDLGCAPTN","Linactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECGRDCAPTN","Linactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECRPTCAPTN","Linactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFEMTOOLTIP","Linactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFEMSTATUSTXT","Linactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the OLDV_USERS.user_id field.
DBSetProp('OLDV_USERS.user_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_USERS.user_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_USERS.user_id', 'Field', 'UpdateName', 'fesys!appusers.user_id')
DBSetProp('OLDV_USERS.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for OLDV_USERS.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_USERS.user_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
