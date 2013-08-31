***************** Begin View Definition IZLEMEANALIZIVIEW ***************


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



CREATE SQL VIEW "IZLEMEANALIZIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Id,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Sube_Id,;
		Sube.Sube_Adi,;
		Icradosya.DosyaTipi_Id,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Id,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.Gelis_Tarihi,;
		Icradosya.Risk_Yoneticisi_Id,;
		Personel.Personel_Adi AS risk_yoneticisi_adi,;
		Izleme.Borclu_Id,;
		Izleme.Borclu_Adi,;
		Izleme.Izleme_Tarihi,;
		Izleme.Izleme_Sonucu,;
		Izleme.Odeme_Sozu_Tarihi,;
		Izleme.Odeme_Sozu_Miktari,;
		CAST('  /  /    ' AS DATE) AS odeme_tarihi,;
		CAST(0 AS NUMERIC) AS odeme_miktari,;
		Izleme.Aciklama,;
		Izleme.Personel_Id,;
		Izleme.Personel_Adi,;
		Icradosyahesabi.Kalan_Alacak,;
		Icradosyahesabi.Toplam_Alacak,;
		CAST(0 AS Integer) AS Dosya_Yasi,;
		CAST(0 AS integer) AS Tahsilat_Orani;
	FROM ;
  {oj{oj{oj{oj  dbo.IcraDosya Icradosya ;
    LEFT OUTER JOIN dbo.Izleme Izleme ;
   ON  Icradosya.IcraDosya_Id = Izleme.Izleme_Fk} ;
    INNER JOIN dbo.Borclu Borclu ;
   ON  Izleme.Borclu_Id = Borclu.Borclu_Id ;
    INNER JOIN dbo.Rehber Rehber ;
   ON  Borclu.Rehber_Id = Rehber.Rehber_Id ;
    LEFT OUTER JOIN dbo.IcraDosyaHesabi Icradosyahesabi ;
   ON  Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk} ;
    LEFT OUTER JOIN dbo.Sube Sube ;
   ON  Icradosya.Sube_Id = Sube.Sube_Id} ;
    LEFT OUTER JOIN dbo.Personel Personel ;
   ON  Icradosya.Risk_Yoneticisi_Id = Personel.Personel_Id}
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'UpdateType', 1)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'WhereType', 3)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'Prepared', .F.)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'FetchSize', -1)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'ParameterList', "vp_Muvekkil_Adi,'C';vp_Sube_Id,'C';vp_Dosya_Tipi,'C';vp_Takip_Tipi,'C';vp_Borc_Tipi,'C';vp_Dosya_Statusu,'C';vp_Gelis_Tarihi1,'D';vp_Gelis_Tarihi2,'D';vp_RiskY_Id,'V';vp_Izleme_Sonucu,'C';vp_OS_Tarihi1,'D';"+;
"vp_OS_Tarihi2,'D';vp_Analiz_Tipi,'V';vp_IcaMudurlugu_Id,'C';vp_Toplam_Alacak1,'Y';vp_Toplam_Alacak2,'Y';vp_Dosya_Yasi1,'I';vp_Dosya_Yasi2,'I';vp_Tahsilat_Orani1,'I';vp_Tahsilat_Orani2,'I'")
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'Comment', "")
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('IZLEMEANALIZIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for IZLEMEANALIZIVIEW
	GoExplorer.odbcx.Validate("IZLEMEANALIZIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW","VIEW",;
		"VFECDESCRIPT","Izlemeanaliziview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLUTAG","muvekkil_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Sube_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Sube Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMLUFIELDS","sube_adi, muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Sube_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Sube_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi, borc_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Takip_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Statusu
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Statusu View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyastatulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECLUTAG","dosya_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMLUFIELDS","dosya_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyastatulookupview.dosya_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Statusu") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Statusu","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gelis_Tarihi1
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECDESCRIPT","Vp Gelis Tarihi1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gelis_Tarihi2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECDESCRIPT","Vp Gelis Tarihi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMDEFAULT","Date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Gelis_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Gelis_Tarihi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_RiskY_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Risky Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!riskyoneticisilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECLUTAG","risk_yoneticisi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMLUFIELDS","risk_yoneticisi_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Riskyoneticisilookupview.risk_yoneticisi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Risk_Yoneticisi_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_RiskY_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Izleme_Sonucu
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECDESCRIPT","Vp Izleme Sonucu View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECFRMCAPTN","Ýzleme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECDLGCAPTN","Ýzleme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMTOOLTIP","Ýzleme Sonucu                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMSTATUSTXT","Ýzleme Sonucu                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECLUTABLE","hbysdata!izlemesonuculookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECLUTAG","izleme_sonucu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMLUFIELDS","izleme_sonucu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMLUUPDTEXP","Izlemesonuculookupview.izleme_sonucu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMCOMPARETO","Izleme.Izleme_Sonucu") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Izleme_Sonucu","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_OS_Tarihi1
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECDESCRIPT","Vp Os Tarihi1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECFRMCAPTN","Ödeme Sözü Trh.") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECDLGCAPTN","Ödeme Sözü Trh.") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMTOOLTIP","Ödeme Sözü Trh.                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMSTATUSTXT","Ödeme Sözü Trh.                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMCOMPARETO","Izleme.Odeme_Sozu_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_OS_Tarihi2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECDESCRIPT","Vp Os Tarihi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECFRMCAPTN","Ödeme Sözü Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECDLGCAPTN","Ödeme Sözü Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMTOOLTIP","Ödeme Sözü Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMSTATUSTXT","Ödeme Sözü Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMCOMPARETO","Izleme.Odeme_Sozu_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_OS_Tarihi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Analiz_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Analiz Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Analiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Analiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Analiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Analiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMINLIST","'Ýzleme Yapýlmýþ Dosyalar','Hiç Ýzleme Yapýlmamýþ Dosyalar'") &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFEMDEFAULT","'Ýzleme Yapýlmýþ Dosyalar'") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Analiz_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_IcaMudurlugu_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icamudurlugu Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECLUTAG","icramudurlugu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.IcraMudurlugu_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_IcaMudurlugu_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Toplam_Alacak1
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECDESCRIPT","Vp Toplam Alacak1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECFRMCAPTN","Toplam Alacak1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECDLGCAPTN","Toplam Alacak1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECVPTYPE","Y") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFEMTOOLTIP","Toplam Alacak1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFEMSTATUSTXT","Toplam Alacak1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Toplam_Alacak2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECDESCRIPT","Vp Toplam Alacak2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECFRMCAPTN","Toplam Alacak2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECDLGCAPTN","Toplam Alacak2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECVPTYPE","Y") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFEMTOOLTIP","Toplam Alacak2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFEMSTATUSTXT","Toplam Alacak2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Toplam_Alacak2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Yasi1
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Yasi1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECFRMCAPTN","Dosya Yasi1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECDLGCAPTN","Dosya Yasi1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFENVPDECIMAL",2) &&Decimals
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFEMTOOLTIP","Dosya Yasi1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Yasi1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Yasi2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Yasi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECFRMCAPTN","Dosya Yasi2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECDLGCAPTN","Dosya Yasi2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFEMTOOLTIP","Dosya Yasi2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Yasi2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Dosya_Yasi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Orani1
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Orani1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Orani1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Orani1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Orani1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Orani1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Orani2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Orani2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Orani2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Orani2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Orani2") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Orani2") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.vp_Tahsilat_Orani2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.burono
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","burono","BURO_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.burono","INDEX",;
		"VFECDESCRIPT","Burono Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.burono","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.burono","INDEX",;
		"VFECTAGCAPTN","Burono") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.burono","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.icrano
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","icrano","ICRA_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icrano","INDEX",;
		"VFECDESCRIPT","Icrano Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icrano","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icrano","INDEX",;
		"VFECTAGCAPTN","Icrano") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icrano","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
ENDIF 

***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.muvekkladi
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","muvekkladi","MUVEKKIL_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.muvekkladi","INDEX",;
		"VFECDESCRIPT","Muvekkladi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.muvekkladi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.muvekkladi","INDEX",;
		"VFECTAGCAPTN","Muvekkladi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.muvekkladi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.subeadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","subeadi","SUBE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.subeadi","INDEX",;
		"VFECDESCRIPT","Subeadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.subeadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.subeadi","INDEX",;
		"VFECTAGCAPTN","Subeadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.subeadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.dosyatipi
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","dosyatipi","DOSYA_TIPI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyatipi","INDEX",;
		"VFECDESCRIPT","Dosyatipi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyatipi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyatipi","INDEX",;
		"VFECTAGCAPTN","Dosyatipi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyatipi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.icramdr
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","icramdr","ICRAMUDURLUGU_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icramdr","INDEX",;
		"VFECDESCRIPT","Icramdr Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icramdr","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icramdr","INDEX",;
		"VFECTAGCAPTN","Icramdr") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.icramdr","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.dosyastat
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","dosyastat","DOSYA_STATUSU","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyastat","INDEX",;
		"VFECDESCRIPT","Dosyastat Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyastat","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyastat","INDEX",;
		"VFECTAGCAPTN","Dosyastat") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.dosyastat","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.gelstarh
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","gelstarh","GELIS_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.gelstarh","INDEX",;
		"VFECDESCRIPT","Gelstarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.gelstarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.gelstarh","INDEX",;
		"VFECTAGCAPTN","Gelstarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.gelstarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.riskyonet
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","riskyonet","RISK_YONETICISI_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.riskyonet","INDEX",;
		"VFECDESCRIPT","Riskyonet Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.riskyonet","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.riskyonet","INDEX",;
		"VFECTAGCAPTN","Riskyonet") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.riskyonet","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.borcluadi
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","borcluadi","BORCLU_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.borcluadi","INDEX",;
		"VFECDESCRIPT","Borcluadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.borcluadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.borcluadi","INDEX",;
		"VFECTAGCAPTN","Borcluadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.borcluadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.izlmtarh
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","izlmtarh","IZLEME_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmtarh","INDEX",;
		"VFECDESCRIPT","Izlmtarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmtarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmtarh","INDEX",;
		"VFECTAGCAPTN","Izlmtarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmtarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.izlmsonc
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","izlmsonc","IZLEME_SONUCU","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmsonc","INDEX",;
		"VFECDESCRIPT","Izlmsonc Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmsonc","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmsonc","INDEX",;
		"VFECTAGCAPTN","Izlmsonc") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.izlmsonc","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysreport!izlemeanaliziview.odmsoztrh
	GoExplorer.odbcx.AddViewIndex("hbysreport!izlemeanaliziview","odmsoztrh","ODEME_SOZU_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.odmsoztrh","INDEX",;
		"VFECDESCRIPT","Odmsoztrh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.odmsoztrh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.odmsoztrh","INDEX",;
		"VFECTAGCAPTN","Odmsoztrh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysreport!izlemeanaliziview.odmsoztrh","INDEX",;
		"VFENDISPORDER",1) &&Display Order


*!* Field Level Properties for IZLEMEANALIZIVIEW
*** Props for the IZLEMEANALIZIVIEW.icradosya_id field.
DBSetProp('IZLEMEANALIZIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('IZLEMEANALIZIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('IZLEMEANALIZIVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","ÝcraDosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","ÝcraDosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","ÝcraDosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","ÝcraDosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","ÝcraDosya ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","ÝcraDosya ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.buro_dosya_no field.
DBSetProp('IZLEMEANALIZIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('IZLEMEANALIZIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFECQFINDTAG","burono") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.icra_dosya_no field.
DBSetProp('IZLEMEANALIZIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('IZLEMEANALIZIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFECQFINDTAG","icrano") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.muvekkil_id field.
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.muvekkil_adi field.
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('IZLEMEANALIZIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFECQFINDTAG","muvekkladi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.sube_id field.
DBSetProp('IZLEMEANALIZIVIEW.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('IZLEMEANALIZIVIEW.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube ID                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube ID                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.sube_adi field.
DBSetProp('IZLEMEANALIZIVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.sube_adi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('IZLEMEANALIZIVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFECQFINDTAG","subeadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.dosyatipi_id field.
DBSetProp('IZLEMEANALIZIVIEW.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.DosyaTipi_Id')
DBSetProp('IZLEMEANALIZIVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosyatipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosyatipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosyatipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosyatipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosyatipi ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosyatipi ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.dosya_tipi field.
DBSetProp('IZLEMEANALIZIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('IZLEMEANALIZIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFECQFINDTAG","dosyatipi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.takip_tipi field.
DBSetProp('IZLEMEANALIZIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('IZLEMEANALIZIVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.borc_tipi field.
DBSetProp('IZLEMEANALIZIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('IZLEMEANALIZIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.icramudurlugu_id field.
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Id')
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü ID                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü ID                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.icramudurlugu_adi field.
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('IZLEMEANALIZIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFECQFINDTAG","icramdr") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.dosya_statusu field.
DBSetProp('IZLEMEANALIZIVIEW.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('IZLEMEANALIZIVIEW.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFECQFINDTAG","dosyastat") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_statusu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.gelis_tarihi field.
DBSetProp('IZLEMEANALIZIVIEW.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('IZLEMEANALIZIVIEW.gelis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFECQFINDTAG","gelstarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.gelis_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.risk_yoneticisi_id field.
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'Updatable', .T.)
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Id')
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.risk_yoneticisi_adi field.
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('IZLEMEANALIZIVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECQFINDTAG","riskyonet") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.borclu_id field.
DBSetProp('IZLEMEANALIZIVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.borclu_id', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Izleme.Borclu_Id')
DBSetProp('IZLEMEANALIZIVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.borclu_adi field.
DBSetProp('IZLEMEANALIZIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Izleme.Borclu_Adi')
DBSetProp('IZLEMEANALIZIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFECQFINDTAG","borcluadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.izleme_tarihi field.
DBSetProp('IZLEMEANALIZIVIEW.izleme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.izleme_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.izleme_tarihi', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Tarihi')
DBSetProp('IZLEMEANALIZIVIEW.izleme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.izleme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECDESCRIPT","Izleme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýzleme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýzleme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýzleme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýzleme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýzleme Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýzleme Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFECQFINDTAG","izlmtarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_tarihi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the IZLEMEANALIZIVIEW.izleme_sonucu field.
DBSetProp('IZLEMEANALIZIVIEW.izleme_sonucu', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.izleme_sonucu', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.izleme_sonucu', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Sonucu')
DBSetProp('IZLEMEANALIZIVIEW.izleme_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.izleme_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECDESCRIPT","Izleme Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECFRMCAPTN","Ýzleme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECDLGCAPTN","Ýzleme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECGRDCAPTN","Ýzleme Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECRPTCAPTN","Ýzleme Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFEMTOOLTIP","Ýzleme Sonucu                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFEMSTATUSTXT","Ýzleme Sonucu                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFECQFINDTAG","izlmsonc") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.izleme_sonucu","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.odeme_sozu_tarihi field.
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_tarihi', 'Field', 'UpdateName', 'dbo.Izleme.Odeme_Sozu_Tarihi')
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.odeme_sozu_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECDESCRIPT","Odeme Sozu Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECFRMCAPTN","Ödeme Sözü Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECDLGCAPTN","Ödeme Sözü Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECGRDCAPTN","Ödeme Sözü Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECRPTCAPTN","Ödeme Sözü Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMTOOLTIP","Ödeme Sözü Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ödeme Sözü Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECQFINDTAG","odmsoztrh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.odeme_sozu_miktari field.
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_miktari', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_miktari', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_miktari', 'Field', 'UpdateName', 'dbo.Izleme.Odeme_Sozu_Miktari')
DBSetProp('IZLEMEANALIZIVIEW.odeme_sozu_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.odeme_sozu_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECDESCRIPT","Odeme Sozu Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECFRMCAPTN","Ödeme Sözü Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECDLGCAPTN","Ödeme Sözü Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECGRDCAPTN","Ödeme Sözü Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECRPTCAPTN","Ödeme Sözü Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMTOOLTIP","Ödeme Sözü Miktarý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMSTATUSTXT","Ödeme Sözü Miktarý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_sozu_miktari","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.odeme_tarihi field.
DBSetProp('IZLEMEANALIZIVIEW.odeme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_tarihi', 'Field', 'UpdateName', 'Odeme_Tarihi')
DBSetProp('IZLEMEANALIZIVIEW.odeme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.odeme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECDESCRIPT","Odeme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECFRMCAPTN","Odeme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECDLGCAPTN","Odeme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECGRDCAPTN","Odeme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECRPTCAPTN","Odeme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFEMTOOLTIP","Odeme Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Odeme Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_tarihi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.odeme_miktari field.
DBSetProp('IZLEMEANALIZIVIEW.odeme_miktari', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_miktari', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.odeme_miktari', 'Field', 'UpdateName', 'Odeme_Miktari')
DBSetProp('IZLEMEANALIZIVIEW.odeme_miktari', 'Field', 'DataType', "N(20)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.odeme_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECDESCRIPT","Odeme Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECFRMCAPTN","Odeme Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECDLGCAPTN","Odeme Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECGRDCAPTN","Odeme Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECRPTCAPTN","Odeme Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFEMTOOLTIP","Odeme Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFEMSTATUSTXT","Odeme Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.odeme_miktari","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.aciklama field.
DBSetProp('IZLEMEANALIZIVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.aciklama', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Izleme.Aciklama')
DBSetProp('IZLEMEANALIZIVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.aciklama","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.personel_id field.
DBSetProp('IZLEMEANALIZIVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.personel_id', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Izleme.Personel_Id')
DBSetProp('IZLEMEANALIZIVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_id","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.personel_adi field.
DBSetProp('IZLEMEANALIZIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Izleme.Personel_Adi')
DBSetProp('IZLEMEANALIZIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.kalan_alacak field.
DBSetProp('IZLEMEANALIZIVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.kalan_alacak', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.kalan_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Kalan_Alacak')
DBSetProp('IZLEMEANALIZIVIEW.kalan_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.toplam_alacak field.
DBSetProp('IZLEMEANALIZIVIEW.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.toplam_alacak', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.toplam_alacak', 'Field', 'UpdateName', 'Toplam_Alacak')
DBSetProp('IZLEMEANALIZIVIEW.toplam_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.toplam_alacak","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.dosya_yasi field.
DBSetProp('IZLEMEANALIZIVIEW.dosya_yasi', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_yasi', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.dosya_yasi', 'Field', 'UpdateName', 'Dosya_Yasi')
DBSetProp('IZLEMEANALIZIVIEW.dosya_yasi', 'Field', 'DataType', "I")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.dosya_yasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECDESCRIPT","Dosya Yasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECFRMCAPTN","Dosya Yaþý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECDLGCAPTN","Dosya Yaþý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECGRDCAPTN","Dosya Yaþý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECRPTCAPTN","Dosya Yaþý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFEMTOOLTIP","Dosya Yaþý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFEMSTATUSTXT","Dosya Yaþý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.dosya_yasi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the IZLEMEANALIZIVIEW.tahsilat_orani field.
DBSetProp('IZLEMEANALIZIVIEW.tahsilat_orani', 'Field', 'KeyField', .F.)
DBSetProp('IZLEMEANALIZIVIEW.tahsilat_orani', 'Field', 'Updatable', .F.)
DBSetProp('IZLEMEANALIZIVIEW.tahsilat_orani', 'Field', 'UpdateName', 'Tahsilat_Orani')
DBSetProp('IZLEMEANALIZIVIEW.tahsilat_orani', 'Field', 'DataType', "B(2)")
*** DBCX Field Properties for IZLEMEANALIZIVIEW.tahsilat_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECDESCRIPT","Tahsilat Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECFRMCAPTN","Tahsilat Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECDLGCAPTN","Tahsilat Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECGRDCAPTN","Tahsilat Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECRPTCAPTN","Tahsilat Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFEMTOOLTIP","Tahsilat Oraný                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Oraný                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!IZLEMEANALIZIVIEW.tahsilat_orani","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
