***************** Begin View Definition LV_CURRENTLOGINS ***************


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



CREATE SQL VIEW "LV_CURRENTLOGINS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT applogin.cuserid,;
		applogin.tloggedin,;
		applogin.tloggedout,;
		applogin.tcleared,;
		applogin.cclearedby,;
		applogin.timestamp_column;
	FROM dbo.applogin Applogin;
	WHERE ( Applogin.cuserid = ( ?vp_cUserId ) AND;
		Applogin.tloggedout IS NULL ) AND Applogin.tcleared IS NULL;
	ORDER BY Applogin.tloggedin DESC

DBSetProp('LV_CURRENTLOGINS', 'View', 'UpdateType', 1)
DBSetProp('LV_CURRENTLOGINS', 'View', 'WhereType', 3)
DBSetProp('LV_CURRENTLOGINS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_CURRENTLOGINS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_CURRENTLOGINS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_CURRENTLOGINS', 'View', 'MaxRecords', -1)
DBSetProp('LV_CURRENTLOGINS', 'View', 'Tables', 'dbo.applogin')
DBSetProp('LV_CURRENTLOGINS', 'View', 'Prepared', .F.)
DBSetProp('LV_CURRENTLOGINS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_CURRENTLOGINS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_CURRENTLOGINS', 'View', 'FetchSize', -1)
DBSetProp('LV_CURRENTLOGINS', 'View', 'ParameterList', "vp_cUserId,'C'")
DBSetProp('LV_CURRENTLOGINS', 'View', 'Comment', "")
DBSetProp('LV_CURRENTLOGINS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_CURRENTLOGINS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_CURRENTLOGINS
	GoExplorer.odbcx.Validate("LV_CURRENTLOGINS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS","VIEW",;
		"VFECDESCRIPT","Lv Currentlogins Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cUserId
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECDESCRIPT","Vp Cuserid View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFENVPSIZE",30) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for LV_CURRENTLOGINS
*** Props for the LV_CURRENTLOGINS.cuserid field.
DBSetProp('LV_CURRENTLOGINS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('LV_CURRENTLOGINS.cuserid', 'Field', 'Updatable', .F.)
DBSetProp('LV_CURRENTLOGINS.cuserid', 'Field', 'UpdateName', 'dbo.applogin.cuserid')
DBSetProp('LV_CURRENTLOGINS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_CURRENTLOGINS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECGRDCAPTN","Userid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECRPTCAPTN","Userid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTLOGINS.tloggedin field.
DBSetProp('LV_CURRENTLOGINS.tloggedin', 'Field', 'KeyField', .T.)
DBSetProp('LV_CURRENTLOGINS.tloggedin', 'Field', 'Updatable', .F.)
DBSetProp('LV_CURRENTLOGINS.tloggedin', 'Field', 'UpdateName', 'dbo.applogin.tloggedin')
DBSetProp('LV_CURRENTLOGINS.tloggedin', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_CURRENTLOGINS.tloggedin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECDESCRIPT","Tloggedin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECFRMCAPTN","Loggedin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECDLGCAPTN","Loggedin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECGRDCAPTN","Loggedin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECRPTCAPTN","Loggedin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMTOOLTIP","Loggedin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMSTATUSTXT","Loggedin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTLOGINS.tloggedout field.
DBSetProp('LV_CURRENTLOGINS.tloggedout', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTLOGINS.tloggedout', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTLOGINS.tloggedout', 'Field', 'UpdateName', 'dbo.applogin.tloggedout')
DBSetProp('LV_CURRENTLOGINS.tloggedout', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_CURRENTLOGINS.tloggedout
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECDESCRIPT","Tloggedout Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECFRMCAPTN","Loggedout") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECDLGCAPTN","Loggedout") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECGRDCAPTN","Loggedout") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECRPTCAPTN","Loggedout") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMTOOLTIP","Loggedout") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMSTATUSTXT","Loggedout") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTLOGINS.tcleared field.
DBSetProp('LV_CURRENTLOGINS.tcleared', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTLOGINS.tcleared', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTLOGINS.tcleared', 'Field', 'UpdateName', 'dbo.applogin.tcleared')
DBSetProp('LV_CURRENTLOGINS.tcleared', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_CURRENTLOGINS.tcleared
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECDESCRIPT","Tcleared Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECFRMCAPTN","Cleared") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECDLGCAPTN","Cleared") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECGRDCAPTN","Cleared") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECRPTCAPTN","Cleared") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMTOOLTIP","Cleared") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMSTATUSTXT","Cleared") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.tcleared","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTLOGINS.cclearedby field.
DBSetProp('LV_CURRENTLOGINS.cclearedby', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTLOGINS.cclearedby', 'Field', 'Updatable', .T.)
DBSetProp('LV_CURRENTLOGINS.cclearedby', 'Field', 'UpdateName', 'dbo.applogin.cclearedby')
DBSetProp('LV_CURRENTLOGINS.cclearedby', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_CURRENTLOGINS.cclearedby
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECDESCRIPT","Cclearedby Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECFRMCAPTN","Clearedby") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECDLGCAPTN","Clearedby") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECGRDCAPTN","Clearedby") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECRPTCAPTN","Clearedby") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMTOOLTIP","Clearedby") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMSTATUSTXT","Clearedby") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_CURRENTLOGINS.timestamp_column field.
DBSetProp('LV_CURRENTLOGINS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_CURRENTLOGINS.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_CURRENTLOGINS.timestamp_column', 'Field', 'UpdateName', 'dbo.applogin.timestamp_column')
DBSetProp('LV_CURRENTLOGINS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_CURRENTLOGINS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_CURRENTLOGINS.timestamp_column","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
