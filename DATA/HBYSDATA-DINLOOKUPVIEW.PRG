***************** Begin View Definition DINLOOKUPVIEW ***************


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



CREATE SQL VIEW "DINLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Din.Dini;
	FROM dbo.Din Din

DBSetProp('DINLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DINLOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('DINLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DINLOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('DINLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DINLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DINLOOKUPVIEW', 'View', 'Tables', 'dbo.Din')
DBSetProp('DINLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DINLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DINLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DINLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('DINLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DINLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DINLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DINLOOKUPVIEW
	GoExplorer.odbcx.Validate("DINLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Dinlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DINLOOKUPVIEW
*** Props for the DINLOOKUPVIEW.dini field.
DBSetProp('DINLOOKUPVIEW.dini', 'Field', 'KeyField', .T.)
DBSetProp('DINLOOKUPVIEW.dini', 'Field', 'Updatable', .T.)
DBSetProp('DINLOOKUPVIEW.dini', 'Field', 'UpdateName', 'dbo.Din.Dini')
DBSetProp('DINLOOKUPVIEW.dini', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DINLOOKUPVIEW.dini
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECDESCRIPT","Dini Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECFRMCAPTN","Dini") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECDLGCAPTN","Dini") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECGRDCAPTN","Dini") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECRPTCAPTN","Dini") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFEMTOOLTIP","Dini") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFEMSTATUSTXT","Dini") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW.dini","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
