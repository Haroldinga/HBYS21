***************** Begin View Definition DOSYASTATULOOKUPVIEW1 ***************


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



CREATE SQL VIEW "DOSYASTATULOOKUPVIEW1" ; 
	AS SELECT Dosyastatusu.dosya_statusu;
	FROM hbysreferans!dosyastatusu

DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!dosyastatusu')
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOSYASTATULOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOSYASTATULOOKUPVIEW1
	GoExplorer.odbcx.Validate("DOSYASTATULOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Dosyastatulookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOSYASTATULOOKUPVIEW1
*** Props for the DOSYASTATULOOKUPVIEW1.dosya_statusu field.
DBSetProp('DOSYASTATULOOKUPVIEW1.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW1.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW1.dosya_statusu', 'Field', 'UpdateName', 'hbysreferans!dosyastatusu.dosya_statusu')
DBSetProp('DOSYASTATULOOKUPVIEW1.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOSYASTATULOOKUPVIEW1.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW1.dosya_statusu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
