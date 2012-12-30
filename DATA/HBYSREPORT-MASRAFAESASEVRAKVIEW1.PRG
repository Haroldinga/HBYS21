***************** Begin View Definition MASRAFAESASEVRAKVIEW ***************


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



CREATE SQL VIEW "MASRAFAESASEVRAKVIEW" ; 
 REMOTE CONNECT "HBYSReportConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Id,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Muvekkil.Vergi_Dairesi,;
		Muvekkil.Vergi_No,;
		Muvekkil.Iletisim_Adresi,;
		Belge.Belge_Adi,;
		Belge.Belge_Formati,;
		Belge.Masrafa_Esas_Evrak,;
		Belge.Belge_Konumu,;
		Belge.Aciklama AS masrafaesasbelge;
	FROM {oj dbo.IcraDosya Icradosya;
		LEFT OUTER JOIN dbo.Muvekkil Muvekkil;
			ON Icradosya.Muvekkil_Id = Muvekkil.Muvekkil_Id};
		INNER JOIN dbo.Belge Belge;
			ON Icradosya.IcraDosya_Id = Belge.Belge_Fk;
	WHERE Belge.Masrafa_Esas_Evrak = ( 1 )

DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'UpdateType', 1)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'WhereType', 3)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'Prepared', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'FetchSize', -1)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'ParameterList', "vp_Buro_Dosya_No,'V';vp_Icra_Dosya_No,'V';vp_Muvekkil_Adi,'C';vp_Dosya_Tipi,'C';vp_Borc_Tipi,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C'")
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'Comment', "")
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MASRAFAESASEVRAKVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MASRAFAESASEVRAKVIEW
	GoExplorer.odbcx.Validate("MASRAFAESASEVRAKVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW","VIEW",;
		"VFECDESCRIPT","MasrafaEsasEvrakView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Dosya_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Borc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü Adý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü Adý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Icramudurlugu_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCOMPARETO","Icradosya.Adliye_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MASRAFAESASEVRAKVIEW
*** Props for the MASRAFAESASEVRAKVIEW.icradosya_id field.
DBSetProp('MASRAFAESASEVRAKVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('MASRAFAESASEVRAKVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('MASRAFAESASEVRAKVIEW.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.buro_dosya_no field.
DBSetProp('MASRAFAESASEVRAKVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('MASRAFAESASEVRAKVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Buro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Buro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Buro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Buro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Buro Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Buro Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.icra_dosya_no field.
DBSetProp('MASRAFAESASEVRAKVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MASRAFAESASEVRAKVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Icra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Icra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Icra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Icra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Icra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Icra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.muvekkil_id field.
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.muvekkil_adi field.
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('MASRAFAESASEVRAKVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.icramudurlugu_adi field.
DBSetProp('MASRAFAESASEVRAKVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('MASRAFAESASEVRAKVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.adliye_adi field.
DBSetProp('MASRAFAESASEVRAKVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('MASRAFAESASEVRAKVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.dosya_tipi field.
DBSetProp('MASRAFAESASEVRAKVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('MASRAFAESASEVRAKVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.borc_tipi field.
DBSetProp('MASRAFAESASEVRAKVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFAESASEVRAKVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('MASRAFAESASEVRAKVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.vergi_dairesi field.
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_dairesi', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_Dairesi')
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.vergi_no field.
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_no', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_No')
DBSetProp('MASRAFAESASEVRAKVIEW.vergi_no', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.iletisim_adresi field.
DBSetProp('MASRAFAESASEVRAKVIEW.iletisim_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.iletisim_adresi', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.iletisim_adresi', 'Field', 'UpdateName', 'dbo.Muvekkil.Iletisim_Adresi')
DBSetProp('MASRAFAESASEVRAKVIEW.iletisim_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.iletisim_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECDESCRIPT","Iletisim Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECFRMCAPTN","Ýletiþim Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECDLGCAPTN","Ýletiþim Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECGRDCAPTN","Ýletiþim Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECRPTCAPTN","Ýletiþim Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFEMTOOLTIP","Ýletiþim Adresi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFEMSTATUSTXT","Ýletiþim Adresi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.iletisim_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.belge_adi field.
DBSetProp('MASRAFAESASEVRAKVIEW.belge_adi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_adi', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_adi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Adi')
DBSetProp('MASRAFAESASEVRAKVIEW.belge_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.belge_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECDESCRIPT","Belge Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECFRMCAPTN","Belge Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECDLGCAPTN","Belge Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECGRDCAPTN","Belge Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECRPTCAPTN","Belge Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFEMTOOLTIP","Belge Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFEMSTATUSTXT","Belge Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.belge_formati field.
DBSetProp('MASRAFAESASEVRAKVIEW.belge_formati', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_formati', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_formati', 'Field', 'UpdateName', 'dbo.Belge.Belge_Formati')
DBSetProp('MASRAFAESASEVRAKVIEW.belge_formati', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.belge_formati
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECDESCRIPT","Belge Formati Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECFRMCAPTN","Belge Formati") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECDLGCAPTN","Belge Formati") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECGRDCAPTN","Belge Formati") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECRPTCAPTN","Belge Formati") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFEMTOOLTIP","Belge Formati") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFEMSTATUSTXT","Belge Formati") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_formati","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.masrafa_esas_evrak field.
DBSetProp('MASRAFAESASEVRAKVIEW.masrafa_esas_evrak', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.masrafa_esas_evrak', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.masrafa_esas_evrak', 'Field', 'UpdateName', 'dbo.Belge.Masrafa_Esas_Evrak')
DBSetProp('MASRAFAESASEVRAKVIEW.masrafa_esas_evrak', 'Field', 'DataType', "L")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.masrafa_esas_evrak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECDESCRIPT","Masrafa Esas Evrak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECFRMCAPTN","Masrafa Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECDLGCAPTN","Masrafa Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECGRDCAPTN","Masrafa Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECRPTCAPTN","Masrafa Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMTOOLTIP","Masrafa Esas Evrak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMSTATUSTXT","Masrafa Esas Evrak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafa_esas_evrak","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MASRAFAESASEVRAKVIEW.belge_konumu field.
DBSetProp('MASRAFAESASEVRAKVIEW.belge_konumu', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_konumu', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.belge_konumu', 'Field', 'UpdateName', 'dbo.Belge.Belge_Konumu')
DBSetProp('MASRAFAESASEVRAKVIEW.belge_konumu', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.belge_konumu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECDESCRIPT","Belge Konumu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECFRMCAPTN","Belge Konumu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECDLGCAPTN","Belge Konumu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECGRDCAPTN","Belge Konumu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECRPTCAPTN","Belge Konumu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFEMTOOLTIP","Belge Konumu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFEMSTATUSTXT","Belge Konumu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.belge_konumu","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MASRAFAESASEVRAKVIEW.masrafaesasbelge field.
DBSetProp('MASRAFAESASEVRAKVIEW.masrafaesasbelge', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.masrafaesasbelge', 'Field', 'Updatable', .F.)
DBSetProp('MASRAFAESASEVRAKVIEW.masrafaesasbelge', 'Field', 'UpdateName', 'dbo.Belge.Aciklama')
DBSetProp('MASRAFAESASEVRAKVIEW.masrafaesasbelge', 'Field', 'DataType', "G")
*** DBCX Field Properties for MASRAFAESASEVRAKVIEW.masrafaesasbelge
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECDESCRIPT","Masrafaesasbelge Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECFRMCAPTN","Masrafaesasbelge") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECDLGCAPTN","Masrafaesasbelge") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECGRDCAPTN","Masrafaesasbelge") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECRPTCAPTN","Masrafaesasbelge") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFEMTOOLTIP","Masrafaesasbelge") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFEMSTATUSTXT","Masrafaesasbelge") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFECOBJTYPE","ioleboundcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!MASRAFAESASEVRAKVIEW.masrafaesasbelge","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
