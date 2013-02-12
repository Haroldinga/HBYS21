***************** Begin View Definition KANGRUBULOOKUPVIEW ***************


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



CREATE SQL VIEW "KANGRUBULOOKUPVIEW" ; 
	AS SELECT Kangrubu.kan_grubu;
	FROM hbysreferans!kangrubu

DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!kangrubu')
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('KANGRUBULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for KANGRUBULOOKUPVIEW
	GoExplorer.odbcx.Validate("KANGRUBULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Kangrubulookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for KANGRUBULOOKUPVIEW
*** Props for the KANGRUBULOOKUPVIEW.kan_grubu field.
DBSetProp('KANGRUBULOOKUPVIEW.kan_grubu', 'Field', 'KeyField', .F.)
DBSetProp('KANGRUBULOOKUPVIEW.kan_grubu', 'Field', 'Updatable', .T.)
DBSetProp('KANGRUBULOOKUPVIEW.kan_grubu', 'Field', 'UpdateName', 'hbysreferans!kangrubu.kan_grubu')
DBSetProp('KANGRUBULOOKUPVIEW.kan_grubu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for KANGRUBULOOKUPVIEW.kan_grubu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECDESCRIPT","Kan Grubu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECFRMCAPTN","Kan Grubu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECDLGCAPTN","Kan Grubu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECGRDCAPTN","Kan Grubu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECRPTCAPTN","Kan Grubu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFEMTOOLTIP","Kan Grubu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFEMSTATUSTXT","Kan Grubu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!KANGRUBULOOKUPVIEW.kan_grubu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
