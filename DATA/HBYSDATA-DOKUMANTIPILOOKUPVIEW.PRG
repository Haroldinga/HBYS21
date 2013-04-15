***************** Begin View Definition DOKUMANTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "DOKUMANTIPILOOKUPVIEW" ; 
	AS SELECT Dokumantipi.dokuman_tipi;
	FROM hbysreferans!dokumantipi

DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!dokumantipi')
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOKUMANTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOKUMANTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("DOKUMANTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","DOKUMANTIPILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOKUMANTIPILOOKUPVIEW
*** Props for the DOKUMANTIPILOOKUPVIEW.dokuman_tipi field.
DBSetProp('DOKUMANTIPILOOKUPVIEW.dokuman_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW.dokuman_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW.dokuman_tipi', 'Field', 'UpdateName', 'hbysreferans!dokumantipi.dokuman_tipi')
DBSetProp('DOKUMANTIPILOOKUPVIEW.dokuman_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOKUMANTIPILOOKUPVIEW.dokuman_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECDESCRIPT","Dokuman Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECFRMCAPTN","Döküman Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECDLGCAPTN","Döküman Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECGRDCAPTN","Döküman Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECRPTCAPTN","Döküman Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFEMTOOLTIP","Döküman Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFEMSTATUSTXT","Döküman Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW.dokuman_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
