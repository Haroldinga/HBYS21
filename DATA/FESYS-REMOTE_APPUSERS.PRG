***************** Begin View Definition REMOTE_APPUSERS ***************


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



CREATE SQL VIEW "REMOTE_APPUSERS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Appusers.cuserid,;
		Appusers.cfirst_name,;
		Appusers.clast_name,;
		Appusers.cpassword,;
		Appusers.dlastchanged,;
		Appusers.ladministrator,;
		Appusers.cgroup_id,;
		Appusers.moldpasswords,;
		Appusers.linactive,;
		Appusers.timestamp_column;
	FROM dbo.appusers Appusers

DBSetProp('REMOTE_APPUSERS', 'View', 'UpdateType', 1)
DBSetProp('REMOTE_APPUSERS', 'View', 'WhereType', 1)
DBSetProp('REMOTE_APPUSERS', 'View', 'FetchMemo', .T.)
DBSetProp('REMOTE_APPUSERS', 'View', 'SendUpdates', .T.)
DBSetProp('REMOTE_APPUSERS', 'View', 'UseMemoSize', 255)
DBSetProp('REMOTE_APPUSERS', 'View', 'MaxRecords', -1)
DBSetProp('REMOTE_APPUSERS', 'View', 'Tables', 'dbo.appusers')
DBSetProp('REMOTE_APPUSERS', 'View', 'Prepared', .F.)
DBSetProp('REMOTE_APPUSERS', 'View', 'CompareMemo', .T.)
DBSetProp('REMOTE_APPUSERS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REMOTE_APPUSERS', 'View', 'FetchSize', -1)
DBSetProp('REMOTE_APPUSERS', 'View', 'Comment', "")
DBSetProp('REMOTE_APPUSERS', 'View', 'BatchUpdateCount', 1)
DBSetProp('REMOTE_APPUSERS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REMOTE_APPUSERS
	GoExplorer.odbcx.Validate("REMOTE_APPUSERS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS","VIEW",;
		"VFECDESCRIPT","Remote Appusers Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for REMOTE_APPUSERS
*** Props for the REMOTE_APPUSERS.cuserid field.
DBSetProp('REMOTE_APPUSERS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('REMOTE_APPUSERS.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.cuserid', 'Field', 'UpdateName', 'dbo.appusers.cuserid')
DBSetProp('REMOTE_APPUSERS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for REMOTE_APPUSERS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.cfirst_name field.
DBSetProp('REMOTE_APPUSERS.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.cfirst_name', 'Field', 'UpdateName', 'dbo.appusers.cfirst_name')
DBSetProp('REMOTE_APPUSERS.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for REMOTE_APPUSERS.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECFRMCAPTN","Cfirst Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECDLGCAPTN","Cfirst Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECGRDCAPTN","Cfirst Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECRPTCAPTN","Cfirst Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFEMTOOLTIP","Cfirst Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","Cfirst Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.clast_name field.
DBSetProp('REMOTE_APPUSERS.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.clast_name', 'Field', 'UpdateName', 'dbo.appusers.clast_name')
DBSetProp('REMOTE_APPUSERS.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REMOTE_APPUSERS.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECFRMCAPTN","Clast Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECDLGCAPTN","Clast Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECGRDCAPTN","Clast Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECRPTCAPTN","Clast Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFEMTOOLTIP","Clast Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFEMSTATUSTXT","Clast Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.cpassword field.
DBSetProp('REMOTE_APPUSERS.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.cpassword', 'Field', 'UpdateName', 'dbo.appusers.cpassword')
DBSetProp('REMOTE_APPUSERS.cpassword', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for REMOTE_APPUSERS.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECFRMCAPTN","Cpassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECDLGCAPTN","Cpassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECGRDCAPTN","Cpassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECRPTCAPTN","Cpassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFEMTOOLTIP","Cpassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFEMSTATUSTXT","Cpassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.dlastchanged field.
DBSetProp('REMOTE_APPUSERS.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.dlastchanged', 'Field', 'UpdateName', 'dbo.appusers.dlastchanged')
DBSetProp('REMOTE_APPUSERS.dlastchanged', 'Field', 'DataType', "T")
*** DBCX Field Properties for REMOTE_APPUSERS.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Dlastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Dlastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Dlastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Dlastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Dlastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Dlastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.ladministrator field.
DBSetProp('REMOTE_APPUSERS.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.ladministrator', 'Field', 'UpdateName', 'dbo.appusers.ladministrator')
DBSetProp('REMOTE_APPUSERS.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for REMOTE_APPUSERS.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECFRMCAPTN","Ladministrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECDLGCAPTN","Ladministrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECGRDCAPTN","Ladministrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECRPTCAPTN","Ladministrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFEMTOOLTIP","Ladministrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Ladministrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.cgroup_id field.
DBSetProp('REMOTE_APPUSERS.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.cgroup_id', 'Field', 'UpdateName', 'dbo.appusers.cgroup_id')
DBSetProp('REMOTE_APPUSERS.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for REMOTE_APPUSERS.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.moldpasswords field.
DBSetProp('REMOTE_APPUSERS.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.moldpasswords', 'Field', 'UpdateName', 'dbo.appusers.moldpasswords')
DBSetProp('REMOTE_APPUSERS.moldpasswords', 'Field', 'DataType', "M")
*** DBCX Field Properties for REMOTE_APPUSERS.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Moldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Moldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Moldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Moldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Moldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Moldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.linactive field.
DBSetProp('REMOTE_APPUSERS.linactive', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.linactive', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.linactive', 'Field', 'UpdateName', 'dbo.appusers.linactive')
DBSetProp('REMOTE_APPUSERS.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for REMOTE_APPUSERS.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECFRMCAPTN","Linactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECDLGCAPTN","Linactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECGRDCAPTN","Linactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECRPTCAPTN","Linactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFEMTOOLTIP","Linactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFEMSTATUSTXT","Linactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPUSERS.timestamp_column field.
DBSetProp('REMOTE_APPUSERS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPUSERS.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPUSERS.timestamp_column', 'Field', 'UpdateName', 'dbo.appusers.timestamp_column')
DBSetProp('REMOTE_APPUSERS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for REMOTE_APPUSERS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPUSERS.timestamp_column","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
