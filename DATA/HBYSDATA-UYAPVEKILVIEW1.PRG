***************** Begin View Definition UYAPVEKILVIEW ***************


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



CREATE SQL VIEW "UYAPVEKILVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('VekilKisi_1' AS CHARACTER(15)) AS id,;
		Personel.Baro_Sicil_No,;
		Personel.Tbb_No,;
		Buro.Buro_Adi,;
		Personel.TcKimlik_No,;
		Personel.Vergi_No,;
		Personel.Vekil_Tipi,;
		Personel.Ssk_No,;
		Vekil.Borclu_Vekili,;
		CAST('' as Char(1)) As KayitNo,;
		Personel.Personel_Adi As Soyadi,;
		CAST('' as char(1)) as ybnNfsKayitliOldgyer,;
		CAST('kisiKurumBilgileri_1' as Char(25)) As Id,;
		CAST('' as char(1)) as aileSiraNo,;
		Personel.Kimlik_No AS CuzdanNo,;
		Personel.Baba_Adi,;
		Personel.Ana_Adi,;
		Personel.Personel_Adi As Adi,;
		Personel.TcKimlik_No,;
   		CAST('' as char(1)) as OncekiSoyadi,;
		Personel.Cinsiyeti,;
		Personel.Cilt_No,;
		CAST('' as char(1)) as CuzdanSeriNo,;
		Personel.Sira_No ,;
		Personel.Mahalle as MahKoy,;
		Personel.Dogum_Yeri;
	FROM dbo.Buro Buro, dbo.Vekil Vekil;
		INNER JOIN dbo.Personel Personel;
			ON Vekil.Personel_Id = Personel.Personel_Id

DBSetProp('UYAPVEKILVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPVEKILVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPVEKILVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPVEKILVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPVEKILVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPVEKILVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPVEKILVIEW', 'View', 'Tables', 'dbo.Personel,dbo.Buro,dbo.Vekil')
DBSetProp('UYAPVEKILVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPVEKILVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPVEKILVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPVEKILVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPVEKILVIEW', 'View', 'Comment', "")
DBSetProp('UYAPVEKILVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPVEKILVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPVEKILVIEW
	GoExplorer.odbcx.Validate("UYAPVEKILVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFECDESCRIPT","Uyapvekilview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for UYAPVEKILVIEW
*** Props for the UYAPVEKILVIEW.id field.
DBSetProp('UYAPVEKILVIEW.id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.id', 'Field', 'UpdateName', 'Id')
DBSetProp('UYAPVEKILVIEW.id', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECDESCRIPT","Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECFRMCAPTN","Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECDLGCAPTN","Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECGRDCAPTN","Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECRPTCAPTN","Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFEMTOOLTIP","Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFEMSTATUSTXT","Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.baro_sicil_no field.
DBSetProp('UYAPVEKILVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Personel.Baro_Sicil_No')
DBSetProp('UYAPVEKILVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.tbb_no field.
DBSetProp('UYAPVEKILVIEW.tbb_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.tbb_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.tbb_no', 'Field', 'UpdateName', 'dbo.Personel.Tbb_No')
DBSetProp('UYAPVEKILVIEW.tbb_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.tbb_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECDESCRIPT","Tbb No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECFRMCAPTN","Tbb No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECDLGCAPTN","Tbb No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECGRDCAPTN","Tbb No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECRPTCAPTN","Tbb No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFEMTOOLTIP","Tbb No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFEMSTATUSTXT","Tbb No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tbb_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.buro_adi field.
DBSetProp('UYAPVEKILVIEW.buro_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.buro_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.buro_adi', 'Field', 'UpdateName', 'dbo.Buro.Buro_Adi')
DBSetProp('UYAPVEKILVIEW.buro_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPVEKILVIEW.buro_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECDESCRIPT","Buro Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECFRMCAPTN","Buro Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECDLGCAPTN","Buro Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECGRDCAPTN","Buro Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECRPTCAPTN","Buro Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFEMTOOLTIP","Buro Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFEMSTATUSTXT","Buro Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.buro_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.tckimlik_no field.
DBSetProp('UYAPVEKILVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Personel.TcKimlik_No')
DBSetProp('UYAPVEKILVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.vergi_no field.
DBSetProp('UYAPVEKILVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Personel.Vergi_No')
DBSetProp('UYAPVEKILVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.vekil_tipi field.
DBSetProp('UYAPVEKILVIEW.vekil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.vekil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.vekil_tipi', 'Field', 'UpdateName', 'dbo.Personel.Vekil_Tipi')
DBSetProp('UYAPVEKILVIEW.vekil_tipi', 'Field', 'DataType', "C(7)")
*** DBCX Field Properties for UYAPVEKILVIEW.vekil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECDESCRIPT","Vekil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECFRMCAPTN","Vekil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECDLGCAPTN","Vekil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECGRDCAPTN","Vekil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECRPTCAPTN","Vekil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFEMTOOLTIP","Vekil Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekil Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekil_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ssk_no field.
DBSetProp('UYAPVEKILVIEW.ssk_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ssk_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.ssk_no', 'Field', 'UpdateName', 'dbo.Personel.Ssk_No')
DBSetProp('UYAPVEKILVIEW.ssk_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.ssk_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECDESCRIPT","Ssk No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECFRMCAPTN","Ssk No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECDLGCAPTN","Ssk No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECGRDCAPTN","Ssk No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECRPTCAPTN","Ssk No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFEMTOOLTIP","Ssk No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFEMSTATUSTXT","Ssk No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ssk_no","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.borclu_vekili field.
DBSetProp('UYAPVEKILVIEW.borclu_vekili', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.borclu_vekili', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.borclu_vekili', 'Field', 'UpdateName', 'dbo.Vekil.Borclu_Vekili')
DBSetProp('UYAPVEKILVIEW.borclu_vekili', 'Field', 'DataType', "L")
*** DBCX Field Properties for UYAPVEKILVIEW.borclu_vekili
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECDESCRIPT","Borclu Vekili Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECFRMCAPTN","Borclu Vekili") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECDLGCAPTN","Borclu Vekili") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECGRDCAPTN","Borclu Vekili") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECRPTCAPTN","Borclu Vekili") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFEMTOOLTIP","Borclu Vekili") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFEMSTATUSTXT","Borclu Vekili") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.borclu_vekili","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.kayitno field.
DBSetProp('UYAPVEKILVIEW.kayitno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.kayitno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.kayitno', 'Field', 'UpdateName', 'KayitNo')
DBSetProp('UYAPVEKILVIEW.kayitno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPVEKILVIEW.kayitno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECDESCRIPT","Kayitno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECFRMCAPTN","Kayitno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECDLGCAPTN","Kayitno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECGRDCAPTN","Kayitno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECRPTCAPTN","Kayitno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFEMTOOLTIP","Kayitno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFEMSTATUSTXT","Kayitno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kayitno","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.soyadi field.
DBSetProp('UYAPVEKILVIEW.soyadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.soyadi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.soyadi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('UYAPVEKILVIEW.soyadi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPVEKILVIEW.soyadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECDESCRIPT","Soyadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECFRMCAPTN","Soyadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECDLGCAPTN","Soyadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECGRDCAPTN","Soyadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECRPTCAPTN","Soyadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFEMTOOLTIP","Soyadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFEMSTATUSTXT","Soyadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.soyadi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ybnnfskayitlioldgyer field.
DBSetProp('UYAPVEKILVIEW.ybnnfskayitlioldgyer', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ybnnfskayitlioldgyer', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.ybnnfskayitlioldgyer', 'Field', 'UpdateName', 'ybnNfsKayitliOldgyer')
DBSetProp('UYAPVEKILVIEW.ybnnfskayitlioldgyer', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPVEKILVIEW.ybnnfskayitlioldgyer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECDESCRIPT","Ybnnfskayitlioldgyer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECFRMCAPTN","Ybnnfskayitlioldgyer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECDLGCAPTN","Ybnnfskayitlioldgyer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECGRDCAPTN","Ybnnfskayitlioldgyer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECRPTCAPTN","Ybnnfskayitlioldgyer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMTOOLTIP","Ybnnfskayitlioldgyer") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMSTATUSTXT","Ybnnfskayitlioldgyer") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.id1 field.
*** DBCX Field Properties for UYAPVEKILVIEW.id1
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPVEKILVIEW.ailesirano field.
DBSetProp('UYAPVEKILVIEW.ailesirano', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ailesirano', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.ailesirano', 'Field', 'UpdateName', 'aileSiraNo')
DBSetProp('UYAPVEKILVIEW.ailesirano', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPVEKILVIEW.ailesirano
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECDESCRIPT","Ailesirano Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECFRMCAPTN","Ailesirano") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECDLGCAPTN","Ailesirano") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECGRDCAPTN","Ailesirano") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECRPTCAPTN","Ailesirano") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFEMTOOLTIP","Ailesirano") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFEMSTATUSTXT","Ailesirano") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ailesirano","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.cuzdanno field.
DBSetProp('UYAPVEKILVIEW.cuzdanno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.cuzdanno', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.cuzdanno', 'Field', 'UpdateName', 'dbo.Personel.Kimlik_No')
DBSetProp('UYAPVEKILVIEW.cuzdanno', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.cuzdanno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECDESCRIPT","Cuzdanno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECFRMCAPTN","Cuzdanno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECDLGCAPTN","Cuzdanno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECGRDCAPTN","Cuzdanno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECRPTCAPTN","Cuzdanno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFEMTOOLTIP","Cuzdanno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFEMSTATUSTXT","Cuzdanno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanno","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.baba_adi field.
DBSetProp('UYAPVEKILVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Personel.Baba_Adi')
DBSetProp('UYAPVEKILVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ana_adi field.
DBSetProp('UYAPVEKILVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Personel.Ana_Adi')
DBSetProp('UYAPVEKILVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.kimlik_no field.
*** DBCX Field Properties for UYAPVEKILVIEW.kimlik_no
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPVEKILVIEW.adi field.
DBSetProp('UYAPVEKILVIEW.adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('UYAPVEKILVIEW.adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPVEKILVIEW.adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECDESCRIPT","Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECFRMCAPTN","Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECDLGCAPTN","Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECGRDCAPTN","Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECRPTCAPTN","Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFEMTOOLTIP","Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFEMSTATUSTXT","Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.tckimlik_no1 field.
*** DBCX Field Properties for UYAPVEKILVIEW.tckimlik_no1
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPVEKILVIEW.cinsiyeti field.
DBSetProp('UYAPVEKILVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Personel.Cinsiyeti')
DBSetProp('UYAPVEKILVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPVEKILVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.cilt_no field.
DBSetProp('UYAPVEKILVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.Personel.Cilt_No')
DBSetProp('UYAPVEKILVIEW.cilt_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPVEKILVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.sira_no field.
DBSetProp('UYAPVEKILVIEW.sira_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.sira_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.sira_no', 'Field', 'UpdateName', 'dbo.Personel.Sira_No')
DBSetProp('UYAPVEKILVIEW.sira_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPVEKILVIEW.sira_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECDESCRIPT","Sira No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECFRMCAPTN","Sira No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECDLGCAPTN","Sira No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECGRDCAPTN","Sira No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECRPTCAPTN","Sira No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFEMTOOLTIP","Sira No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFEMSTATUSTXT","Sira No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.sira_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.mahalle field.
*** DBCX Field Properties for UYAPVEKILVIEW.mahalle
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPVEKILVIEW.dogum_yeri field.
DBSetProp('UYAPVEKILVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Personel.Dogum_Yeri')
DBSetProp('UYAPVEKILVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Dogum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Dogum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Dogum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Dogum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Dogum Yeri") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Dogum Yeri") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
