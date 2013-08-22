***************** Begin View Definition HacizMASRAFBELGESIVIEW ***************


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



CREATE SQL VIEW "HacizMASRAFBELGESIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosya.Takip_Yolu,;
		Sube.Sube_Adi,;
		Sube.Sube_Kodu,;
		CAST(' ' AS CHARACTER(100)) AS borclu_adi,;
		Masraf.Muamele_Id,;
		Masraf.Masraf_Tarihi,;
		Masraf.Masraf_Tipi,;
		Masraf.Aciklama,;
		Masraf.Masraf_Miktari,;
		Muamele.Muhatap_Adi,;
		Resim.Resim;
	FROM {oj{oj{oj{oj{oj{oj dbo.IcraDosya Icradosya;
		LEFT OUTER JOIN dbo.Masraf Masraf;
			ON Icradosya.IcraDosya_Id = Masraf.Masraf_fk};
		LEFT OUTER JOIN dbo.Muamele Muamele;
			ON Masraf.Muamele_Id = Muamele.Muamele_Id};
		LEFT OUTER JOIN dbo.Muvekkil Muvekkil;
			ON Icradosya.Muvekkil_Id = Muvekkil.Muvekkil_Id};
		LEFT OUTER JOIN dbo.Resim Resim;
			ON Muvekkil.Resim_Id = Resim.Resim_Id};
		LEFT OUTER JOIN dbo.Sube Sube;
			ON Icradosya.Sube_Id = Sube.Sube_Id};
		LEFT OUTER JOIN dbo.IcraMudurlugu Icramudurlugu;
			ON Icradosya.IcraMudurlugu_Id = Icramudurlugu.IcraMudurlugu_Id};
	WHERE Masraf.Uygulama_Asamasi LIKE ( 'Muamele' );
	ORDER BY Icradosya.Muvekkil_Adi, Icradosya.Sube_Id,;
		Icradosya.Buro_Dosya_No, Masraf.Masraf_Tarihi

DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'UpdateType', 1)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'WhereType', 3)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'Prepared', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'FetchSize', -1)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'V';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C';vp_Muamele_Id,'V'")
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'Comment', "")
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HacizMASRAFBELGESIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for HacizMASRAFBELGESIVIEW
	GoExplorer.odbcx.Validate("HacizMASRAFBELGESIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW","VIEW",;
		"VFECDESCRIPT","HacizMASRAFBELGESIVIEW Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","Rtrim(IcraDosya.Icra_Dosya_NO) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMDEFAULT","space(1000)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMWHEREEXPR","Masraf.Muamele_Id IN ?.vp_Muamele_Id") &&Complete SQL Where Expression
ENDIF

*!* Field Level Properties for HacizMASRAFBELGESIVIEW
*** Props for the HacizMASRAFBELGESIVIEW.icradosya_id field.
DBSetProp('HacizMASRAFBELGESIVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('HacizMASRAFBELGESIVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('HacizMASRAFBELGESIVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('HacizMASRAFBELGESIVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.buro_dosya_no field.
DBSetProp('HacizMASRAFBELGESIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('HacizMASRAFBELGESIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.icra_dosya_no field.
DBSetProp('HacizMASRAFBELGESIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('HacizMASRAFBELGESIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.muvekkil_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.dosya_tipi field.
DBSetProp('HacizMASRAFBELGESIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('HacizMASRAFBELGESIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.borc_tipi field.
DBSetProp('HacizMASRAFBELGESIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('HacizMASRAFBELGESIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.icramudurlugu_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.adliye_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yoneticisi Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yoneticisi Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.takip_yolu field.
DBSetProp('HacizMASRAFBELGESIVIEW.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('HacizMASRAFBELGESIVIEW.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('HacizMASRAFBELGESIVIEW.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.takip_yolu","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.sube_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.sube_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Sube Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Sube Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Sube Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Sube Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Sube Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Sube Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.sube_kodu field.
DBSetProp('HacizMASRAFBELGESIVIEW.sube_kodu', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.sube_kodu', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.sube_kodu', 'Field', 'UpdateName', 'dbo.Sube.Sube_Kodu')
DBSetProp('HacizMASRAFBELGESIVIEW.sube_kodu', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.sube_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECDESCRIPT","Sube Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECFRMCAPTN","Sube Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECDLGCAPTN","Sube Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECGRDCAPTN","Sube Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECRPTCAPTN","Sube Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFEMTOOLTIP","Sube Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFEMSTATUSTXT","Sube Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.sube_kodu","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.borclu_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.borclu_adi', 'Field', 'UpdateName', 'Borclu_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.borclu_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the HacizMASRAFBELGESIVIEW.muamele_id field.
DBSetProp('HacizMASRAFBELGESIVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muamele_id', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Masraf.Muamele_Id')
DBSetProp('HacizMASRAFBELGESIVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.masraf_tarihi field.
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tarihi', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Tarihi')
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.masraf_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECDESCRIPT","Masraf Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECFRMCAPTN","Masraf Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECDLGCAPTN","Masraf Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECGRDCAPTN","Masraf Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECRPTCAPTN","Masraf Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFEMTOOLTIP","Masraf Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tarihi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.masraf_tipi field.
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tipi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Tipi')
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.aciklama field.
DBSetProp('HacizMASRAFBELGESIVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.aciklama', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Masraf.Aciklama')
DBSetProp('HacizMASRAFBELGESIVIEW.aciklama', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.aciklama","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.masraf_miktari field.
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_miktari', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Miktari')
DBSetProp('HacizMASRAFBELGESIVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.muhatap_adi field.
DBSetProp('HacizMASRAFBELGESIVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muhatap_adi', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('HacizMASRAFBELGESIVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the HacizMASRAFBELGESIVIEW.resim field.
DBSetProp('HacizMASRAFBELGESIVIEW.resim', 'Field', 'KeyField', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.resim', 'Field', 'Updatable', .F.)
DBSetProp('HacizMASRAFBELGESIVIEW.resim', 'Field', 'UpdateName', 'dbo.Resim.Resim')
DBSetProp('HacizMASRAFBELGESIVIEW.resim', 'Field', 'DataType', "W")
*** DBCX Field Properties for HacizMASRAFBELGESIVIEW.resim
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECDESCRIPT","Resim Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECFRMCAPTN","Resim") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECDLGCAPTN","Resim") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECGRDCAPTN","Resim") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECRPTCAPTN","Resim") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFEMTOOLTIP","Resim") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFEMSTATUSTXT","Resim") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!HacizMASRAFBELGESIVIEW.resim","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
