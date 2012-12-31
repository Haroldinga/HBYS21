***************** Begin View Definition USEREDITVIEW ***************


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



CREATE SQL VIEW "USEREDITVIEW" ; 
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
		Appusers.timestamp_column,;
		Appusers.User_Id;
	FROM dbo.appusers Appusers

DBSetProp('USEREDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('USEREDITVIEW', 'View', 'WhereType', 3)
DBSetProp('USEREDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('USEREDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('USEREDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('USEREDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('USEREDITVIEW', 'View', 'Tables', 'dbo.appusers')
DBSetProp('USEREDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('USEREDITVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('USEREDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('USEREDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('USEREDITVIEW', 'View', 'ParameterList', "vp_User_Id,'C'")
DBSetProp('USEREDITVIEW', 'View', 'Comment', "")
DBSetProp('USEREDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('USEREDITVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for USEREDITVIEW
	GoExplorer.odbcx.Validate("USEREDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW","VIEW",;
		"VFECDESCRIPT","Userview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_User_Id
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECDESCRIPT","Vp User Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.vp_User_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for USEREDITVIEW
*** Props for the USEREDITVIEW.cuserid field.
DBSetProp('USEREDITVIEW.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('USEREDITVIEW.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.cuserid', 'Field', 'UpdateName', 'dbo.appusers.cuserid')
DBSetProp('USEREDITVIEW.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for USEREDITVIEW.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.cfirst_name field.
DBSetProp('USEREDITVIEW.cfirst_name', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.cfirst_name', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.cfirst_name', 'Field', 'UpdateName', 'dbo.appusers.cfirst_name')
DBSetProp('USEREDITVIEW.cfirst_name', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for USEREDITVIEW.cfirst_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECDESCRIPT","Cfirst Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECFRMCAPTN","Cfirst Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECDLGCAPTN","Cfirst Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECGRDCAPTN","Cfirst Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECRPTCAPTN","Cfirst Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFEMTOOLTIP","Cfirst Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFEMSTATUSTXT","Cfirst Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cfirst_name","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.clast_name field.
DBSetProp('USEREDITVIEW.clast_name', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.clast_name', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.clast_name', 'Field', 'UpdateName', 'dbo.appusers.clast_name')
DBSetProp('USEREDITVIEW.clast_name', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for USEREDITVIEW.clast_name
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECDESCRIPT","Clast Name Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECFRMCAPTN","Clast Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECDLGCAPTN","Clast Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECGRDCAPTN","Clast Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECRPTCAPTN","Clast Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFEMTOOLTIP","Clast Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFEMSTATUSTXT","Clast Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.clast_name","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.cpassword field.
DBSetProp('USEREDITVIEW.cpassword', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.cpassword', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.cpassword', 'Field', 'UpdateName', 'dbo.appusers.cpassword')
DBSetProp('USEREDITVIEW.cpassword', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for USEREDITVIEW.cpassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECDESCRIPT","Cpassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECFRMCAPTN","Cpassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECDLGCAPTN","Cpassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECGRDCAPTN","Cpassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECRPTCAPTN","Cpassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFEMTOOLTIP","Cpassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFEMSTATUSTXT","Cpassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cpassword","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.dlastchanged field.
DBSetProp('USEREDITVIEW.dlastchanged', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.dlastchanged', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.dlastchanged', 'Field', 'UpdateName', 'dbo.appusers.dlastchanged')
DBSetProp('USEREDITVIEW.dlastchanged', 'Field', 'DataType', "T")
*** DBCX Field Properties for USEREDITVIEW.dlastchanged
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECDESCRIPT","Dlastchanged Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECFRMCAPTN","Dlastchanged") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECDLGCAPTN","Dlastchanged") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECGRDCAPTN","Dlastchanged") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECRPTCAPTN","Dlastchanged") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFEMTOOLTIP","Dlastchanged") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFEMSTATUSTXT","Dlastchanged") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.dlastchanged","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.ladministrator field.
DBSetProp('USEREDITVIEW.ladministrator', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.ladministrator', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.ladministrator', 'Field', 'UpdateName', 'dbo.appusers.ladministrator')
DBSetProp('USEREDITVIEW.ladministrator', 'Field', 'DataType', "L")
*** DBCX Field Properties for USEREDITVIEW.ladministrator
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECDESCRIPT","Ladministrator Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECFRMCAPTN","Ladministrator") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECDLGCAPTN","Ladministrator") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECGRDCAPTN","Ladministrator") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECRPTCAPTN","Ladministrator") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFEMTOOLTIP","Ladministrator") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFEMSTATUSTXT","Ladministrator") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.ladministrator","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.cgroup_id field.
DBSetProp('USEREDITVIEW.cgroup_id', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.cgroup_id', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.cgroup_id', 'Field', 'UpdateName', 'dbo.appusers.cgroup_id')
DBSetProp('USEREDITVIEW.cgroup_id', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for USEREDITVIEW.cgroup_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECDESCRIPT","Cgroup Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECFRMCAPTN","Cgroup Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECDLGCAPTN","Cgroup Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECGRDCAPTN","Cgroup Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECRPTCAPTN","Cgroup Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFEMTOOLTIP","Cgroup Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFEMSTATUSTXT","Cgroup Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.cgroup_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.moldpasswords field.
DBSetProp('USEREDITVIEW.moldpasswords', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.moldpasswords', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.moldpasswords', 'Field', 'UpdateName', 'dbo.appusers.moldpasswords')
DBSetProp('USEREDITVIEW.moldpasswords', 'Field', 'DataType', "M")
*** DBCX Field Properties for USEREDITVIEW.moldpasswords
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECDESCRIPT","Moldpasswords Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECFRMCAPTN","Moldpasswords") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECDLGCAPTN","Moldpasswords") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECGRDCAPTN","Moldpasswords") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECRPTCAPTN","Moldpasswords") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFEMTOOLTIP","Moldpasswords") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFEMSTATUSTXT","Moldpasswords") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.moldpasswords","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.linactive field.
DBSetProp('USEREDITVIEW.linactive', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.linactive', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.linactive', 'Field', 'UpdateName', 'dbo.appusers.linactive')
DBSetProp('USEREDITVIEW.linactive', 'Field', 'DataType', "L")
*** DBCX Field Properties for USEREDITVIEW.linactive
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECDESCRIPT","Linactive Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECFRMCAPTN","Linactive") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECDLGCAPTN","Linactive") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECGRDCAPTN","Linactive") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECRPTCAPTN","Linactive") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFEMTOOLTIP","Linactive") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFEMSTATUSTXT","Linactive") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.linactive","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.timestamp_column field.
DBSetProp('USEREDITVIEW.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.timestamp_column', 'Field', 'UpdateName', 'dbo.appusers.timestamp_column')
DBSetProp('USEREDITVIEW.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for USEREDITVIEW.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.timestamp_column","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the USEREDITVIEW.user_id field.
DBSetProp('USEREDITVIEW.user_id', 'Field', 'KeyField', .F.)
DBSetProp('USEREDITVIEW.user_id', 'Field', 'Updatable', .T.)
DBSetProp('USEREDITVIEW.user_id', 'Field', 'UpdateName', 'dbo.appusers.User_Id')
DBSetProp('USEREDITVIEW.user_id', 'Field', 'DataType', "C(36)")
DBSetProp('USEREDITVIEW.user_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for USEREDITVIEW.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!USEREDITVIEW.user_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
