***************** Begin View Definition OLDV_LOGINS ***************


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



CREATE SQL VIEW "OLDV_LOGINS" ; 
	AS SELECT applogin.cuserid,;
		applogin.tloggedin,;
		applogin.tloggedout,;
		applogin.tcleared,;
		applogin.cclearedby;
	FROM fesys!applogin

DBSetProp('OLDV_LOGINS', 'View', 'UpdateType', 1)
DBSetProp('OLDV_LOGINS', 'View', 'WhereType', 3)
DBSetProp('OLDV_LOGINS', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_LOGINS', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_LOGINS', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_LOGINS', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_LOGINS', 'View', 'Tables', 'fesys!applogin')
DBSetProp('OLDV_LOGINS', 'View', 'Prepared', .F.)
DBSetProp('OLDV_LOGINS', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_LOGINS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_LOGINS', 'View', 'FetchSize', 100)
DBSetProp('OLDV_LOGINS', 'View', 'Comment', "")
DBSetProp('OLDV_LOGINS', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_LOGINS', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_LOGINS
	GoExplorer.odbcx.Validate("OLDV_LOGINS","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS","VIEW",;
		"VFECDESCRIPT","Oldv Logins Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_LOGINS
*** Props for the OLDV_LOGINS.cuserid field.
DBSetProp('OLDV_LOGINS.cuserid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_LOGINS.cuserid', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGINS.cuserid', 'Field', 'UpdateName', 'fesys!applogin.cuserid')
DBSetProp('OLDV_LOGINS.cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_LOGINS.cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECDESCRIPT","Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECFRMCAPTN","Cuserid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECDLGCAPTN","Cuserid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECGRDCAPTN","Cuserid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECRPTCAPTN","Cuserid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFEMTOOLTIP","Cuserid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFEMSTATUSTXT","Cuserid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cuserid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGINS.tloggedin field.
DBSetProp('OLDV_LOGINS.tloggedin', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_LOGINS.tloggedin', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGINS.tloggedin', 'Field', 'UpdateName', 'fesys!applogin.tloggedin')
DBSetProp('OLDV_LOGINS.tloggedin', 'Field', 'DataType', "T")
DBSetProp('OLDV_LOGINS.tloggedin', 'Field', 'DefaultValue', "DATETIME()")
*** DBCX Field Properties for OLDV_LOGINS.tloggedin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECDESCRIPT","Tloggedin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECFRMCAPTN","Tloggedin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECDLGCAPTN","Tloggedin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECGRDCAPTN","Tloggedin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECRPTCAPTN","Tloggedin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFEMTOOLTIP","Tloggedin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFEMSTATUSTXT","Tloggedin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedin","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGINS.tloggedout field.
DBSetProp('OLDV_LOGINS.tloggedout', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGINS.tloggedout', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGINS.tloggedout', 'Field', 'UpdateName', 'fesys!applogin.tloggedout')
DBSetProp('OLDV_LOGINS.tloggedout', 'Field', 'DataType', "T")
*** DBCX Field Properties for OLDV_LOGINS.tloggedout
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECDESCRIPT","Tloggedout Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECFRMCAPTN","Tloggedout") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECDLGCAPTN","Tloggedout") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECGRDCAPTN","Tloggedout") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECRPTCAPTN","Tloggedout") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFEMTOOLTIP","Tloggedout") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFEMSTATUSTXT","Tloggedout") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tloggedout","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGINS.tcleared field.
DBSetProp('OLDV_LOGINS.tcleared', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGINS.tcleared', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGINS.tcleared', 'Field', 'UpdateName', 'fesys!applogin.tcleared')
DBSetProp('OLDV_LOGINS.tcleared', 'Field', 'DataType', "T")
*** DBCX Field Properties for OLDV_LOGINS.tcleared
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECDESCRIPT","Tcleared Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECFRMCAPTN","Tcleared") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECDLGCAPTN","Tcleared") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECGRDCAPTN","Tcleared") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECRPTCAPTN","Tcleared") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFEMTOOLTIP","Tcleared") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFEMSTATUSTXT","Tcleared") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.tcleared","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_LOGINS.cclearedby field.
DBSetProp('OLDV_LOGINS.cclearedby', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_LOGINS.cclearedby', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_LOGINS.cclearedby', 'Field', 'UpdateName', 'fesys!applogin.cclearedby')
DBSetProp('OLDV_LOGINS.cclearedby', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for OLDV_LOGINS.cclearedby
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECDESCRIPT","Cclearedby Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECFRMCAPTN","Cclearedby") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECDLGCAPTN","Cclearedby") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECGRDCAPTN","Cclearedby") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECRPTCAPTN","Cclearedby") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFEMTOOLTIP","Cclearedby") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFEMSTATUSTXT","Cclearedby") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_LOGINS.cclearedby","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
