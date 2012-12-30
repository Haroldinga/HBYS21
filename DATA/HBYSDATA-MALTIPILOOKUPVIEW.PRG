***************** Begin View Definition MALTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "MALTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Haciztipi.Haciz_Tipi AS mal_tipi;
	FROM dbo.HacizTipi Haciztipi

DBSetProp('MALTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.HacizTipi')
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MALTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MALTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("MALTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Maltipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MALTIPILOOKUPVIEW
*** Props for the MALTIPILOOKUPVIEW.mal_tipi field.
DBSetProp('MALTIPILOOKUPVIEW.mal_tipi', 'Field', 'KeyField', .T.)
DBSetProp('MALTIPILOOKUPVIEW.mal_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MALTIPILOOKUPVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.HacizTipi.Haciz_Tipi')
DBSetProp('MALTIPILOOKUPVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALTIPILOOKUPVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALTIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
