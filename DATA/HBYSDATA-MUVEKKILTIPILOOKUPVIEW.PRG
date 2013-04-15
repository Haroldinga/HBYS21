***************** Begin View Definition MUVEKKILTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "MUVEKKILTIPILOOKUPVIEW" ; 
	AS SELECT Muvekkiltipi.muvekkil_tipi;
	FROM hbysreferans!muvekkiltipi

DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!muvekkiltipi')
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUVEKKILTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MUVEKKILTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("MUVEKKILTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Muvekkiltipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MUVEKKILTIPILOOKUPVIEW
*** Props for the MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi field.
DBSetProp('MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi', 'Field', 'UpdateName', 'hbysreferans!muvekkiltipi.muvekkil_tipi')
DBSetProp('MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECDESCRIPT","Muvekkil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECFRMCAPTN","Müvekkkil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECDLGCAPTN","Müvekkkil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECGRDCAPTN","Müvekkkil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECRPTCAPTN","Müvekkkil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMTOOLTIP","Müvekkkil Tipi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMSTATUSTXT","Müvekkkil Tipi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILTIPILOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
