***************** Begin View Definition KURUMTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "KURUMTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Kurumtipi.Kurum_Tipi;
	FROM dbo.KurumTipi Kurumtipi

DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.KurumTipi')
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('KURUMTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for KURUMTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("KURUMTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Kurumtipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for KURUMTIPILOOKUPVIEW
*** Props for the KURUMTIPILOOKUPVIEW.kurum_tipi field.
DBSetProp('KURUMTIPILOOKUPVIEW.kurum_tipi', 'Field', 'KeyField', .T.)
DBSetProp('KURUMTIPILOOKUPVIEW.kurum_tipi', 'Field', 'Updatable', .T.)
DBSetProp('KURUMTIPILOOKUPVIEW.kurum_tipi', 'Field', 'UpdateName', 'dbo.KurumTipi.Kurum_Tipi')
DBSetProp('KURUMTIPILOOKUPVIEW.kurum_tipi', 'Field', 'Caption', "Kurum Tipi")
DBSetProp('KURUMTIPILOOKUPVIEW.kurum_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for KURUMTIPILOOKUPVIEW.kurum_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECDESCRIPT","Kurum Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECFRMCAPTN","Kurum Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECDLGCAPTN","Kurum Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECGRDCAPTN","Kurum Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECRPTCAPTN","Kurum Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFEMTOOLTIP","Kurum Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFEMSTATUSTXT","Kurum Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KURUMTIPILOOKUPVIEW.kurum_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
