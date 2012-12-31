***************** Begin View Definition DOSYASTATULOOKUPVIEW ***************


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



CREATE SQL VIEW "DOSYASTATULOOKUPVIEW" ; 
	AS SELECT Dosyastatusu.dosya_statusu;
	FROM hbysreferans!dosyastatusu

DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!dosyastatusu')
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOSYASTATULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOSYASTATULOOKUPVIEW
	GoExplorer.odbcx.Validate("DOSYASTATULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","DOSYASTATULOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOSYASTATULOOKUPVIEW
*** Props for the DOSYASTATULOOKUPVIEW.dosya_statusu field.
DBSetProp('DOSYASTATULOOKUPVIEW.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('DOSYASTATULOOKUPVIEW.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('DOSYASTATULOOKUPVIEW.dosya_statusu', 'Field', 'UpdateName', 'hbysreferans!dosyastatusu.dosya_statusu')
DBSetProp('DOSYASTATULOOKUPVIEW.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOSYASTATULOOKUPVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYASTATULOOKUPVIEW.dosya_statusu","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
