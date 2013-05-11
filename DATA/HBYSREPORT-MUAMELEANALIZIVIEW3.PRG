***************** Begin View Definition MUAMELEANALIZIVIEW ***************


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



CREATE SQL VIEW "MUAMELEANALIZIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Sube_Id,;
		Sube.Sube_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.Gelis_Tarihi,;
		Icradosya.Bila_Tarihi,;
		Icradosya.Kesinlesme_Tarihi,;
		Icradosya.Itiraz_Edildi,;
		Icradosya.Risk_Yoneticisi_Id,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosyahesabi.Kalan_Alacak,;
		Borclu.Borclu_Id,;
		Borclu.TcKimlik_No,;
		Borclu.Ticaret_Sicil_No,;
		Borclu.Borclu_Adi,;
		Borclu.Rehber_Id,;
		Borclu.Urun_No,;
		CAST(0 As bit) as Vefat_Etti,;
		Adres.Adres_Tipi,;
		Adres.Adres,;
		Adres.Il_Adi,;
		Adres.Ilce_Adi,;
		Adres.Adres_Statusu,;
		CAST(0 AS INTEGER) AS nadres_statusu,;
		CAST(' ' AS CHARACTER(25)) AS adlibolge_adi,;
		Muamele.Muamele_Id,;
		Muamele.Muzekkere_Adi,;
		Muamele.Muamele_Tarihi AS son_muamele_tarihi,;
		Gonderi.Gonderi_Tarihi,;
		Gonderi.Sonuc_Bilgisi,;
  CAST('' as Character(250)) as Gayrimenkul_Bilgisi,;
  CAST('' as Character(250)) as Araç_Bilgisi,;
  CAST('' as Character(250)) as Sgk_Bilgisi,;
		CAST('' as Character(15)) as Haciz_Tipi,;
		CAST('' as Date) as Haciz_Tarihi,;
		CAST(0 AS BIT) AS sec;
	FROM {oj{oj{oj dbo.IcraDosya Icradosya;
		LEFT OUTER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk};
		INNER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk;
		LEFT OUTER JOIN dbo.Muamele Muamele;
			ON Icradosya.IcraDosya_Id = Muamele.Muamele_Fk};
		LEFT OUTER JOIN dbo.Gonderi;
			ON Muamele.Muamele_Id=Gonderi.Muamele_Id;
		INNER JOIN dbo.Adres Adres;
			ON Adres.Adres_Fk = Borclu.Rehber_Id;
		LEFT OUTER JOIN dbo.Sube Sube;
			ON Icradosya.Sube_Id = Sube.Sube_Id}

DBSetProp('MUAMELEANALIZIVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'WhereType', 3)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'ParameterList', "vp_Muvekkil_Adi,'C';vp_Sube_Id,'C';vp_Dosya_Tipi,'C';vp_Takip_Tipi,'C';vp_Borc_Tipi,'C';vp_Basl_Gelis_Tarihi,'D';vp_Bits_Gelis_Tarihi,'D';vp_Risk_Yoneticisi_Id,'C';vp_Analiz_Tipi,'V';vp_Icra_Dosya_No,'V';"+;
"vp_Buro_Dosya_No,'V';vp_AdliBolge_Adi,'C';vp_Muamele_Adi,'C'")
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'Comment', "")
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUAMELEANALIZIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MUAMELEANALIZIVIEW
	GoExplorer.odbcx.Validate("MUAMELEANALIZIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW","VIEW",;
		"VFECDESCRIPT","MuameleAnaliziView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTAG","muvekkil_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Sube_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Sube Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMLUFIELDS","sube_adi, muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Sube_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi, borc_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Takip_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Basl_Gelis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Basl Gelis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Basl_Gelis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Bits_Gelis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Bits Gelis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMDEFAULT","Date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Bits_Gelis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Risk_Yoneticisi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Risk Yoneticisi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!riskyoneticisilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLUTAG","risk_yoneticisi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMLUFIELDS","risk_yoneticisi_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Riskyoneticisilookupview.risk_yoneticisi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Risk_Yoneticisi_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Analiz_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Analiz Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Analiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Analiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Analiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Analiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!analiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECLUTAG","analiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMLUFIELDS","analiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Analiztipilookupview.analiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Buro_dosya_no) IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_AdliBolge_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adlibolge Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adli Bölge") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adli Bölge") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adli Bölge                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adli Bölge                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!adliyelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECLUTAG","adliye_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMLUFIELDS","adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Adliyelookupview.adliye_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_AdliBolge_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECFRMCAPTN","Muamele Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECDLGCAPTN","Muamele Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMTOOLTIP","Muamele Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!muzekkeretipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Muzekkeretipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vp_Muamele_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.burono
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","burono","BURO_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.burono","INDEX",;
		"VFECDESCRIPT","Burono Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.burono","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.burono","INDEX",;
		"VFECTAGCAPTN","Burono") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.burono","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.icrano
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","icrano","ICRA_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icrano","INDEX",;
		"VFECDESCRIPT","Icrano Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icrano","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icrano","INDEX",;
		"VFECTAGCAPTN","Icrano") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icrano","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.muvekkladi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","muvekkladi","MUVEKKIL_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muvekkladi","INDEX",;
		"VFECDESCRIPT","Muvekkladi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muvekkladi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muvekkladi","INDEX",;
		"VFECTAGCAPTN","Muvekkladi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muvekkladi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.subeadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","subeadi","SUBE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.subeadi","INDEX",;
		"VFECDESCRIPT","Subeadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.subeadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.subeadi","INDEX",;
		"VFECTAGCAPTN","Subeadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.subeadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.dosyatipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","dosyatipi","DOSYA_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyatipi","INDEX",;
		"VFECDESCRIPT","Dosyatipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyatipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyatipi","INDEX",;
		"VFECTAGCAPTN","Dosyatipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyatipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.icramdr
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","icramdr","ICRAMUDURLUGU_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icramdr","INDEX",;
		"VFECDESCRIPT","Icramdr Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icramdr","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icramdr","INDEX",;
		"VFECTAGCAPTN","Icramdr") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.icramdr","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.dosyastat
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","dosyastat","DOSYA_STATUSU","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyastat","INDEX",;
		"VFECDESCRIPT","Dosyastat Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyastat","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyastat","INDEX",;
		"VFECTAGCAPTN","Dosyastat") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.dosyastat","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.gelstarh
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","gelstarh","GELIS_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.gelstarh","INDEX",;
		"VFECDESCRIPT","Gelstarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.gelstarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.gelstarh","INDEX",;
		"VFECTAGCAPTN","Gelstarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.gelstarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.riskyonet
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","riskyonet","RISK_YONETICISI_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.riskyonet","INDEX",;
		"VFECDESCRIPT","Riskyonet Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.riskyonet","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.riskyonet","INDEX",;
		"VFECTAGCAPTN","Riskyonet") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.riskyonet","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.takiptipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","takiptipi","TAKIP_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.takiptipi","INDEX",;
		"VFECDESCRIPT","Takiptipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.takiptipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.takiptipi","INDEX",;
		"VFECTAGCAPTN","Takiptipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.takiptipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.borctipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","borctipi","BORC_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borctipi","INDEX",;
		"VFECDESCRIPT","Borctipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borctipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borctipi","INDEX",;
		"VFECTAGCAPTN","Borctipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borctipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.adliyeadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","adliyeadi","ADLIYE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adliyeadi","INDEX",;
		"VFECDESCRIPT","Adliyeadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adliyeadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adliyeadi","INDEX",;
		"VFECTAGCAPTN","Adliyeadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adliyeadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.kalanalack
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","kalanalack","INT(KALAN_ALACAK)","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kalanalack","INDEX",;
		"VFECDESCRIPT","Kalanalack Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kalanalack","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kalanalack","INDEX",;
		"VFECTAGCAPTN","Kalanalack") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kalanalack","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.borcluadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","borcluadi","BORCLU_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borcluadi","INDEX",;
		"VFECDESCRIPT","Borcluadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borcluadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borcluadi","INDEX",;
		"VFECTAGCAPTN","Borcluadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.borcluadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.adlibolge
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","adlibolge","ADLIBOLGE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adlibolge","INDEX",;
		"VFECDESCRIPT","Adlibolge Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adlibolge","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adlibolge","INDEX",;
		"VFECTAGCAPTN","Adlibolge") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.adlibolge","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.iladi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","iladi","IL_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.iladi","INDEX",;
		"VFECDESCRIPT","Iladi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.iladi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.iladi","INDEX",;
		"VFECTAGCAPTN","Iladi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.iladi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.ilceadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","ilceadi","ILCE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.ilceadi","INDEX",;
		"VFECDESCRIPT","Ilceadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.ilceadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.ilceadi","INDEX",;
		"VFECTAGCAPTN","Ilceadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.ilceadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.sonmuamtar
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","sonmuamtar","SON_MUAMELE_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.sonmuamtar","INDEX",;
		"VFECDESCRIPT","Sonmuamtar Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.sonmuamtar","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.sonmuamtar","INDEX",;
		"VFECTAGCAPTN","Sonmuamtar") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.sonmuamtar","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.muamleadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","muamleadi","MUZEKKERE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muamleadi","INDEX",;
		"VFECDESCRIPT","Muamleadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muamleadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muamleadi","INDEX",;
		"VFECTAGCAPTN","Muamleadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.muamleadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!muameleanaliziview.kesintarih
	GoExplorer.odbcx.AddViewIndex("hbysreport!muameleanaliziview","kesintarih","KESINLESME_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kesintarih","INDEX",;
		"VFECDESCRIPT","Kesintarih Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kesintarih","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kesintarih","INDEX",;
		"VFECTAGCAPTN","Kesintarih") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!muameleanaliziview.kesintarih","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for MUAMELEANALIZIVIEW
*** Props for the MUAMELEANALIZIVIEW.icradosya_id field.
DBSetProp('MUAMELEANALIZIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('MUAMELEANALIZIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('MUAMELEANALIZIVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","ÝcraDosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","ÝcraDosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","ÝcraDosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","ÝcraDosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","ÝcraDosya ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","ÝcraDosya ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.buro_dosya_no field.
DBSetProp('MUAMELEANALIZIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('MUAMELEANALIZIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECQFINDTAG","burono") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.icra_dosya_no field.
DBSetProp('MUAMELEANALIZIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MUAMELEANALIZIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECQFINDTAG","icrano") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MUAMELEANALIZIVIEW.muvekkil_adi field.
DBSetProp('MUAMELEANALIZIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('MUAMELEANALIZIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECQFINDTAG","muvekkladi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.sube_id field.
DBSetProp('MUAMELEANALIZIVIEW.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('MUAMELEANALIZIVIEW.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube ID                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube ID                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.sube_adi field.
DBSetProp('MUAMELEANALIZIVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sube_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('MUAMELEANALIZIVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFECQFINDTAG","subeadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.dosya_tipi field.
DBSetProp('MUAMELEANALIZIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('MUAMELEANALIZIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECQFINDTAG","dosyatipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.takip_tipi field.
DBSetProp('MUAMELEANALIZIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('MUAMELEANALIZIVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECQFINDTAG","takiptipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.borc_tipi field.
DBSetProp('MUAMELEANALIZIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('MUAMELEANALIZIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECQFINDTAG","borctipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.icramudurlugu_adi field.
DBSetProp('MUAMELEANALIZIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('MUAMELEANALIZIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECQFINDTAG","icramdr") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.adliye_adi field.
DBSetProp('MUAMELEANALIZIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('MUAMELEANALIZIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFECQFINDTAG","adliyeadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.dosya_statusu field.
DBSetProp('MUAMELEANALIZIVIEW.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('MUAMELEANALIZIVIEW.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECQFINDTAG","dosyastat") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.gelis_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.gelis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECQFINDTAG","gelstarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.bila_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.bila_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.bila_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.bila_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Bila_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.bila_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.bila_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECDESCRIPT","Bila Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECFRMCAPTN","Bila Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECDLGCAPTN","Bila Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECGRDCAPTN","Bila Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECRPTCAPTN","Bila Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFEMTOOLTIP","Bila Tarihi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFEMSTATUSTXT","Bila Tarihi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.bila_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.kesinlesme_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.kesinlesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Kesinlesme_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.kesinlesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinleþme Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinleþme Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFECQFINDTAG","kesintarih") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.itiraz_edildi field.
DBSetProp('MUAMELEANALIZIVIEW.itiraz_edildi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.itiraz_edildi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.itiraz_edildi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Edildi')
DBSetProp('MUAMELEANALIZIVIEW.itiraz_edildi', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.itiraz_edildi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECDESCRIPT","Itiraz Edildi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Edildi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Edildi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Edildi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Edildi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Edildi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Edildi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.itiraz_edildi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.risk_yoneticisi_id field.
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Id')
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.risk_yoneticisi_adi field.
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('MUAMELEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECQFINDTAG","riskyonet") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.kalan_alacak field.
DBSetProp('MUAMELEANALIZIVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.kalan_alacak', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('MUAMELEANALIZIVIEW.kalan_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECQFINDTAG","kalanalack") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",27) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMINPUTMASK","9,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.borclu_id field.
DBSetProp('MUAMELEANALIZIVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.borclu_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Id')
DBSetProp('MUAMELEANALIZIVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borclu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borclu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borclu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borclu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borclu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borclu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.tckimlik_no field.
DBSetProp('MUAMELEANALIZIVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('MUAMELEANALIZIVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TC Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TC Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TC Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TC Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TC Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TC Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.ticaret_sicil_no field.
DBSetProp('MUAMELEANALIZIVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.ticaret_sicil_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('MUAMELEANALIZIVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.borclu_adi field.
DBSetProp('MUAMELEANALIZIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('MUAMELEANALIZIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECQFINDTAG","borcluadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.rehber_id field.
DBSetProp('MUAMELEANALIZIVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.rehber_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Borclu.Rehber_Id')
DBSetProp('MUAMELEANALIZIVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.urun_no field.
DBSetProp('MUAMELEANALIZIVIEW.urun_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.urun_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.urun_no', 'Field', 'UpdateName', 'dbo.Borclu.Urun_No')
DBSetProp('MUAMELEANALIZIVIEW.urun_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.urun_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECDESCRIPT","Urun No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECFRMCAPTN","Ürün No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECDLGCAPTN","Ürün No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECGRDCAPTN","Ürün No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECRPTCAPTN","Ürün No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFEMTOOLTIP","Ürün No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFEMSTATUSTXT","Ürün No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.urun_no","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the MUAMELEANALIZIVIEW.vefat_etti field.
DBSetProp('MUAMELEANALIZIVIEW.vefat_etti', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.vefat_etti', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.vefat_etti', 'Field', 'UpdateName', 'Vefat_Etti')
DBSetProp('MUAMELEANALIZIVIEW.vefat_etti', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.vefat_etti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECDESCRIPT","Vefat Etti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECFRMCAPTN","Vefat Etti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECDLGCAPTN","Vefat Etti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECGRDCAPTN","Vefat Etti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECRPTCAPTN","Vefat Etti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFEMTOOLTIP","Vefat Etti                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFEMSTATUSTXT","Vefat Etti                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.vefat_etti","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.adres_tipi field.
DBSetProp('MUAMELEANALIZIVIEW.adres_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres_tipi', 'Field', 'UpdateName', 'dbo.Adres.Adres_Tipi')
DBSetProp('MUAMELEANALIZIVIEW.adres_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.adres_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECDESCRIPT","Adres Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECFRMCAPTN","Adres Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECDLGCAPTN","Adres Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECGRDCAPTN","Adres Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECRPTCAPTN","Adres Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFEMTOOLTIP","Adres Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFEMSTATUSTXT","Adres Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_tipi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.adres field.
DBSetProp('MUAMELEANALIZIVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres', 'Field', 'UpdateName', 'dbo.Adres.Adres')
DBSetProp('MUAMELEANALIZIVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.il_adi field.
DBSetProp('MUAMELEANALIZIVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.il_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Adres.Il_Adi')
DBSetProp('MUAMELEANALIZIVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFECQFINDTAG","iladi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.il_adi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.ilce_adi field.
DBSetProp('MUAMELEANALIZIVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.ilce_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Adres.Ilce_Adi')
DBSetProp('MUAMELEANALIZIVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFECQFINDTAG","ilceadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.adres_statusu field.
DBSetProp('MUAMELEANALIZIVIEW.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres_statusu', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adres_statusu', 'Field', 'UpdateName', 'dbo.Adres.Adres_Statusu')
DBSetProp('MUAMELEANALIZIVIEW.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adres_statusu","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.nadres_statusu field.
DBSetProp('MUAMELEANALIZIVIEW.nadres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.nadres_statusu', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.nadres_statusu', 'Field', 'UpdateName', 'nAdres_Statusu')
DBSetProp('MUAMELEANALIZIVIEW.nadres_statusu', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.nadres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECDESCRIPT","Nadres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECFRMCAPTN","Nadres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECDLGCAPTN","Nadres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECGRDCAPTN","Nadres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECRPTCAPTN","Nadres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFEMTOOLTIP","Nadres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFEMSTATUSTXT","Nadres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.nadres_statusu","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.adlibolge_adi field.
DBSetProp('MUAMELEANALIZIVIEW.adlibolge_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adlibolge_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.adlibolge_adi', 'Field', 'UpdateName', 'dbo.AdliBolge.Adliye_Adi')
DBSetProp('MUAMELEANALIZIVIEW.adlibolge_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.adlibolge_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECDESCRIPT","Adlibolge Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECFRMCAPTN","Adli Bölge") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECDLGCAPTN","Adli Bölge") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECGRDCAPTN","Adli Bölge") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECRPTCAPTN","Adli Bölge") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFEMTOOLTIP","Adli Bölge                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFEMSTATUSTXT","Adli Bölge                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFECQFINDTAG","adlibolge") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.adlibolge_adi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.muamele_id field.
DBSetProp('MUAMELEANALIZIVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.muamele_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.muamele_id', 'Field', 'UpdateName', 'Muamele_Id')
DBSetProp('MUAMELEANALIZIVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.muzekkere_adi field.
DBSetProp('MUAMELEANALIZIVIEW.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.muzekkere_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('MUAMELEANALIZIVIEW.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Muamele Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Muamele Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Muamele Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Muamele Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Muamele Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Muamele Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFECQFINDTAG","muamleadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.muzekkere_adi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.son_muamele_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.son_muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.son_muamele_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.son_muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.son_muamele_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.son_muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Son Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Son Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Son Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Son Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Son Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Son Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Son Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFECQFINDTAG","sonmuamtar") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.son_muamele_tarihi","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.gonderi_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.gonderi_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.gonderi_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.gonderi_tarihi', 'Field', 'UpdateName', 'Gonderi_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.gonderi_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.gonderi_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECDESCRIPT","Gonderi Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.gonderi_tarihi","FIELD",;
		"VFENDISPORDER",37) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.sonuc_bilgisi field.
DBSetProp('MUAMELEANALIZIVIEW.sonuc_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sonuc_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sonuc_bilgisi', 'Field', 'UpdateName', 'Sonuc_Bilgisi')
DBSetProp('MUAMELEANALIZIVIEW.sonuc_bilgisi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.sonuc_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDESCRIPT","Sonuc Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECFRMCAPTN","Sonuç Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDLGCAPTN","Sonuç Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECGRDCAPTN","Sonuç Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECRPTCAPTN","Sonuç Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMTOOLTIP","Sonuç Bilgisi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Sonuç Bilgisi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.haciz_tipi field.
DBSetProp('MUAMELEANALIZIVIEW.haciz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.haciz_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.haciz_tipi', 'Field', 'UpdateName', 'Haciz_Tipi')
DBSetProp('MUAMELEANALIZIVIEW.haciz_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.haciz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECDESCRIPT","Haciz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECFRMCAPTN","Aciz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECDLGCAPTN","Aciz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECGRDCAPTN","Aciz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECRPTCAPTN","Aciz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFEMTOOLTIP","Aciz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFEMSTATUSTXT","Aciz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tipi","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.haciz_tarihi field.
DBSetProp('MUAMELEANALIZIVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.haciz_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.haciz_tarihi', 'Field', 'UpdateName', 'Haciz_Tarihi')
DBSetProp('MUAMELEANALIZIVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Aciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Aciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Aciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Aciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Aciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Aciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",39) &&Display Order
ENDIF
 
*** Props for the MUAMELEANALIZIVIEW.sec field.
DBSetProp('MUAMELEANALIZIVIEW.sec', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sec', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEANALIZIVIEW.sec', 'Field', 'UpdateName', 'Sec')
DBSetProp('MUAMELEANALIZIVIEW.sec', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELEANALIZIVIEW.sec
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECDESCRIPT","Sec Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECFRMCAPTN","Seç") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECDLGCAPTN","Seç") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECGRDCAPTN","Seç") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECRPTCAPTN","Seç") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFEMTOOLTIP","Seç                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFEMSTATUSTXT","Seç                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MUAMELEANALIZIVIEW.sec","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
