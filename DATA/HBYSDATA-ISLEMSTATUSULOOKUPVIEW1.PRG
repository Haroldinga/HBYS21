***************** Begin View Definition ISLEMSTATUSULOOKUPVIEW ***************


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



CREATE SQL VIEW "ISLEMSTATUSULOOKUPVIEW" ; 
	AS SELECT Islemstatusu.islem_statusu;
	FROM hbysreferans!islemstatusu

DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!islemstatusu')
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ISLEMSTATUSULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ISLEMSTATUSULOOKUPVIEW
	GoExplorer.odbcx.Validate("ISLEMSTATUSULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Islemstatusulookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ISLEMSTATUSULOOKUPVIEW
*** Props for the ISLEMSTATUSULOOKUPVIEW.islem_statusu field.
DBSetProp('ISLEMSTATUSULOOKUPVIEW.islem_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW.islem_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ISLEMSTATUSULOOKUPVIEW.islem_statusu', 'Field', 'UpdateName', 'hbysreferans!islemstatusu.islem_statusu')
DBSetProp('ISLEMSTATUSULOOKUPVIEW.islem_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ISLEMSTATUSULOOKUPVIEW.islem_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECDESCRIPT","Islem Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECFRMCAPTN","Ýþlem Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECDLGCAPTN","Ýþlem Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECGRDCAPTN","Ýþlem Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECRPTCAPTN","Ýþlem Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFEMTOOLTIP","Ýþlem Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMSTATUSULOOKUPVIEW.islem_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
