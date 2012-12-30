***************** Begin View Definition ICRADOSYAASAMASILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "ICRADOSYAASAMASILOOKUPVIEW1" ; 
	AS SELECT Icradosyaasamasi.dosya_asamasi;
	FROM hbysreferans!icradosyaasamasi

DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!icradosyaasamasi')
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAASAMASILOOKUPVIEW1
	GoExplorer.odbcx.Validate("ICRADOSYAASAMASILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Icradosyaasamasilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ICRADOSYAASAMASILOOKUPVIEW1
*** Props for the ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi field.
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi', 'Field', 'UpdateName', 'hbysreferans!icradosyaasamasi.dosya_asamasi')
DBSetProp('ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECDESCRIPT","Dosya Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECFRMCAPTN","Dosya Asamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECDLGCAPTN","Dosya Asamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECGRDCAPTN","Dosya Asamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECRPTCAPTN","Dosya Asamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFEMTOOLTIP","Dosya Asamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFEMSTATUSTXT","Dosya Asamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAASAMASILOOKUPVIEW1.dosya_asamasi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
