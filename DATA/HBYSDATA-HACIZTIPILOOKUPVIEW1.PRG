***************** Begin View Definition HACIZTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "HACIZTIPILOOKUPVIEW1" ; 
	AS SELECT Haciztipi.haciz_tipi;
	FROM hbysreferans!haciztipi

DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!haciztipi')
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('HACIZTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HACIZTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("HACIZTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Haciztipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for HACIZTIPILOOKUPVIEW1
*** Props for the HACIZTIPILOOKUPVIEW1.haciz_tipi field.
DBSetProp('HACIZTIPILOOKUPVIEW1.haciz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZTIPILOOKUPVIEW1.haciz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZTIPILOOKUPVIEW1.haciz_tipi', 'Field', 'UpdateName', 'hbysreferans!haciztipi.haciz_tipi')
DBSetProp('HACIZTIPILOOKUPVIEW1.haciz_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZTIPILOOKUPVIEW1.haciz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECDESCRIPT","Haciz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECFRMCAPTN","Haciz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECDLGCAPTN","Haciz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECGRDCAPTN","Haciz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECRPTCAPTN","Haciz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFEMTOOLTIP","Haciz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZTIPILOOKUPVIEW1.haciz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
