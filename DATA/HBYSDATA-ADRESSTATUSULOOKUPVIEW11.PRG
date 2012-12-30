***************** Begin View Definition ADRESSTATUSULOOKUPVIEW1 ***************


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



CREATE SQL VIEW "ADRESSTATUSULOOKUPVIEW1" ; 
	AS SELECT Adresstatusu.adres_statusu;
	FROM hbysreferans!adresstatusu

DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!adresstatusu')
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADRESSTATUSULOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADRESSTATUSULOOKUPVIEW1
	GoExplorer.odbcx.Validate("ADRESSTATUSULOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Adresstatusulookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADRESSTATUSULOOKUPVIEW1
*** Props for the ADRESSTATUSULOOKUPVIEW1.adres_statusu field.
DBSetProp('ADRESSTATUSULOOKUPVIEW1.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1.adres_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ADRESSTATUSULOOKUPVIEW1.adres_statusu', 'Field', 'UpdateName', 'hbysreferans!adresstatusu.adres_statusu')
DBSetProp('ADRESSTATUSULOOKUPVIEW1.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ADRESSTATUSULOOKUPVIEW1.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPVIEW1.adres_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
