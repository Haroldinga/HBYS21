***************** Begin View Definition UYAPALACAKLIVIEW ***************


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



CREATE SQL VIEW "UYAPALACAKLIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_3' AS CHAR(10)) AS taraf_id,;
		Alacakli.Muvekkil_Adi AS ad,;
		CAST('kisiKurumBilgileri_3' AS CHAR(25)) AS kisikurumbilgileri_id,;
		CAST('' AS CHAR(1)) AS ticaretsicilnoverildigiyer,;
		CAST('1' AS CHAR(1)) AS harcdurumu,;
		Muvekkil.Ticaret_Sicil_No AS ticaretsicilno,;
		Muvekkil.Muvekkil_Adi AS kurumadi,;
		Muvekkil.Muvekkil_Tipi AS kamuozel,;
		Muvekkil.Vergi_Dairesi AS vergidairesi,;
		CAST('' AS CHAR(1)) AS sskisyerisicilno,;
		Muvekkil.Vergi_No AS vergino,;
		Muvekkil.e_Posta ,;
		CAST('' AS CHAR(1)) AS postakodu,;
		CAST('Yurt Ýçi Ýkametgah Adresi' AS CHAR(25)) AS adresturuaciklama,;
		CAST('' AS CHAR(15)) AS ceptelefon,;
		Adres.Il_Adi AS il,;
		CAST('' AS CHAR(15)) AS fax,;
		CAST('Adres_3' AS CHAR(10)) AS adres_id,;
		CAST('' AS CHAR(2)) AS ilkodu,;
		Adres.Ilce_Adi AS ilce,;
		Adres.Adres AS adres,;
		Muvekkil.Iletisim_Telefonu AS telefon,;
		CAST('' AS CHAR(3)) AS ilcekodu,;
		CAST('ADRTR00001' AS CHAR(10)) AS adresturu,;
		CAST('ALACAKLI' AS CHAR(15)) AS rol,;
		CAST('21' AS CHAR(2)) AS rol_id;
	FROM {oj{oj dbo.Alacakli Alacakli;
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Alacakli.Muvekkil_Id = Muvekkil.Muvekkil_Id;
		LEFT OUTER JOIN dbo.Iletisim Iletisim;
			ON Muvekkil.Muvekkil_Id = Iletisim.Iletisim_Fk};
		LEFT OUTER JOIN dbo.Adres Adres;
			ON Muvekkil.Muvekkil_Id = Adres.Adres_Fk}

DBSetProp('UYAPALACAKLIVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Tables', 'dbo.Alacakli,dbo.Muvekkil')
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchSize', -1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'ParameterList', "vp_Alacakli_fk,'C'")
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Comment', "")
DBSetProp('UYAPALACAKLIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPALACAKLIVIEW
	GoExplorer.odbcx.Validate("UYAPALACAKLIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECDESCRIPT","Uyapalacakliview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Alacakli_fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECDESCRIPT","Vp Alacakli Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECFRMCAPTN","Alacakli Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECDLGCAPTN","Alacakli Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMTOOLTIP","Alacakli Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMSTATUSTXT","Alacakli Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMCOMPARETO","Alacakli.Alacakli_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vp_Alacakli_fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for UYAPALACAKLIVIEW
*** Props for the UYAPALACAKLIVIEW.taraf_id field.
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'UpdateName', 'taraf_Id')
DBSetProp('UYAPALACAKLIVIEW.taraf_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.taraf_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECDESCRIPT","Taraf Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECFRMCAPTN","Taraf Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECDLGCAPTN","Taraf Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECGRDCAPTN","Taraf Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECRPTCAPTN","Taraf Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMTOOLTIP","Taraf Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMSTATUSTXT","Taraf Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.taraf_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ad field.
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'UpdateName', 'dbo.Alacakli.Muvekkil_Adi')
DBSetProp('UYAPALACAKLIVIEW.ad', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ad
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECDESCRIPT","Ad Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECFRMCAPTN","Ad") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECDLGCAPTN","Ad") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECGRDCAPTN","Ad") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECRPTCAPTN","Ad") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMTOOLTIP","Ad") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMSTATUSTXT","Ad") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ad","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kisikurumbilgileri_id field.
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'UpdateName', 'KisiKurumBilgileri_Id')
DBSetProp('UYAPALACAKLIVIEW.kisikurumbilgileri_id', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kisikurumbilgileri_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDESCRIPT","Kisikurumbilgileri Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECFRMCAPTN","Kisikurumbilgileri Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECDLGCAPTN","Kisikurumbilgileri Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECGRDCAPTN","Kisikurumbilgileri Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECRPTCAPTN","Kisikurumbilgileri Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMTOOLTIP","Kisikurumbilgileri Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMSTATUSTXT","Kisikurumbilgileri Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kisikurumbilgileri_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer field.
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'UpdateName', 'TicaretSicilNoVerildigiyer')
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECDESCRIPT","Ticaretsicilnoverildigiyer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECFRMCAPTN","Ticaretsicilnoverildigiyer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECDLGCAPTN","Ticaretsicilnoverildigiyer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECGRDCAPTN","Ticaretsicilnoverildigiyer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECRPTCAPTN","Ticaretsicilnoverildigiyer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMTOOLTIP","Ticaretsicilnoverildigiyer") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMSTATUSTXT","Ticaretsicilnoverildigiyer") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilnoverildigiyer","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.harcdurumu field.
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'UpdateName', 'HarcDurumu')
DBSetProp('UYAPALACAKLIVIEW.harcdurumu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.harcdurumu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECDESCRIPT","Harcdurumu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECFRMCAPTN","Harcdurumu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECDLGCAPTN","Harcdurumu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECGRDCAPTN","Harcdurumu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECRPTCAPTN","Harcdurumu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMTOOLTIP","Harcdurumu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMSTATUSTXT","Harcdurumu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.harcdurumu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ticaretsicilno field.
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'UpdateName', 'dbo.Muvekkil.Ticaret_Sicil_No')
DBSetProp('UYAPALACAKLIVIEW.ticaretsicilno', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ticaretsicilno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECDESCRIPT","Ticaretsicilno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECFRMCAPTN","Ticaretsicilno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECDLGCAPTN","Ticaretsicilno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECGRDCAPTN","Ticaretsicilno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECRPTCAPTN","Ticaretsicilno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMTOOLTIP","Ticaretsicilno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMSTATUSTXT","Ticaretsicilno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ticaretsicilno","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kurumadi field.
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('UYAPALACAKLIVIEW.kurumadi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kurumadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECDESCRIPT","Kurumadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECFRMCAPTN","Kurumadi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECDLGCAPTN","Kurumadi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECGRDCAPTN","Kurumadi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECRPTCAPTN","Kurumadi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMTOOLTIP","Kurumadi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMSTATUSTXT","Kurumadi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kurumadi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.kamuozel field.
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Tipi')
DBSetProp('UYAPALACAKLIVIEW.kamuozel', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.kamuozel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECDESCRIPT","Kamuozel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECFRMCAPTN","Kamuozel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECDLGCAPTN","Kamuozel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECGRDCAPTN","Kamuozel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECRPTCAPTN","Kamuozel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMTOOLTIP","Kamuozel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMSTATUSTXT","Kamuozel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.kamuozel","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.vergidairesi field.
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_Dairesi')
DBSetProp('UYAPALACAKLIVIEW.vergidairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.vergidairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECDESCRIPT","Vergidairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECFRMCAPTN","Vergidairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECDLGCAPTN","Vergidairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECGRDCAPTN","Vergidairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECRPTCAPTN","Vergidairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMTOOLTIP","Vergidairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMSTATUSTXT","Vergidairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergidairesi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.sskisyerisicilno field.
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'UpdateName', 'SSkIsyeriSicilNo')
DBSetProp('UYAPALACAKLIVIEW.sskisyerisicilno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.sskisyerisicilno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECDESCRIPT","Sskisyerisicilno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECFRMCAPTN","Sskisyerisicilno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECDLGCAPTN","Sskisyerisicilno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECGRDCAPTN","Sskisyerisicilno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECRPTCAPTN","Sskisyerisicilno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMTOOLTIP","Sskisyerisicilno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMSTATUSTXT","Sskisyerisicilno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.sskisyerisicilno","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.vergino field.
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'Updatable', .T.)
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_No')
DBSetProp('UYAPALACAKLIVIEW.vergino', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.vergino
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECDESCRIPT","Vergino Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECFRMCAPTN","Vergino") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECDLGCAPTN","Vergino") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECGRDCAPTN","Vergino") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECRPTCAPTN","Vergino") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMTOOLTIP","Vergino") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMSTATUSTXT","Vergino") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.vergino","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.e_posta field.
DBSetProp('UYAPALACAKLIVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.e_posta', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.e_posta', 'Field', 'UpdateName', 'e_Posta')
DBSetProp('UYAPALACAKLIVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","E Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","E Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","E Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","E Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","E Posta") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","E Posta") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.e_posta","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.postakodu field.
DBSetProp('UYAPALACAKLIVIEW.postakodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.postakodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.postakodu', 'Field', 'UpdateName', 'PostaKodu')
DBSetProp('UYAPALACAKLIVIEW.postakodu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.postakodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECDESCRIPT","Postakodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECFRMCAPTN","Postakodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECDLGCAPTN","Postakodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECGRDCAPTN","Postakodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECRPTCAPTN","Postakodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFEMTOOLTIP","Postakodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFEMSTATUSTXT","Postakodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.postakodu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.adresturuaciklama field.
DBSetProp('UYAPALACAKLIVIEW.adresturuaciklama', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.adresturuaciklama', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.adresturuaciklama', 'Field', 'UpdateName', 'AdresTuruAciklama')
DBSetProp('UYAPALACAKLIVIEW.adresturuaciklama', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.adresturuaciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECDESCRIPT","Adresturuaciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECFRMCAPTN","Adresturuaciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECDLGCAPTN","Adresturuaciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECGRDCAPTN","Adresturuaciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECRPTCAPTN","Adresturuaciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFEMTOOLTIP","Adresturuaciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFEMSTATUSTXT","Adresturuaciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturuaciklama","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ceptelefon field.
DBSetProp('UYAPALACAKLIVIEW.ceptelefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ceptelefon', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ceptelefon', 'Field', 'UpdateName', 'cepTelefon')
DBSetProp('UYAPALACAKLIVIEW.ceptelefon', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ceptelefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECDESCRIPT","Ceptelefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECFRMCAPTN","Ceptelefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECDLGCAPTN","Ceptelefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECGRDCAPTN","Ceptelefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECRPTCAPTN","Ceptelefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFEMTOOLTIP","Ceptelefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFEMSTATUSTXT","Ceptelefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ceptelefon","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.il field.
DBSetProp('UYAPALACAKLIVIEW.il', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.il', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.il', 'Field', 'UpdateName', 'dbo.Adres.Il_Adi')
DBSetProp('UYAPALACAKLIVIEW.il', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.il
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECDESCRIPT","Il Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECFRMCAPTN","Il") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECDLGCAPTN","Il") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECGRDCAPTN","Il") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECRPTCAPTN","Il") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFEMTOOLTIP","Il") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFEMSTATUSTXT","Il") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.il","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.fax field.
DBSetProp('UYAPALACAKLIVIEW.fax', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.fax', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.fax', 'Field', 'UpdateName', 'Fax')
DBSetProp('UYAPALACAKLIVIEW.fax', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.fax
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECDESCRIPT","Fax Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECFRMCAPTN","Fax") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECDLGCAPTN","Fax") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECGRDCAPTN","Fax") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECRPTCAPTN","Fax") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFEMTOOLTIP","Fax") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFEMSTATUSTXT","Fax") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.fax","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.adres_id field.
DBSetProp('UYAPALACAKLIVIEW.adres_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.adres_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.adres_id', 'Field', 'UpdateName', 'Adres_Id')
DBSetProp('UYAPALACAKLIVIEW.adres_id', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.adres_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECDESCRIPT","Adres Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECFRMCAPTN","Adres Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECDLGCAPTN","Adres Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECGRDCAPTN","Adres Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECRPTCAPTN","Adres Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFEMTOOLTIP","Adres Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFEMSTATUSTXT","Adres Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres_id","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ilkodu field.
DBSetProp('UYAPALACAKLIVIEW.ilkodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilkodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilkodu', 'Field', 'UpdateName', 'IlKOdu')
DBSetProp('UYAPALACAKLIVIEW.ilkodu', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ilkodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECDESCRIPT","Ilkodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECFRMCAPTN","Ilkodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECDLGCAPTN","Ilkodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECGRDCAPTN","Ilkodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECRPTCAPTN","Ilkodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFEMTOOLTIP","Ilkodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFEMSTATUSTXT","Ilkodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilkodu","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ilce field.
DBSetProp('UYAPALACAKLIVIEW.ilce', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilce', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilce', 'Field', 'UpdateName', 'dbo.Adres.Ilce_Adi')
DBSetProp('UYAPALACAKLIVIEW.ilce', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ilce
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECDESCRIPT","Ilce Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECFRMCAPTN","Ilce") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECDLGCAPTN","Ilce") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECGRDCAPTN","Ilce") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECRPTCAPTN","Ilce") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFEMTOOLTIP","Ilce") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFEMSTATUSTXT","Ilce") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilce","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.adres field.
DBSetProp('UYAPALACAKLIVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.adres', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.adres', 'Field', 'UpdateName', 'dbo.Adres.Adres')
DBSetProp('UYAPALACAKLIVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adres","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.telefon field.
DBSetProp('UYAPALACAKLIVIEW.telefon', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.telefon', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.telefon', 'Field', 'UpdateName', 'dbo.Muvekkil.Iletisim_Telefonu')
DBSetProp('UYAPALACAKLIVIEW.telefon', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.telefon
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECDESCRIPT","Telefon Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECFRMCAPTN","Telefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECDLGCAPTN","Telefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECGRDCAPTN","Telefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECRPTCAPTN","Telefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFEMTOOLTIP","Telefon") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFEMSTATUSTXT","Telefon") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.telefon","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.ilcekodu field.
DBSetProp('UYAPALACAKLIVIEW.ilcekodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilcekodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.ilcekodu', 'Field', 'UpdateName', 'Ilcekodu')
DBSetProp('UYAPALACAKLIVIEW.ilcekodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.ilcekodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECDESCRIPT","Ilcekodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECFRMCAPTN","Ilcekodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECDLGCAPTN","Ilcekodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECGRDCAPTN","Ilcekodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECRPTCAPTN","Ilcekodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFEMTOOLTIP","Ilcekodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFEMSTATUSTXT","Ilcekodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.ilcekodu","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.adresturu field.
DBSetProp('UYAPALACAKLIVIEW.adresturu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.adresturu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.adresturu', 'Field', 'UpdateName', 'AdresTuru')
DBSetProp('UYAPALACAKLIVIEW.adresturu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.adresturu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECDESCRIPT","Adresturu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECFRMCAPTN","Adresturu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECDLGCAPTN","Adresturu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECGRDCAPTN","Adresturu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECRPTCAPTN","Adresturu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFEMTOOLTIP","Adresturu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFEMSTATUSTXT","Adresturu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.adresturu","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the UYAPALACAKLIVIEW.rol field.
DBSetProp('UYAPALACAKLIVIEW.rol', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.rol', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.rol', 'Field', 'UpdateName', 'Rol')
DBSetProp('UYAPALACAKLIVIEW.rol', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.rol
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECDESCRIPT","Rol Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECFRMCAPTN","Rol") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECDLGCAPTN","Rol") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECGRDCAPTN","Rol") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECRPTCAPTN","Rol") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFEMTOOLTIP","Rol") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFEMSTATUSTXT","Rol") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKLIVIEW.rol_id field.
DBSetProp('UYAPALACAKLIVIEW.rol_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKLIVIEW.rol_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKLIVIEW.rol_id', 'Field', 'UpdateName', 'Rol_Id')
DBSetProp('UYAPALACAKLIVIEW.rol_id', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for UYAPALACAKLIVIEW.rol_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECDESCRIPT","Rol Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECFRMCAPTN","Rol Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECDLGCAPTN","Rol Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECGRDCAPTN","Rol Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECRPTCAPTN","Rol Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFEMTOOLTIP","Rol Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFEMSTATUSTXT","Rol Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW.rol_id","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
