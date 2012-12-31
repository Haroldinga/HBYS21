***************** Begin View Definition DOKUMANVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "DOKUMANVIEW" ; 
 REMOTE CONNECT "HBYSReportConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Borc_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Ihtarname_Tarihi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Takip_Alacak_Hesabi,;
		Icradosyahesabi.Toplam_Alacak_Hesabi,;
		CAST(STR(Icradosyahesabi.temerrut_faizi_orani,5,2) AS CHARACTER(5)) AS temerrut_faizi_orani,;
		Icradosyahesabi.Temerrut_Faizi_Aciklamasi,;
		Icramudurlugu.IMNo,;
		Borclu.Borclu_Adi,;
		Rehber.TcKimlik_No AS borclu_tckimlik_no,;
		Rehber.Iletisim_Adresi AS borclu_adresi,;
		Borclu.Borclu_Adi AS muhatap_adi,;
		Rehber.Iletisim_Adresi AS muhatap_adresi,;
		Takiptipi.OE_Ornek_Adi,;
		Icradosya.Icra_Dosya_No AS grapor_sablonu,;
		Icradosya.Icra_Dosya_No AS gzarf_sablonu,;
		CAST(SPACE(13) AS CHARACTER(13)) AS barkod;
	FROM {oj{oj{oj{oj dbo.IcraDosya Icradosya;
		LEFT OUTER JOIN dbo.TakipTipi Takiptipi;
			ON Icradosya.Takip_Tipi = Takiptipi.Takip_Tipi};
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		LEFT OUTER JOIN dbo.IcraMudurlugu Icramudurlugu;
			ON Icradosya.IcraMudurlugu_Id = Icramudurlugu.IcraMudurlugu_Id};
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk};
		LEFT OUTER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id}

DBSetProp('DOKUMANVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOKUMANVIEW', 'View', 'WhereType', 1)
DBSetProp('DOKUMANVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOKUMANVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOKUMANVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOKUMANVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOKUMANVIEW', 'View', 'Tables', '')
DBSetProp('DOKUMANVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOKUMANVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOKUMANVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOKUMANVIEW', 'View', 'FetchSize', -1)
DBSetProp('DOKUMANVIEW', 'View', 'Comment', "")
DBSetProp('DOKUMANVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOKUMANVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOKUMANVIEW
	GoExplorer.odbcx.Validate("DOKUMANVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW","VIEW",;
		"VFECDESCRIPT","Dokumanview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOKUMANVIEW
*** Props for the DOKUMANVIEW.icradosya_id field.
DBSetProp('DOKUMANVIEW.icradosya_id', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('DOKUMANVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('DOKUMANVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for DOKUMANVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.icra_dosya_no field.
DBSetProp('DOKUMANVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('DOKUMANVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOKUMANVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Icra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Icra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Icra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Icra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Icra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Icra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borc_tipi field.
DBSetProp('DOKUMANVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('DOKUMANVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOKUMANVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borc_evragi field.
DBSetProp('DOKUMANVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borc_evragi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('DOKUMANVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for DOKUMANVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borc Evragi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borc Evragi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.icramudurlugu_adi field.
DBSetProp('DOKUMANVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('DOKUMANVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOKUMANVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.adliye_adi field.
DBSetProp('DOKUMANVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('DOKUMANVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOKUMANVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.ihtarname_tarihi field.
DBSetProp('DOKUMANVIEW.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.ihtarname_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('DOKUMANVIEW.ihtarname_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for DOKUMANVIEW.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ihtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ihtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ihtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ihtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ihtarname Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ihtarname Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.alacakli_bilgisi field.
DBSetProp('DOKUMANVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.alacakli_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('DOKUMANVIEW.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOKUMANVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacakli Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacakli Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacakli Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacakli Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacakli Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacakli Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.vekil_bilgisi field.
DBSetProp('DOKUMANVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.vekil_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('DOKUMANVIEW.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOKUMANVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borclu_bilgisi field.
DBSetProp('DOKUMANVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borclu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('DOKUMANVIEW.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOKUMANVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borclu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borclu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borclu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borclu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borclu Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borclu Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.takip_alacak_hesabi field.
DBSetProp('DOKUMANVIEW.takip_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.takip_alacak_hesabi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.takip_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacak_Hesabi')
DBSetProp('DOKUMANVIEW.takip_alacak_hesabi', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOKUMANVIEW.takip_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Takip Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Takip Alacak Hesabi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Takip Alacak Hesabi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Takip Alacak Hesabi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Takip Alacak Hesabi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Takip Alacak Hesabi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacak Hesabi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.toplam_alacak_hesabi field.
DBSetProp('DOKUMANVIEW.toplam_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.toplam_alacak_hesabi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.toplam_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak_Hesabi')
DBSetProp('DOKUMANVIEW.toplam_alacak_hesabi', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOKUMANVIEW.toplam_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak Hesabi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak Hesabi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak Hesabi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak Hesabi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak Hesabi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak Hesabi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.temerrut_faizi_orani field.
DBSetProp('DOKUMANVIEW.temerrut_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.temerrut_faizi_orani', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.temerrut_faizi_orani', 'Field', 'UpdateName', 'temerrut_faizi_orani')
DBSetProp('DOKUMANVIEW.temerrut_faizi_orani', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for DOKUMANVIEW.temerrut_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.temerrut_faizi_aciklamasi field.
DBSetProp('DOKUMANVIEW.temerrut_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.temerrut_faizi_aciklamasi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.temerrut_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Aciklamasi')
DBSetProp('DOKUMANVIEW.temerrut_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for DOKUMANVIEW.temerrut_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Aciklamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Aciklamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Aciklamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Aciklamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Aciklamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Aciklamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.imno field.
DBSetProp('DOKUMANVIEW.imno', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.imno', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.imno', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IMNo')
DBSetProp('DOKUMANVIEW.imno', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for DOKUMANVIEW.imno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECDESCRIPT","Imno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECFRMCAPTN","Imno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECDLGCAPTN","Imno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECGRDCAPTN","Imno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECRPTCAPTN","Imno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFEMTOOLTIP","Imno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFEMSTATUSTXT","Imno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.imno","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borclu_adi field.
DBSetProp('DOKUMANVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('DOKUMANVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DOKUMANVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borclu_tckimlik_no field.
DBSetProp('DOKUMANVIEW.borclu_tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borclu_tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borclu_tckimlik_no', 'Field', 'UpdateName', 'dbo.Rehber.TcKimlik_No')
DBSetProp('DOKUMANVIEW.borclu_tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOKUMANVIEW.borclu_tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECDESCRIPT","Borclu Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Borclu Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Borclu Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Borclu Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Borclu Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Borclu Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Borclu Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_tckimlik_no","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.borclu_adresi field.
DBSetProp('DOKUMANVIEW.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.borclu_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('DOKUMANVIEW.borclu_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for DOKUMANVIEW.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borclu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borclu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borclu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borclu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borclu Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.borclu_adresi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.muhatap_adi field.
DBSetProp('DOKUMANVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.muhatap_adi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('DOKUMANVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DOKUMANVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.muhatap_adresi field.
DBSetProp('DOKUMANVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.muhatap_adresi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('DOKUMANVIEW.muhatap_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for DOKUMANVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.oe_ornek_adi field.
DBSetProp('DOKUMANVIEW.oe_ornek_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.oe_ornek_adi', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.oe_ornek_adi', 'Field', 'UpdateName', 'dbo.TakipTipi.OE_Ornek_Adi')
DBSetProp('DOKUMANVIEW.oe_ornek_adi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for DOKUMANVIEW.oe_ornek_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECDESCRIPT","Oe Ornek Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECFRMCAPTN","Oe Ornek Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECDLGCAPTN","Oe Ornek Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECGRDCAPTN","Oe Ornek Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECRPTCAPTN","Oe Ornek Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFEMTOOLTIP","Oe Ornek Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFEMSTATUSTXT","Oe Ornek Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.oe_ornek_adi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.grapor_sablonu field.
DBSetProp('DOKUMANVIEW.grapor_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.grapor_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.grapor_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('DOKUMANVIEW.grapor_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for DOKUMANVIEW.grapor_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECDESCRIPT","Grapor Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECFRMCAPTN","Grapor Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECDLGCAPTN","Grapor Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECGRDCAPTN","Grapor Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECRPTCAPTN","Grapor Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFEMTOOLTIP","Grapor Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFEMSTATUSTXT","Grapor Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFECOBJTYPE","ioleboundcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.grapor_sablonu","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.gzarf_sablonu field.
DBSetProp('DOKUMANVIEW.gzarf_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.gzarf_sablonu', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.gzarf_sablonu', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('DOKUMANVIEW.gzarf_sablonu', 'Field', 'DataType', "G")
*** DBCX Field Properties for DOKUMANVIEW.gzarf_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECDESCRIPT","Gzarf Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECFRMCAPTN","Gzarf Sablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECDLGCAPTN","Gzarf Sablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECGRDCAPTN","Gzarf Sablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECRPTCAPTN","Gzarf Sablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFEMTOOLTIP","Gzarf Sablonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFEMSTATUSTXT","Gzarf Sablonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFECOBJTYPE","ioleboundcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.gzarf_sablonu","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the DOKUMANVIEW.barkod field.
DBSetProp('DOKUMANVIEW.barkod', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANVIEW.barkod', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANVIEW.barkod', 'Field', 'UpdateName', 'barkod')
DBSetProp('DOKUMANVIEW.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for DOKUMANVIEW.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DOKUMANVIEW.barkod","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
