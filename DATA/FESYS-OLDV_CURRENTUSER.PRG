***************** Begin View Definition OLDV_CURRENTUSER ***************


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



CREATE SQL VIEW "OLDV_CURRENTUSER" ; 
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
	WHERE Appusers.cuserid = ( ?vp_cUserId )

DBSetProp('OLDV_CURRENTUSER', 'View', 'UpdateType', 1)
DBSetProp('OLDV_CURRENTUSER', 'View', 'WhereType', 3)
DBSetProp('OLDV_CURRENTUSER', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_CURRENTUSER', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_CURRENTUSER', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_CURRENTUSER', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_CURRENTUSER', 'View', 'Tables', 'fesys!appusers')
DBSetProp('OLDV_CURRENTUSER', 'View', 'Prepared', .F.)
DBSetProp('OLDV_CURRENTUSER', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_CURRENTUSER', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_CURRENTUSER', 'View', 'FetchSize', 100)
DBSetProp('OLDV_CURRENTUSER', 'View', 'ParameterList', "vp_cUserId,'C'")
DBSetProp('OLDV_CURRENTUSER', 'View', 'Comment', "")
DBSetProp('OLDV_CURRENTUSER', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_CURRENTUSER', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_CURRENTUSER
	GoExplorer.odbcx.Validate("OLDV_CURRENTUSER","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER","VIEW",;
		"VFECDESCRIPT","Oldv Currentuser Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cUserId
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECDESCRIPT","Vp Cuserid View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFENVPSIZE",30) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.vp_cUserId","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for OLDV_CURRENTUSER
*** Props for the OLDV_CURRENTUSER.cuserid field.
DBSetProp('OLDV_CURRENTUSER.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_CURRENTUSER.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.cuserid', 'Field', 'UpdateName', 'fesys!appusers.cuserid')
DBSetProp('OLDV_CURRENTUSER.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_CURRENTUSER.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.cfirst_name field.
DBSetProp('OLDV_CURRENTUSER.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.cfirst_name', 'Field', 'UpdateName', 'fesys!appusers.cfirst_name')
DBSetProp('OLDV_CURRENTUSER.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for OLDV_CURRENTUSER.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECFRMCAPTN","Cfirst Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECDLGCAPTN","Cfirst Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECGRDCAPTN","Cfirst Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECRPTCAPTN","Cfirst Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMTOOLTIP","Cfirst Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","Cfirst Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.clast_name field.
DBSetProp('OLDV_CURRENTUSER.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.clast_name', 'Field', 'UpdateName', 'fesys!appusers.clast_name')
DBSetProp('OLDV_CURRENTUSER.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for OLDV_CURRENTUSER.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECFRMCAPTN","Clast Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECDLGCAPTN","Clast Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECGRDCAPTN","Clast Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECRPTCAPTN","Clast Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFEMTOOLTIP","Clast Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFEMSTATUSTXT","Clast Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.cpassword field.
DBSetProp('OLDV_CURRENTUSER.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.cpassword', 'Field', 'UpdateName', 'fesys!appusers.cpassword')
DBSetProp('OLDV_CURRENTUSER.cpassword', 'Field', 'DataType', "C(30) NOCPTRANS")
*** DBCX Field Properties for OLDV_CURRENTUSER.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECFRMCAPTN","Cpassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECDLGCAPTN","Cpassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECGRDCAPTN","Cpassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECRPTCAPTN","Cpassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFEMTOOLTIP","Cpassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFEMSTATUSTXT","Cpassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.dlastchanged field.
DBSetProp('OLDV_CURRENTUSER.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.dlastchanged', 'Field', 'UpdateName', 'fesys!appusers.dlastchanged')
DBSetProp('OLDV_CURRENTUSER.dlastchanged', 'Field', 'DataType', "D")
*** DBCX Field Properties for OLDV_CURRENTUSER.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Dlastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Dlastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Dlastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Dlastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Dlastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Dlastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.ladministrator field.
DBSetProp('OLDV_CURRENTUSER.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.ladministrator', 'Field', 'UpdateName', 'fesys!appusers.ladministrator')
DBSetProp('OLDV_CURRENTUSER.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_CURRENTUSER.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECFRMCAPTN","Ladministrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECDLGCAPTN","Ladministrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECGRDCAPTN","Ladministrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECRPTCAPTN","Ladministrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMTOOLTIP","Ladministrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Ladministrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.cgroup_id field.
DBSetProp('OLDV_CURRENTUSER.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.cgroup_id', 'Field', 'UpdateName', 'fesys!appusers.cgroup_id')
DBSetProp('OLDV_CURRENTUSER.cgroup_id', 'Field', 'DataType', "C(16) NOCPTRANS")
*** DBCX Field Properties for OLDV_CURRENTUSER.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.moldpasswords field.
DBSetProp('OLDV_CURRENTUSER.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.moldpasswords', 'Field', 'UpdateName', 'fesys!appusers.moldpasswords')
DBSetProp('OLDV_CURRENTUSER.moldpasswords', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for OLDV_CURRENTUSER.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Moldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Moldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Moldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Moldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Moldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Moldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.linactive field.
DBSetProp('OLDV_CURRENTUSER.linactive', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.linactive', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.linactive', 'Field', 'UpdateName', 'fesys!appusers.linactive')
DBSetProp('OLDV_CURRENTUSER.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for OLDV_CURRENTUSER.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECFRMCAPTN","Linactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECDLGCAPTN","Linactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECGRDCAPTN","Linactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECRPTCAPTN","Linactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFEMTOOLTIP","Linactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFEMSTATUSTXT","Linactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTUSER.user_id field.
DBSetProp('OLDV_CURRENTUSER.user_id', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTUSER.user_id', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTUSER.user_id', 'Field', 'UpdateName', 'fesys!appusers.user_id')
DBSetProp('OLDV_CURRENTUSER.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for OLDV_CURRENTUSER.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTUSER.user_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
