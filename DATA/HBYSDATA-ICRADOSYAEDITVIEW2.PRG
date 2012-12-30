***************** Begin View Definition IcraDosyaView ***************


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



CREATE SQL VIEW "IcraDosyaView" ; 
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

DBSetProp('IcraDosyaView', 'View', 'UpdateType', 1)
DBSetProp('IcraDosyaView', 'View', 'WhereType', 1)
DBSetProp('IcraDosyaView', 'View', 'FetchMemo', .T.)
DBSetProp('IcraDosyaView', 'View', 'SendUpdates', .T.)
DBSetProp('IcraDosyaView', 'View', 'UseMemoSize', 255)
DBSetProp('IcraDosyaView', 'View', 'MaxRecords', -1)
DBSetProp('IcraDosyaView', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('IcraDosyaView', 'View', 'Prepared', .F.)
DBSetProp('IcraDosyaView', 'View', 'CompareMemo', .T.)
DBSetProp('IcraDosyaView', 'View', 'FetchAsNeeded', .F.)
DBSetProp('IcraDosyaView', 'View', 'FetchSize', -1)
DBSetProp('IcraDosyaView', 'View', 'ParameterList', "vp_IcraDosya_Id,'C'")
DBSetProp('IcraDosyaView', 'View', 'Comment', "")
DBSetProp('IcraDosyaView', 'View', 'BatchUpdateCount', 1)
DBSetProp('IcraDosyaView', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for IcraDosyaView
	GoExplorer.odbcx.Validate("IcraDosyaView","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView","VIEW",;
		"VFECDESCRIPT","IcraDosyaView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosya_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosya Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for IcraDosyaView
*** Props for the IcraDosyaView.icradosya_id field.
DBSetProp('IcraDosyaView.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('IcraDosyaView.icradosya_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('IcraDosyaView.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('IcraDosyaView.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for IcraDosyaView.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Dosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Dosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Dosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Dosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Dosya ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Dosya ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.icra_dosya_no field.
DBSetProp('IcraDosyaView.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('IcraDosyaView.icra_dosya_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for IcraDosyaView.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_dosya_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.buro_dosya_no field.
DBSetProp('IcraDosyaView.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('IcraDosyaView.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('IcraDosyaView.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for IcraDosyaView.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.buro_dosya_no","FIELD",;
		"VFEMFORMAT","ZK") &&Format
ENDIF
 
*** Props for the IcraDosyaView.muvekkil_id field.
DBSetProp('IcraDosyaView.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('IcraDosyaView.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IcraDosyaView.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.muvekkil_adi field.
DBSetProp('IcraDosyaView.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('IcraDosyaView.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IcraDosyaView.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.sube_id field.
DBSetProp('IcraDosyaView.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('IcraDosyaView.sube_id', 'Field', 'Caption', "Þube ID")
DBSetProp('IcraDosyaView.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IcraDosyaView.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMLUFIELDS","sube_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.sube_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.dosyatipi_id field.
DBSetProp('IcraDosyaView.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.dosyatipi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.DosyaTipi_Id')
DBSetProp('IcraDosyaView.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IcraDosyaView.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECLUTAG","dosyatipi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosyatipi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECCLASS","afieldnovalidateduringsave") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosyatipi_id","FIELD",;
		"VFEMLUUPDFLDS","takip_tipi, borc_tipi, borc_evragi, dosya_tipi, takip_yolu, talep_edilen_hak, bk84madde_uygulansin, bsmv_uygulansin, kkdf_uygulansin, takipsekli_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the IcraDosyaView.dosya_tipi field.
DBSetProp('IcraDosyaView.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('IcraDosyaView.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IcraDosyaView.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.takip_tipi field.
DBSetProp('IcraDosyaView.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('IcraDosyaView.takip_tipi', 'Field', 'DataType', "C(15)")
DBSetProp('IcraDosyaView.takip_tipi', 'Field', 'DefaultValue', "'Ýlamsýz Takip'")
*** DBCX Field Properties for IcraDosyaView.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.takip_yolu field.
DBSetProp('IcraDosyaView.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('IcraDosyaView.takip_yolu', 'Field', 'DataType', "C(25)")
DBSetProp('IcraDosyaView.takip_yolu', 'Field', 'DefaultValue', "'Haciz'")
*** DBCX Field Properties for IcraDosyaView.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECLUTABLE","hbysdata!takipyolulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECLUTAG","takip_yolu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMLUFIELDS","takip_yolu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMLUUPDTEXP","Takipyolulookupview.takip_yolu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_yolu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.takipsekli_id field.
DBSetProp('IcraDosyaView.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.takipsekli_id', 'Field', 'UpdateName', 'dbo.IcraDosya.TakipSekli_Id')
DBSetProp('IcraDosyaView.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for IcraDosyaView.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takip Þekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takip Þekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takip Þekli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takip Þekli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takip Þekli                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takip Þekli                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECLUTABLE","hbysdata!takipseklilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECLUTAG","takipsekli_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMLUFIELDS","takip_sekli") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMLUUPDTEXP","Takipseklilookupview.takipsekli_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takipsekli_id","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.borc_tipi field.
DBSetProp('IcraDosyaView.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('IcraDosyaView.borc_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('IcraDosyaView.borc_tipi', 'Field', 'DefaultValue', "'Kredi Kartý'")
*** DBCX Field Properties for IcraDosyaView.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.borc_evragi field.
DBSetProp('IcraDosyaView.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('IcraDosyaView.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for IcraDosyaView.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borca Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borca Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borca Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borca Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borca Esas Evrak                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borca Esas Evrak                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.borc_evragi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.talep_edilen_hak field.
DBSetProp('IcraDosyaView.talep_edilen_hak', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.talep_edilen_hak', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.talep_edilen_hak', 'Field', 'UpdateName', 'dbo.IcraDosya.Talep_Edilen_Hak')
DBSetProp('IcraDosyaView.talep_edilen_hak', 'Field', 'DataType', "M")
*** DBCX Field Properties for IcraDosyaView.talep_edilen_hak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECDESCRIPT","Talep Edilen Hak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECGRDCAPTN","Talep Edilen Hak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECRPTCAPTN","Talep Edilen Hak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.talep_edilen_hak","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.bk84madde_uygulansin field.
DBSetProp('IcraDosyaView.bk84madde_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.bk84madde_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.bk84madde_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BK84Madde_Uygulansin')
DBSetProp('IcraDosyaView.bk84madde_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for IcraDosyaView.bk84madde_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECDESCRIPT","Bk84madde Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECFRMCAPTN","BK 84. Madde Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECDLGCAPTN","BK 84. Madde Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECGRDCAPTN","BK 84. Madde Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECRPTCAPTN","BK 84. Madde Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFEMTOOLTIP","BK 84. Madde Uygulansýn                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFEMSTATUSTXT","BK 84. Madde Uygulansýn                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bk84madde_uygulansin","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.bsmv_uygulansin field.
DBSetProp('IcraDosyaView.bsmv_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.bsmv_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.bsmv_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BSMV_Uygulansin')
DBSetProp('IcraDosyaView.bsmv_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for IcraDosyaView.bsmv_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECDESCRIPT","Bsmv Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECFRMCAPTN","BSMV Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECDLGCAPTN","BSMV Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECGRDCAPTN","BSMV Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECRPTCAPTN","BSMV Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFEMTOOLTIP","BSMV Uygulansýn                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFEMSTATUSTXT","BSMV Uygulansýn                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.bsmv_uygulansin","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.kkdf_uygulansin field.
DBSetProp('IcraDosyaView.kkdf_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.kkdf_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.kkdf_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.KKDF_Uygulansin')
DBSetProp('IcraDosyaView.kkdf_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for IcraDosyaView.kkdf_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECDESCRIPT","Kkdf Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECFRMCAPTN","KKDF Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECDLGCAPTN","KKDF Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECGRDCAPTN","KKDF Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECRPTCAPTN","KKDF Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFEMTOOLTIP","KKDF Uygulansýn                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFEMSTATUSTXT","KKDF Uygulansýn                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kkdf_uygulansin","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.icramudurlugu_id field.
DBSetProp('IcraDosyaView.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Id')
DBSetProp('IcraDosyaView.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IcraDosyaView.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.icramudurlugu_adi field.
DBSetProp('IcraDosyaView.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('IcraDosyaView.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IcraDosyaView.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDFLDS","adliye_adi, icramudurlugu_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the IcraDosyaView.adliye_adi field.
DBSetProp('IcraDosyaView.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('IcraDosyaView.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IcraDosyaView.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.adliye_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.dosya_statusu field.
DBSetProp('IcraDosyaView.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('IcraDosyaView.dosya_statusu', 'Field', 'DataType', "C(15)")
DBSetProp('IcraDosyaView.dosya_statusu', 'Field', 'DefaultValue', "'Derdest'")
*** DBCX Field Properties for IcraDosyaView.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!dosyastatulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECLUTAG","dosya_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMLUFIELDS","dosya_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMLUUPDTEXP","Dosyastatulookupview.dosya_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.dosya_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the IcraDosyaView.vade_tarihi field.
DBSetProp('IcraDosyaView.vade_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.vade_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.vade_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vade_Tarihi')
DBSetProp('IcraDosyaView.vade_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.vade_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECDESCRIPT","Vade Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECFRMCAPTN","Vade Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECDLGCAPTN","Vade Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECGRDCAPTN","Vade Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECRPTCAPTN","Vade Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFEMTOOLTIP","Vade Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFEMSTATUSTXT","Vade Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vade_tarihi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.ihtarname_tarihi field.
DBSetProp('IcraDosyaView.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.ihtarname_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('IcraDosyaView.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýhtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýhtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýhtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýhtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýhtarname Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýhtarname Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.gelis_tarihi field.
DBSetProp('IcraDosyaView.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('IcraDosyaView.gelis_tarihi', 'Field', 'DataType', "D")
DBSetProp('IcraDosyaView.gelis_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for IcraDosyaView.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gelis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.takip_tarihi field.
DBSetProp('IcraDosyaView.takip_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.takip_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.takip_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tarihi')
DBSetProp('IcraDosyaView.takip_tarihi', 'Field', 'DataType', "D")
DBSetProp('IcraDosyaView.takip_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for IcraDosyaView.takip_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECDESCRIPT","Takip Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECFRMCAPTN","Takip Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECDLGCAPTN","Takip Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECGRDCAPTN","Takip Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECRPTCAPTN","Takip Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFEMTOOLTIP","Takip Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFEMSTATUSTXT","Takip Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.takip_tarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.teblig_tarihi field.
DBSetProp('IcraDosyaView.teblig_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.teblig_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.teblig_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Teblig_Tarihi')
DBSetProp('IcraDosyaView.teblig_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.teblig_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECDESCRIPT","Teblig Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECFRMCAPTN","Teblið Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECDLGCAPTN","Teblið Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECGRDCAPTN","Teblið Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECRPTCAPTN","Teblið Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFEMTOOLTIP","Teblið Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFEMSTATUSTXT","Teblið Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.teblig_tarihi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.kesinlesme_tarihi field.
DBSetProp('IcraDosyaView.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.kesinlesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Kesinlesme_Tarihi')
DBSetProp('IcraDosyaView.kesinlesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinleþme Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinleþme Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.hitam_tarihi field.
DBSetProp('IcraDosyaView.hitam_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.hitam_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.hitam_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Hitam_Tarihi')
DBSetProp('IcraDosyaView.hitam_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.hitam_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECDESCRIPT","Hitam Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECFRMCAPTN","Hitam Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECDLGCAPTN","Hitam Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECGRDCAPTN","Hitam Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECRPTCAPTN","Hitam Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFEMTOOLTIP","Hitam Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFEMSTATUSTXT","Hitam Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.hitam_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.icra_kapanis_tarihi field.
DBSetProp('IcraDosyaView.icra_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.icra_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.icra_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Kapanis_Tarihi')
DBSetProp('IcraDosyaView.icra_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.icra_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Icra Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýcra Kapanýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýcra Kapanýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýcra Kapanýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýcra Kapanýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýcra Kapanýþ Tarihi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Kapanýþ Tarihi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.icra_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.banka_kapanis_tarihi field.
DBSetProp('IcraDosyaView.banka_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.banka_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.banka_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Banka_Kapanis_Tarihi')
DBSetProp('IcraDosyaView.banka_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.banka_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Banka Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Banka Kapanýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Banka Kapanýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Banka Kapanýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Banka Kapanýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Banka Kapanýþ Tarihi                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Banka Kapanýþ Tarihi                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.banka_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.gidis_tarihi field.
DBSetProp('IcraDosyaView.gidis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.gidis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.gidis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gidis_Tarihi')
DBSetProp('IcraDosyaView.gidis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.gidis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECDESCRIPT","Gidis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECFRMCAPTN","Gidiþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECDLGCAPTN","Gidiþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECGRDCAPTN","Gidiþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECRPTCAPTN","Gidiþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFEMTOOLTIP","Gidiþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gidiþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.gidis_tarihi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.vekalet_ucreti_tipi field.
DBSetProp('IcraDosyaView.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vekalet_Ucreti_Tipi')
DBSetProp('IcraDosyaView.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('IcraDosyaView.vekalet_ucreti_tipi', 'Field', 'DefaultValue', "'Dosya Tipi Vekalet Ücreti'")
*** DBCX Field Properties for IcraDosyaView.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFEMINLIST",'"Resmi Vekalet Ücreti","Dosya Tipi Vekalet Ücreti","Özel Vekalet Ücreti"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.risk_yoneticisi_id field.
DBSetProp('IcraDosyaView.risk_yoneticisi_id', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.risk_yoneticisi_id', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Id')
DBSetProp('IcraDosyaView.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IcraDosyaView.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECLUTABLE","hbysdata!riskyoneticisilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECLUTAG","risk_yoneticisi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMLUFIELDS","risk_yoneticisi_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMLUUPDTEXP","Riskyoneticisilookupview.risk_yoneticisi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",28) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMLUUPDFLDS","risk_yoneticisi_adi") &&After Lookup Update Field List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_id","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the IcraDosyaView.risk_yoneticisi_adi field.
DBSetProp('IcraDosyaView.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.risk_yoneticisi_adi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('IcraDosyaView.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IcraDosyaView.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.itiraz_edildi field.
DBSetProp('IcraDosyaView.itiraz_edildi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.itiraz_edildi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.itiraz_edildi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Edildi')
DBSetProp('IcraDosyaView.itiraz_edildi', 'Field', 'DataType', "L")
*** DBCX Field Properties for IcraDosyaView.itiraz_edildi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECDESCRIPT","Itiraz Edildi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Edildi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Edildi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Edildi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Edildi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Edildi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Edildi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_edildi","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.itiraz_tarihi field.
DBSetProp('IcraDosyaView.itiraz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.itiraz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.itiraz_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Tarihi')
DBSetProp('IcraDosyaView.itiraz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IcraDosyaView.itiraz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECDESCRIPT","Itiraz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_tarihi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the IcraDosyaView.itiraz_sebebi field.
DBSetProp('IcraDosyaView.itiraz_sebebi', 'Field', 'KeyField', .F.)
DBSetProp('IcraDosyaView.itiraz_sebebi', 'Field', 'Updatable', .T.)
DBSetProp('IcraDosyaView.itiraz_sebebi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Sebebi')
DBSetProp('IcraDosyaView.itiraz_sebebi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for IcraDosyaView.itiraz_sebebi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECDESCRIPT","Itiraz Sebebi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Sebebi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Sebebi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Sebebi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Sebebi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Sebebi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Sebebi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!IcraDosyaView.itiraz_sebebi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
