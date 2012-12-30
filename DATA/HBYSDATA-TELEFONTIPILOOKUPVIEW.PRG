***************** Begin View Definition TELEFONTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "TELEFONTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Telefontipi.Telefon_Tipi;
	FROM dbo.TelefonTipi Telefontipi

DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.TelefonTipi')
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TELEFONTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TELEFONTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("TELEFONTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Telefontipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TELEFONTIPILOOKUPVIEW
*** Props for the TELEFONTIPILOOKUPVIEW.telefon_tipi field.
DBSetProp('TELEFONTIPILOOKUPVIEW.telefon_tipi', 'Field', 'KeyField', .T.)
DBSetProp('TELEFONTIPILOOKUPVIEW.telefon_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TELEFONTIPILOOKUPVIEW.telefon_tipi', 'Field', 'UpdateName', 'dbo.TelefonTipi.Telefon_Tipi')
DBSetProp('TELEFONTIPILOOKUPVIEW.telefon_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TELEFONTIPILOOKUPVIEW.telefon_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECDESCRIPT","Telefon Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECFRMCAPTN","Telefon Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECDLGCAPTN","Telefon Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECGRDCAPTN","Telefon Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECRPTCAPTN","Telefon Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFEMTOOLTIP","Telefon Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFEMSTATUSTXT","Telefon Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONTIPILOOKUPVIEW.telefon_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
