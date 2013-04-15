***************** Begin View Definition IZLEMESONUCULOOKUPVIEW ***************


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



CREATE SQL VIEW "IZLEMESONUCULOOKUPVIEW" ; 
	AS SELECT Izlemesonucu.izleme_sonucu;
	FROM hbysreferans!izlemesonucu

DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('IZLEMESONUCULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!izlemesonucu')
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
		"VFECDESCRIPT","Izlemesonuculookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for IZLEMESONUCULOOKUPVIEW
*** Props for the IZLEMESONUCULOOKUPVIEW.izleme_sonucu field.
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'UpdateName', 'hbysreferans!izlemesonucu.izleme_sonucu')
DBSetProp('IZLEMESONUCULOOKUPVIEW.izleme_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for IZLEMESONUCULOOKUPVIEW.izleme_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECDESCRIPT","Izleme Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECFRMCAPTN","Ýzleme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECDLGCAPTN","Ýzleme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECGRDCAPTN","Ýzleme Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFECRPTCAPTN","Ýzleme Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMTOOLTIP","Ýzleme Sonucu                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IZLEMESONUCULOOKUPVIEW.izleme_sonucu","FIELD",;
		"VFEMSTATUSTXT","Ýzleme Sonucu                                        ") &&Status Bar Text
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
 
