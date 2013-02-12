***************** Begin View Definition ISLEMLERLOOKUPVIEW ***************


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



CREATE SQL VIEW "ISLEMLERLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Islemler.Islem_Adi,;
		Islemler.IsKurali_Adi;
	FROM dbo.Islemler Islemler

DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'Tables', 'dbo.Islemler')
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ISLEMLERLOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ISLEMLERLOOKUPVIEW
	GoExplorer.odbcx.Validate("ISLEMLERLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Islemlerlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ISLEMLERLOOKUPVIEW
*** Props for the ISLEMLERLOOKUPVIEW.islem_adi field.
DBSetProp('ISLEMLERLOOKUPVIEW.islem_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISLEMLERLOOKUPVIEW.islem_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISLEMLERLOOKUPVIEW.islem_adi', 'Field', 'UpdateName', 'dbo.Islemler.Islem_Adi')
DBSetProp('ISLEMLERLOOKUPVIEW.islem_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISLEMLERLOOKUPVIEW.islem_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECDESCRIPT","Islem Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECFRMCAPTN","Islem Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECDLGCAPTN","Islem Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECGRDCAPTN","Islem Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECRPTCAPTN","Islem Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFEMTOOLTIP","Islem Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFEMSTATUSTXT","Islem Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.islem_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ISLEMLERLOOKUPVIEW.iskurali_adi field.
DBSetProp('ISLEMLERLOOKUPVIEW.iskurali_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISLEMLERLOOKUPVIEW.iskurali_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISLEMLERLOOKUPVIEW.iskurali_adi', 'Field', 'UpdateName', 'dbo.Islemler.IsKurali_Adi')
DBSetProp('ISLEMLERLOOKUPVIEW.iskurali_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISLEMLERLOOKUPVIEW.iskurali_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECDESCRIPT","Iskurali Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECFRMCAPTN","Iskurali Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECDLGCAPTN","Iskurali Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECGRDCAPTN","Iskurali Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECRPTCAPTN","Iskurali Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMTOOLTIP","Iskurali Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMSTATUSTXT","Iskurali Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISLEMLERLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
