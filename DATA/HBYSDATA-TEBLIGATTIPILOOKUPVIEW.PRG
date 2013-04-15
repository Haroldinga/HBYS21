***************** Begin View Definition TEBLIGATTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "TEBLIGATTIPILOOKUPVIEW" ; 
	AS SELECT Tebligattipi.tebligat_tipi;
	FROM hbysreferans!tebligattipi

DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!tebligattipi')
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TEBLIGATTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TEBLIGATTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("TEBLIGATTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Tebligattipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TEBLIGATTIPILOOKUPVIEW
*** Props for the TEBLIGATTIPILOOKUPVIEW.tebligat_tipi field.
DBSetProp('TEBLIGATTIPILOOKUPVIEW.tebligat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW.tebligat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATTIPILOOKUPVIEW.tebligat_tipi', 'Field', 'UpdateName', 'hbysreferans!tebligattipi.tebligat_tipi')
DBSetProp('TEBLIGATTIPILOOKUPVIEW.tebligat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATTIPILOOKUPVIEW.tebligat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECDESCRIPT","Tebligat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECFRMCAPTN","Tebligat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECDLGCAPTN","Tebligat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECGRDCAPTN","Tebligat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECRPTCAPTN","Tebligat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFEMTOOLTIP","Tebligat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tebligat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATTIPILOOKUPVIEW.tebligat_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
