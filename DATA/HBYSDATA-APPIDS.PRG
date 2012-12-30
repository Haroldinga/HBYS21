***************** Begin View Definition APPIDS ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "APPIDS" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Appids.cKeyName,;
		Appids.cValue;
	FROM dbo.AppIds Appids;
	WHERE Appids.cKeyName LIKE ?vp_cKeyName

DBSetProp('APPIDS', 'View', 'UpdateType', 1)
DBSetProp('APPIDS', 'View', 'WhereType', 3)
DBSetProp('APPIDS', 'View', 'FetchMemo', .T.)
DBSetProp('APPIDS', 'View', 'SendUpdates', .T.)
DBSetProp('APPIDS', 'View', 'UseMemoSize', 255)
DBSetProp('APPIDS', 'View', 'MaxRecords', -1)
DBSetProp('APPIDS', 'View', 'Tables', 'dbo.AppIds')
DBSetProp('APPIDS', 'View', 'Prepared', .F.)
DBSetProp('APPIDS', 'View', 'CompareMemo', .T.)
DBSetProp('APPIDS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('APPIDS', 'View', 'FetchSize', -1)
DBSetProp('APPIDS', 'View', 'ParameterList', "vp_cKeyName,'C'")
DBSetProp('APPIDS', 'View', 'Comment', "")
DBSetProp('APPIDS', 'View', 'BatchUpdateCount', 1)
DBSetProp('APPIDS', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for APPIDS
	GoExplorer.odbcx.Validate("APPIDS","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS","VIEW",;
		"VFECDESCRIPT","Appids Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cKeyName
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECDESCRIPT","Vp Ckeyname View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECFRMCAPTN","Ckeyname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECDLGCAPTN","Ckeyname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFENVPSIZE",60) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFEMTOOLTIP","Ckeyname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFEMSTATUSTXT","Ckeyname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.vp_cKeyName","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for APPIDS
*** Props for the APPIDS.ckeyname field.
DBSetProp('APPIDS.ckeyname', 'Field', 'KeyField', .T.)
DBSetProp('APPIDS.ckeyname', 'Field', 'Updatable', .T.)
DBSetProp('APPIDS.ckeyname', 'Field', 'UpdateName', 'dbo.AppIds.cKeyName')
DBSetProp('APPIDS.ckeyname', 'Field', 'DataType', "C(60)")
*** DBCX Field Properties for APPIDS.ckeyname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECDESCRIPT","Ckeyname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECFRMCAPTN","Ckeyname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECDLGCAPTN","Ckeyname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECGRDCAPTN","Ckeyname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECRPTCAPTN","Ckeyname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFEMTOOLTIP","Ckeyname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFEMSTATUSTXT","Ckeyname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.ckeyname","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the APPIDS.cvalue field.
DBSetProp('APPIDS.cvalue', 'Field', 'KeyField', .F.)
DBSetProp('APPIDS.cvalue', 'Field', 'Updatable', .T.)
DBSetProp('APPIDS.cvalue', 'Field', 'UpdateName', 'dbo.AppIds.cValue')
DBSetProp('APPIDS.cvalue', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for APPIDS.cvalue
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECDESCRIPT","Cvalue Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECFRMCAPTN","Cvalue") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECDLGCAPTN","Cvalue") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECGRDCAPTN","Cvalue") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECRPTCAPTN","Cvalue") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFEMTOOLTIP","Cvalue") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFEMSTATUSTXT","Cvalue") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!APPIDS.cvalue","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
