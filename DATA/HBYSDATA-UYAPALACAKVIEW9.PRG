***************** Begin View Definition UYAPALACAKVIEW ***************


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



CREATE SQL VIEW "UYAPALACAKVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Doviztipi.Uyap_Kodu AS tutartur,;
		Icradosyahesabi.Asil_Alacak AS tutar,;
		CAST('1' AS CHAR(1)) AS alacakno,;
		Icradosya.Borc_Evragi AS digeralacakaciklama,;
		CAST('DigerAlacak_6' AS CHAR(15)) AS alacak_id,;
		Doviztipi.Aciklama AS tutaradi,;
		Icradosya.Takip_Tarihi AS tarih,;
		Icradosyahesabi.Asil_Alacak,;
		Icradosyahesabi.Gecikme_Faizi_Orani,;
		Icradosyahesabi.Gecikme_Faizi_Tutari,;
		Icradosyahesabi.Gecikme_Faizi_Aciklamasi,;
		Icradosyahesabi.Temerrut_Faizi_Orani,;
		Icradosyahesabi.Temerrut_Faizi_Tutari,;
		Icradosyahesabi.Temerrut_Faizi_Aciklamasi,;
		Icradosyahesabi.To_Alacak_Adi_1,;
		Icradosyahesabi.To_Alacak_Tutari_1,;
		Icradosyahesabi.To_Alacak_Aciklamasi_1,;
		Icradosyahesabi.To_Alacak_Adi_2,;
		Icradosyahesabi.To_Alacak_Tutari_2,;
		Icradosyahesabi.To_Alacak_Aciklamasi_2,;
		Icradosyahesabi.To_Alacak_Adi_3,;
		Icradosyahesabi.To_Alacak_Tutari_3,;
		Icradosyahesabi.To_Alacak_Aciklamasi_3,;
		Icradosyahesabi.To_Alacak_Adi_4,;
		Icradosyahesabi.To_Alacak_Tutari_4,;
		Icradosyahesabi.To_Alacak_Aciklamasi_4,;
		Icradosyahesabi.To_Alacak_Adi_5,;
		Icradosyahesabi.To_Alacak_Tutari_5,;
		Icradosyahesabi.To_Alacak_Aciklamasi_5,;
		Icradosyahesabi.To_Alacak_Adi_6,;
		Icradosyahesabi.To_Alacak_Tutari_6,;
		Icradosyahesabi.To_Alacak_Aciklamasi_6,;
		Icradosyahesabi.To_Alacak_Adi_7,;
		Icradosyahesabi.To_Alacak_Tutari_7,;
		Icradosyahesabi.To_Alacak_Aciklamasi_7,;
		Icradosyahesabi.To_Alacak_Adi_8,;
		Icradosyahesabi.To_Alacak_Tutari_8,;
		Icradosyahesabi.To_Alacak_Aciklamasi_8,;
		Icradosyahesabi.To_Alacak_Adi_9,;
		Icradosyahesabi.To_Alacak_Tutari_9,;
		Icradosyahesabi.To_Alacak_Aciklamasi_9,;
		Icradosyahesabi.To_Alacak_Adi_10,;
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
		Icradosyahesabi.TS_Alacak_Tutari_1,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_1,;
		Icradosyahesabi.TS_Alacak_Adi_2,;
		Icradosyahesabi.TS_Alacak_Tutari_2,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_2,;
		Icradosyahesabi.TS_Alacak_Adi_3,;
		Icradosyahesabi.TS_Alacak_Tutari_3,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_3,;
		Icradosyahesabi.TS_Alacak_Adi_4,;
		Icradosyahesabi.TS_Alacak_Tutari_4,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_4,;
		Icradosyahesabi.TS_Alacak_Adi_5,;
		Icradosyahesabi.TS_Alacak_Tutari_5,;
		Icradosyahesabi.TS_Alacak_Aciklamasi_5;
	FROM {oj dbo.IcraDosyaHesabi Icradosyahesabi;
		INNER JOIN dbo.Alacak Alacak;
			ON Icradosyahesabi.IcraDosyaHesabi_Fk = Alacak.Alacak_Fk;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Icradosyahesabi.IcraDosyaHesabi_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.DovizTipi Doviztipi;
			ON Alacak.Doviz_Tipi = Doviztipi.Doviz_Tipi}

DBSetProp('UYAPALACAKVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPALACAKVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPALACAKVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPALACAKVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPALACAKVIEW', 'View', 'Tables', 'dbo.IcraDosyaHesabi')
DBSetProp('UYAPALACAKVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchSize', -1)
DBSetProp('UYAPALACAKVIEW', 'View', 'ParameterList', "vp_Alacak_Fk,'C'")
DBSetProp('UYAPALACAKVIEW', 'View', 'Comment', "")
DBSetProp('UYAPALACAKVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPALACAKVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPALACAKVIEW
	GoExplorer.odbcx.Validate("UYAPALACAKVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFECDESCRIPT","Uyapalacakview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Alacak_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Alacak Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECFRMCAPTN","Alacak Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECDLGCAPTN","Alacak Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMTOOLTIP","Alacak Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Alacak Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMCOMPARETO","Alacak.Alacak_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for UYAPALACAKVIEW
*** Props for the UYAPALACAKVIEW.tutartur field.
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'UpdateName', 'dbo.DovizTipi.Uyap_Kodu')
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'DataType', "C(8)")
*** DBCX Field Properties for UYAPALACAKVIEW.tutartur
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECDESCRIPT","Tutartur Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECFRMCAPTN","Tutartur") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECDLGCAPTN","Tutartur") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECGRDCAPTN","Tutartur") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECRPTCAPTN","Tutartur") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMTOOLTIP","Tutartur") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMSTATUSTXT","Tutartur") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.tutar field.
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'DataType', "N(10,2)")
*** DBCX Field Properties for UYAPALACAKVIEW.tutar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECDESCRIPT","Tutar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECFRMCAPTN","Tutar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECDLGCAPTN","Tutar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECGRDCAPTN","Tutar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECRPTCAPTN","Tutar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMTOOLTIP","Tutar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMSTATUSTXT","Tutar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.alacakno field.
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'UpdateName', 'AlacakNo')
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKVIEW.alacakno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECDESCRIPT","Alacakno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECFRMCAPTN","Alacakno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECDLGCAPTN","Alacakno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECGRDCAPTN","Alacakno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECRPTCAPTN","Alacakno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMTOOLTIP","Alacakno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMSTATUSTXT","Alacakno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.digeralacakaciklama field.
DBSetProp('UYAPALACAKVIEW.digeralacakaciklama', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.digeralacakaciklama', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.digeralacakaciklama', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('UYAPALACAKVIEW.digeralacakaciklama', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.digeralacakaciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECDESCRIPT","Digeralacakaciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECFRMCAPTN","Digeralacakaciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECDLGCAPTN","Digeralacakaciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECGRDCAPTN","Digeralacakaciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECRPTCAPTN","Digeralacakaciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFEMTOOLTIP","Digeralacakaciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFEMSTATUSTXT","Digeralacakaciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.digeralacakaciklama","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.alacak_id field.
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'UpdateName', 'Alacak_Id')
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKVIEW.alacak_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECDESCRIPT","Alacak Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECFRMCAPTN","Alacak Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECDLGCAPTN","Alacak Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECGRDCAPTN","Alacak Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECRPTCAPTN","Alacak Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMTOOLTIP","Alacak Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMSTATUSTXT","Alacak Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.tutaradi field.
DBSetProp('UYAPALACAKVIEW.tutaradi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tutaradi', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tutaradi', 'Field', 'UpdateName', 'dbo.DovizTipi.Aciklama')
DBSetProp('UYAPALACAKVIEW.tutaradi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.tutaradi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECDESCRIPT","Tutaradi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECFRMCAPTN","Tutaradi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECDLGCAPTN","Tutaradi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECGRDCAPTN","Tutaradi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECRPTCAPTN","Tutaradi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFEMTOOLTIP","Tutaradi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFEMSTATUSTXT","Tutaradi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutaradi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.tarih field.
DBSetProp('UYAPALACAKVIEW.tarih', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tarih', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tarih', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tarihi')
DBSetProp('UYAPALACAKVIEW.tarih', 'Field', 'DataType', "T")
*** DBCX Field Properties for UYAPALACAKVIEW.tarih
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECDESCRIPT","Tarih Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECFRMCAPTN","Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECDLGCAPTN","Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECGRDCAPTN","Tarih") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECRPTCAPTN","Tarih") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFEMTOOLTIP","Tarih") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFEMSTATUSTXT","Tarih") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tarih","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.asil_alacak field.
DBSetProp('UYAPALACAKVIEW.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.asil_alacak', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('UYAPALACAKVIEW.asil_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asil Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asil Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asil Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asil Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asil Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asil Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.asil_alacak","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.gecikme_faizi_orani field.
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Orani')
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.gecikme_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_orani","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.gecikme_faizi_tutari field.
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Tutari')
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.gecikme_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_tutari","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.gecikme_faizi_aciklamasi field.
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Gecikme_Faizi_Aciklamasi')
DBSetProp('UYAPALACAKVIEW.gecikme_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.gecikme_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Aciklamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Aciklamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Aciklamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Aciklamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Aciklamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Aciklamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.gecikme_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.temerrut_faizi_orani field.
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Orani')
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.temerrut_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_orani","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.temerrut_faizi_tutari field.
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Tutari')
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.temerrut_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_tutari","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.temerrut_faizi_aciklamasi field.
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Temerrut_Faizi_Aciklamasi')
DBSetProp('UYAPALACAKVIEW.temerrut_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.temerrut_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Aciklamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Aciklamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Aciklamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Aciklamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Aciklamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Aciklamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.temerrut_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_1 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_1')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_1","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_1 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_1')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_1","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_1 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_1')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_2 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_2', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_2')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_2","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_2 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_2', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_2')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_2","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_2 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_2', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_2')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_3 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_3')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_3","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_3 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_3')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_3","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_3 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_3')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_4 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_4')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_4","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_4 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_4')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_4","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_4 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_4')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_5 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_5')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_5","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_5 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_5')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_5","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_5 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_5')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_6 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_6', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_6', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_6')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_6', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_6","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_6 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_6', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_6', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_6')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_6', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_6","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_6 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_6', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_6', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_6', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_6')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_6', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 6") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 6") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_6","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_7 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_7', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_7', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_7')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_7', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_7","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_7 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_7', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_7', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_7')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_7', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_7","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_7 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_7', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_7', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_7', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_7')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_7', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 7") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 7") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_7","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_8 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_8', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_8', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_8')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_8', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_8","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_8 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_8', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_8', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_8')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_8', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_8","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_8 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_8', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_8', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_8', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_8')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_8', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 8") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 8") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_8","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_9 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_9', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_9', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_9')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_9', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_9","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_9 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_9', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_9', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_9')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_9', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_9","FIELD",;
		"VFENDISPORDER",40) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_9 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_9', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_9', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_9', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_9')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_9', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 9") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 9") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_9","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_adi_10 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_10', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_10', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Adi_10')
DBSetProp('UYAPALACAKVIEW.to_alacak_adi_10', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_adi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Adi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Adi 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Adi 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Adi 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Adi 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Adi 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Adi 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_adi_10","FIELD",;
		"VFENDISPORDER",42) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_tutari_10 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_10', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_10', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Tutari_10')
DBSetProp('UYAPALACAKVIEW.to_alacak_tutari_10', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_tutari_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECDESCRIPT","To Alacak Tutari 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Tutari 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Tutari 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Tutari 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Tutari 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Tutari 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Tutari 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_tutari_10","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.to_alacak_aciklamasi_10 field.
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_10', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_10', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_10', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.To_Alacak_Aciklamasi_10')
DBSetProp('UYAPALACAKVIEW.to_alacak_aciklamasi_10', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.to_alacak_aciklamasi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDESCRIPT","To Alacak Aciklamasi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECFRMCAPTN","To Alacak Aciklamasi 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECDLGCAPTN","To Alacak Aciklamasi 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECGRDCAPTN","To Alacak Aciklamasi 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECRPTCAPTN","To Alacak Aciklamasi 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMTOOLTIP","To Alacak Aciklamasi 10") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMSTATUSTXT","To Alacak Aciklamasi 10") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.to_alacak_aciklamasi_10","FIELD",;
		"VFENDISPORDER",44) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.takip_alacagi field.
DBSetProp('UYAPALACAKVIEW.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.takip_alacagi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('UYAPALACAKVIEW.takip_alacagi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacagi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacagi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacagi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacagi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacagi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacagi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_alacagi","FIELD",;
		"VFENDISPORDER",45) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the UYAPALACAKVIEW.ts_vekalet_ucreti field.
DBSetProp('UYAPALACAKVIEW.ts_vekalet_ucreti', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_vekalet_ucreti', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_vekalet_ucreti', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Vekalet_Ucreti')
DBSetProp('UYAPALACAKVIEW.ts_vekalet_ucreti', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_vekalet_ucreti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDESCRIPT","Ts Vekalet Ucreti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECFRMCAPTN","Ts Vekalet Ucreti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDLGCAPTN","Ts Vekalet Ucreti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECGRDCAPTN","Ts Vekalet Ucreti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECRPTCAPTN","Ts Vekalet Ucreti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMTOOLTIP","Ts Vekalet Ucreti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMSTATUSTXT","Ts Vekalet Ucreti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDISPORDER",46) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.takip_faizi_orani field.
DBSetProp('UYAPALACAKVIEW.takip_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Orani')
DBSetProp('UYAPALACAKVIEW.takip_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.takip_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECDESCRIPT","Takip Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_orani","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.indirimli_takip_faizi_orani field.
DBSetProp('UYAPALACAKVIEW.indirimli_takip_faizi_orani', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.indirimli_takip_faizi_orani', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.indirimli_takip_faizi_orani', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Indirimli_Takip_Faizi_Orani')
DBSetProp('UYAPALACAKVIEW.indirimli_takip_faizi_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.indirimli_takip_faizi_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECDESCRIPT","Indirimli Takip Faizi Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECFRMCAPTN","Indirimli Takip Faizi Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECDLGCAPTN","Indirimli Takip Faizi Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECGRDCAPTN","Indirimli Takip Faizi Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECRPTCAPTN","Indirimli Takip Faizi Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMTOOLTIP","Indirimli Takip Faizi Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMSTATUSTXT","Indirimli Takip Faizi Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.indirimli_takip_faizi_orani","FIELD",;
		"VFENDISPORDER",48) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.takip_faizi_tutari field.
DBSetProp('UYAPALACAKVIEW.takip_faizi_tutari', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_tutari', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Tutari')
DBSetProp('UYAPALACAKVIEW.takip_faizi_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.takip_faizi_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECDESCRIPT","Takip Faizi Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_tutari","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.takip_faizi_aciklamasi field.
DBSetProp('UYAPALACAKVIEW.takip_faizi_aciklamasi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_aciklamasi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.takip_faizi_aciklamasi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Faizi_Aciklamasi')
DBSetProp('UYAPALACAKVIEW.takip_faizi_aciklamasi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.takip_faizi_aciklamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECDESCRIPT","Takip Faizi Aciklamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Aciklamasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Aciklamasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Aciklamasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Aciklamasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Aciklamasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Aciklamasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.takip_faizi_aciklamasi","FIELD",;
		"VFENDISPORDER",50) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_harc_tutari field.
DBSetProp('UYAPALACAKVIEW.ts_harc_tutari', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_harc_tutari', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_harc_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Harc_Tutari')
DBSetProp('UYAPALACAKVIEW.ts_harc_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_harc_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECDESCRIPT","Ts Harc Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECFRMCAPTN","Ts Harc Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECDLGCAPTN","Ts Harc Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECGRDCAPTN","Ts Harc Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECRPTCAPTN","Ts Harc Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFEMTOOLTIP","Ts Harc Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFEMSTATUSTXT","Ts Harc Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_harc_tutari","FIELD",;
		"VFENDISPORDER",51) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_masraf_tutari field.
DBSetProp('UYAPALACAKVIEW.ts_masraf_tutari', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_masraf_tutari', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_masraf_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Masraf_Tutari')
DBSetProp('UYAPALACAKVIEW.ts_masraf_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_masraf_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECDESCRIPT","Ts Masraf Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECFRMCAPTN","Ts Masraf Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECDLGCAPTN","Ts Masraf Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECGRDCAPTN","Ts Masraf Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECRPTCAPTN","Ts Masraf Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFEMTOOLTIP","Ts Masraf Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFEMSTATUSTXT","Ts Masraf Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_masraf_tutari","FIELD",;
		"VFENDISPORDER",52) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.tahsil_harci field.
DBSetProp('UYAPALACAKVIEW.tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.tahsil_harci', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Tahsil_Harci')
DBSetProp('UYAPALACAKVIEW.tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECDESCRIPT","Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECFRMCAPTN","Tahsil Harci") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECDLGCAPTN","Tahsil Harci") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECGRDCAPTN","Tahsil Harci") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECRPTCAPTN","Tahsil Harci") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFEMTOOLTIP","Tahsil Harci") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","Tahsil Harci") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tahsil_harci","FIELD",;
		"VFENDISPORDER",53) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_adi_1 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_1')
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_1', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_adi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_1","FIELD",;
		"VFENDISPORDER",54) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_tutari_1 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_1')
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_tutari_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_1","FIELD",;
		"VFENDISPORDER",55) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_aciklamasi_1 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_1', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_1', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_1', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_1')
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_1', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_aciklamasi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_1","FIELD",;
		"VFENDISPORDER",56) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_adi_2 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_2', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_2')
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_2', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_adi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_2","FIELD",;
		"VFENDISPORDER",57) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_tutari_2 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_2', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_2')
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_tutari_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_2","FIELD",;
		"VFENDISPORDER",58) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_aciklamasi_2 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_2', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_2', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_2', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_2')
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_2', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_aciklamasi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_2","FIELD",;
		"VFENDISPORDER",59) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_adi_3 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_3')
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_3', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_adi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_3","FIELD",;
		"VFENDISPORDER",60) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_tutari_3 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_3')
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_tutari_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_3","FIELD",;
		"VFENDISPORDER",61) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_aciklamasi_3 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_3', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_3', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_3', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_3')
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_3', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_aciklamasi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 3") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 3") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_3","FIELD",;
		"VFENDISPORDER",62) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_adi_4 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_4')
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_4', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_adi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_4","FIELD",;
		"VFENDISPORDER",63) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_tutari_4 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_4')
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_tutari_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_4","FIELD",;
		"VFENDISPORDER",64) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_aciklamasi_4 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_4', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_4', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_4', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_4')
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_4', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_aciklamasi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 4") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 4") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_4","FIELD",;
		"VFENDISPORDER",65) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_adi_5 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Adi_5')
DBSetProp('UYAPALACAKVIEW.ts_alacak_adi_5', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_adi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Adi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Adi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Adi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Adi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Adi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Adi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Adi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_adi_5","FIELD",;
		"VFENDISPORDER",66) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_tutari_5 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Tutari_5')
DBSetProp('UYAPALACAKVIEW.ts_alacak_tutari_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_tutari_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Tutari 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Tutari 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Tutari 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Tutari 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Tutari 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Tutari 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Tutari 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_tutari_5","FIELD",;
		"VFENDISPORDER",67) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.ts_alacak_aciklamasi_5 field.
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_5', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_5', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_5', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Alacak_Aciklamasi_5')
DBSetProp('UYAPALACAKVIEW.ts_alacak_aciklamasi_5', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for UYAPALACAKVIEW.ts_alacak_aciklamasi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDESCRIPT","Ts Alacak Aciklamasi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECFRMCAPTN","Ts Alacak Aciklamasi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECDLGCAPTN","Ts Alacak Aciklamasi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECGRDCAPTN","Ts Alacak Aciklamasi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECRPTCAPTN","Ts Alacak Aciklamasi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMTOOLTIP","Ts Alacak Aciklamasi 5") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMSTATUSTXT","Ts Alacak Aciklamasi 5") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.ts_alacak_aciklamasi_5","FIELD",;
		"VFENDISPORDER",68) &&Display Order
ENDIF
 
