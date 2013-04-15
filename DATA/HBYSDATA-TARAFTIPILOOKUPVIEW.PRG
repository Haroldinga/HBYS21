***************** Begin View Definition TARAFTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "TARAFTIPILOOKUPVIEW" ; 
	AS SELECT Taraftipi.taraf_tipi;
	FROM hbysreferans!taraftipi

DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!taraftipi')
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TARAFTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TARAFTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("TARAFTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Taraftipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TARAFTIPILOOKUPVIEW
*** Props for the TARAFTIPILOOKUPVIEW.taraf_tipi field.
DBSetProp('TARAFTIPILOOKUPVIEW.taraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TARAFTIPILOOKUPVIEW.taraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TARAFTIPILOOKUPVIEW.taraf_tipi', 'Field', 'UpdateName', 'hbysreferans!taraftipi.taraf_tipi')
DBSetProp('TARAFTIPILOOKUPVIEW.taraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TARAFTIPILOOKUPVIEW.taraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECDESCRIPT","Taraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECFRMCAPTN","Taraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECDLGCAPTN","Taraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECGRDCAPTN","Taraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECRPTCAPTN","Taraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFEMTOOLTIP","Taraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Taraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TARAFTIPILOOKUPVIEW.taraf_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
