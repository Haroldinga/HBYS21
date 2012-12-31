***************** Begin View Definition LV_LOGINS ***************


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



CREATE SQL VIEW "LV_LOGINS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT applogin.cuserid,;
		applogin.tloggedin,;
		applogin.tloggedout,;
		applogin.tcleared,;
		applogin.cclearedby,;
		applogin.timestamp_column;
	FROM dbo.applogin Applogin

DBSetProp('LV_LOGINS', 'View', 'UpdateType', 1)
DBSetProp('LV_LOGINS', 'View', 'WhereType', 3)
DBSetProp('LV_LOGINS', 'View', 'FetchMemo', .T.)
DBSetProp('LV_LOGINS', 'View', 'SendUpdates', .T.)
DBSetProp('LV_LOGINS', 'View', 'UseMemoSize', 255)
DBSetProp('LV_LOGINS', 'View', 'MaxRecords', -1)
DBSetProp('LV_LOGINS', 'View', 'Tables', 'dbo.applogin')
DBSetProp('LV_LOGINS', 'View', 'Prepared', .F.)
DBSetProp('LV_LOGINS', 'View', 'CompareMemo', .T.)
DBSetProp('LV_LOGINS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_LOGINS', 'View', 'FetchSize', -1)
DBSetProp('LV_LOGINS', 'View', 'Comment', "")
DBSetProp('LV_LOGINS', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_LOGINS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_LOGINS
	GoExplorer.odbcx.Validate("LV_LOGINS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS","VIEW",;
		"VFECDESCRIPT","Lv Logins Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_LOGINS
*** Props for the LV_LOGINS.cuserid field.
DBSetProp('LV_LOGINS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('LV_LOGINS.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGINS.cuserid', 'Field', 'UpdateName', 'dbo.applogin.cuserid')
DBSetProp('LV_LOGINS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_LOGINS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECFRMCAPTN","Userid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECDLGCAPTN","Userid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECGRDCAPTN","Userid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECRPTCAPTN","Userid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFEMTOOLTIP","Userid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Userid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_LOGINS.tloggedin field.
DBSetProp('LV_LOGINS.tloggedin', 'Field', 'KeyField', .T.)
DBSetProp('LV_LOGINS.tloggedin', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGINS.tloggedin', 'Field', 'UpdateName', 'dbo.applogin.tloggedin')
DBSetProp('LV_LOGINS.tloggedin', 'Field', 'DataType', "T")
DBSetProp('LV_LOGINS.tloggedin', 'Field', 'DefaultValue', "DATETIME()")
*** DBCX Field Properties for LV_LOGINS.tloggedin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECDESCRIPT","Tloggedin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECFRMCAPTN","Loggedin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECDLGCAPTN","Loggedin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECGRDCAPTN","Loggedin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECRPTCAPTN","Loggedin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFEMTOOLTIP","Loggedin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFEMSTATUSTXT","Loggedin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedin","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_LOGINS.tloggedout field.
DBSetProp('LV_LOGINS.tloggedout', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGINS.tloggedout', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGINS.tloggedout', 'Field', 'UpdateName', 'dbo.applogin.tloggedout')
DBSetProp('LV_LOGINS.tloggedout', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_LOGINS.tloggedout
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECDESCRIPT","Tloggedout Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECFRMCAPTN","Loggedout") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECDLGCAPTN","Loggedout") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECGRDCAPTN","Loggedout") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECRPTCAPTN","Loggedout") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFEMTOOLTIP","Loggedout") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFEMSTATUSTXT","Loggedout") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tloggedout","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_LOGINS.tcleared field.
DBSetProp('LV_LOGINS.tcleared', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGINS.tcleared', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGINS.tcleared', 'Field', 'UpdateName', 'dbo.applogin.tcleared')
DBSetProp('LV_LOGINS.tcleared', 'Field', 'DataType', "T")
*** DBCX Field Properties for LV_LOGINS.tcleared
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECDESCRIPT","Tcleared Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECFRMCAPTN","Cleared") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECDLGCAPTN","Cleared") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECGRDCAPTN","Cleared") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECRPTCAPTN","Cleared") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFEMTOOLTIP","Cleared") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFEMSTATUSTXT","Cleared") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.tcleared","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_LOGINS.cclearedby field.
DBSetProp('LV_LOGINS.cclearedby', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGINS.cclearedby', 'Field', 'Updatable', .T.)
DBSetProp('LV_LOGINS.cclearedby', 'Field', 'UpdateName', 'dbo.applogin.cclearedby')
DBSetProp('LV_LOGINS.cclearedby', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for LV_LOGINS.cclearedby
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECDESCRIPT","Cclearedby Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECFRMCAPTN","Clearedby") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECDLGCAPTN","Clearedby") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECGRDCAPTN","Clearedby") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECRPTCAPTN","Clearedby") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFEMTOOLTIP","Clearedby") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFEMSTATUSTXT","Clearedby") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.cclearedby","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_LOGINS.timestamp_column field.
DBSetProp('LV_LOGINS.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_LOGINS.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_LOGINS.timestamp_column', 'Field', 'UpdateName', 'dbo.applogin.timestamp_column')
DBSetProp('LV_LOGINS.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_LOGINS.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_LOGINS.timestamp_column","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
