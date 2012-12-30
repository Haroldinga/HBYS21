***************** Begin View Definition DOKUMANTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "DOKUMANTIPILOOKUPVIEW1" ; 
	AS SELECT Dokumantipi.dokuman_tipi;
	FROM hbysreferans!dokumantipi

DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!dokumantipi')
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOKUMANTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOKUMANTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("DOKUMANTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Dokumantipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOKUMANTIPILOOKUPVIEW1
*** Props for the DOKUMANTIPILOOKUPVIEW1.dokuman_tipi field.
DBSetProp('DOKUMANTIPILOOKUPVIEW1.dokuman_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1.dokuman_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOKUMANTIPILOOKUPVIEW1.dokuman_tipi', 'Field', 'UpdateName', 'hbysreferans!dokumantipi.dokuman_tipi')
DBSetProp('DOKUMANTIPILOOKUPVIEW1.dokuman_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOKUMANTIPILOOKUPVIEW1.dokuman_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECDESCRIPT","Dokuman Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECFRMCAPTN","Dokuman Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECDLGCAPTN","Dokuman Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECGRDCAPTN","Dokuman Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECRPTCAPTN","Dokuman Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFEMTOOLTIP","Dokuman Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFEMSTATUSTXT","Dokuman Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANTIPILOOKUPVIEW1.dokuman_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
