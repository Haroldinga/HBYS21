***************** Begin View Definition CINSIYETLOOKUPVIEW ***************


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



CREATE SQL VIEW "CINSIYETLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Cinsiyet.Cinsiyeti;
	FROM dbo.Cinsiyet Cinsiyet

DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'Tables', 'dbo.Cinsiyet')
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('CINSIYETLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for CINSIYETLOOKUPVIEW
	GoExplorer.odbcx.Validate("CINSIYETLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Cinsiyetlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for CINSIYETLOOKUPVIEW
*** Props for the CINSIYETLOOKUPVIEW.cinsiyeti field.
DBSetProp('CINSIYETLOOKUPVIEW.cinsiyeti', 'Field', 'KeyField', .T.)
DBSetProp('CINSIYETLOOKUPVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('CINSIYETLOOKUPVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Cinsiyet.Cinsiyeti')
DBSetProp('CINSIYETLOOKUPVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for CINSIYETLOOKUPVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
