***************** Begin View Definition VIZITTESPITTUTANAGIVIEW ***************


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



CREATE SQL VIEW "VIZITTESPITTUTANAGIVIEW" ; 
 REMOTE CONNECT "HBYSReportConnect" ; 
	AS SELECT Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Takip_Alacak_Hesabi,;
		Icradosyahesabi.Toplam_Alacak_Hesabi,;
		Icradosyahesabi.Asil_Alacak,;
		Icradosyahesabi.Takip_Alacagi,;
		Icradosyahesabi.Toplam_Alacak,;
		Icradosyahesabi.Kalan_Alacak,;
		CAST('' AS CHARACTER) AS vizit_bilgisi,;
		Isguncesi.Departman_Adi,;
		Isguncesi.Islem_Tarihi,;
		Isguncesi.Borclu_Adi,;
		Isguncesi.Islem_Adi,;
		Isguncesi.Aciklama,;
		Isguncesi.Personel_Adi;
	FROM {oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		LEFT OUTER JOIN dbo.IsGuncesi Isguncesi;
			ON Icradosya.IcraDosya_Id = Isguncesi.IsGuncesi_Fk}

DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'UpdateType', 1)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'WhereType', 3)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'Tables', 'dbo.IcraDosya,dbo.IcraDosyaHesabi,dbo.IsGuncesi')
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'Prepared', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'FetchSize', -1)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'C';vp_Icra_Dosya_No,'C'")
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'Comment', "")
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('VIZITTESPITTUTANAGIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for VIZITTESPITTUTANAGIVIEW
	GoExplorer.odbcx.Validate("VIZITTESPITTUTANAGIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW","VIEW",;
		"VFECDESCRIPT","Vizittespittutanagiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for VIZITTESPITTUTANAGIVIEW
*** Props for the VIZITTESPITTUTANAGIVIEW.buro_dosya_no field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('VIZITTESPITTUTANAGIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Büro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Büro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Büro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Büro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Büro Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Büro Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.icra_dosya_no field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('VIZITTESPITTUTANAGIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.muvekkil_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müekkil Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müekkil Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.adliye_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacaklý Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacaklý Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacaklý Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacaklý Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacaklý Bilgisi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacaklý Bilgisi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.vekil_bilgisi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.vekil_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.borclu_bilgisi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacak_Hesabi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Takip Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Takip Alacak Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Takip Alacak Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Takip Alacak Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Takip Alacak Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Takip Alacak Hesabý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacak Hesabý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacak_hesabi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak_Hesabi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak Hesabý                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak Hesabý                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak_hesabi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.asil_alacak field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.asil_alacak', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('VIZITTESPITTUTANAGIVIEW.asil_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asýl Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asýl Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asýl Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asýl Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asýl Alacak                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asýl Alacak                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.asil_alacak","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.takip_alacagi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacagi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.takip_alacagi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacaðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacaðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacaðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacaðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacaðý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacaðý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.takip_alacagi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.toplam_alacak field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak')
DBSetProp('VIZITTESPITTUTANAGIVIEW.toplam_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.toplam_alacak","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.kalan_alacak field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.kalan_alacak', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('VIZITTESPITTUTANAGIVIEW.kalan_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.vizit_bilgisi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.vizit_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.vizit_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.vizit_bilgisi', 'Field', 'UpdateName', 'Vizit_Bilgisi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.vizit_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.vizit_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECDESCRIPT","Vizit Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vizit Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vizit Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vizit Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vizit Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vizit Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vizit Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.vizit_bilgisi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.departman_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.departman_adi', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Departman_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.islem_tarihi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_tarihi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Islem_Tarihi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.islem_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECDESCRIPT","Islem Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýþlem Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýþlem Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýþlem Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýþlem Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýþlem Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_tarihi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.borclu_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Borclu_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.islem_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_adi', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Islem_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.islem_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.islem_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECDESCRIPT","Islem Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECFRMCAPTN","Ýþlem Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECDLGCAPTN","Ýþlem Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECGRDCAPTN","Ýþlem Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECRPTCAPTN","Ýþlem Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFEMTOOLTIP","Ýþlem Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.islem_adi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the VIZITTESPITTUTANAGIVIEW.aciklama field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.aciklama', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.aciklama', 'Field', 'UpdateName', 'dbo.IsGuncesi.Aciklama')
DBSetProp('VIZITTESPITTUTANAGIVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.aciklama","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the VIZITTESPITTUTANAGIVIEW.personel_adi field.
DBSetProp('VIZITTESPITTUTANAGIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('VIZITTESPITTUTANAGIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Personel_Adi')
DBSetProp('VIZITTESPITTUTANAGIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for VIZITTESPITTUTANAGIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!VIZITTESPITTUTANAGIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
