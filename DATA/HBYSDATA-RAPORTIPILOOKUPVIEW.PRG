***************** Begin View Definition RAPORTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "RAPORTIPILOOKUPVIEW" ; 
	AS SELECT Raportipi.rapor_tipi;
	FROM hbysreferans!raportipi

DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!raportipi')
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('RAPORTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for RAPORTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("RAPORTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Raportipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for RAPORTIPILOOKUPVIEW
*** Props for the RAPORTIPILOOKUPVIEW.rapor_tipi field.
DBSetProp('RAPORTIPILOOKUPVIEW.rapor_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORTIPILOOKUPVIEW.rapor_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORTIPILOOKUPVIEW.rapor_tipi', 'Field', 'UpdateName', 'hbysreferans!raportipi.rapor_tipi')
DBSetProp('RAPORTIPILOOKUPVIEW.rapor_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for RAPORTIPILOOKUPVIEW.rapor_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDESCRIPT","Rapor Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECFRMCAPTN","Rapor Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDLGCAPTN","Rapor Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECGRDCAPTN","Rapor Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECRPTCAPTN","Rapor Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMTOOLTIP","Rapor Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMSTATUSTXT","Rapor Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
