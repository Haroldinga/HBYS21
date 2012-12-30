***************** Begin View Definition ADRESSTATUSULOOKUPUPVIEW1 ***************


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



CREATE SQL VIEW "ADRESSTATUSULOOKUPUPVIEW1" ; 
	AS SELECT Adresstatusu.adres_statusu;
	FROM hbysreferans!adresstatusu

DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'Tables', 'hbysreferans!adresstatusu')
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'Comment', "")
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADRESSTATUSULOOKUPUPVIEW1
	GoExplorer.odbcx.Validate("ADRESSTATUSULOOKUPUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1","VIEW",;
		"VFECDESCRIPT","Adresstatusulookupupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADRESSTATUSULOOKUPUPVIEW1
*** Props for the ADRESSTATUSULOOKUPUPVIEW1.adres_statusu field.
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1.adres_statusu', 'Field', 'Updatable', .F.)
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1.adres_statusu', 'Field', 'UpdateName', 'hbysreferans!adresstatusu.adres_statusu')
DBSetProp('ADRESSTATUSULOOKUPUPVIEW1.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ADRESSTATUSULOOKUPUPVIEW1.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESSTATUSULOOKUPUPVIEW1.adres_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
