***************** Begin View Definition DINLOOKUPVIEW1 ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\hbysreferans"
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



CREATE SQL VIEW "DINLOOKUPVIEW1" ; 
	AS SELECT Din.dini;
	FROM hbysreferans!din

DBSetProp('DINLOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('DINLOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('DINLOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('DINLOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('DINLOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('DINLOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('DINLOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!din')
DBSetProp('DINLOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('DINLOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('DINLOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DINLOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('DINLOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('DINLOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('DINLOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DINLOOKUPVIEW1
	GoExplorer.odbcx.Validate("DINLOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Dinlookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DINLOOKUPVIEW1
*** Props for the DINLOOKUPVIEW1.dini field.
DBSetProp('DINLOOKUPVIEW1.dini', 'Field', 'KeyField', .F.)
DBSetProp('DINLOOKUPVIEW1.dini', 'Field', 'Updatable', .T.)
DBSetProp('DINLOOKUPVIEW1.dini', 'Field', 'UpdateName', 'hbysreferans!din.dini')
DBSetProp('DINLOOKUPVIEW1.dini', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DINLOOKUPVIEW1.dini
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECDESCRIPT","Dini Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECFRMCAPTN","Dini") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECDLGCAPTN","Dini") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECGRDCAPTN","Dini") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECRPTCAPTN","Dini") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFEMTOOLTIP","Dini") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFEMSTATUSTXT","Dini") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DINLOOKUPVIEW1.dini","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
