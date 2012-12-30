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
	AS SELECT CAST('VekilKisi_1' AS CHARACTER(15)) AS vekilkisi_id,;
		Personel.Baro_Sicil_No,;
		Personel.Tbb_No,;
		Buro.Buro_Adi,;
		Personel.TcKimlik_No,;
		Personel.Vergi_No,;
		Personel.Vekil_Tipi,;
		Personel.Ssk_No,;
		Vekil.Borclu_Vekili,;
		CAST('' AS CHAR(1)) AS kayitno,;
		Personel.Personel_Adi AS soyadi,;
		CAST('' AS CHAR(1)) AS ybnnfskayitlioldgyer,;
		CAST('kisiKurumBilgileri_1' AS CHAR(25)) AS kisikurumbilgileri_id,;
		CAST('' AS CHAR(1)) AS ailesirano,;
		Personel.Kimlik_No AS cuzdanno,;
		Personel.Baba_Adi,;
		Personel.Ana_Adi,;
		Personel.Personel_Adi AS adi,;
		CAST('' AS CHAR(1)) AS oncekisoyadi,;
		Personel.Cinsiyeti,;
		Personel.Cilt_No,;
		CAST('' AS CHAR(1)) AS cuzdanserino,;
		Personel.Sira_No,;
		Personel.Mahalle AS mahkoy,;
		Personel.Dogum_Yeri,;
		Personel.e_Posta,;
		Buro.Posta_Kodu,;
		CAST('Yurt Ýçi Ýþyeri Adresi' AS CHAR(25)) AS adresturuaciklama,;
		CAST('ADRTR00002' AS CHAR(10)) AS adresturu,;
		Personel.Cep_Tel_No AS ceptelefon,;
		Buro.Il_Adi AS il,;
		Buro.Ilce_Adi AS ilce,;
		Buro.Adres,;
		Buro.Tel AS telefon,;
		Buro.Faks,;
		CAST('Adres_1' AS CHAR(10)) AS adres_id,;
		CAST('' AS CHAR(2)) AS ilkodu,;
		CAST('' AS CHAR(3)) AS ilcekodu;
	FROM dbo.Vekil Vekil;
		INNER JOIN dbo.Personel Personel;
			ON Vekil.Personel_Id = Personel.Personel_Id, {oj dbo.Buro Buro;
		LEFT OUTER JOIN dbo.Iluyapkodu Iluyapkodu;
			ON UPPER(Buro.Il_Adi) = UPPER(Iluyapkodu.Il_Adi)}

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
DBSetProp('UYAPVEKILVIEW', 'View', 'FetchSize', -1)
DBSetProp('UYAPVEKILVIEW', 'View', 'ParameterList', "vp_Vekil_Fk,'C'")
DBSetProp('UYAPVEKILVIEW', 'View', 'Comment', "")
DBSetProp('UYAPVEKILVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPVEKILVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPVEKILVIEW
	GoExplorer.odbcx.Validate("UYAPVEKILVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFECDESCRIPT","Uyapvekilview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Vekil_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Vekil Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECFRMCAPTN","Vekil Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECDLGCAPTN","Vekil Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMTOOLTIP","Vekil Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Vekil Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMCOMPARETO","Vekil.Vekil_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for UYAPVEKILVIEW
*** Props for the UYAPVEKILVIEW.vekilkisi_id field.
DBSetProp('UYAPVEKILVIEW.vekilkisi_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.vekilkisi_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.vekilkisi_id', 'Field', 'UpdateName', 'VekilKisi_id')
DBSetProp('UYAPVEKILVIEW.vekilkisi_id', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.vekilkisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECDESCRIPT","Vekilkisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECFRMCAPTN","Vekilkisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECDLGCAPTN","Vekilkisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECGRDCAPTN","Vekilkisi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECRPTCAPTN","Vekilkisi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFEMTOOLTIP","Vekilkisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFEMSTATUSTXT","Vekilkisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.vekilkisi_id","FIELD",;
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
 
*** Props for the UYAPVEKILVIEW.kisikurumbilgileri_id field.
DBSetProp('UYAPVEKILVIEW.kisikurumbilgileri_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.kisikurumbilgileri_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.kisikurumbilgileri_id', 'Field', 'UpdateName', 'KisiKurumBilgileri_id')
DBSetProp('UYAPVEKILVIEW.kisikurumbilgileri_id', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.kisikurumbilgileri_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDESCRIPT","Kisikurumbilgileri Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECFRMCAPTN","Kisikurumbilgileri Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDLGCAPTN","Kisikurumbilgileri Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECGRDCAPTN","Kisikurumbilgileri Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECRPTCAPTN","Kisikurumbilgileri Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMTOOLTIP","Kisikurumbilgileri Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMSTATUSTXT","Kisikurumbilgileri Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDISPORDER",13) &&Display Order
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
 
*** Props for the UYAPVEKILVIEW.oncekisoyadi field.
DBSetProp('UYAPVEKILVIEW.oncekisoyadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.oncekisoyadi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.oncekisoyadi', 'Field', 'UpdateName', 'OncekiSoyadi')
DBSetProp('UYAPVEKILVIEW.oncekisoyadi', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPVEKILVIEW.oncekisoyadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECDESCRIPT","Oncekisoyadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECFRMCAPTN","Oncekisoyadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECDLGCAPTN","Oncekisoyadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECGRDCAPTN","Oncekisoyadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECRPTCAPTN","Oncekisoyadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFEMTOOLTIP","Oncekisoyadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFEMSTATUSTXT","Oncekisoyadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.oncekisoyadi","FIELD",;
		"VFENDISPORDER",20) &&Display Order
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
 
*** Props for the UYAPVEKILVIEW.cuzdanserino field.
DBSetProp('UYAPVEKILVIEW.cuzdanserino', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.cuzdanserino', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.cuzdanserino', 'Field', 'UpdateName', 'CuzdanSeriNo')
DBSetProp('UYAPVEKILVIEW.cuzdanserino', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPVEKILVIEW.cuzdanserino
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECDESCRIPT","Cuzdanserino Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECFRMCAPTN","Cuzdanserino") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECDLGCAPTN","Cuzdanserino") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECGRDCAPTN","Cuzdanserino") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECRPTCAPTN","Cuzdanserino") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFEMTOOLTIP","Cuzdanserino") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFEMSTATUSTXT","Cuzdanserino") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.cuzdanserino","FIELD",;
		"VFENDISPORDER",23) &&Display Order
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
 
*** Props for the UYAPVEKILVIEW.mahkoy field.
DBSetProp('UYAPVEKILVIEW.mahkoy', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.mahkoy', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.mahkoy', 'Field', 'UpdateName', 'dbo.Personel.Mahalle')
DBSetProp('UYAPVEKILVIEW.mahkoy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.mahkoy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECDESCRIPT","Mahkoy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECFRMCAPTN","Mahkoy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECDLGCAPTN","Mahkoy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECGRDCAPTN","Mahkoy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECRPTCAPTN","Mahkoy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFEMTOOLTIP","Mahkoy") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFEMSTATUSTXT","Mahkoy") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.mahkoy","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
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
 
*** Props for the UYAPVEKILVIEW.e_posta field.
DBSetProp('UYAPVEKILVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Personel.e_Posta')
DBSetProp('UYAPVEKILVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPVEKILVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","E Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","E Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","E Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","E Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","E Posta") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","E Posta") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.e_posta","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.posta_kodu field.
DBSetProp('UYAPVEKILVIEW.posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.posta_kodu', 'Field', 'UpdateName', 'dbo.Buro.Posta_Kodu')
DBSetProp('UYAPVEKILVIEW.posta_kodu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECDESCRIPT","Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.posta_kodu","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.adresturuaciklama field.
DBSetProp('UYAPVEKILVIEW.adresturuaciklama', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.adresturuaciklama', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.adresturuaciklama', 'Field', 'UpdateName', 'AdresTuruAciklama')
DBSetProp('UYAPVEKILVIEW.adresturuaciklama', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPVEKILVIEW.adresturuaciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECDESCRIPT","Adresturuaciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECFRMCAPTN","Adresturuaciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECDLGCAPTN","Adresturuaciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECGRDCAPTN","Adresturuaciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECRPTCAPTN","Adresturuaciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFEMTOOLTIP","Adresturuaciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFEMSTATUSTXT","Adresturuaciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturuaciklama","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.adresturu field.
DBSetProp('UYAPVEKILVIEW.adresturu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.adresturu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.adresturu', 'Field', 'UpdateName', 'AdresTuru')
DBSetProp('UYAPVEKILVIEW.adresturu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPVEKILVIEW.adresturu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECDESCRIPT","Adresturu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECFRMCAPTN","Adresturu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECDLGCAPTN","Adresturu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECGRDCAPTN","Adresturu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECRPTCAPTN","Adresturu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFEMTOOLTIP","Adresturu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFEMSTATUSTXT","Adresturu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adresturu","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ceptelefon field.
DBSetProp('UYAPVEKILVIEW.ceptelefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ceptelefon', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.ceptelefon', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_No')
DBSetProp('UYAPVEKILVIEW.ceptelefon', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.ceptelefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECDESCRIPT","Ceptelefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECFRMCAPTN","Ceptelefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECDLGCAPTN","Ceptelefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECGRDCAPTN","Ceptelefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECRPTCAPTN","Ceptelefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFEMTOOLTIP","Ceptelefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFEMSTATUSTXT","Ceptelefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ceptelefon","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.il field.
DBSetProp('UYAPVEKILVIEW.il', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.il', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.il', 'Field', 'UpdateName', 'dbo.Buro.Il_Adi')
DBSetProp('UYAPVEKILVIEW.il', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.il
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECDESCRIPT","Il Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECFRMCAPTN","Il") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECDLGCAPTN","Il") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECGRDCAPTN","Il") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECRPTCAPTN","Il") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFEMTOOLTIP","Il") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFEMSTATUSTXT","Il") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.il","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ilce field.
DBSetProp('UYAPVEKILVIEW.ilce', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ilce', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.ilce', 'Field', 'UpdateName', 'dbo.Buro.Ilce_Adi')
DBSetProp('UYAPVEKILVIEW.ilce', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.ilce
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECDESCRIPT","Ilce Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECFRMCAPTN","Ilce") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECDLGCAPTN","Ilce") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECGRDCAPTN","Ilce") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECRPTCAPTN","Ilce") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFEMTOOLTIP","Ilce") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFEMSTATUSTXT","Ilce") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilce","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.adres field.
DBSetProp('UYAPVEKILVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.adres', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.adres', 'Field', 'UpdateName', 'dbo.Buro.Adres')
DBSetProp('UYAPVEKILVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for UYAPVEKILVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.telefon field.
DBSetProp('UYAPVEKILVIEW.telefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.telefon', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.telefon', 'Field', 'UpdateName', 'dbo.Buro.Tel')
DBSetProp('UYAPVEKILVIEW.telefon', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.telefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECDESCRIPT","Telefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECFRMCAPTN","Telefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECDLGCAPTN","Telefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECGRDCAPTN","Telefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECRPTCAPTN","Telefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFEMTOOLTIP","Telefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFEMSTATUSTXT","Telefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.telefon","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.faks field.
DBSetProp('UYAPVEKILVIEW.faks', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.faks', 'Field', 'Updatable', .T.)
DBSetProp('UYAPVEKILVIEW.faks', 'Field', 'UpdateName', 'dbo.Buro.Faks')
DBSetProp('UYAPVEKILVIEW.faks', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPVEKILVIEW.faks
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECDESCRIPT","Faks Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECFRMCAPTN","Faks") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECDLGCAPTN","Faks") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECGRDCAPTN","Faks") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECRPTCAPTN","Faks") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFEMTOOLTIP","Faks") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFEMSTATUSTXT","Faks") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.faks","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.adres_id field.
DBSetProp('UYAPVEKILVIEW.adres_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.adres_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.adres_id', 'Field', 'UpdateName', 'Adres_Id')
DBSetProp('UYAPVEKILVIEW.adres_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPVEKILVIEW.adres_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECDESCRIPT","Adres Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECFRMCAPTN","Adres Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECDLGCAPTN","Adres Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECGRDCAPTN","Adres Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECRPTCAPTN","Adres Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFEMTOOLTIP","Adres Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFEMSTATUSTXT","Adres Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.adres_id","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ilkodu field.
DBSetProp('UYAPVEKILVIEW.ilkodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ilkodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.ilkodu', 'Field', 'UpdateName', 'IlKodu')
DBSetProp('UYAPVEKILVIEW.ilkodu', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for UYAPVEKILVIEW.ilkodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECDESCRIPT","Ilkodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECFRMCAPTN","Ilkodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECDLGCAPTN","Ilkodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECGRDCAPTN","Ilkodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECRPTCAPTN","Ilkodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFEMTOOLTIP","Ilkodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFEMSTATUSTXT","Ilkodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilkodu","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the UYAPVEKILVIEW.ilcekodu field.
DBSetProp('UYAPVEKILVIEW.ilcekodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPVEKILVIEW.ilcekodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPVEKILVIEW.ilcekodu', 'Field', 'UpdateName', 'IlceKodu')
DBSetProp('UYAPVEKILVIEW.ilcekodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for UYAPVEKILVIEW.ilcekodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECDESCRIPT","Ilcekodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECFRMCAPTN","Ilcekodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECDLGCAPTN","Ilcekodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECGRDCAPTN","Ilcekodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECRPTCAPTN","Ilcekodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFEMTOOLTIP","Ilcekodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFEMSTATUSTXT","Ilcekodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPVEKILVIEW.ilcekodu","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
