***************** Begin View Definition IZLEMESONUCULOOKUPVIEW ***************


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



CREATE SQL VIEW "IZLEMESONUCULOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Izlemesonucu.Izleme_Sonucu;
	FROM dbo.IzlemeSonucu Izlemesonucu

DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'Tables', 'dbo.IzlemeSonucu')
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for IZLEMESONUCULOOKUPVIEW
	GoExplorer.odbcx.Validate("IZLEMESONUCULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Izlemesonuculookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for IZLEMESONUCULOOKUPVIEW
*** Props for the IZLEMESONUCULOOKUPVIEW.izleme_sonucu field.
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'KeyField', .T.)
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'UpdateName', 'dbo.IzlemeSonucu.Izleme_Sonucu')
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for IZLEMESONUCULOOKUPVIEW.izleme_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECDESCRIPT","Izleme Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECFRMCAPTN","Izleme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECDLGCAPTN","Izleme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECGRDCAPTN","Izleme Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECRPTCAPTN","Izleme Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMTOOLTIP","Izleme Sonucu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMSTATUSTXT","Izleme Sonucu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
