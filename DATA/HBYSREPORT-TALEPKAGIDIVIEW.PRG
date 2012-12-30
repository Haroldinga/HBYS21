***************** Begin View Definition TALEPKAGIDIVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "TALEPKAGIDIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Takip_Yolu,;
		Icramudurlugu.IMNo,;
		Icradosya.Ihtarname_Tarihi,;
		Icradosyahesabi.Alacakli_Bilgisi,;
		Icradosyahesabi.Borclu_Bilgisi,;
		Icradosyahesabi.Vekil_Bilgisi,;
		Borclu.Borclu_Adi,;
		Borclu.TcKimlik_No,;
		Rehber.Iletisim_Telefonu,;
		Rehber.Iletisim_Adresi,;
		CAST('' AS VARCHAR(1000)) AS adresler,;
		CAST('' AS VARCHAR(1000)) AS telefonlar,;
		CAST('' AS VARCHAR(1000)) AS icradosyalari;
	FROM {oj dbo.IcraDosya Icradosya;
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
		INNER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk;
		INNER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id;
		LEFT OUTER JOIN dbo.IcraMudurlugu Icramudurlugu;
			ON Icradosya.IcraMudurlugu_Id = Icramudurlugu.IcraMudurlugu_Id};
	ORDER BY Icradosya.Buro_Dosya_No, Borclu.Borclu_Adi

DBSetProp('TALEPKAGIDIVIEW', 'View', 'UpdateType', 1)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'WhereType', 3)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'Tables', 'dbo.IcraDosya,dbo.IcraDosyaHesabi,dbo.Borclu,dbo.Rehber')
DBSetProp('TALEPKAGIDIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'V';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C'")
DBSetProp('TALEPKAGIDIVIEW', 'View', 'Comment', "")
DBSetProp('TALEPKAGIDIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TALEPKAGIDIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for TALEPKAGIDIVIEW
	GoExplorer.odbcx.Validate("TALEPKAGIDIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW","VIEW",;
		"VFECDESCRIPT","TalepKagidiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys19\libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys19\libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","Rtrim(IcraDosya.Icra_Dosya_NO) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TALEPKAGIDIVIEW
*** Props for the TALEPKAGIDIVIEW.icradosya_id field.
DBSetProp('TALEPKAGIDIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('TALEPKAGIDIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('TALEPKAGIDIVIEW.icradosya_id', 'Field', 'DataType', "M")
DBSetProp('TALEPKAGIDIVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.buro_dosya_no field.
DBSetProp('TALEPKAGIDIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('TALEPKAGIDIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for TALEPKAGIDIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.icra_dosya_no field.
DBSetProp('TALEPKAGIDIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TALEPKAGIDIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.muvekkil_adi field.
DBSetProp('TALEPKAGIDIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('TALEPKAGIDIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.dosya_tipi field.
DBSetProp('TALEPKAGIDIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('TALEPKAGIDIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.borc_tipi field.
DBSetProp('TALEPKAGIDIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('TALEPKAGIDIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.takip_tipi field.
DBSetProp('TALEPKAGIDIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('TALEPKAGIDIVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.borc_evragi field.
DBSetProp('TALEPKAGIDIVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.borc_evragi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('TALEPKAGIDIVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borç Evraðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borç Evraðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borç Evraðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borç Evraðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borç Evraðý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borç Evraðý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.icramudurlugu_adi field.
DBSetProp('TALEPKAGIDIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('TALEPKAGIDIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.adliye_adi field.
DBSetProp('TALEPKAGIDIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('TALEPKAGIDIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.takip_yolu field.
DBSetProp('TALEPKAGIDIVIEW.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('TALEPKAGIDIVIEW.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.takip_yolu","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.imno field.
DBSetProp('TALEPKAGIDIVIEW.imno', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.imno', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.imno', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IMNo')
DBSetProp('TALEPKAGIDIVIEW.imno', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.imno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECDESCRIPT","Imno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECFRMCAPTN","Imno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECDLGCAPTN","Imno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECGRDCAPTN","Imno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECRPTCAPTN","Imno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFEMTOOLTIP","Imno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFEMSTATUSTXT","Imno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.imno","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.ihtarname_tarihi field.
DBSetProp('TALEPKAGIDIVIEW.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.ihtarname_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('TALEPKAGIDIVIEW.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TALEPKAGIDIVIEW.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýhtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýhtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýhtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýhtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýhtarname Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýhtarname Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.alacakli_bilgisi field.
DBSetProp('TALEPKAGIDIVIEW.alacakli_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.alacakli_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.alacakli_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Alacakli_Bilgisi')
DBSetProp('TALEPKAGIDIVIEW.alacakli_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.alacakli_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDESCRIPT","Alacakli Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECFRMCAPTN","Alacaklý Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECDLGCAPTN","Alacaklý Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECGRDCAPTN","Alacaklý Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECRPTCAPTN","Alacaklý Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMTOOLTIP","Alacaklý Bilgisi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Alacaklý Bilgisi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.alacakli_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.borclu_bilgisi field.
DBSetProp('TALEPKAGIDIVIEW.borclu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.borclu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.borclu_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Borclu_Bilgisi')
DBSetProp('TALEPKAGIDIVIEW.borclu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.borclu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECDESCRIPT","Borclu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Borçlu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Borçlu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Borçlu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Borçlu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Borçlu Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.vekil_bilgisi field.
DBSetProp('TALEPKAGIDIVIEW.vekil_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.vekil_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.vekil_bilgisi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Vekil_Bilgisi')
DBSetProp('TALEPKAGIDIVIEW.vekil_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.vekil_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECDESCRIPT","Vekil Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECFRMCAPTN","Vekil Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECDLGCAPTN","Vekil Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECGRDCAPTN","Vekil Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECRPTCAPTN","Vekil Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFEMTOOLTIP","Vekil Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Vekil Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.vekil_bilgisi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the TALEPKAGIDIVIEW.borclu_adi field.
DBSetProp('TALEPKAGIDIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('TALEPKAGIDIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.tckimlik_no field.
DBSetProp('TALEPKAGIDIVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('TALEPKAGIDIVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.iletisim_telefonu field.
DBSetProp('TALEPKAGIDIVIEW.iletisim_telefonu', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.iletisim_telefonu', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.iletisim_telefonu', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Telefonu')
DBSetProp('TALEPKAGIDIVIEW.iletisim_telefonu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.iletisim_telefonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECDESCRIPT","Iletisim Telefonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECFRMCAPTN","Iletisim Telefonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECDLGCAPTN","Iletisim Telefonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECGRDCAPTN","Iletisim Telefonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECRPTCAPTN","Iletisim Telefonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFEMTOOLTIP","Iletisim Telefonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFEMSTATUSTXT","Iletisim Telefonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_telefonu","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.iletisim_adresi field.
DBSetProp('TALEPKAGIDIVIEW.iletisim_adresi', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.iletisim_adresi', 'Field', 'Updatable', .T.)
DBSetProp('TALEPKAGIDIVIEW.iletisim_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('TALEPKAGIDIVIEW.iletisim_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for TALEPKAGIDIVIEW.iletisim_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECDESCRIPT","Iletisim Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECFRMCAPTN","Iletisim Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECDLGCAPTN","Iletisim Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECGRDCAPTN","Iletisim Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECRPTCAPTN","Iletisim Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFEMTOOLTIP","Iletisim Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFEMSTATUSTXT","Iletisim Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.iletisim_adresi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.adresler field.
DBSetProp('TALEPKAGIDIVIEW.adresler', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.adresler', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.adresler', 'Field', 'UpdateName', 'Adresler')
DBSetProp('TALEPKAGIDIVIEW.adresler', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.adresler
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECDESCRIPT","Adresler Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECFRMCAPTN","Adresler") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECDLGCAPTN","Adresler") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECGRDCAPTN","Adresler") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECRPTCAPTN","Adresler") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFEMTOOLTIP","Adresler") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFEMSTATUSTXT","Adresler") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.adresler","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.telefonlar field.
DBSetProp('TALEPKAGIDIVIEW.telefonlar', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.telefonlar', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.telefonlar', 'Field', 'UpdateName', 'Telefonlar')
DBSetProp('TALEPKAGIDIVIEW.telefonlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.telefonlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECDESCRIPT","Telefonlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECFRMCAPTN","Telefonlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECDLGCAPTN","Telefonlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECGRDCAPTN","Telefonlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECRPTCAPTN","Telefonlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFEMTOOLTIP","Telefonlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFEMSTATUSTXT","Telefonlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.telefonlar","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the TALEPKAGIDIVIEW.icradosyalari field.
DBSetProp('TALEPKAGIDIVIEW.icradosyalari', 'Field', 'KeyField', .F.)
DBSetProp('TALEPKAGIDIVIEW.icradosyalari', 'Field', 'Updatable', .F.)
DBSetProp('TALEPKAGIDIVIEW.icradosyalari', 'Field', 'UpdateName', 'IcraDosyalari')
DBSetProp('TALEPKAGIDIVIEW.icradosyalari', 'Field', 'DataType', "M")
*** DBCX Field Properties for TALEPKAGIDIVIEW.icradosyalari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECDESCRIPT","Icradosyalari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECFRMCAPTN","Icradosyalari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECDLGCAPTN","Icradosyalari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECGRDCAPTN","Icradosyalari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECRPTCAPTN","Icradosyalari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFEMTOOLTIP","Icradosyalari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFEMSTATUSTXT","Icradosyalari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TALEPKAGIDIVIEW.icradosyalari","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
