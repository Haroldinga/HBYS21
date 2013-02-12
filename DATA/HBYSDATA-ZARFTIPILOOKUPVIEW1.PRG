***************** Begin View Definition ZARFTIPILOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
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



CREATE SQL VIEW "ZARFTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.Rapor_Adi,;
		Raporlistesi.Rapor_Tipi;
	FROM dbo.RaporListesi Raporlistesi;
	WHERE Raporlistesi.Rapor_Tipi LIKE ( 'Zarf' )

DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.RaporListesi')
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ZARFTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ZARFTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("ZARFTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Zarftipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ZARFTIPILOOKUPVIEW
*** Props for the ZARFTIPILOOKUPVIEW.rapor_adi field.
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_adi', 'Field', 'Updatable', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ZARFTIPILOOKUPVIEW.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Rapor Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Rapor Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Rapor Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Rapor Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Rapor Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Rapor Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ZARFTIPILOOKUPVIEW.rapor_tipi field.
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_tipi', 'Field', 'Updatable', .F.)
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_tipi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Tipi')
DBSetProp('ZARFTIPILOOKUPVIEW.rapor_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ZARFTIPILOOKUPVIEW.rapor_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDESCRIPT","Rapor Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECFRMCAPTN","Rapor Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDLGCAPTN","Rapor Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECGRDCAPTN","Rapor Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECRPTCAPTN","Rapor Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMTOOLTIP","Rapor Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMSTATUSTXT","Rapor Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ZARFTIPILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
