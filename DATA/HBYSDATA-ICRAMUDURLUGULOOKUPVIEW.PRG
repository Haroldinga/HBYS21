***************** Begin View Definition ICRAMUDURLUGULOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
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



CREATE SQL VIEW "ICRAMUDURLUGULOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icramudurlugu.IcraMudurlugu_Adi,;
		Icramudurlugu.Adliye_Adi,;
		Icramudurlugu.IcraMudurlugu_Id;
	FROM dbo.IcraMudurlugu Icramudurlugu

DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'Tables', 'dbo.IcraMudurlugu')
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRAMUDURLUGULOOKUPVIEW
	GoExplorer.odbcx.Validate("ICRAMUDURLUGULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Icramudurlugulookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ICRAMUDURLUGULOOKUPVIEW
*** Props for the ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi field.
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IcraMudurlugu_Adi')
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULOOKUPVIEW.adliye_adi field.
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Adliye_Adi')
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRAMUDURLUGULOOKUPVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id field.
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id', 'Field', 'Updatable', .F.)
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IcraMudurlugu_Id')
DBSetProp('ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULOOKUPVIEW.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
