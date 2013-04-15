***************** Begin View Definition FAIZTIPILOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
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



CREATE SQL VIEW "FAIZTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT DISTINCT Faiztipi.Faiz_Tipi;
	FROM dbo.FaizTipi Faiztipi

DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.FaizTipi')
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('FAIZTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for FAIZTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("FAIZTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Faiztipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for FAIZTIPILOOKUPVIEW
*** Props for the FAIZTIPILOOKUPVIEW.faiz_tipi field.
DBSetProp('FAIZTIPILOOKUPVIEW.faiz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILOOKUPVIEW.faiz_tipi', 'Field', 'Updatable', .F.)
DBSetProp('FAIZTIPILOOKUPVIEW.faiz_tipi', 'Field', 'UpdateName', 'dbo.FaizTipi.Faiz_Tipi')
DBSetProp('FAIZTIPILOOKUPVIEW.faiz_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for FAIZTIPILOOKUPVIEW.faiz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECDESCRIPT","Faiz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECFRMCAPTN","Faiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECDLGCAPTN","Faiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECGRDCAPTN","Faiz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECRPTCAPTN","Faiz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFEMTOOLTIP","Faiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFEMSTATUSTXT","Faiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILOOKUPVIEW.faiz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
