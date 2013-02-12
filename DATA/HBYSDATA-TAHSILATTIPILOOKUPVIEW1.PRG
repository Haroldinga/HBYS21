***************** Begin View Definition TAHSILATTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "TAHSILATTIPILOOKUPVIEW" ; 
	AS SELECT Tahsilattipi.tahsilat_tipi;
	FROM hbysreferans!tahsilattipi

DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!tahsilattipi')
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAHSILATTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAHSILATTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("TAHSILATTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Tahsilattipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TAHSILATTIPILOOKUPVIEW
*** Props for the TAHSILATTIPILOOKUPVIEW.tahsilat_tipi field.
DBSetProp('TAHSILATTIPILOOKUPVIEW.tahsilat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATTIPILOOKUPVIEW.tahsilat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATTIPILOOKUPVIEW.tahsilat_tipi', 'Field', 'UpdateName', 'hbysreferans!tahsilattipi.tahsilat_tipi')
DBSetProp('TAHSILATTIPILOOKUPVIEW.tahsilat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATTIPILOOKUPVIEW.tahsilat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATTIPILOOKUPVIEW.tahsilat_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
