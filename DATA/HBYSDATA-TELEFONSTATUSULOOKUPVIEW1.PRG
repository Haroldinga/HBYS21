***************** Begin View Definition TELEFONSTATUSULOOKUPVIEW ***************


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



CREATE SQL VIEW "TELEFONSTATUSULOOKUPVIEW" ; 
	AS SELECT Telefonstatusu.telefon_statusu;
	FROM hbysreferans!telefonstatusu

DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!telefonstatusu')
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TELEFONSTATUSULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TELEFONSTATUSULOOKUPVIEW
	GoExplorer.odbcx.Validate("TELEFONSTATUSULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Telefonstatusulookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TELEFONSTATUSULOOKUPVIEW
*** Props for the TELEFONSTATUSULOOKUPVIEW.telefon_statusu field.
DBSetProp('TELEFONSTATUSULOOKUPVIEW.telefon_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW.telefon_statusu', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONSTATUSULOOKUPVIEW.telefon_statusu', 'Field', 'UpdateName', 'hbysreferans!telefonstatusu.telefon_statusu')
DBSetProp('TELEFONSTATUSULOOKUPVIEW.telefon_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TELEFONSTATUSULOOKUPVIEW.telefon_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECDESCRIPT","Telefon Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECFRMCAPTN","Telefon Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECDLGCAPTN","Telefon Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECGRDCAPTN","Telefon Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECRPTCAPTN","Telefon Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFEMTOOLTIP","Telefon Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFEMSTATUSTXT","Telefon Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONSTATUSULOOKUPVIEW.telefon_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
