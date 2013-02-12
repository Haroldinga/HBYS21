***************** Begin View Definition UYAPBORCLUVIEW ***************


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



CREATE SQL VIEW "UYAPBORCLUVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_5' AS CHAR(10)) AS taraf_id,;
		CAST('kisiKurumBilgileri_5' AS CHAR(25)) AS kisikurumbilgileri_id,;
		CAST('kisiTumBilgileri_5' AS CHAR(25)) AS kisiTumbilgileri_id,;
		CAST('' AS CHAR(10)) AS kayitno,;
		CAST('' AS CHAR(15)) AS ybnnfskayitlioldgyer,;
		CAST('' AS CHAR(10)) AS ailesirano,;
		CAST('' AS CHAR(10)) AS cuzdanno,;
		Rehber.Baba_Adi AS babaadi,;
		Rehber.Ana_Adi AS anaadi,;
		Rehber.Dogum_Tarihi AS dogumtarihi,;
		Rehber.Adi AS ad,;
		Rehber.Adi AS soyadi,;
		Rehber.TcKimlik_No AS tckimlikno,;
		Rehber.Cinsiyeti AS cinsiyeti,;
		Rehber.Cilt_No AS ciltno,;
		Rehber.Kimlik_No AS cuzdanserino,;
		Rehber.Sira_No AS sirano,;
		Rehber.Mahalle AS mahkoy,;
		Rehber.Dogum_Yeri AS dogumyeri,;
		Rehber.e_Posta AS elektronikpostaadresi,;
		Adres.Posta_Kodu AS postakodu,;
		CAST('Yurt Ýçi Ýkametgah Adresi' AS CHAR(25)) AS adresturuaciklama,;
		CAST('' AS CHAR(15)) AS ceptelefon,;
		Adres.Il_Adi AS il,;
		CAST('' AS CHAR(15)) AS fax,;
		CAST('Adres_3' AS CHAR(10)) AS adres_id,;
		CAST('' AS CHAR(2)) AS ilkodu,;
		Adres.Ilce_Adi AS ilce,;
		Adres.Adres AS adres,;
		Rehber.Iletisim_Telefonu AS telefon,;
		CAST('' AS CHAR(3)) AS ilcekodu,;
		CAST('ADRTR00001' AS CHAR(10)) AS adresturu,;
		CAST('BORCLU/MUFLIS' AS CHAR(15)) AS rol,;
		CAST('22' AS CHAR(2)) AS rol_id;
	FROM {oj{oj{oj dbo.Borclu Borclu;
		INNER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id;
		LEFT OUTER JOIN dbo.Iletisim Iletisim;
			ON Rehber.Rehber_Id = Iletisim.Iletisim_Fk};
		LEFT OUTER JOIN dbo.Adres Adres;
			ON Rehber.Rehber_Id = Adres.Adres_Fk};
		LEFT OUTER JOIN dbo.AdresTipi Adrestipi;
			ON Adres.Adres_Tipi = Adrestipi.Adres_Tipi}

DBSetProp('UYAPBORCLUVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPBORCLUVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'Tables', 'dbo.Borclu')
DBSetProp('UYAPBORCLUVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchSize', -1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'ParameterList', "vp_Borclu_Fk,'C'")
DBSetProp('UYAPBORCLUVIEW', 'View', 'Comment', "")
DBSetProp('UYAPBORCLUVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPBORCLUVIEW
	GoExplorer.odbcx.Validate("UYAPBORCLUVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECDESCRIPT","Uyapborcluview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Borclu_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECFRMCAPTN","Borclu Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECDLGCAPTN","Borclu Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMTOOLTIP","Borclu Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Borclu Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMCOMPARETO","Borclu.Borclu_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for UYAPBORCLUVIEW
*** Props for the UYAPBORCLUVIEW.taraf_id field.
DBSetProp('UYAPBORCLUVIEW.taraf_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.taraf_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.taraf_id', 'Field', 'UpdateName', 'Taraf_Id')
DBSetProp('UYAPBORCLUVIEW.taraf_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.taraf_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECDESCRIPT","Taraf Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECFRMCAPTN","Taraf Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECDLGCAPTN","Taraf Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECGRDCAPTN","Taraf Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECRPTCAPTN","Taraf Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFEMTOOLTIP","Taraf Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFEMSTATUSTXT","Taraf Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.taraf_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.kisikurumbilgileri_id field.
DBSetProp('UYAPBORCLUVIEW.kisikurumbilgileri_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.kisikurumbilgileri_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.kisikurumbilgileri_id', 'Field', 'UpdateName', 'KisiKurumBilgileri_Id')
DBSetProp('UYAPBORCLUVIEW.kisikurumbilgileri_id', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.kisikurumbilgileri_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDESCRIPT","Kisikurumbilgileri Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECFRMCAPTN","Kisikurumbilgileri Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDLGCAPTN","Kisikurumbilgileri Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECGRDCAPTN","Kisikurumbilgileri Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECRPTCAPTN","Kisikurumbilgileri Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMTOOLTIP","Kisikurumbilgileri Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMSTATUSTXT","Kisikurumbilgileri Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.kisitumbilgileri_id field.
DBSetProp('UYAPBORCLUVIEW.kisitumbilgileri_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.kisitumbilgileri_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.kisitumbilgileri_id', 'Field', 'UpdateName', 'kisiTumbilgileri_id')
DBSetProp('UYAPBORCLUVIEW.kisitumbilgileri_id', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.kisitumbilgileri_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECDESCRIPT","Kisitumbilgileri Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECFRMCAPTN","Kisitumbilgileri Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECDLGCAPTN","Kisitumbilgileri Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECGRDCAPTN","Kisitumbilgileri Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECRPTCAPTN","Kisitumbilgileri Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFEMTOOLTIP","Kisitumbilgileri Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFEMSTATUSTXT","Kisitumbilgileri Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kisitumbilgileri_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.kayitno field.
DBSetProp('UYAPBORCLUVIEW.kayitno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.kayitno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.kayitno', 'Field', 'UpdateName', 'KayitNo')
DBSetProp('UYAPBORCLUVIEW.kayitno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPBORCLUVIEW.kayitno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECDESCRIPT","Kayitno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECFRMCAPTN","Kayitno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECDLGCAPTN","Kayitno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECGRDCAPTN","Kayitno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECRPTCAPTN","Kayitno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFEMTOOLTIP","Kayitno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFEMSTATUSTXT","Kayitno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.kayitno","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ybnnfskayitlioldgyer field.
DBSetProp('UYAPBORCLUVIEW.ybnnfskayitlioldgyer', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ybnnfskayitlioldgyer', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ybnnfskayitlioldgyer', 'Field', 'UpdateName', 'ybnNfsKayitliOldgYer')
DBSetProp('UYAPBORCLUVIEW.ybnnfskayitlioldgyer', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ybnnfskayitlioldgyer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECDESCRIPT","Ybnnfskayitlioldgyer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECFRMCAPTN","Ybnnfskayitlioldgyer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECDLGCAPTN","Ybnnfskayitlioldgyer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECGRDCAPTN","Ybnnfskayitlioldgyer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECRPTCAPTN","Ybnnfskayitlioldgyer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMTOOLTIP","Ybnnfskayitlioldgyer") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMSTATUSTXT","Ybnnfskayitlioldgyer") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ybnnfskayitlioldgyer","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ailesirano field.
DBSetProp('UYAPBORCLUVIEW.ailesirano', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ailesirano', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ailesirano', 'Field', 'UpdateName', 'AileSiraNo')
DBSetProp('UYAPBORCLUVIEW.ailesirano', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ailesirano
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECDESCRIPT","Ailesirano Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECFRMCAPTN","Ailesirano") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECDLGCAPTN","Ailesirano") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECGRDCAPTN","Ailesirano") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECRPTCAPTN","Ailesirano") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFEMTOOLTIP","Ailesirano") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFEMSTATUSTXT","Ailesirano") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ailesirano","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.cuzdanno field.
DBSetProp('UYAPBORCLUVIEW.cuzdanno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.cuzdanno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.cuzdanno', 'Field', 'UpdateName', 'CuzdanNo')
DBSetProp('UYAPBORCLUVIEW.cuzdanno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPBORCLUVIEW.cuzdanno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECDESCRIPT","Cuzdanno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECFRMCAPTN","Cuzdanno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECDLGCAPTN","Cuzdanno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECGRDCAPTN","Cuzdanno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECRPTCAPTN","Cuzdanno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFEMTOOLTIP","Cuzdanno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFEMSTATUSTXT","Cuzdanno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanno","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.babaadi field.
DBSetProp('UYAPBORCLUVIEW.babaadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.babaadi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.babaadi', 'Field', 'UpdateName', 'dbo.Rehber.Baba_Adi')
DBSetProp('UYAPBORCLUVIEW.babaadi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.babaadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECDESCRIPT","Babaadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECFRMCAPTN","Babaadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECDLGCAPTN","Babaadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECGRDCAPTN","Babaadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECRPTCAPTN","Babaadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFEMTOOLTIP","Babaadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFEMSTATUSTXT","Babaadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.babaadi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.anaadi field.
DBSetProp('UYAPBORCLUVIEW.anaadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.anaadi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.anaadi', 'Field', 'UpdateName', 'dbo.Rehber.Ana_Adi')
DBSetProp('UYAPBORCLUVIEW.anaadi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.anaadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECDESCRIPT","Anaadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECFRMCAPTN","Anaadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECDLGCAPTN","Anaadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECGRDCAPTN","Anaadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECRPTCAPTN","Anaadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFEMTOOLTIP","Anaadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFEMSTATUSTXT","Anaadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.anaadi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.dogumtarihi field.
DBSetProp('UYAPBORCLUVIEW.dogumtarihi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.dogumtarihi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.dogumtarihi', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Tarihi')
DBSetProp('UYAPBORCLUVIEW.dogumtarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for UYAPBORCLUVIEW.dogumtarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECDESCRIPT","Dogumtarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECFRMCAPTN","Dogumtarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECDLGCAPTN","Dogumtarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECGRDCAPTN","Dogumtarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECRPTCAPTN","Dogumtarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFEMTOOLTIP","Dogumtarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFEMSTATUSTXT","Dogumtarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumtarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ad field.
DBSetProp('UYAPBORCLUVIEW.ad', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ad', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ad', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('UYAPBORCLUVIEW.ad', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ad
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECDESCRIPT","Ad Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECFRMCAPTN","Ad") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECDLGCAPTN","Ad") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECGRDCAPTN","Ad") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECRPTCAPTN","Ad") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFEMTOOLTIP","Ad") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFEMSTATUSTXT","Ad") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ad","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.soyadi field.
DBSetProp('UYAPBORCLUVIEW.soyadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.soyadi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.soyadi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('UYAPBORCLUVIEW.soyadi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPBORCLUVIEW.soyadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECDESCRIPT","Soyadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECFRMCAPTN","Soyadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECDLGCAPTN","Soyadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECGRDCAPTN","Soyadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECRPTCAPTN","Soyadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFEMTOOLTIP","Soyadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFEMSTATUSTXT","Soyadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.soyadi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.tckimlikno field.
DBSetProp('UYAPBORCLUVIEW.tckimlikno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.tckimlikno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.tckimlikno', 'Field', 'UpdateName', 'dbo.Rehber.TcKimlik_No')
DBSetProp('UYAPBORCLUVIEW.tckimlikno', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.tckimlikno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECDESCRIPT","Tckimlikno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECFRMCAPTN","Tckimlikno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECDLGCAPTN","Tckimlikno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECGRDCAPTN","Tckimlikno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECRPTCAPTN","Tckimlikno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFEMTOOLTIP","Tckimlikno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFEMSTATUSTXT","Tckimlikno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlikno","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.cinsiyeti field.
DBSetProp('UYAPBORCLUVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.cinsiyeti', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Rehber.Cinsiyeti')
DBSetProp('UYAPBORCLUVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ciltno field.
DBSetProp('UYAPBORCLUVIEW.ciltno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ciltno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ciltno', 'Field', 'UpdateName', 'dbo.Rehber.Cilt_No')
DBSetProp('UYAPBORCLUVIEW.ciltno', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ciltno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECDESCRIPT","Ciltno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECFRMCAPTN","Ciltno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECDLGCAPTN","Ciltno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECGRDCAPTN","Ciltno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECRPTCAPTN","Ciltno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFEMTOOLTIP","Ciltno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFEMSTATUSTXT","Ciltno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ciltno","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.cuzdanserino field.
DBSetProp('UYAPBORCLUVIEW.cuzdanserino', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.cuzdanserino', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.cuzdanserino', 'Field', 'UpdateName', 'dbo.Rehber.Kimlik_No')
DBSetProp('UYAPBORCLUVIEW.cuzdanserino', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.cuzdanserino
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECDESCRIPT","Cuzdanserino Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECFRMCAPTN","Cuzdanserino") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECDLGCAPTN","Cuzdanserino") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECGRDCAPTN","Cuzdanserino") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECRPTCAPTN","Cuzdanserino") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFEMTOOLTIP","Cuzdanserino") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFEMSTATUSTXT","Cuzdanserino") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.cuzdanserino","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.sirano field.
DBSetProp('UYAPBORCLUVIEW.sirano', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.sirano', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.sirano', 'Field', 'UpdateName', 'dbo.Rehber.Sira_No')
DBSetProp('UYAPBORCLUVIEW.sirano', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.sirano
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECDESCRIPT","Sirano Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECFRMCAPTN","Sirano") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECDLGCAPTN","Sirano") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECGRDCAPTN","Sirano") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECRPTCAPTN","Sirano") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFEMTOOLTIP","Sirano") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFEMSTATUSTXT","Sirano") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.sirano","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.mahkoy field.
DBSetProp('UYAPBORCLUVIEW.mahkoy', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.mahkoy', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.mahkoy', 'Field', 'UpdateName', 'dbo.Rehber.Mahalle')
DBSetProp('UYAPBORCLUVIEW.mahkoy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.mahkoy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECDESCRIPT","Mahkoy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECFRMCAPTN","Mahkoy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECDLGCAPTN","Mahkoy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECGRDCAPTN","Mahkoy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECRPTCAPTN","Mahkoy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFEMTOOLTIP","Mahkoy") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFEMSTATUSTXT","Mahkoy") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.mahkoy","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.dogumyeri field.
DBSetProp('UYAPBORCLUVIEW.dogumyeri', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.dogumyeri', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.dogumyeri', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Yeri')
DBSetProp('UYAPBORCLUVIEW.dogumyeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.dogumyeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECDESCRIPT","Dogumyeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECFRMCAPTN","Dogumyeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECDLGCAPTN","Dogumyeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECGRDCAPTN","Dogumyeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECRPTCAPTN","Dogumyeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFEMTOOLTIP","Dogumyeri") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFEMSTATUSTXT","Dogumyeri") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.dogumyeri","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.elektronikpostaadresi field.
DBSetProp('UYAPBORCLUVIEW.elektronikpostaadresi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.elektronikpostaadresi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.elektronikpostaadresi', 'Field', 'UpdateName', 'dbo.Rehber.e_Posta')
DBSetProp('UYAPBORCLUVIEW.elektronikpostaadresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for UYAPBORCLUVIEW.elektronikpostaadresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECDESCRIPT","Elektronikpostaadresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECFRMCAPTN","Elektronikpostaadresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECDLGCAPTN","Elektronikpostaadresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECGRDCAPTN","Elektronikpostaadresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECRPTCAPTN","Elektronikpostaadresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFEMTOOLTIP","Elektronikpostaadresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFEMSTATUSTXT","Elektronikpostaadresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.elektronikpostaadresi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.postakodu field.
DBSetProp('UYAPBORCLUVIEW.postakodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.postakodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.postakodu', 'Field', 'UpdateName', 'dbo.Adres.Posta_Kodu')
DBSetProp('UYAPBORCLUVIEW.postakodu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.postakodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECDESCRIPT","Postakodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECFRMCAPTN","Postakodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECDLGCAPTN","Postakodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECGRDCAPTN","Postakodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECRPTCAPTN","Postakodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFEMTOOLTIP","Postakodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFEMSTATUSTXT","Postakodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.postakodu","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.adresturuaciklama field.
DBSetProp('UYAPBORCLUVIEW.adresturuaciklama', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.adresturuaciklama', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.adresturuaciklama', 'Field', 'UpdateName', 'adresturuaciklama')
DBSetProp('UYAPBORCLUVIEW.adresturuaciklama', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.adresturuaciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECDESCRIPT","Adresturuaciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECFRMCAPTN","Adresturuaciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECDLGCAPTN","Adresturuaciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECGRDCAPTN","Adresturuaciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECRPTCAPTN","Adresturuaciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFEMTOOLTIP","Adresturuaciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFEMSTATUSTXT","Adresturuaciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturuaciklama","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ceptelefon field.
DBSetProp('UYAPBORCLUVIEW.ceptelefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ceptelefon', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ceptelefon', 'Field', 'UpdateName', 'ceptelefon')
DBSetProp('UYAPBORCLUVIEW.ceptelefon', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ceptelefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECDESCRIPT","Ceptelefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECFRMCAPTN","Ceptelefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECDLGCAPTN","Ceptelefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECGRDCAPTN","Ceptelefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECRPTCAPTN","Ceptelefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFEMTOOLTIP","Ceptelefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFEMSTATUSTXT","Ceptelefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ceptelefon","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.il field.
DBSetProp('UYAPBORCLUVIEW.il', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.il', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.il', 'Field', 'UpdateName', 'dbo.Adres.Il_Adi')
DBSetProp('UYAPBORCLUVIEW.il', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.il
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECDESCRIPT","Il Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECFRMCAPTN","Il") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECDLGCAPTN","Il") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECGRDCAPTN","Il") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECRPTCAPTN","Il") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFEMTOOLTIP","Il") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFEMSTATUSTXT","Il") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.il","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the UYAPBORCLUVIEW.fax field.
DBSetProp('UYAPBORCLUVIEW.fax', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.fax', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.fax', 'Field', 'UpdateName', 'Fax')
DBSetProp('UYAPBORCLUVIEW.fax', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.fax
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECDESCRIPT","Fax Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECFRMCAPTN","Fax") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECDLGCAPTN","Fax") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECGRDCAPTN","Fax") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECRPTCAPTN","Fax") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFEMTOOLTIP","Fax") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFEMSTATUSTXT","Fax") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.fax","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.adres_id field.
DBSetProp('UYAPBORCLUVIEW.adres_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.adres_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.adres_id', 'Field', 'UpdateName', 'Adres_Id')
DBSetProp('UYAPBORCLUVIEW.adres_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.adres_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECDESCRIPT","Adres Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECFRMCAPTN","Adres Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECDLGCAPTN","Adres Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECGRDCAPTN","Adres Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECRPTCAPTN","Adres Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFEMTOOLTIP","Adres Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFEMSTATUSTXT","Adres Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres_id","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ilkodu field.
DBSetProp('UYAPBORCLUVIEW.ilkodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ilkodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ilkodu', 'Field', 'UpdateName', 'IlKOdu')
DBSetProp('UYAPBORCLUVIEW.ilkodu', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ilkodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECDESCRIPT","Ilkodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECFRMCAPTN","Ilkodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECDLGCAPTN","Ilkodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECGRDCAPTN","Ilkodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECRPTCAPTN","Ilkodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFEMTOOLTIP","Ilkodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFEMSTATUSTXT","Ilkodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilkodu","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ilce field.
DBSetProp('UYAPBORCLUVIEW.ilce', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ilce', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ilce', 'Field', 'UpdateName', 'dbo.Adres.Ilce_Adi')
DBSetProp('UYAPBORCLUVIEW.ilce', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ilce
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECDESCRIPT","Ilce Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECFRMCAPTN","Ilce") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECDLGCAPTN","Ilce") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECGRDCAPTN","Ilce") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECRPTCAPTN","Ilce") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFEMTOOLTIP","Ilce") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFEMSTATUSTXT","Ilce") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilce","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.adres field.
DBSetProp('UYAPBORCLUVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.adres', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.adres', 'Field', 'UpdateName', 'dbo.Adres.Adres')
DBSetProp('UYAPBORCLUVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for UYAPBORCLUVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adres","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.telefon field.
DBSetProp('UYAPBORCLUVIEW.telefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.telefon', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.telefon', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Telefonu')
DBSetProp('UYAPBORCLUVIEW.telefon', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPBORCLUVIEW.telefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECDESCRIPT","Telefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECFRMCAPTN","Telefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECDLGCAPTN","Telefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECGRDCAPTN","Telefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECRPTCAPTN","Telefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFEMTOOLTIP","Telefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFEMSTATUSTXT","Telefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.telefon","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ilcekodu field.
DBSetProp('UYAPBORCLUVIEW.ilcekodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.ilcekodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.ilcekodu', 'Field', 'UpdateName', 'Ilcekodu')
DBSetProp('UYAPBORCLUVIEW.ilcekodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for UYAPBORCLUVIEW.ilcekodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECDESCRIPT","Ilcekodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECFRMCAPTN","Ilcekodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECDLGCAPTN","Ilcekodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECGRDCAPTN","Ilcekodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECRPTCAPTN","Ilcekodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFEMTOOLTIP","Ilcekodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFEMSTATUSTXT","Ilcekodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.ilcekodu","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.adresturu field.
DBSetProp('UYAPBORCLUVIEW.adresturu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.adresturu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.adresturu', 'Field', 'UpdateName', 'AdresTuru')
DBSetProp('UYAPBORCLUVIEW.adresturu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPBORCLUVIEW.adresturu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECDESCRIPT","Adresturu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECFRMCAPTN","Adresturu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECDLGCAPTN","Adresturu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECGRDCAPTN","Adresturu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECRPTCAPTN","Adresturu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFEMTOOLTIP","Adresturu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFEMSTATUSTXT","Adresturu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.adresturu","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.rol field.
DBSetProp('UYAPBORCLUVIEW.rol', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.rol', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.rol', 'Field', 'UpdateName', 'Rol')
DBSetProp('UYAPBORCLUVIEW.rol', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.rol
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECDESCRIPT","Rol Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECFRMCAPTN","Rol") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECDLGCAPTN","Rol") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECGRDCAPTN","Rol") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECRPTCAPTN","Rol") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFEMTOOLTIP","Rol") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFEMSTATUSTXT","Rol") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the UYAPBORCLUVIEW.rol_id field.
DBSetProp('UYAPBORCLUVIEW.rol_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.rol_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPBORCLUVIEW.rol_id', 'Field', 'UpdateName', 'Rol_Id')
DBSetProp('UYAPBORCLUVIEW.rol_id', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for UYAPBORCLUVIEW.rol_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECDESCRIPT","Rol Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECFRMCAPTN","Rol Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECDLGCAPTN","Rol Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECGRDCAPTN","Rol Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECRPTCAPTN","Rol Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFEMTOOLTIP","Rol Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFEMSTATUSTXT","Rol Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.rol_id","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
