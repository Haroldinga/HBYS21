***************** Begin View Definition ICRADOSYAHESABIVIEW ***************


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



CREATE SQL VIEW "ICRADOSYAHESABIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosyahesabi.IcraDosyaHesabi_Id,;
		Icradosyahesabi.IcraDosyaHesabi_Fk,;
		Icradosyahesabi.Hesap_Tipi,;
		Icradosyahesabi.Faiz_Bilgisi,;
		Icradosyahesabi.Takip_Alacak_Hesabi,;
		Icradosyahesabi.Toplam_Alacak_Hesabi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Asil_Alacak,;
		Icradosyahesabi.Tahsilat_Dusme_Sirasi,;
		Icradosyahesabi.Gecikme_Faizi_Orani,;
		Icradosyahesabi.Gecikme_Faizi_Tutari,;
		Icradosyahesabi.Gecikme_Faizi_Aciklamasi,;
		Icradosyahesabi.Temerrut_Faizi_Orani,;
		Icradosyahesabi.Temerrut_Faizi_Tutari,;
		Icradosyahesabi.Temerrut_Faizi_Aciklamasi,;
		Icradosyahesabi.To_Alacak_Adi_1,;
		Icradosyahesabi.To_Alacak_Hesabi_1,;
		Icradosyahesabi.To_Alacak_Tutari_1,;
		Icradosyahesabi.To_Alacak_Aciklamasi_1,;
		Icradosyahesabi.To_Alacak_Adi_2,;
		Icradosyahesabi.To_Alacak_Hesabi_2,;
		Icradosyahesabi.To_Alacak_Tutari_2,;
		Icradosyahesabi.To_Alacak_Aciklamasi_2,;
		Icradosyahesabi.To_Alacak_Adi_3,;
		Icradosyahesabi.To_Alacak_Hesabi_3,;
		Icradosyahesabi.To_Alacak_Tutari_3,;
		Icradosyahesabi.To_Alacak_Aciklamasi_3,;
		Icradosyahesabi.To_Alacak_Adi_4,;
		Icradosyahesabi.To_Alacak_Hesabi_4,;
		Icradosyahesabi.To_Alacak_Tutari_4,;
		Icradosyahesabi.To_Alacak_Aciklamasi_4,;
		Icradosyahesabi.To_Alacak_Adi_5,;
		Icradosyahesabi.To_Alacak_Hesabi_5,;
		Icradosyahesabi.To_Alacak_Tutari_5,;
		Icradosyahesabi.To_Alacak_Aciklamasi_5,;
		Icradosyahesabi.To_Alacak_Adi_6,;
		Icradosyahesabi.To_Alacak_Hesabi_6,;
		Icradosyahesabi.To_Alacak_Tutari_6,;
		Icradosyahesabi.To_Alacak_Aciklamasi_6,;
		Icradosyahesabi.To_Alacak_Adi_7,;
		Icradosyahesabi.To_Alacak_Hesabi_7,;
		Icradosyahesabi.To_Alacak_Tutari_7,;
		Icradosyahesabi.To_Alacak_Aciklamasi_7,;
		Icradosyahesabi.To_Alacak_Adi_8,;
		Icradosyahesabi.To_Alacak_Hesabi_8,;
		Icradosyahesabi.To_Alacak_Tutari_8,;
		Icradosyahesabi.To_Alacak_Aciklamasi_8,;
		Icradosyahesabi.To_Alacak_Adi_9,;
		Icradosyahesabi.To_Alacak_Hesabi_9,;
		Icradosyahesabi.To_Alacak_Tutari_9,;
		Icradosyahesabi.To_Alacak_Aciklamasi_9,;
		Icradosyahesabi.To_Alacak_Adi_10,;
		Icradosyahesabi.To_Alacak_Hesabi_10,;
		Icradosyahesabi.To_Alacak_Tutari_10,;
		Icradosyahesabi.To_Alacak_Aciklamasi_10,;
		Icradosyahesabi.Takip_Alacagi,;
		Icradosyahesabi.TS_Vekalet_Ucreti,;
		Icradosyahesabi.Takip_Faizi_Orani,;
		Icradosyahesabi.Indirimli_Takip_Faizi_Orani,;
		Icradosyahesabi.Takip_Faizi_Tutari,;
		Icradosyahesabi.Takip_Faizi_Aciklamasi,;
		Icradosyahesabi.TS_Harc_Tutari,;
		Icradosyahesabi.TS_Masraf_Tutari,;
		Icradosyahesabi.Tahsil_Harci,;
		Icradosyahesabi.TS_Alacak_Adi_1,;
		Icradosyahesabi.TS_Alacak_Hesabi_1,;
		Icradosyahesabi.TS_Alacak_Tutari_1,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_1,;
		Icradosyahesabi.TS_Alacak_Adi_2,;
		Icradosyahesabi.TS_Alacak_Hesabi_2,;
		Icradosyahesabi.TS_Alacak_Tutari_2,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_2,;
		Icradosyahesabi.TS_Alacak_Adi_3,;
		Icradosyahesabi.TS_Alacak_Hesabi_3,;
		Icradosyahesabi.TS_Alacak_Tutari_3,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_3,;
		Icradosyahesabi.TS_Alacak_Adi_4,;
		Icradosyahesabi.TS_Alacak_Hesabi_4,;
		Icradosyahesabi.TS_Alacak_Tutari_4,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_4,;
		Icradosyahesabi.TS_Alacak_Adi_5,;
		Icradosyahesabi.TS_Alacak_Hesabi_5,;
		Icradosyahesabi.TS_Alacak_Tutari_5,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_5,;
		Icradosyahesabi.TS_Tahsilat_Tutari,;
		Icradosyahesabi.Indirim_Tutari,;
		Icradosyahesabi.Toplam_Alacak,;
		Icradosyahesabi.Kalan_Alacak;
	FROM dbo.IcraDosyaHesabi Icradosyahesabi

DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'WhereType', 1)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'Tables', 'dbo.IcraDosyaHesabi')
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'FetchSize', -1)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'ParameterList', "vp_IcraDosyaHesabi_Fk,'C'")
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'Comment', "")
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAHESABIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()
_VFEGenView_F3()
_VFEGenView_F4()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAHESABIVIEW
	GoExplorer.odbcx.Validate("ICRADOSYAHESABIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW","VIEW",;
		"VFECDESCRIPT","Icradosyahesabiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosyaHesabi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosyahesabi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Icradosyahesabi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Icradosyahesabi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Icradosyahesabi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Icradosyahesabi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vp_IcraDosyaHesabi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ICRADOSYAHESABIVIEW
*** Props for the ICRADOSYAHESABIVIEW.icradosyahesabi_id field.
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_id', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.IcraDosyaHesabi_Id')
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_id', 'Field', 'DataType', "C(36)")
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.icradosyahesabi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECDESCRIPT","Icradosyahesabi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya Hesabý ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya Hesabý ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya Hesabý ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya Hesabý ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya Hesabý ID                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya Hesabý ID                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.icradosyahesabi_fk field.
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_fk', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_fk', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_fk', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.IcraDosyaHesabi_Fk')
DBSetProp('ICRADOSYAHESABIVIEW.icradosyahesabi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.icradosyahesabi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECDESCRIPT","Icradosyahesabi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECFRMCAPTN","Icradosyahesabi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECDLGCAPTN","Icradosyahesabi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECGRDCAPTN","Icradosyahesabi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECRPTCAPTN","Icradosyahesabi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFEMTOOLTIP","Icradosyahesabi FK                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFEMSTATUSTXT","Icradosyahesabi FK                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.icradosyahesabi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.hesap_tipi field.
DBSetProp('ICRADOSYAHESABIVIEW.hesap_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.hesap_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.hesap_tipi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Hesap_Tipi')
DBSetProp('ICRADOSYAHESABIVIEW.hesap_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.hesap_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECDESCRIPT","Hesap Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECFRMCAPTN","Hesap Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECDLGCAPTN","Hesap Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECGRDCAPTN","Hesap Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECRPTCAPTN","Hesap Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFEMTOOLTIP","Hesap Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFEMSTATUSTXT","Hesap Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFEMINLIST",'"Standart Hesap","Özel Hesap","Ýndirimli Hesap","Kampanya Hesabý"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.hesap_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.faiz_bilgisi field.
DBSetProp('ICRADOSYAHESABIVIEW.faiz_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.faiz_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.faiz_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Faiz_Bilgisi')
DBSetProp('ICRADOSYAHESABIVIEW.faiz_bilgisi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.faiz_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECDESCRIPT","Faiz Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECFRMCAPTN","Faiz Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECDLGCAPTN","Faiz Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECGRDCAPTN","Faiz Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECRPTCAPTN","Faiz Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFEMTOOLTIP","Faiz Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Faiz Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.faiz_bilgisi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.takip_alacak_hesabi field.
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacak_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacak_Hesabi')
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacak_hesabi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.takip_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Takip Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Takip Alacak Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Takip Alacak Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Takip Alacak Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Takip Alacak Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Takip Alacak Hesabý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacak Hesabý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.toplam_alacak_hesabi field.
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak_Hesabi')
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak_hesabi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.toplam_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak Hesabý                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak Hesabý                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.alacakli_bilgisi field.
DBSetProp('ICRADOSYAHESABIVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.alacakli_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('ICRADOSYAHESABIVIEW.alacakli_bilgisi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacakli Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacakli Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacakli Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacakli Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacakli Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacakli Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.vekil_bilgisi field.
DBSetProp('ICRADOSYAHESABIVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.vekil_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('ICRADOSYAHESABIVIEW.vekil_bilgisi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.borclu_bilgisi field.
DBSetProp('ICRADOSYAHESABIVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.borclu_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('ICRADOSYAHESABIVIEW.borclu_bilgisi', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.asil_alacak field.
DBSetProp('ICRADOSYAHESABIVIEW.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.asil_alacak', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('ICRADOSYAHESABIVIEW.asil_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asýl Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asýl Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asýl Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asýl Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asýl Alacak                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asýl Alacak                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.asil_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi field.
DBSetProp('ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Tahsilat_Dusme_Sirasi')
DBSetProp('ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECDESCRIPT","Tahsilat Dusme Sirasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Düþme Sýrasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Düþme Sýrasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Düþme Sýrasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Düþme Sýrasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Düþme Sýrasý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Düþme Sýrasý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsilat_dusme_sirasi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.gecikme_faizi_orani field.
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Orani')
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.gecikme_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Oraný                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Oraný                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMINPUTMASK","99.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.gecikme_faizi_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.gecikme_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFENDISPORDER",11) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi field.
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Aciklamasi')
DBSetProp('ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Açýklamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Açýklamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Açýklamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Açýklamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Açýklamasý                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Açýklamasý                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.temerrut_faizi_orani field.
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Orani')
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.temerrut_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi Oraný                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi Oraný                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDISPORDER",13) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMINPUTMASK","99.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.temerrut_faizi_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.temerrut_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFENDISPORDER",14) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi field.
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Aciklamasi')
DBSetProp('ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi Açýklamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi Açýklamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi Açýklamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi Açýklamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi Açýklamasý                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi Açýklamasý                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_1')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Adý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Adý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Adý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Adý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Adý 1                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adý 1                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_1","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_1')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_1', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesab1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesab1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesab1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesab1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesab1                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesab1                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_1","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_1')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_1')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 1                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 1                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_2')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_2","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_2')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_2', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 2                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 2                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_2","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_2')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFENDISPORDER",19) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_2')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 2                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 2                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_3')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_3","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_3')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_3', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 3                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 3                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_3","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_3')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFENDISPORDER",21) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_3')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 3                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 3                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_4')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_4","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_4')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_4', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 4                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 4                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_4","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_4')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFENDISPORDER",23) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_4')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 4                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 4                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_5')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_5","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_5')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_5', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 5                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 5                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_5","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_5')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFENDISPORDER",25) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_5')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 5                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 5                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_6 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_6', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_6', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_6')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_6', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_6","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_6 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_6', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_6', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_6')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_6', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 6                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 6                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_6","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_6 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_6', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_6', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_6')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_6', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFENDISPORDER",27) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_6')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 6                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 6                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_7 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_7', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_7', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_7')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_7', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_7","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_7 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_7', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_7', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_7')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_7', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 7                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 7                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_7","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_7 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_7', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_7', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_7')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_7', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFENDISPORDER",29) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_7')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 7                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 7                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_8 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_8', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_8', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_8')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_8', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_8","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_8 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_8', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_8', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_8')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_8', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 8                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 8                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_8","FIELD",;
		"VFENDISPORDER",45) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_8 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_8', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_8', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_8')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_8', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFENDISPORDER",31) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_8')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 8                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 8                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_9 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_9', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_9', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_9')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_9', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_9","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_9 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_9', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_9', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_9')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_9', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 9                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 9                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_9","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_9 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_9', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_9', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_9')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_9', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFENDISPORDER",33) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_9')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 9                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 9                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDISPORDER",51) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_adi_10 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_10', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_10', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_10')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_adi_10', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_adi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_adi_10","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_hesabi_10 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_10', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_10', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Hesabi_10')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_hesabi_10', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_hesabi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Hesabi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Hesabý 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Hesabý 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Hesabý 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Hesabý 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Hesabý 10                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Hesabý 10                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_hesabi_10","FIELD",;
		"VFENDISPORDER",53) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_tutari_10 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_10', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_10', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_10')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_tutari_10', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_tutari_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFENDISPORDER",35) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10 field.
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_10')
DBSetProp('ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Açýklamasý 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Açýklamasý 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Açýklamasý 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Açýklamasý 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Açýklamasý 10                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Açýklamasý 10                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDISPORDER",55) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.takip_alacagi field.
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacagi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('ICRADOSYAHESABIVIEW.takip_alacagi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacaðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacaðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacaðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacaðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacaðý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacaðý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFENDISPORDER",36) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_alacagi","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_vekalet_ucreti field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_vekalet_ucreti', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_vekalet_ucreti', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_vekalet_ucreti', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Vekalet_Ucreti')
DBSetProp('ICRADOSYAHESABIVIEW.ts_vekalet_ucreti', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_vekalet_ucreti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDESCRIPT","Ts Vekalet Ucreti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDISPORDER",37) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.takip_faizi_orani field.
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Orani')
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.takip_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECDESCRIPT","Takip Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Oraný                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Oraný                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFENDISPORDER",38) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMINPUTMASK","99.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani field.
DBSetProp('ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Indirimli_Takip_Faizi_Orani')
DBSetProp('ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECDESCRIPT","Indirimli Takip Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Ýndirimli Faiz Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Ýndirimli Faiz Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Ýndirimli Faiz Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Ýndirimli Faiz Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Ýndirimli Faiz Oraný                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Ýndirimli Faiz Oraný                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFENDISPORDER",61) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMINPUTMASK","99.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.takip_faizi_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.takip_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Takip Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Takip Faizi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Takip Faizi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Takip Faizi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Takip Faizi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Takip Faizi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFENDISPORDER",39) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi field.
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Aciklamasi')
DBSetProp('ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Takip Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Açýklamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Açýklamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Açýklamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Açýklamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Açýklamasý                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Açýklamasý                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",40) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F3
*** Props for the ICRADOSYAHESABIVIEW.ts_harc_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_harc_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_harc_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_harc_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Harc_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.ts_harc_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_harc_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECDESCRIPT","Ts Harc Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECFRMCAPTN","Diðer Harçlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECDLGCAPTN","Diðer Harçlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECGRDCAPTN","Diðer Harçlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECRPTCAPTN","Diðer Harçlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMTOOLTIP","Diðer Harçlar                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMSTATUSTXT","Diðer Harçlar                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFENDISPORDER",41) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_harc_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_masraf_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_masraf_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_masraf_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_masraf_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Masraf_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.ts_masraf_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_masraf_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECDESCRIPT","Ts Masraf Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECFRMCAPTN","Masraf Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECDLGCAPTN","Masraf Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECGRDCAPTN","Masraf Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECRPTCAPTN","Masraf Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMTOOLTIP","Masraf Tutarý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMSTATUSTXT","Masraf Tutarý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFENDISPORDER",42) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_masraf_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.tahsil_harci field.
DBSetProp('ICRADOSYAHESABIVIEW.tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.tahsil_harci', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Tahsil_Harci')
DBSetProp('ICRADOSYAHESABIVIEW.tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECDESCRIPT","Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECFRMCAPTN","Tahsil Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECDLGCAPTN","Tahsil Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECGRDCAPTN","Tahsil Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECRPTCAPTN","Tahsil Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMTOOLTIP","Tahsil Harcý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","Tahsil Harcý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFENDISPORDER",65) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.tahsil_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_adi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_1')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Hesabi_1')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Hesabi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Hesabi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Hesabi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Hesabi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Hesabi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Hesabi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_1","FIELD",;
		"VFENDISPORDER",64) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_tutari_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_1')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_tutari_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFENDISPORDER",44) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_1')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",66) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_adi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_2')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDISPORDER",45) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Hesabi_2')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Hesabi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Hesabi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Hesabi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Hesabi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Hesabi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Hesabi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_2","FIELD",;
		"VFENDISPORDER",68) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_tutari_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_2')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_tutari_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFENDISPORDER",46) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_2')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",70) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_adi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_3')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Hesabi_3')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Hesabi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Hesabi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Hesabi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Hesabi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Hesabi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Hesabi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_3","FIELD",;
		"VFENDISPORDER",72) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_tutari_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_3')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_tutari_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFENDISPORDER",48) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_3')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",74) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_adi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_4')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Hesabi_4')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Hesabi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Hesabi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Hesabi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Hesabi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Hesabi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Hesabi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_4","FIELD",;
		"VFENDISPORDER",76) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_tutari_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_4')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_tutari_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFENDISPORDER",50) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_4')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",78) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_adi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_5')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDISPORDER",51) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Hesabi_5')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Hesabi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Hesabi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Hesabi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Hesabi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Hesabi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Hesabi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Hesabi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_hesabi_5","FIELD",;
		"VFENDISPORDER",80) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F4
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_tutari_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_5')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_tutari_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_tutari_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFENDISPORDER",52) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5 field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_5')
DBSetProp('ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",82) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.ts_tahsilat_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.ts_tahsilat_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_tahsilat_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.ts_tahsilat_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Tahsilat_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.ts_tahsilat_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.ts_tahsilat_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECDESCRIPT","Ts Tahsilat Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tutarý                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tutarý                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFENDISPORDER",53) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.indirim_tutari field.
DBSetProp('ICRADOSYAHESABIVIEW.indirim_tutari', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.indirim_tutari', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.indirim_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Indirim_Tutari')
DBSetProp('ICRADOSYAHESABIVIEW.indirim_tutari', 'Field', 'DataType', "Y")
DBSetProp('ICRADOSYAHESABIVIEW.indirim_tutari', 'Field', 'DefaultValue', "0")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.indirim_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECDESCRIPT","Indirim Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECFRMCAPTN","Ýndirim Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECDLGCAPTN","Ýndirim Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECGRDCAPTN","Ýndirim Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECRPTCAPTN","Ýndirim Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMTOOLTIP","Ýndirim Tutarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMSTATUSTXT","Ýndirim Tutarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFENDISPORDER",89) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.indirim_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.toplam_alacak field.
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak')
DBSetProp('ICRADOSYAHESABIVIEW.toplam_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFENDISPORDER",54) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.toplam_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAHESABIVIEW.kalan_alacak field.
DBSetProp('ICRADOSYAHESABIVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHESABIVIEW.kalan_alacak', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHESABIVIEW.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('ICRADOSYAHESABIVIEW.kalan_alacak', 'Field', 'DataType', "Y")
DBSetProp('ICRADOSYAHESABIVIEW.kalan_alacak', 'Field', 'DefaultValue', "0")
*** DBCX Field Properties for ICRADOSYAHESABIVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",90) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHESABIVIEW.kalan_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
