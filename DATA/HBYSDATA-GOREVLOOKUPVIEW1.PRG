***************** Begin View Definition GOREVLOOKUPVIEW ***************


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



CREATE SQL VIEW "GOREVLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Gorev.Gorev_Adi;
	FROM dbo.Gorev Gorev

DBSetProp('GOREVLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'Tables', 'dbo.Gorev')
DBSetProp('GOREVLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('GOREVLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('GOREVLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GOREVLOOKUPVIEW
	GoExplorer.odbcx.Validate("GOREVLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Gorevlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for GOREVLOOKUPVIEW
*** Props for the GOREVLOOKUPVIEW.gorev_adi field.
DBSetProp('GOREVLOOKUPVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('GOREVLOOKUPVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('GOREVLOOKUPVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.Gorev.Gorev_Adi')
DBSetProp('GOREVLOOKUPVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GOREVLOOKUPVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Gorev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Gorev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Gorev Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Gorev Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Gorev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Gorev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLOOKUPVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
