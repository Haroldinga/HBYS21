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
		Muvekkil.Vergi_No as VergiNo,;
		Muvekkil.e_posta as ElektronikPostaAdresi,;
		CAST('' as char(1)) as PostaKodu,;
		CAST('Yurt Ýçi Ýkametgah Adresi' as char(25)) as AdresTuruAciklama,;
        CAST('' as char(15)) as cepTelefon,;
		Muvekkil.Iletisim_Adresi;
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
 
*** Props for the UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer field.
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'UpdateName', 'TicaretSicilNoVerildigiyer')
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECDESCRIPT","Ticaretsicilnoverildigiyer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECFRMCAPTN","Ticaretsicilnoverildigiyer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECDLGCAPTN","Ticaretsicilnoverildigiyer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECGRDCAPTN","Ticaretsicilnoverildigiyer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECRPTCAPTN","Ticaretsicilnoverildigiyer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMTOOLTIP","Ticaretsicilnoverildigiyer") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMSTATUSTXT","Ticaretsicilnoverildigiyer") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.harcdurumu field.
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'UpdateName', 'HarcDurumu')
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.harcdurumu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECDESCRIPT","Harcdurumu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECFRMCAPTN","Harcdurumu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECDLGCAPTN","Harcdurumu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECGRDCAPTN","Harcdurumu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECRPTCAPTN","Harcdurumu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMTOOLTIP","Harcdurumu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMSTATUSTXT","Harcdurumu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ticaretsicilno field.
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'UpdateName', 'dbo.Muvekkil.Ticaret_Sicil_No')
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ticaretsicilno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECDESCRIPT","Ticaretsicilno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECFRMCAPTN","Ticaretsicilno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECDLGCAPTN","Ticaretsicilno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECGRDCAPTN","Ticaretsicilno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECRPTCAPTN","Ticaretsicilno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMTOOLTIP","Ticaretsicilno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMSTATUSTXT","Ticaretsicilno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kurumadi field.
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kurumadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECDESCRIPT","Kurumadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECFRMCAPTN","Kurumadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECDLGCAPTN","Kurumadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECGRDCAPTN","Kurumadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECRPTCAPTN","Kurumadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMTOOLTIP","Kurumadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMSTATUSTXT","Kurumadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kamuozel field.
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Tipi')
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kamuozel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECDESCRIPT","Kamuozel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECFRMCAPTN","Kamuozel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECDLGCAPTN","Kamuozel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECGRDCAPTN","Kamuozel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECRPTCAPTN","Kamuozel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMTOOLTIP","Kamuozel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMSTATUSTXT","Kamuozel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.vergidairesi field.
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'UpdateName', 'dbo.Muvekkil.vergi_Dairesi')
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.vergidairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECDESCRIPT","Vergidairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECFRMCAPTN","Vergidairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECDLGCAPTN","Vergidairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECGRDCAPTN","Vergidairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECRPTCAPTN","Vergidairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMTOOLTIP","Vergidairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMSTATUSTXT","Vergidairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.sskisyerisicilno field.
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'UpdateName', 'SSkIsyeriSicilNo')
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.sskisyerisicilno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECDESCRIPT","Sskisyerisicilno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECFRMCAPTN","Sskisyerisicilno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECDLGCAPTN","Sskisyerisicilno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECGRDCAPTN","Sskisyerisicilno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECRPTCAPTN","Sskisyerisicilno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMTOOLTIP","Sskisyerisicilno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMSTATUSTXT","Sskisyerisicilno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.vergino field.
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_No')
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.vergino
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECDESCRIPT","Vergino Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECFRMCAPTN","Vergino") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECDLGCAPTN","Vergino") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECGRDCAPTN","Vergino") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECRPTCAPTN","Vergino") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMTOOLTIP","Vergino") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMSTATUSTXT","Vergino") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
