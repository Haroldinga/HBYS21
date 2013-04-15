***************** Begin View Definition RISKYONETICISILOOKUPVIEW ***************


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



CREATE SQL VIEW "RISKYONETICISILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Personel.Personel_Id AS risk_yoneticisi_id,;
		Personel.Personel_Adi AS risk_yoneticisi_adi;
	FROM dbo.Personel Personel

DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'Tables', 'dbo.Personel')
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('RISKYONETICISILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for RISKYONETICISILOOKUPVIEW
	GoExplorer.odbcx.Validate("RISKYONETICISILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Riskyoneticisilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for RISKYONETICISILOOKUPVIEW
*** Props for the RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id field.
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id', 'Field', 'KeyField', .T.)
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id', 'Field', 'Updatable', .F.)
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.Personel.Personel_Id')
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi field.
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .T.)
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RISKYONETICISILOOKUPVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
