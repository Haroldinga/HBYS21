***************** Begin View Definition UYAPALACAKLIVIEW ***************


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



CREATE SQL VIEW "UYAPALACAKLIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_3' as Char(10)) as taraf_Id,;
		Alacakli.Muvekkil_Adi As Ad,;
		CAST('kisiKurumBilgileri_3' as char(25)) as KisiKurumBilgileri_Id,;
		CAST('' as char(1)) as TicaretSicilNoVerildigiyer,;
		CAST('1' as char(1)) as HarcDurumu,;
		Muvekkil.Ticaret_Sicil_No as TicaretSicilNo,;
		Muvekkil.Muvekkil_Adi as KurumAdi,;
		Muvekkil.Muvekkil_Tipi as KamuOzel,;
		Muvekkil.vergi_Dairesi as VergiDairesi,;
		CAST('' as char(1)) as SSkIsyeriSicilNo,;
		Muvekkil.Vergi_No as VergiNo;
	FROM dbo.Alacakli Alacakli;
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Alacakli.Muvekkil_Id = Muvekkil.Muvekkil_Id

DBSetProp('UYAPALACAKLIVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Tables', 'dbo.Alacakli')
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Comment', "")
DBSetProp('UYAPALACAKLIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPALACAKLIVIEW
	GoExplorer.odbcx.Validate("UYAPALACAKLIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECDESCRIPT","Uyapalacakliview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for UYAPALACAKLIVIEW
*** Props for the UYAPALACAKLIVIEW.taraf_id field.
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'UpdateName', 'taraf_Id')
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.taraf_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECDESCRIPT","Taraf Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECFRMCAPTN","Taraf Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECDLGCAPTN","Taraf Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECGRDCAPTN","Taraf Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECRPTCAPTN","Taraf Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMTOOLTIP","Taraf Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMSTATUSTXT","Taraf Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ad field.
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'UpdateName', 'dbo.Alacakli.Muvekkil_Adi')
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ad
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECDESCRIPT","Ad Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECFRMCAPTN","Ad") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECDLGCAPTN","Ad") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECGRDCAPTN","Ad") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECRPTCAPTN","Ad") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMTOOLTIP","Ad") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMSTATUSTXT","Ad") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kisikurumbilgileri_id field.
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'UpdateName', 'KisiKurumBilgileri_Id')
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kisikurumbilgileri_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDESCRIPT","Kisikurumbilgileri Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECFRMCAPTN","Kisikurumbilgileri Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDLGCAPTN","Kisikurumbilgileri Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECGRDCAPTN","Kisikurumbilgileri Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECRPTCAPTN","Kisikurumbilgileri Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMTOOLTIP","Kisikurumbilgileri Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMSTATUSTXT","Kisikurumbilgileri Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
