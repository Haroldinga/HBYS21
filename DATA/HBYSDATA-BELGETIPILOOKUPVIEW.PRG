***************** Begin View Definition BELGETIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "BELGETIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Belgetipi.Belge_Tipi;
	FROM dbo.BelgeTipi Belgetipi

DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'FetchMemo', .F.)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'Tables', 'dbo.BelgeTipi')
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BELGETIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BELGETIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("BELGETIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Belgetipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BELGETIPILOOKUPVIEW
*** Props for the BELGETIPILOOKUPVIEW.belge_tipi field.
DBSetProp('BELGETIPILOOKUPVIEW.belge_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BELGETIPILOOKUPVIEW.belge_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BELGETIPILOOKUPVIEW.belge_tipi', 'Field', 'UpdateName', 'dbo.BelgeTipi.Belge_Tipi')
DBSetProp('BELGETIPILOOKUPVIEW.belge_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BELGETIPILOOKUPVIEW.belge_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECDESCRIPT","Belge Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECFRMCAPTN","Belge Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECDLGCAPTN","Belge Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECGRDCAPTN","Belge Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECRPTCAPTN","Belge Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMTOOLTIP","Belge Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMSTATUSTXT","Belge Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGETIPILOOKUPVIEW.belge_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
