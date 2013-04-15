***************** Begin View Definition ANALIZTIPILOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\hbysreferans"
ENDIF
***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "ANALIZTIPILOOKUPVIEW" ; 
	AS SELECT Analiztipi.analiz_tipi;
	FROM hbysreferans!analiztipi;
	WHERE NOT (DELETED() )

DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!analiztipi')
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ANALIZTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ANALIZTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("ANALIZTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Analiztipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ANALIZTIPILOOKUPVIEW
*** Props for the ANALIZTIPILOOKUPVIEW.analiz_tipi field.
DBSetProp('ANALIZTIPILOOKUPVIEW.analiz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ANALIZTIPILOOKUPVIEW.analiz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ANALIZTIPILOOKUPVIEW.analiz_tipi', 'Field', 'UpdateName', 'hbysreferans!analiztipi.analiz_tipi')
DBSetProp('ANALIZTIPILOOKUPVIEW.analiz_tipi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ANALIZTIPILOOKUPVIEW.analiz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECDESCRIPT","Analiz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECFRMCAPTN","Naliz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECDLGCAPTN","Naliz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECGRDCAPTN","Naliz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECRPTCAPTN","Naliz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFEMTOOLTIP","Naliz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFEMSTATUSTXT","Naliz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ANALIZTIPILOOKUPVIEW.analiz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
