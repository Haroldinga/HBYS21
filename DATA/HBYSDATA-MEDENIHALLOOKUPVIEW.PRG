***************** Begin View Definition MEDENIHALLOOKUPVIEW ***************


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



CREATE SQL VIEW "MEDENIHALLOOKUPVIEW" ; 
	AS SELECT Medenihali.medeni_hali;
	FROM hbysreferans!medenihali

DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'Tables', 'hbysreferans!medenihali')
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MEDENIHALLOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MEDENIHALLOOKUPVIEW
	GoExplorer.odbcx.Validate("MEDENIHALLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Medenihallookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MEDENIHALLOOKUPVIEW
*** Props for the MEDENIHALLOOKUPVIEW.medeni_hali field.
DBSetProp('MEDENIHALLOOKUPVIEW.medeni_hali', 'Field', 'KeyField', .F.)
DBSetProp('MEDENIHALLOOKUPVIEW.medeni_hali', 'Field', 'Updatable', .T.)
DBSetProp('MEDENIHALLOOKUPVIEW.medeni_hali', 'Field', 'UpdateName', 'hbysreferans!medenihali.medeni_hali')
DBSetProp('MEDENIHALLOOKUPVIEW.medeni_hali', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MEDENIHALLOOKUPVIEW.medeni_hali
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECDESCRIPT","Medeni Hali Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECFRMCAPTN","Medeni Hali") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECDLGCAPTN","Medeni Hali") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECGRDCAPTN","Medeni Hali") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECRPTCAPTN","Medeni Hali") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFEMTOOLTIP","Medeni Hali") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFEMSTATUSTXT","Medeni Hali") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MEDENIHALLOOKUPVIEW.medeni_hali","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
