***************** Begin View Definition OLDV_CURRENTLOGINS ***************


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



CREATE SQL VIEW "OLDV_CURRENTLOGINS" ; 
	AS SELECT applogin.cuserid,;
		applogin.tloggedin,;
		applogin.tloggedout,;
		applogin.tcleared,;
		applogin.cclearedby;
	FROM fesys!applogin;
	WHERE Applogin.cuserid = ?vp_cUserId AND;
		Applogin.tloggedout = { / / } AND Applogin.tcleared = { / / };
	ORDER BY Applogin.tloggedin DESC

DBSetProp('OLDV_CURRENTLOGINS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'WhereType', 3)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'Tables', 'fesys!applogin')
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'ParameterList', "vp_cUserId,'C'")
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'Comment', "")
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_CURRENTLOGINS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_CURRENTLOGINS
	GoExplorer.odbcx.Validate("OLDV_CURRENTLOGINS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS","VIEW",;
		"VFECDESCRIPT","Oldv Currentlogins Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cUserId
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECDESCRIPT","Vp Cuserid View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFENVPSIZE",30) &&Size
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.vp_cUserId","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for OLDV_CURRENTLOGINS
*** Props for the OLDV_CURRENTLOGINS.cuserid field.
DBSetProp('OLDV_CURRENTLOGINS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_CURRENTLOGINS.cuserid', 'Field', 'Updatable', .F.)
DBSetProp('OLDV_CURRENTLOGINS.cuserid', 'Field', 'UpdateName', 'fesys!applogin.cuserid')
DBSetProp('OLDV_CURRENTLOGINS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_CURRENTLOGINS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTLOGINS.tloggedin field.
DBSetProp('OLDV_CURRENTLOGINS.tloggedin', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_CURRENTLOGINS.tloggedin', 'Field', 'Updatable', .F.)
DBSetProp('OLDV_CURRENTLOGINS.tloggedin', 'Field', 'UpdateName', 'fesys!applogin.tloggedin')
DBSetProp('OLDV_CURRENTLOGINS.tloggedin', 'Field', 'DataType', "T")
*** DBCX Field Properties for OLDV_CURRENTLOGINS.tloggedin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECDESCRIPT","Tloggedin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECFRMCAPTN","Tloggedin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECDLGCAPTN","Tloggedin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECGRDCAPTN","Tloggedin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECRPTCAPTN","Tloggedin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMTOOLTIP","Tloggedin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMSTATUSTXT","Tloggedin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedin","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTLOGINS.tloggedout field.
DBSetProp('OLDV_CURRENTLOGINS.tloggedout', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTLOGINS.tloggedout', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTLOGINS.tloggedout', 'Field', 'UpdateName', 'fesys!applogin.tloggedout')
DBSetProp('OLDV_CURRENTLOGINS.tloggedout', 'Field', 'DataType', "T")
*** DBCX Field Properties for OLDV_CURRENTLOGINS.tloggedout
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECDESCRIPT","Tloggedout Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECFRMCAPTN","Tloggedout") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECDLGCAPTN","Tloggedout") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECGRDCAPTN","Tloggedout") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECRPTCAPTN","Tloggedout") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMTOOLTIP","Tloggedout") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMSTATUSTXT","Tloggedout") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tloggedout","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTLOGINS.tcleared field.
DBSetProp('OLDV_CURRENTLOGINS.tcleared', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTLOGINS.tcleared', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTLOGINS.tcleared', 'Field', 'UpdateName', 'fesys!applogin.tcleared')
DBSetProp('OLDV_CURRENTLOGINS.tcleared', 'Field', 'DataType', "T")
*** DBCX Field Properties for OLDV_CURRENTLOGINS.tcleared
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECDESCRIPT","Tcleared Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECFRMCAPTN","Tcleared") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECDLGCAPTN","Tcleared") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECGRDCAPTN","Tcleared") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECRPTCAPTN","Tcleared") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMTOOLTIP","Tcleared") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMSTATUSTXT","Tcleared") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.tcleared","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_CURRENTLOGINS.cclearedby field.
DBSetProp('OLDV_CURRENTLOGINS.cclearedby', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_CURRENTLOGINS.cclearedby', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_CURRENTLOGINS.cclearedby', 'Field', 'UpdateName', 'fesys!applogin.cclearedby')
DBSetProp('OLDV_CURRENTLOGINS.cclearedby', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_CURRENTLOGINS.cclearedby
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECDESCRIPT","Cclearedby Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECFRMCAPTN","Cclearedby") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECDLGCAPTN","Cclearedby") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECGRDCAPTN","Cclearedby") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECRPTCAPTN","Cclearedby") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMTOOLTIP","Cclearedby") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMSTATUSTXT","Cclearedby") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_CURRENTLOGINS.cclearedby","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
