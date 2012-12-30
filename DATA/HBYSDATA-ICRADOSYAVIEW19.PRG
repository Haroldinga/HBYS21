***************** Begin View Definition ICRADOSYAVIEW1 ***************


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



CREATE SQL VIEW "ICRADOSYAVIEW1" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Muvekkil_Id,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Sube_Id,;
		Icradosya.DosyaTipi_Id,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Takip_Yolu,;
		Icradosya.TakipSekli_Id,;
		Icradosya.Borc_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.Talep_Edilen_Hak,;
		Icradosya.BK84Madde_Uygulansin,;
		Icradosya.BSMV_Uygulansin,;
		Icradosya.KKDF_Uygulansin,;
		Icradosya.IcraMudurlugu_Id,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.Vade_Tarihi,;
		Icradosya.Ihtarname_Tarihi,;
		Icradosya.Gelis_Tarihi,;
		Icradosya.Takip_Tarihi,;
		Icradosya.Teblig_Tarihi,;
		Icradosya.Kesinlesme_Tarihi,;
		Icradosya.Hitam_Tarihi,;
		Icradosya.Icra_Kapanis_Tarihi,;
		Icradosya.Banka_Kapanis_Tarihi,;
		Icradosya.Gidis_Tarihi,;
		Icradosya.Vekalet_Ucreti_Tipi,;
		Icradosya.Risk_Yoneticisi_Id,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosya.Itiraz_Edildi,;
		Icradosya.Itiraz_Tarihi,;
		Icradosya.Itiraz_Sebebi;
	FROM dbo.IcraDosya Icradosya

DBSetProp('ICRADOSYAVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAVIEW1', 'View', 'WhereType', 1)
DBSetProp('ICRADOSYAVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAVIEW1', 'View', 'SendUpdates', .T.)
DBSetProp('ICRADOSYAVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAVIEW1', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('ICRADOSYAVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ICRADOSYAVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAVIEW1', 'View', 'ParameterList', "vp_Icra_Dosya_No,'V';vp_Buro_Dosya_No,'V';vp_Muvekkil_Id,'C';vp_Sube_Id,'C';vp_DosyaTipi_Id,'C';vp_Takip_Tipi,'C';vp_Takip_Yolu,'C';vp_IcraMudurlugu_Id,'C';vp_Takip_Tarihi,'D';"+"vp_Risk_Yoneticisi_Id,'C';vp_Muvekkil_Adi,'C';vp_TcKimlik_No,'C';vp_Ticaret_Sicil_No,'C';vp_Borc_Tipi,'C';vp_Gelis_Tarihi,'D';"+"vp_Borc_Evragi,'V';vp_Talep_Edilen_Hak,'V';vp_Adliye_Adi,'C';vp_Risk_Yoneticisi_Adi,'C';"+"vp_Dosya_Tipi,'C';vp_TakipSekli_Id,'I';vp_IcraMudurlugu_Adi,'C';vp_Sube_Adi,'C';vp_Takip_Sekli,'C';vp_Ihtarname_Tarihi,'D'")
DBSetProp('ICRADOSYAVIEW1', 'View', 'FetchSize', -1)
DBSetProp('ICRADOSYAVIEW1', 'View', 'Comment', "")
DBSetProp('ICRADOSYAVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAVIEW1', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAVIEW1
	GoExplorer.odbcx.Validate("ICRADOSYAVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1","VIEW",;
		"VFECDESCRIPT","Icradosyaview1 Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ICRADOSYAVIEW1
*** Props for the ICRADOSYAVIEW1.icradosya_id field.
DBSetProp('ICRADOSYAVIEW1.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRADOSYAVIEW1.icradosya_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('ICRADOSYAVIEW1.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('ICRADOSYAVIEW1.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.icra_dosya_no field.
DBSetProp('ICRADOSYAVIEW1.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ICRADOSYAVIEW1.icra_dosya_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRADOSYAVIEW1.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Icra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Icra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Icra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Icra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Icra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Icra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.buro_dosya_no field.
DBSetProp('ICRADOSYAVIEW1.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('ICRADOSYAVIEW1.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('ICRADOSYAVIEW1.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for ICRADOSYAVIEW1.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Buro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Buro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Buro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Buro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Buro Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Buro Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.buro_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.muvekkil_id field.
DBSetProp('ICRADOSYAVIEW1.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('ICRADOSYAVIEW1.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.muvekkil_adi field.
DBSetProp('ICRADOSYAVIEW1.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('ICRADOSYAVIEW1.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ICRADOSYAVIEW1.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.muvekkil_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.sube_id field.
DBSetProp('ICRADOSYAVIEW1.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('ICRADOSYAVIEW1.sube_id', 'Field', 'Caption', "Þube ID")
DBSetProp('ICRADOSYAVIEW1.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube ID") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube ID") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.sube_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.dosyatipi_id field.
DBSetProp('ICRADOSYAVIEW1.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.dosyatipi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.DosyaTipi_Id')
DBSetProp('ICRADOSYAVIEW1.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosyatipi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosyatipi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosyatipi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosyatipi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosyatipi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosyatipi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosyatipi_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.dosya_tipi field.
DBSetProp('ICRADOSYAVIEW1.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('ICRADOSYAVIEW1.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW1.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.takip_tipi field.
DBSetProp('ICRADOSYAVIEW1.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('ICRADOSYAVIEW1.takip_tipi', 'Field', 'DataType', "C(15)")
DBSetProp('ICRADOSYAVIEW1.takip_tipi', 'Field', 'DefaultValue', "'Ýlamsýz Takip'")
*** DBCX Field Properties for ICRADOSYAVIEW1.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.takip_yolu field.
DBSetProp('ICRADOSYAVIEW1.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('ICRADOSYAVIEW1.takip_yolu', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEW1.takip_yolu', 'Field', 'DefaultValue', "'Haciz'")
*** DBCX Field Properties for ICRADOSYAVIEW1.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_yolu","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.takipsekli_id field.
DBSetProp('ICRADOSYAVIEW1.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.takipsekli_id', 'Field', 'UpdateName', 'dbo.IcraDosya.TakipSekli_Id')
DBSetProp('ICRADOSYAVIEW1.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for ICRADOSYAVIEW1.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takipsekli Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takipsekli Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takipsekli Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takipsekli Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takipsekli Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takipsekli Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takipsekli_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.borc_tipi field.
DBSetProp('ICRADOSYAVIEW1.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('ICRADOSYAVIEW1.borc_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEW1.borc_tipi', 'Field', 'DefaultValue', "'Kredi Kartý'")
*** DBCX Field Properties for ICRADOSYAVIEW1.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_tipi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.borc_evragi field.
DBSetProp('ICRADOSYAVIEW1.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('ICRADOSYAVIEW1.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAVIEW1.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borc Evragi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borc Evragi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.borc_evragi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.talep_edilen_hak field.
DBSetProp('ICRADOSYAVIEW1.talep_edilen_hak', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.talep_edilen_hak', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.talep_edilen_hak', 'Field', 'UpdateName', 'dbo.IcraDosya.Talep_Edilen_Hak')
DBSetProp('ICRADOSYAVIEW1.talep_edilen_hak', 'Field', 'DataType', "M")
*** DBCX Field Properties for ICRADOSYAVIEW1.talep_edilen_hak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECDESCRIPT","Talep Edilen Hak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECGRDCAPTN","Talep Edilen Hak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECRPTCAPTN","Talep Edilen Hak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.talep_edilen_hak","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.bk84madde_uygulansin field.
DBSetProp('ICRADOSYAVIEW1.bk84madde_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.bk84madde_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.bk84madde_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BK84Madde_Uygulansin')
DBSetProp('ICRADOSYAVIEW1.bk84madde_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW1.bk84madde_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECDESCRIPT","Bk84madde Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bk84madde Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bk84madde Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bk84madde Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bk84madde Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bk84madde Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bk84madde Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bk84madde_uygulansin","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.bsmv_uygulansin field.
DBSetProp('ICRADOSYAVIEW1.bsmv_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.bsmv_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.bsmv_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BSMV_Uygulansin')
DBSetProp('ICRADOSYAVIEW1.bsmv_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW1.bsmv_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECDESCRIPT","Bsmv Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bsmv Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bsmv Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bsmv Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bsmv Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bsmv Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bsmv Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.bsmv_uygulansin","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.kkdf_uygulansin field.
DBSetProp('ICRADOSYAVIEW1.kkdf_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.kkdf_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.kkdf_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.KKDF_Uygulansin')
DBSetProp('ICRADOSYAVIEW1.kkdf_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW1.kkdf_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECDESCRIPT","Kkdf Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECFRMCAPTN","Kkdf Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECDLGCAPTN","Kkdf Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECGRDCAPTN","Kkdf Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECRPTCAPTN","Kkdf Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFEMTOOLTIP","Kkdf Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Kkdf Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kkdf_uygulansin","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.icramudurlugu_id field.
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Id')
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.icramudurlugu_adi field.
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('ICRADOSYAVIEW1.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW1.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.adliye_adi field.
DBSetProp('ICRADOSYAVIEW1.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('ICRADOSYAVIEW1.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW1.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.adliye_adi","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.dosya_statusu field.
DBSetProp('ICRADOSYAVIEW1.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('ICRADOSYAVIEW1.dosya_statusu', 'Field', 'DataType', "C(15)")
DBSetProp('ICRADOSYAVIEW1.dosya_statusu', 'Field', 'DefaultValue', "'Derdest'")
*** DBCX Field Properties for ICRADOSYAVIEW1.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.dosya_statusu","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.vade_tarihi field.
DBSetProp('ICRADOSYAVIEW1.vade_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.vade_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.vade_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vade_Tarihi')
DBSetProp('ICRADOSYAVIEW1.vade_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.vade_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECDESCRIPT","Vade Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECFRMCAPTN","Vade Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECDLGCAPTN","Vade Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECGRDCAPTN","Vade Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECRPTCAPTN","Vade Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFEMTOOLTIP","Vade Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFEMSTATUSTXT","Vade Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vade_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.ihtarname_tarihi field.
DBSetProp('ICRADOSYAVIEW1.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.ihtarname_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('ICRADOSYAVIEW1.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ihtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ihtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ihtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ihtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ihtarname Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ihtarname Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.gelis_tarihi field.
DBSetProp('ICRADOSYAVIEW1.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('ICRADOSYAVIEW1.gelis_tarihi', 'Field', 'DataType', "D")
DBSetProp('ICRADOSYAVIEW1.gelis_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for ICRADOSYAVIEW1.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Gelis Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Gelis Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Gelis Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Gelis Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Gelis Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gelis Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gelis_tarihi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the ICRADOSYAVIEW1.takip_tarihi field.
DBSetProp('ICRADOSYAVIEW1.takip_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.takip_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.takip_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tarihi')
DBSetProp('ICRADOSYAVIEW1.takip_tarihi', 'Field', 'DataType', "D")
DBSetProp('ICRADOSYAVIEW1.takip_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for ICRADOSYAVIEW1.takip_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECDESCRIPT","Takip Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECFRMCAPTN","Takip Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECDLGCAPTN","Takip Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECGRDCAPTN","Takip Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECRPTCAPTN","Takip Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFEMTOOLTIP","Takip Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFEMSTATUSTXT","Takip Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.takip_tarihi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.teblig_tarihi field.
DBSetProp('ICRADOSYAVIEW1.teblig_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.teblig_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.teblig_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Teblig_Tarihi')
DBSetProp('ICRADOSYAVIEW1.teblig_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.teblig_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECDESCRIPT","Teblig Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECFRMCAPTN","Teblig Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECDLGCAPTN","Teblig Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECGRDCAPTN","Teblig Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECRPTCAPTN","Teblig Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFEMTOOLTIP","Teblig Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFEMSTATUSTXT","Teblig Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.teblig_tarihi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.kesinlesme_tarihi field.
DBSetProp('ICRADOSYAVIEW1.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.kesinlesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Kesinlesme_Tarihi')
DBSetProp('ICRADOSYAVIEW1.kesinlesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinlesme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinlesme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinlesme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinlesme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinlesme Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinlesme Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.hitam_tarihi field.
DBSetProp('ICRADOSYAVIEW1.hitam_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.hitam_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.hitam_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Hitam_Tarihi')
DBSetProp('ICRADOSYAVIEW1.hitam_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.hitam_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECDESCRIPT","Hitam Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECFRMCAPTN","Hitam Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECDLGCAPTN","Hitam Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECGRDCAPTN","Hitam Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECRPTCAPTN","Hitam Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFEMTOOLTIP","Hitam Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFEMSTATUSTXT","Hitam Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.hitam_tarihi","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.icra_kapanis_tarihi field.
DBSetProp('ICRADOSYAVIEW1.icra_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.icra_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.icra_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Kapanis_Tarihi')
DBSetProp('ICRADOSYAVIEW1.icra_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.icra_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Icra Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Icra Kapanis Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Icra Kapanis Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Icra Kapanis Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Icra Kapanis Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Icra Kapanis Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Icra Kapanis Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.icra_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.banka_kapanis_tarihi field.
DBSetProp('ICRADOSYAVIEW1.banka_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.banka_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.banka_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Banka_Kapanis_Tarihi')
DBSetProp('ICRADOSYAVIEW1.banka_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.banka_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Banka Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Banka Kapanis Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Banka Kapanis Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Banka Kapanis Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Banka Kapanis Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Banka Kapanis Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Banka Kapanis Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.banka_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.gidis_tarihi field.
DBSetProp('ICRADOSYAVIEW1.gidis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.gidis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.gidis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gidis_Tarihi')
DBSetProp('ICRADOSYAVIEW1.gidis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.gidis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECDESCRIPT","Gidis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECFRMCAPTN","Gidis Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECDLGCAPTN","Gidis Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECGRDCAPTN","Gidis Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECRPTCAPTN","Gidis Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFEMTOOLTIP","Gidis Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gidis Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.gidis_tarihi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.vekalet_ucreti_tipi field.
DBSetProp('ICRADOSYAVIEW1.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vekalet_Ucreti_Tipi')
DBSetProp('ICRADOSYAVIEW1.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEW1.vekalet_ucreti_tipi', 'Field', 'DefaultValue', "'Dosya Tipi Vekalet Ücreti'")
*** DBCX Field Properties for ICRADOSYAVIEW1.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ucreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ucreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ucreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ucreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ucreti Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ucreti Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.risk_yoneticisi_id field.
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Id')
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW1.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.risk_yoneticisi_adi field.
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('ICRADOSYAVIEW1.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ICRADOSYAVIEW1.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.itiraz_edildi field.
DBSetProp('ICRADOSYAVIEW1.itiraz_edildi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.itiraz_edildi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.itiraz_edildi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Edildi')
DBSetProp('ICRADOSYAVIEW1.itiraz_edildi', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW1.itiraz_edildi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECDESCRIPT","Itiraz Edildi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECFRMCAPTN","Itiraz Edildi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECDLGCAPTN","Itiraz Edildi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECGRDCAPTN","Itiraz Edildi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECRPTCAPTN","Itiraz Edildi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFEMTOOLTIP","Itiraz Edildi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFEMSTATUSTXT","Itiraz Edildi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_edildi","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.itiraz_tarihi field.
DBSetProp('ICRADOSYAVIEW1.itiraz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.itiraz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.itiraz_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Tarihi')
DBSetProp('ICRADOSYAVIEW1.itiraz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW1.itiraz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECDESCRIPT","Itiraz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECFRMCAPTN","Itiraz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECDLGCAPTN","Itiraz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECGRDCAPTN","Itiraz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECRPTCAPTN","Itiraz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFEMTOOLTIP","Itiraz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Itiraz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_tarihi","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW1.itiraz_sebebi field.
DBSetProp('ICRADOSYAVIEW1.itiraz_sebebi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEW1.itiraz_sebebi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEW1.itiraz_sebebi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Sebebi')
DBSetProp('ICRADOSYAVIEW1.itiraz_sebebi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAVIEW1.itiraz_sebebi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECDESCRIPT","Itiraz Sebebi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECFRMCAPTN","Itiraz Sebebi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECDLGCAPTN","Itiraz Sebebi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECGRDCAPTN","Itiraz Sebebi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECRPTCAPTN","Itiraz Sebebi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFEMTOOLTIP","Itiraz Sebebi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFEMSTATUSTXT","Itiraz Sebebi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEW1.itiraz_sebebi","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
