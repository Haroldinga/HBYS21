***************** Begin View Definition BORCTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "BORCTIPILOOKUPVIEW1" ; 
	AS SELECT Borctipi.borc_tipi;
	FROM hbysreferans!borctipi

DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!borctipi')
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BORCTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("BORCTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Borctipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BORCTIPILOOKUPVIEW1
*** Props for the BORCTIPILOOKUPVIEW1.borc_tipi field.
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'UpdateName', 'hbysreferans!borctipi.borc_tipi')
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCTIPILOOKUPVIEW1.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW1.borc_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
