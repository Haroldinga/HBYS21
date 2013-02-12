***************** Begin View Definition OLAYLARLOOKUPVIEW ***************


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



CREATE SQL VIEW "OLAYLARLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Olaylar.Olay_Adi,;
		Olaylar.IsKurali_Adi;
	FROM dbo.Olaylar Olaylar

DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'Tables', 'dbo.Olaylar')
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLAYLARLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLAYLARLOOKUPVIEW
	GoExplorer.odbcx.Validate("OLAYLARLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Olaylarlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLAYLARLOOKUPVIEW
*** Props for the OLAYLARLOOKUPVIEW.olay_adi field.
DBSetProp('OLAYLARLOOKUPVIEW.olay_adi', 'Field', 'KeyField', .F.)
DBSetProp('OLAYLARLOOKUPVIEW.olay_adi', 'Field', 'Updatable', .F.)
DBSetProp('OLAYLARLOOKUPVIEW.olay_adi', 'Field', 'UpdateName', 'dbo.Olaylar.Olay_Adi')
DBSetProp('OLAYLARLOOKUPVIEW.olay_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for OLAYLARLOOKUPVIEW.olay_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECDESCRIPT","Olay Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECFRMCAPTN","Olay Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECDLGCAPTN","Olay Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECGRDCAPTN","Olay Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECRPTCAPTN","Olay Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFEMTOOLTIP","Olay Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFEMSTATUSTXT","Olay Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.olay_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLAYLARLOOKUPVIEW.iskurali_adi field.
DBSetProp('OLAYLARLOOKUPVIEW.iskurali_adi', 'Field', 'KeyField', .F.)
DBSetProp('OLAYLARLOOKUPVIEW.iskurali_adi', 'Field', 'Updatable', .F.)
DBSetProp('OLAYLARLOOKUPVIEW.iskurali_adi', 'Field', 'UpdateName', 'dbo.Olaylar.IsKurali_Adi')
DBSetProp('OLAYLARLOOKUPVIEW.iskurali_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for OLAYLARLOOKUPVIEW.iskurali_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECDESCRIPT","Iskurali Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECFRMCAPTN","Iskurali Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECDLGCAPTN","Iskurali Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECGRDCAPTN","Iskurali Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECRPTCAPTN","Iskurali Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMTOOLTIP","Iskurali Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMSTATUSTXT","Iskurali Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!OLAYLARLOOKUPVIEW.iskurali_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
