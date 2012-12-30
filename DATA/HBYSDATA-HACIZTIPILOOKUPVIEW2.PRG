***************** Begin View Definition HACIZTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "HACIZTIPILOOKUPVIEW" ; 
	AS SELECT Haciztipi.haciz_tipi;
	FROM hbysreferans!haciztipi

DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!haciztipi')
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HACIZTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HACIZTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("HACIZTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","HACIZTIPILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for HACIZTIPILOOKUPVIEW
*** Props for the HACIZTIPILOOKUPVIEW.haciz_tipi field.
DBSetProp('HACIZTIPILOOKUPVIEW.haciz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW.haciz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW.haciz_tipi', 'Field', 'UpdateName', 'hbysreferans!haciztipi.haciz_tipi')
DBSetProp('HACIZTIPILOOKUPVIEW.haciz_tipi', 'Field', 'DataType', "C(15)")

*** DBCX Field Properties for HACIZTIPILOOKUPVIEW.haciz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECDESCRIPT","Haciz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECFRMCAPTN","Haciz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECDLGCAPTN","Haciz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECGRDCAPTN","Haciz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECRPTCAPTN","Haciz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFEMTOOLTIP","Haciz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW.haciz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
