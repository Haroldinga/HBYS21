***************** Begin View Definition ICRADOSYAASAMASILOOKUPVIEW ***************


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



CREATE SQL VIEW "ICRADOSYAASAMASILOOKUPVIEW" ; 
	AS SELECT Icradosyaasamasi.dosya_asamasi;
	FROM hbysreferans!icradosyaasamasi

DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!icradosyaasamasi')
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAASAMASILOOKUPVIEW
	GoExplorer.odbcx.Validate("ICRADOSYAASAMASILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","ICRADOSYAASAMASILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ICRADOSYAASAMASILOOKUPVIEW
*** Props for the ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi field.
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi', 'Field', 'UpdateName', 'hbysreferans!icradosyaasamasi.dosya_asamasi')
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECDESCRIPT","Dosya Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECFRMCAPTN","Dosya Asamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECDLGCAPTN","Dosya Asamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECGRDCAPTN","Dosya Asamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECRPTCAPTN","Dosya Asamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFEMTOOLTIP","Dosya Asamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFEMSTATUSTXT","Dosya Asamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW.dosya_asamasi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
