***************** Begin View Definition BUROLOOKUPVIEW ***************


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



CREATE SQL VIEW "BUROLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Buro.Buro_Id,;
		Buro.Buro_Adi;
	FROM dbo.Buro Buro

DBSetProp('BUROLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BUROLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('BUROLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BUROLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('BUROLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BUROLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BUROLOOKUPVIEW', 'View', 'Tables', 'dbo.Buro')
DBSetProp('BUROLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BUROLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BUROLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BUROLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('BUROLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BUROLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BUROLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BUROLOOKUPVIEW
	GoExplorer.odbcx.Validate("BUROLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Burolookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BUROLOOKUPVIEW
*** Props for the BUROLOOKUPVIEW.buro_id field.
DBSetProp('BUROLOOKUPVIEW.buro_id', 'Field', 'KeyField', .T.)
DBSetProp('BUROLOOKUPVIEW.buro_id', 'Field', 'Updatable', .F.)
DBSetProp('BUROLOOKUPVIEW.buro_id', 'Field', 'UpdateName', 'dbo.Buro.Buro_Id')
DBSetProp('BUROLOOKUPVIEW.buro_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BUROLOOKUPVIEW.buro_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECDESCRIPT","Buro Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECFRMCAPTN","Buro Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECDLGCAPTN","Buro Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECGRDCAPTN","Buro Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECRPTCAPTN","Buro Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFEMTOOLTIP","Buro Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFEMSTATUSTXT","Buro Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BUROLOOKUPVIEW.buro_adi field.
DBSetProp('BUROLOOKUPVIEW.buro_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROLOOKUPVIEW.buro_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROLOOKUPVIEW.buro_adi', 'Field', 'UpdateName', 'dbo.Buro.Buro_Adi')
DBSetProp('BUROLOOKUPVIEW.buro_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BUROLOOKUPVIEW.buro_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECDESCRIPT","Buro Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECFRMCAPTN","Buro Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECDLGCAPTN","Buro Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECGRDCAPTN","Buro Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECRPTCAPTN","Buro Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFEMTOOLTIP","Buro Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFEMSTATUSTXT","Buro Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROLOOKUPVIEW.buro_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
