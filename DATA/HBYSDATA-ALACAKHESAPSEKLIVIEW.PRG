***************** Begin View Definition ALACAKHESAPSEKLIVIEW ***************


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



CREATE SQL VIEW "ALACAKHESAPSEKLIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Alacakhesapsekli.HesapSekli_Id,;
		Alacakhesapsekli.HesapSekli_Fk,;
		Alacakhesapsekli.Dosya_Tipi,;
		Alacakhesapsekli.Takip_Tipi,;
		Alacakhesapsekli.To_Alacak_Adi_1,;
		Alacakhesapsekli.To_Alacak_Hesabi_1,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_1,;
		Alacakhesapsekli.To_Alacak_Adi_2,;
		Alacakhesapsekli.To_Alacak_Hesabi_2,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_2,;
		Alacakhesapsekli.To_Alacak_Adi_3,;
		Alacakhesapsekli.To_Alacak_Hesabi_3,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_3,;
		Alacakhesapsekli.To_Alacak_Adi_4,;
		Alacakhesapsekli.To_Alacak_Hesabi_4,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_4,;
		Alacakhesapsekli.To_Alacak_Adi_5,;
		Alacakhesapsekli.To_Alacak_Hesabi_5,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_5,;
		Alacakhesapsekli.To_Alacak_Adi_6,;
		Alacakhesapsekli.To_Alacak_Hesabi_6,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_6,;
		Alacakhesapsekli.To_Alacak_Adi_7,;
		Alacakhesapsekli.To_Alacak_Hesabi_7,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_7,;
		Alacakhesapsekli.To_Alacak_Adi_8,;
		Alacakhesapsekli.To_Alacak_Hesabi_8,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_8,;
		Alacakhesapsekli.To_Alacak_Adi_9,;
		Alacakhesapsekli.To_Alacak_Hesabi_9,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_9,;
		Alacakhesapsekli.To_Alacak_Adi_10,;
		Alacakhesapsekli.To_Alacak_Hesabi_10,;
		Alacakhesapsekli.To_Alacak_Aciklamasi_10,;
		Alacakhesapsekli.Ts_Alacak_Adi_1,;
		Alacakhesapsekli.Ts_Alacak_Hesabi_1,;
		Alacakhesapsekli.Ts_Alacak_Aciklamasi_1,;
		Alacakhesapsekli.Ts_Alacak_Adi_2,;
		Alacakhesapsekli.Ts_Alacak_Hesabi_2,;
		Alacakhesapsekli.Ts_Alacak_Aciklamasi_2,;
		Alacakhesapsekli.Ts_Alacak_Adi_3,;
		Alacakhesapsekli.Ts_Alacak_Hesabi_3,;
		Alacakhesapsekli.Ts_Alacak_Aciklamasi_3,;
		Alacakhesapsekli.Ts_Alacak_Adi_4,;
		Alacakhesapsekli.Ts_Alacak_Hesabi_4,;
		Alacakhesapsekli.Ts_Alacak_Aciklamasi_4,;
		Alacakhesapsekli.Ts_Alacak_Adi_5,;
		Alacakhesapsekli.Ts_Alacak_Hesabi_5,;
		Alacakhesapsekli.Ts_Alacak_Aciklamasi_5,;
		Alacakhesapsekli.Tahsilat_Dusme_Sirasi;
	FROM dbo.AlacakHesapSekli Alacakhesapsekli

DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'UpdateType', 1)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'WhereType', 3)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'Tables', 'dbo.AlacakHesapSekli')
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'Prepared', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'FetchSize', -1)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'ParameterList', "vp_HesapSekli_Fk,'C'")
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'Comment', "")
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ALACAKHESAPSEKLIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ALACAKHESAPSEKLIVIEW
	GoExplorer.odbcx.Validate("ALACAKHESAPSEKLIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW","VIEW",;
		"VFECDESCRIPT","Alacakhesapsekliview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_HesapSekli_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Hesapsekli Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECFRMCAPTN","Hesap Þekli Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECDLGCAPTN","Hesap Þekli Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFEMTOOLTIP","Hesap Þekli Fk                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Hesap Þekli Fk                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.vp_HesapSekli_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ALACAKHESAPSEKLIVIEW
*** Props for the ALACAKHESAPSEKLIVIEW.hesapsekli_id field.
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_id', 'Field', 'KeyField', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_id', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.HesapSekli_Id')
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_id', 'Field', 'DataType', "C(36)")
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.hesapsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECDESCRIPT","Hesapsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECFRMCAPTN","Hesap Þekli ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECDLGCAPTN","Hesap Þekli ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECGRDCAPTN","Hesap Þekli ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECRPTCAPTN","Hesap Þekli ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFEMTOOLTIP","Hesap Þekli ID                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFEMSTATUSTXT","Hesap Þekli ID                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.hesapsekli_fk field.
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_fk', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_fk', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_fk', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.HesapSekli_Fk')
DBSetProp('ALACAKHESAPSEKLIVIEW.hesapsekli_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.hesapsekli_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECDESCRIPT","Hesapsekli Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECFRMCAPTN","Hesap Þekli FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECDLGCAPTN","Hesap Þekli FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECGRDCAPTN","Hesap Þekli FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECRPTCAPTN","Hesap Þekli FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFEMTOOLTIP","Hesap Þekli FK                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFEMSTATUSTXT","Hesap Þekli FK                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.hesapsekli_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.dosya_tipi field.
DBSetProp('ALACAKHESAPSEKLIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Dosya_Tipi')
DBSetProp('ALACAKHESAPSEKLIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.takip_tipi field.
DBSetProp('ALACAKHESAPSEKLIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Takip_Tipi')
DBSetProp('ALACAKHESAPSEKLIVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 1                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 1                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_1","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 1                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 1                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 3                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 3                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_2","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 2                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 2                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 3                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 3                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_3","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 3                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 3                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 4                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 4                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_4","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 4                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 4                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 5                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 5                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_5","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 5                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 5                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_6 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_6', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_6', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_6', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_6')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_6', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 6                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 6                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_6","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_6')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 6                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 6                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_6')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_7 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_7', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_7', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_7', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_7')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_7', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 7                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 7                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_7","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_7')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 7                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 7                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_7')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_8 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_8', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_8', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_8', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_8')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_8', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 8                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 8                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_8","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_8')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 8                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 8                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_8')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_9 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_9', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_9', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_9', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_9')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_9', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 9                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 9                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_9","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_9')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 9                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 9                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_9')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_adi_10 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_10', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_10', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_10', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Adi_10')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_adi_10', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_adi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Adý 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Adý 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Adý 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Adý 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Adý 10                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Adý 10                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_adi_10","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Hesabi_10')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECFRMCAPTN","TÖ Alacak Hesabý 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECDLGCAPTN","TÖ Alacak Hesabý 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECGRDCAPTN","TÖ Alacak Hesabý 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECRPTCAPTN","TÖ Alacak Hesabý 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMTOOLTIP","TÖ Alacak Hesabý 10                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMSTATUSTXT","TÖ Alacak Hesabý 10                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.To_Alacak_Aciklamasi_10')
DBSetProp('ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Adi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","TS Alacak Adý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","TS Alacak Adý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","TS Alacak Adý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","TS Alacak Adý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","TS Alacak Adý 1                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Adý 1                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Hesabi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECFRMCAPTN","TS Alacak Hesabý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECDLGCAPTN","TS Alacak Hesabý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECGRDCAPTN","TS Alacak Hesabý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECRPTCAPTN","TS Alacak Hesabý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMTOOLTIP","TS Alacak Hesabý 1                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Hesabý 1                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Aciklamasi_1')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Adi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","TS Alacak Adý 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","TS Alacak Adý 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","TS Alacak Adý 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","TS Alacak Adý 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","TS Alacak Adý 2                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Adý 2                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Hesabi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECFRMCAPTN","TS Alacak Hesabý 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECDLGCAPTN","TS Alacak Hesabý 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECGRDCAPTN","TS Alacak Hesabý 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECRPTCAPTN","TS Alacak Hesabý 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMTOOLTIP","TS Alacak Hesabý 2                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Hesabý 2                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFENDISPORDER",40) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Aciklamasi_2')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",40) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Adi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","TS Alacak Adý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","TS Alacak Adý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","TS Alacak Adý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","TS Alacak Adý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","TS Alacak Adý 3                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Adý 3                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Hesabi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECFRMCAPTN","TS Alacak Hesabý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECDLGCAPTN","TS Alacak Hesabý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECGRDCAPTN","TS Alacak Hesabý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECRPTCAPTN","TS Alacak Hesabý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMTOOLTIP","TS Alacak Hesabý 3                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Hesabý 3                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFENDISPORDER",44) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Aciklamasi_3')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Adi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","TS Alacak Adý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","TS Alacak Adý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","TS Alacak Adý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","TS Alacak Adý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","TS Alacak Adý 4                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Adý 4                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDISPORDER",46) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Hesabi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECFRMCAPTN","TS Alacak Hesabý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECDLGCAPTN","TS Alacak Hesabý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECGRDCAPTN","TS Alacak Hesabý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECRPTCAPTN","TS Alacak Hesabý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMTOOLTIP","TS Alacak Hesabý 4                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Hesabý 4                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Aciklamasi_4')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",46) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Adi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","TS Alacak Adý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","TS Alacak Adý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","TS Alacak Adý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","TS Alacak Adý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","TS Alacak Adý 5                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Adý 5                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Hesabi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECFRMCAPTN","TS Alacak Hesabý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECDLGCAPTN","TS Alacak Hesabý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECGRDCAPTN","TS Alacak Hesabý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECRPTCAPTN","TS Alacak Hesabý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMTOOLTIP","TS Alacak Hesabý 5                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMSTATUSTXT","TS Alacak Hesabý 5                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFENDISPORDER",50) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5 field.
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Ts_Alacak_Aciklamasi_5')
DBSetProp('ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi field.
DBSetProp('ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi', 'Field', 'UpdateName', 'dbo.AlacakHesapSekli.Tahsilat_Dusme_Sirasi')
DBSetProp('ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECDESCRIPT","Tahsilat Dusme Sirasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Düþme Sýrasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Düþme Sýrasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Düþme Sýrasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Düþme Sýrasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Düþme Sýrasý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Düþme Sýrasý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKHESAPSEKLIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
