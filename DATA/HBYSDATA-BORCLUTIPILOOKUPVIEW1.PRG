***************** Begin View Definition BORCLUTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "BORCLUTIPILOOKUPVIEW1" ; 
	AS SELECT Borclutipi.borclu_tipi;
	FROM hbysreferans!borclutipi

DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!borclutipi')
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCLUTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BORCLUTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("BORCLUTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Borclutipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BORCLUTIPILOOKUPVIEW1
*** Props for the BORCLUTIPILOOKUPVIEW1.borclu_tipi field.
DBSetProp('BORCLUTIPILOOKUPVIEW1.borclu_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW1.borclu_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW1.borclu_tipi', 'Field', 'UpdateName', 'hbysreferans!borclutipi.borclu_tipi')
DBSetProp('BORCLUTIPILOOKUPVIEW1.borclu_tipi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BORCLUTIPILOOKUPVIEW1.borclu_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECDESCRIPT","Borclu Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECFRMCAPTN","Borclu Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECDLGCAPTN","Borclu Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECGRDCAPTN","Borclu Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECRPTCAPTN","Borclu Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFEMTOOLTIP","Borclu Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFEMSTATUSTXT","Borclu Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW1.borclu_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
