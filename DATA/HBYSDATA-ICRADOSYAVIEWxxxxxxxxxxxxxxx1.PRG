***************** Begin View Definition ICRADOSYAVIEW ***************


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



CREATE SQL VIEW "ICRADOSYAVIEWxxxxxxxxxxxxxxx" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Muvekkil_Id,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Sube_Id,;
		Icradosya.DosyaTipi_Id,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Takip_Yolu,;
		Icradosya.TakipSekli_Id,;
		Icradosya.Borc_Tipi,;
		Icradosya.Borc_Evragi,;
		Icradosya.Talep_Edilen_Hak,;
		Icradosya.BK84Madde_Uygulansin,;
		Icradosya.BSMV_Uygulansin,;
		Icradosya.KKDF_Uygulansin,;
		Icradosya.IcraMudurlugu_Id,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.Vade_Tarihi,;
		Icradosya.Ihtarname_Tarihi,;
		Icradosya.Gelis_Tarihi,;
		Icradosya.Takip_Tarihi,;
		Icradosya.Teblig_Tarihi,;
		Icradosya.Kesinlesme_Tarihi,;
		Icradosya.Hitam_Tarihi,;
		Icradosya.Icra_Kapanis_Tarihi,;
		Icradosya.Banka_Kapanis_Tarihi,;
		Icradosya.Gidis_Tarihi,;
		Icradosya.Vekalet_Ucreti_Tipi,;
		Icradosya.Risk_Yoneticisi_Id,;
		Icradosya.Risk_Yoneticisi_Adi,;
		Icradosya.Itiraz_Edildi,;
		Icradosya.Itiraz_Tarihi,;
		Icradosya.Itiraz_Sebebi;
	FROM dbo.IcraDosya Icradosya

DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'WhereType', 1)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'SendUpdates', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'CompareMemo', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'FetchSize', -1)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'ParameterList', "vp_Icra_Dosya_No,'V';vp_Buro_Dosya_No,'V';vp_Muvekkil_Id,'C';vp_Sube_Id,'C';vp_DosyaTipi_Id,'C';vp_Takip_Tipi,'C';vp_Takip_Yolu,'C';")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'Comment', "")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAVIEW
	GoExplorer.odbcx.Validate("ICRADOSYAVIEWxxxxxxxxxxxxxxx","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx","VIEW",;
		"VFECDESCRIPT","IcraDosyaView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","Space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Büro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Büro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Büro Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Büro Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","Space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","muvekkilidviewparamsupporttransfervaluefromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Sube_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Sube Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMLUFIELDS","sube_adi, muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECCLASS","subeidviewparamtransfervaluefromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys20\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_DosyaTipi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Dosyatipi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECLUTAG","dosyatipi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosyatipi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECCLASS","dosyatipiidviewparamsupporttransfervaluefromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Yolu
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Yolu View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECLUTABLE","hbysdata!takipyolulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECLUTAG","takip_yolu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMLUFIELDS","takip_yolu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMLUUPDTEXP","Takipyolulookupview.takip_yolu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Yolu","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECCLASS","icramudurluguidviewparamtransfervaluefromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Risk_Yoneticisi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Risk Yoneticisi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECFRMCAPTN","Risk Yoneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECDLGCAPTN","Risk Yoneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMTOOLTIP","Risk Yoneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Risk Yoneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECCLASS","riskyoneticisiidviewparamtransferfromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_TcKimlik_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECDESCRIPT","Vp Tckimlik No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TcKimlik_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Ticaret_Sicil_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDESCRIPT","Vp Ticaret Sicil No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gelis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Gelis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Gelis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Evragi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Evragi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFENVPSIZE",75) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Borc_Evragi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Talep_Edilen_Hak
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECDESCRIPT","Vp Talep Edilen Hak View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Talep_Edilen_Hak","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Risk_Yoneticisi_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Risk Yoneticisi Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECFRMCAPTN","Risk Yoneticisi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECDLGCAPTN","Risk Yoneticisi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFEMTOOLTIP","Risk Yoneticisi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Risk Yoneticisi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Risk_Yoneticisi_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_TakipSekli_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Takipsekli Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECFRMCAPTN","Takip Þekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECDLGCAPTN","Takip Þekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECVPTYPE","I") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFEMTOOLTIP","Takip Þekli                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFEMSTATUSTXT","Takip Þekli                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_TakipSekli_Id","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Sube_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Sube Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECFRMCAPTN","Sube Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECDLGCAPTN","Sube Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFEMTOOLTIP","Sube Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Sube Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Sube_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Sekli
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Sekli View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECFRMCAPTN","Takip Þekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECDLGCAPTN","Takip Þekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFENVPSIZE",100) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMTOOLTIP","Takip Þekli                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMSTATUSTXT","Takip Þekli                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECLUTABLE","hbysdata!takipseklilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECLUTAG","takip_sekli") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMLUFIELDS","takip_sekli") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMLUUPDTEXP","Takipseklilookupview.takip_sekli") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECCLASS","takipsekliidviewparamtransfervaluefromlookup") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Takip_Sekli","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
	*** DBCX View Parameter Properties for vp_Ihtarname_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Ihtarname Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Ihtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Ihtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Ihtarname Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Ihtarname Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vp_Ihtarname_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
ENDIF

*!* Field Level Properties for ICRADOSYAVIEW
*** Props for the ICRADOSYAVIEW.icradosya_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id', 'Field', 'DataType', "C(36)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Dosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Dosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Dosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Dosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Dosya ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Dosya ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.icra_dosya_no field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRADOSYAVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_dosya_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.buro_dosya_no field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for ICRADOSYAVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFELREADONLY",.T.) &&Read Only
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.buro_dosya_no","FIELD",;
		"VFEMFORMAT","ZK") &&Format
ENDIF
 
*** Props for the ICRADOSYAVIEW.muvekkil_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.muvekkil_adi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ICRADOSYAVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.sube_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id', 'Field', 'Caption', "Þube ID")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMLUFIELDS","sube_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.sube_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.dosyatipi_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.DosyaTipi_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECLUTAG","dosyatipi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosyatipi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECCLASS","afieldnovalidateduringsave") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosyatipi_id","FIELD",;
		"VFEMLUUPDFLDS","takip_tipi, borc_tipi, borc_evragi, dosya_tipi, takip_yolu, talep_edilen_hak, bk84madde_uygulansin, bsmv_uygulansin, kkdf_uygulansin, takipsekli_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the ICRADOSYAVIEW.dosya_tipi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.takip_tipi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi', 'Field', 'DataType', "C(15)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi', 'Field', 'DefaultValue', "'Ýlamsýz Takip'")
*** DBCX Field Properties for ICRADOSYAVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.takip_yolu field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Yolu')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu', 'Field', 'DefaultValue', "'Haciz'")
*** DBCX Field Properties for ICRADOSYAVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECLUTABLE","hbysdata!takipyolulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECLUTAG","takip_yolu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMLUFIELDS","takip_yolu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMLUUPDTEXP","Takipyolulookupview.takip_yolu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_yolu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.takipsekli_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id', 'Field', 'UpdateName', 'dbo.IcraDosya.TakipSekli_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for ICRADOSYAVIEW.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takip Þekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takip Þekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takip Þekli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takip Þekli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takip Þekli                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takip Þekli                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECLUTABLE","hbysdata!takipseklilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECLUTAG","takipsekli_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMLUFIELDS","takip_sekli") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMLUUPDTEXP","Takipseklilookupview.takipsekli_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takipsekli_id","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.borc_tipi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi', 'Field', 'DefaultValue', "'Kredi Kartý'")
*** DBCX Field Properties for ICRADOSYAVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.borc_evragi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Evragi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for ICRADOSYAVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borca Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borca Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borca Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borca Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borca Esas Evrak                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borca Esas Evrak                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.borc_evragi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.talep_edilen_hak field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak', 'Field', 'UpdateName', 'dbo.IcraDosya.Talep_Edilen_Hak')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak', 'Field', 'DataType', "M")
*** DBCX Field Properties for ICRADOSYAVIEW.talep_edilen_hak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECDESCRIPT","Talep Edilen Hak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECGRDCAPTN","Talep Edilen Hak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECRPTCAPTN","Talep Edilen Hak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.talep_edilen_hak","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.bk84madde_uygulansin field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BK84Madde_Uygulansin')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW.bk84madde_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECDESCRIPT","Bk84madde Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECFRMCAPTN","BK 84. Madde Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECDLGCAPTN","BK 84. Madde Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECGRDCAPTN","BK 84. Madde Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECRPTCAPTN","BK 84. Madde Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFEMTOOLTIP","BK 84. Madde Uygulansýn                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFEMSTATUSTXT","BK 84. Madde Uygulansýn                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bk84madde_uygulansin","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.bsmv_uygulansin field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BSMV_Uygulansin')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW.bsmv_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECDESCRIPT","Bsmv Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECFRMCAPTN","BSMV Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECDLGCAPTN","BSMV Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECGRDCAPTN","BSMV Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECRPTCAPTN","BSMV Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFEMTOOLTIP","BSMV Uygulansýn                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFEMSTATUSTXT","BSMV Uygulansýn                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.bsmv_uygulansin","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.kkdf_uygulansin field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.KKDF_Uygulansin')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW.kkdf_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECDESCRIPT","Kkdf Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECFRMCAPTN","KKDF Uygulansýn") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECDLGCAPTN","KKDF Uygulansýn") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECGRDCAPTN","KKDF Uygulansýn") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECRPTCAPTN","KKDF Uygulansýn") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFEMTOOLTIP","KKDF Uygulansýn                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFEMSTATUSTXT","KKDF Uygulansýn                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kkdf_uygulansin","FIELD",;
		"VFENDISPORDER",36) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.icramudurlugu_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.icramudurlugu_adi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDFLDS","adliye_adi, icramudurlugu_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the ICRADOSYAVIEW.adliye_adi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Adliye_Adi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.adliye_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.dosya_statusu field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu', 'Field', 'DataType', "C(15)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu', 'Field', 'DefaultValue', "'Derdest'")
*** DBCX Field Properties for ICRADOSYAVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!dosyastatulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECLUTAG","dosya_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMLUFIELDS","dosya_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMLUUPDTEXP","Dosyastatulookupview.dosya_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.dosya_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the ICRADOSYAVIEW.vade_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vade_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.vade_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECDESCRIPT","Vade Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECFRMCAPTN","Vade Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECDLGCAPTN","Vade Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECGRDCAPTN","Vade Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECRPTCAPTN","Vade Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFEMTOOLTIP","Vade Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFEMSTATUSTXT","Vade Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vade_tarihi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.ihtarname_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Ihtarname_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýhtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýhtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýhtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýhtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýhtarname Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýhtarname Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.gelis_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi', 'Field', 'DataType', "D")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for ICRADOSYAVIEW.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Geliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Geliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Geliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Geliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Geliþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Geliþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gelis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.takip_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi', 'Field', 'DataType', "D")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for ICRADOSYAVIEW.takip_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECDESCRIPT","Takip Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECFRMCAPTN","Takip Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECDLGCAPTN","Takip Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECGRDCAPTN","Takip Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECRPTCAPTN","Takip Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFEMTOOLTIP","Takip Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFEMSTATUSTXT","Takip Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.takip_tarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.teblig_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Teblig_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.teblig_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECDESCRIPT","Teblig Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECFRMCAPTN","Teblið Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECDLGCAPTN","Teblið Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECGRDCAPTN","Teblið Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECRPTCAPTN","Teblið Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFEMTOOLTIP","Teblið Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFEMSTATUSTXT","Teblið Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.teblig_tarihi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.kesinlesme_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Kesinlesme_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinleþme Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinleþme Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.hitam_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Hitam_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.hitam_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECDESCRIPT","Hitam Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECFRMCAPTN","Hitam Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECDLGCAPTN","Hitam Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECGRDCAPTN","Hitam Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECRPTCAPTN","Hitam Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFEMTOOLTIP","Hitam Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFEMSTATUSTXT","Hitam Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.hitam_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.icra_kapanis_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Kapanis_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.icra_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Icra Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýcra Kapanýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýcra Kapanýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýcra Kapanýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýcra Kapanýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýcra Kapanýþ Tarihi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Kapanýþ Tarihi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.icra_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.banka_kapanis_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Banka_Kapanis_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.banka_kapanis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECDESCRIPT","Banka Kapanis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECFRMCAPTN","Banka Kapanýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECDLGCAPTN","Banka Kapanýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECGRDCAPTN","Banka Kapanýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECRPTCAPTN","Banka Kapanýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFEMTOOLTIP","Banka Kapanýþ Tarihi                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Banka Kapanýþ Tarihi                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.banka_kapanis_tarihi","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.gidis_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gidis_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.gidis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECDESCRIPT","Gidis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECFRMCAPTN","Gidiþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECDLGCAPTN","Gidiþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECGRDCAPTN","Gidiþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECRPTCAPTN","Gidiþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFEMTOOLTIP","Gidiþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gidiþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.gidis_tarihi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.vekalet_ucreti_tipi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Vekalet_Ucreti_Tipi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi', 'Field', 'DefaultValue', "'Dosya Tipi Vekalet Ücreti'")
*** DBCX Field Properties for ICRADOSYAVIEW.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFEMINLIST",'"Resmi Vekalet Ücreti","Dosya Tipi Vekalet Ücreti","Özel Vekalet Ücreti"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.risk_yoneticisi_id field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Id')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAVIEW.risk_yoneticisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECLUTABLE","hbysdata!riskyoneticisilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECLUTAG","risk_yoneticisi_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMLUFIELDS","risk_yoneticisi_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMLUUPDTEXP","Riskyoneticisilookupview.risk_yoneticisi_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFENDISPORDER",28) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMLUUPDFLDS","risk_yoneticisi_adi") &&After Lookup Update Field List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_id","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRADOSYAVIEW.risk_yoneticisi_adi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Risk_Yoneticisi_Adi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ICRADOSYAVIEW.risk_yoneticisi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECDESCRIPT","Risk Yoneticisi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECFRMCAPTN","Risk Yöneticisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECDLGCAPTN","Risk Yöneticisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECGRDCAPTN","Risk Yöneticisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECRPTCAPTN","Risk Yöneticisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFEMTOOLTIP","Risk Yöneticisi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFEMSTATUSTXT","Risk Yöneticisi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.risk_yoneticisi_adi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.itiraz_edildi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Edildi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi', 'Field', 'DataType', "L")
*** DBCX Field Properties for ICRADOSYAVIEW.itiraz_edildi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECDESCRIPT","Itiraz Edildi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Edildi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Edildi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Edildi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Edildi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Edildi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Edildi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_edildi","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.itiraz_tarihi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Tarihi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ICRADOSYAVIEW.itiraz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECDESCRIPT","Itiraz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_tarihi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAVIEW.itiraz_sebebi field.
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Sebebi')
DBSetProp('ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRADOSYAVIEW.itiraz_sebebi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECDESCRIPT","Itiraz Sebebi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Sebebi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Sebebi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Sebebi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Sebebi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Sebebi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Sebebi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAVIEWxxxxxxxxxxxxxxx.itiraz_sebebi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
