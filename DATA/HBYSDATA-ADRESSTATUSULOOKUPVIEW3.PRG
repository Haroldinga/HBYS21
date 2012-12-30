***************** Begin View Definition ADRESSTATUSULOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\hbysreferans"
ENDIF
***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "ADRESSTATUSULOOKUPVIEW" ; 
	AS SELECT Adresstatusu.adres_statusu;
	FROM hbysreferans!adresstatusu

DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!adresstatusu')
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADRESSTATUSULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADRESSTATUSULOOKUPVIEW
	GoExplorer.odbcx.Validate("ADRESSTATUSULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","ADRESSTATUSULOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADRESSTATUSULOOKUPVIEW
*** Props for the ADRESSTATUSULOOKUPVIEW.adres_statusu field.
DBSetProp('ADRESSTATUSULOOKUPVIEW.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW.adres_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW.adres_statusu', 'Field', 'UpdateName', 'hbysreferans!adresstatusu.adres_statusu')
DBSetProp('ADRESSTATUSULOOKUPVIEW.adres_statusu', 'Field', 'DataType', "C(15)")

*** DBCX Field Properties for ADRESSTATUSULOOKUPVIEW.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW.adres_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
