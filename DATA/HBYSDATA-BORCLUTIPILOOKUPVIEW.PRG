***************** Begin View Definition BORCLUTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "BORCLUTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Borclutipi.Borclu_Tipi;
	FROM dbo.BorcluTipi Borclutipi

DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.BorcluTipi')
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCLUTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BORCLUTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("BORCLUTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Borclutipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BORCLUTIPILOOKUPVIEW
*** Props for the BORCLUTIPILOOKUPVIEW.borclu_tipi field.
DBSetProp('BORCLUTIPILOOKUPVIEW.borclu_tipi', 'Field', 'KeyField', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW.borclu_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUTIPILOOKUPVIEW.borclu_tipi', 'Field', 'UpdateName', 'dbo.BorcluTipi.Borclu_Tipi')
DBSetProp('BORCLUTIPILOOKUPVIEW.borclu_tipi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BORCLUTIPILOOKUPVIEW.borclu_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECDESCRIPT","Borclu Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECFRMCAPTN","Borçlu Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECDLGCAPTN","Borçlu Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECGRDCAPTN","Borçlu Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECRPTCAPTN","Borçlu Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFEMTOOLTIP","Borçlu Tipi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Tipi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUTIPILOOKUPVIEW.borclu_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
