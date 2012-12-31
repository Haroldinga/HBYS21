***************** Begin View Definition OLDV_LOGIN ***************


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



CREATE SQL VIEW "OLDV_LOGIN" ; 
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
	FROM fesys!appusers;
	ORDER BY Appusers.cuserid

DBSetProp('OLDV_LOGIN', 'View', 'UpdateType', 1)
DBSetProp('OLDV_LOGIN', 'View', 'WhereType', 3)
DBSetProp('OLDV_LOGIN', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_LOGIN', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_LOGIN', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_LOGIN', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_LOGIN', 'View', 'Tables', 'fesys!appusers')
DBSetProp('OLDV_LOGIN', 'View', 'Prepared', .F.)
DBSetProp('OLDV_LOGIN', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_LOGIN', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_LOGIN', 'View', 'FetchSize', 100)
DBSetProp('OLDV_LOGIN', 'View', 'Comment', "")
DBSetProp('OLDV_LOGIN', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_LOGIN', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_LOGIN
	GoExplorer.odbcx.Validate("OLDV_LOGIN","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN","VIEW",;
		"VFECDESCRIPT","Oldv Login Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_LOGIN
*** Props for the OLDV_LOGIN.cuserid field.
DBSetProp('OLDV_LOGIN.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_LOGIN.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.cuserid', 'Field', 'UpdateName', 'fesys!appusers.cuserid')
DBSetProp('OLDV_LOGIN.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_LOGIN.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.cfirst_name field.
DBSetProp('OLDV_LOGIN.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.cfirst_name', 'Field', 'UpdateName', 'fesys!appusers.cfirst_name')
DBSetProp('OLDV_LOGIN.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for OLDV_LOGIN.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECFRMCAPTN","Cfirst Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECDLGCAPTN","Cfirst Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECGRDCAPTN","Cfirst Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECRPTCAPTN","Cfirst Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFEMTOOLTIP","Cfirst Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","Cfirst Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.clast_name field.
DBSetProp('OLDV_LOGIN.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.clast_name', 'Field', 'UpdateName', 'fesys!appusers.clast_name')
DBSetProp('OLDV_LOGIN.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for OLDV_LOGIN.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECFRMCAPTN","Clast Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECDLGCAPTN","Clast Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECGRDCAPTN","Clast Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECRPTCAPTN","Clast Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFEMTOOLTIP","Clast Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFEMSTATUSTXT","Clast Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.cpassword field.
DBSetProp('OLDV_LOGIN.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.cpassword', 'Field', 'UpdateName', 'fesys!appusers.cpassword')
DBSetProp('OLDV_LOGIN.cpassword', 'Field', 'DataType', "C(30) NOCPTRANS")
*** DBCX Field Properties for OLDV_LOGIN.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECFRMCAPTN","Cpassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECDLGCAPTN","Cpassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECGRDCAPTN","Cpassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECRPTCAPTN","Cpassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFEMTOOLTIP","Cpassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFEMSTATUSTXT","Cpassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.dlastchanged field.
DBSetProp('OLDV_LOGIN.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.dlastchanged', 'Field', 'UpdateName', 'fesys!appusers.dlastchanged')
DBSetProp('OLDV_LOGIN.dlastchanged', 'Field', 'DataType', "D")
*** DBCX Field Properties for OLDV_LOGIN.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Dlastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Dlastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Dlastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Dlastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Dlastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Dlastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.ladministrator field.
DBSetProp('OLDV_LOGIN.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.ladministrator', 'Field', 'UpdateName', 'fesys!appusers.ladministrator')
DBSetProp('OLDV_LOGIN.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_LOGIN.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECFRMCAPTN","Ladministrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECDLGCAPTN","Ladministrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECGRDCAPTN","Ladministrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECRPTCAPTN","Ladministrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFEMTOOLTIP","Ladministrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Ladministrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.cgroup_id field.
DBSetProp('OLDV_LOGIN.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.cgroup_id', 'Field', 'UpdateName', 'fesys!appusers.cgroup_id')
DBSetProp('OLDV_LOGIN.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_LOGIN.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.moldpasswords field.
DBSetProp('OLDV_LOGIN.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.moldpasswords', 'Field', 'UpdateName', 'fesys!appusers.moldpasswords')
DBSetProp('OLDV_LOGIN.moldpasswords', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for OLDV_LOGIN.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Moldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Moldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Moldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Moldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Moldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Moldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.linactive field.
DBSetProp('OLDV_LOGIN.linactive', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.linactive', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.linactive', 'Field', 'UpdateName', 'fesys!appusers.linactive')
DBSetProp('OLDV_LOGIN.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_LOGIN.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECFRMCAPTN","Linactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECDLGCAPTN","Linactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECGRDCAPTN","Linactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECRPTCAPTN","Linactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFEMTOOLTIP","Linactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFEMSTATUSTXT","Linactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGIN.user_id field.
DBSetProp('OLDV_LOGIN.user_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGIN.user_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGIN.user_id', 'Field', 'UpdateName', 'fesys!appusers.user_id')
DBSetProp('OLDV_LOGIN.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for OLDV_LOGIN.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGIN.user_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
