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
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "UYAPBORCLUVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_5' as char(10)) As Taraf_Id,;
		CAST('kisiKurumBilgileri_5' as char(25)) as KisiKurumBilgileri_Id,;
	    CAST('' as char(1)) As KayitNo,;
		CAST('' as char(1)) As ybnNfsKayitliOldgYer,;
	    CAST('' as char(1)) As AileSiraNo,;
		CAST('' as char(1)) As CuzdanNo,;
	    Rehber.Baba_Adi as BabaAdi,;
		Rehber.Ana_adi as AnaAdi,;
	    Rehber.Dogum_Tarihi as DogumTarihi,;
		rehber.Adi as Adi,;
	    Rehber.TcKimlik_No as TcKimlikNo,;
		Rehber.Cinsiyeti as Cinsiyeti,;
	    Rehber.Cilt_No as CiltNo,;
		rehber.Kimlik_No as CuzdanSeriNo,;
		Rehber.Sira_No as SiraNo,;
		Rehber.Mahalle as mahKoy,;
		Rehber.Dogum_Yeri as DogumYeri; 
	FROM {oj{oj dbo.Borclu Borclu;
		INNER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id;
		LEFT OUTER JOIN dbo.Iletisim Iletisim;
			ON Rehber.Rehber_Id = Iletisim.Iletisim_Fk};
		LEFT OUTER JOIN dbo.Adres Adres;
			ON Rehber.Rehber_Id = Adres.Adres_Fk}

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
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPBORCLUVIEW', 'View', 'Comment', "")
DBSetProp('UYAPBORCLUVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPBORCLUVIEW
	GoExplorer.odbcx.Validate("UYAPBORCLUVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECDESCRIPT","Uyapborcluview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
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
 
*** Props for the UYAPBORCLUVIEW.k_s_kurumbilgileri_id field.
*** DBCX Field Properties for UYAPBORCLUVIEW.k_s_kurumbilgileri_id
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPBORCLUVIEW.ad field.
*** DBCX Field Properties for UYAPBORCLUVIEW.ad
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPBORCLUVIEW.tckimlik_no field.
*** DBCX Field Properties for UYAPBORCLUVIEW.tckimlik_no
IF lWriteDBCXProps
ENDIF
 
