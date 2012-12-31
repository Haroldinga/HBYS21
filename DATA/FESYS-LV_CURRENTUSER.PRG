***************** Begin View Definition LV_CURRENTUSER ***************


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



CREATE SQL VIEW "LV_CURRENTUSER" ; 
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
	WHERE Appusers.cuserid = ( ?vp_cUserId )

DBSetProp('LV_CURRENTUSER', 'View', 'UpdateType', 1)
DBSetProp('LV_CURRENTUSER', 'View', 'WhereType', 3)
DBSetProp('LV_CURRENTUSER', 'View', 'FetchMemo', .T.)
DBSetProp('LV_CURRENTUSER', 'View', 'SendUpdates', .T.)
DBSetProp('LV_CURRENTUSER', 'View', 'UseMemoSize', 255)
DBSetProp('LV_CURRENTUSER', 'View', 'MaxRecords', -1)
DBSetProp('LV_CURRENTUSER', 'View', 'Tables', 'dbo.appusers')
DBSetProp('LV_CURRENTUSER', 'View', 'Prepared', .F.)
DBSetProp('LV_CURRENTUSER', 'View', 'CompareMemo', .T.)
DBSetProp('LV_CURRENTUSER', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_CURRENTUSER', 'View', 'FetchSize', -1)
DBSetProp('LV_CURRENTUSER', 'View', 'ParameterList', "vp_cUserId,'C'")
DBSetProp('LV_CURRENTUSER', 'View', 'Comment', "")
DBSetProp('LV_CURRENTUSER', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_CURRENTUSER', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_CURRENTUSER
	GoExplorer.odbcx.Validate("LV_CURRENTUSER","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER","VIEW",;
		"VFECDESCRIPT","Lv Currentuser Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cUserId
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECDESCRIPT","Vp Cuserid View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFENVPSIZE",30) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for LV_CURRENTUSER
*** Props for the LV_CURRENTUSER.cuserid field.
DBSetProp('LV_CURRENTUSER.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('LV_CURRENTUSER.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.cuserid', 'Field', 'UpdateName', 'dbo.appusers.cuserid')
DBSetProp('LV_CURRENTUSER.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_CURRENTUSER.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECGRDCAPTN","Userid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECRPTCAPTN","Userid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.cfirst_name field.
DBSetProp('LV_CURRENTUSER.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.cfirst_name', 'Field', 'UpdateName', 'dbo.appusers.cfirst_name')
DBSetProp('LV_CURRENTUSER.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for LV_CURRENTUSER.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECFRMCAPTN","First Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECDLGCAPTN","First Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECGRDCAPTN","First Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECRPTCAPTN","First Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMTOOLTIP","First Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","First Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.clast_name field.
DBSetProp('LV_CURRENTUSER.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.clast_name', 'Field', 'UpdateName', 'dbo.appusers.clast_name')
DBSetProp('LV_CURRENTUSER.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for LV_CURRENTUSER.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECFRMCAPTN","Last Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECDLGCAPTN","Last Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECGRDCAPTN","Last Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECRPTCAPTN","Last Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFEMTOOLTIP","Last Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFEMSTATUSTXT","Last Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.cpassword field.
DBSetProp('LV_CURRENTUSER.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.cpassword', 'Field', 'UpdateName', 'dbo.appusers.cpassword')
DBSetProp('LV_CURRENTUSER.cpassword', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_CURRENTUSER.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECFRMCAPTN","Password") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECDLGCAPTN","Password") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECGRDCAPTN","Password") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECRPTCAPTN","Password") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFEMTOOLTIP","Password") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFEMSTATUSTXT","Password") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.dlastchanged field.
DBSetProp('LV_CURRENTUSER.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.dlastchanged', 'Field', 'UpdateName', 'dbo.appusers.dlastchanged')
DBSetProp('LV_CURRENTUSER.dlastchanged', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_CURRENTUSER.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Lastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Lastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Lastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Lastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Lastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Lastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.ladministrator field.
DBSetProp('LV_CURRENTUSER.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.ladministrator', 'Field', 'UpdateName', 'dbo.appusers.ladministrator')
DBSetProp('LV_CURRENTUSER.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_CURRENTUSER.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECFRMCAPTN","Administrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECDLGCAPTN","Administrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECGRDCAPTN","Administrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECRPTCAPTN","Administrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMTOOLTIP","Administrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Administrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.cgroup_id field.
DBSetProp('LV_CURRENTUSER.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.cgroup_id', 'Field', 'UpdateName', 'dbo.appusers.cgroup_id')
DBSetProp('LV_CURRENTUSER.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for LV_CURRENTUSER.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Group Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Group Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Group Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Group Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Group Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Group Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.moldpasswords field.
DBSetProp('LV_CURRENTUSER.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.moldpasswords', 'Field', 'UpdateName', 'dbo.appusers.moldpasswords')
DBSetProp('LV_CURRENTUSER.moldpasswords', 'Field', 'DataType', "M")
*** DBCX Field Properties for LV_CURRENTUSER.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Oldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Oldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Oldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Oldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Oldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Oldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.linactive field.
DBSetProp('LV_CURRENTUSER.linactive', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.linactive', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.linactive', 'Field', 'UpdateName', 'dbo.appusers.linactive')
DBSetProp('LV_CURRENTUSER.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_CURRENTUSER.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECFRMCAPTN","Inactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECDLGCAPTN","Inactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECGRDCAPTN","Inactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECRPTCAPTN","Inactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFEMTOOLTIP","Inactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFEMSTATUSTXT","Inactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.timestamp_column field.
DBSetProp('LV_CURRENTUSER.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.timestamp_column', 'Field', 'UpdateName', 'dbo.appusers.timestamp_column')
DBSetProp('LV_CURRENTUSER.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_CURRENTUSER.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.timestamp_column","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTUSER.user_id field.
DBSetProp('LV_CURRENTUSER.user_id', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTUSER.user_id', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTUSER.user_id', 'Field', 'UpdateName', 'dbo.appusers.User_Id')
DBSetProp('LV_CURRENTUSER.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for LV_CURRENTUSER.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTUSER.user_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
