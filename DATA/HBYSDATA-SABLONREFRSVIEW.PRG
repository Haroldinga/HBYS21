***************** Begin View Definition SABLONREFRSVIEW ***************


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



CREATE SQL VIEW "SABLONREFRSVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Sablonrefrs.SablonRefrs_Id,;
		Sablonrefrs.DosyaTipi_Id,;
		Sablonrefrs.Dosya_Tipi,;
		Sablonrefrs.Dokuman_Adi,;
		Sablonrefrs.Dokuman_Tipi,;
		Sablonrefrs.Talep_Ifadesi,;
		Sablonrefrs.ZarfTipi_Id,;
		Sablonrefrs.Dokuman_Sablonu,;
		Sablonrefrs.Dokuman_Baski_Adedi,;
		Sablonrefrs.Dokuman_Arsivle,;
		Sablonrefrs.Gonderi_Takibi,;
		Sablonrefrs.Gonderi_Tipi,;
		Sablonrefrs.Barkod_Bas,;
		Sablonrefrs.Barkod_Tipi;
	FROM dbo.SablonRefrs Sablonrefrs

DBSetProp('SABLONREFRSVIEW', 'View', 'UpdateType', 1)
DBSetProp('SABLONREFRSVIEW', 'View', 'WhereType', 1)
DBSetProp('SABLONREFRSVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('SABLONREFRSVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('SABLONREFRSVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('SABLONREFRSVIEW', 'View', 'MaxRecords', -1)
DBSetProp('SABLONREFRSVIEW', 'View', 'Tables', 'dbo.SablonRefrs')
DBSetProp('SABLONREFRSVIEW', 'View', 'Prepared', .F.)
DBSetProp('SABLONREFRSVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('SABLONREFRSVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SABLONREFRSVIEW', 'View', 'FetchSize', -1)
DBSetProp('SABLONREFRSVIEW', 'View', 'ParameterList', "vp_SablonRefrs_Id,'C';vp_Dokuman_Tipi,'C';vp_Dokuman_Adi,'C';vp_DosyaTipi_Id,'C';vp_Dosya_Tipi,'C'")
DBSetProp('SABLONREFRSVIEW', 'View', 'Comment', "")
DBSetProp('SABLONREFRSVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('SABLONREFRSVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for SABLONREFRSVIEW
	GoExplorer.odbcx.Validate("SABLONREFRSVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW","VIEW",;
		"VFECDESCRIPT","Sablonrefrsview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_SablonRefrs_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Sablonrefrs Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECFRMCAPTN","Þablorefrs ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECDLGCAPTN","Þablorefrs ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMTOOLTIP","Þablorefrs ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMSTATUSTXT","Þablorefrs ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMCOMPARETO","SablonRefrs_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dokuman_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dokuman Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Döküman Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Döküman Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Döküman Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Döküman Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dokumantipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECLUTAG","dokuman_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMLUFIELDS","dokuman_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Dokumantipilookupview.dokuman_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Dokuman_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dokuman_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Dokuman Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECFRMCAPTN","Döküman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECDLGCAPTN","Döküman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMTOOLTIP","Döküman Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Döküman Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!dokumanadilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECLUTAG","dokuman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMLUFIELDS","dokuman_adi, dokuman_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Dokumanadilookupview.dokuman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMCOMPARETO","Dokuman_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dokuman_Adi","PARAMETER",;
		"VFEMINPUTMASK","XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") &&Input Mask
 
	*** DBCX View Parameter Properties for vp_DosyaTipi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Dosyatipi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for SABLONREFRSVIEW
*** Props for the SABLONREFRSVIEW.sablonrefrs_id field.
DBSetProp('SABLONREFRSVIEW.sablonrefrs_id', 'Field', 'KeyField', .T.)
DBSetProp('SABLONREFRSVIEW.sablonrefrs_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.sablonrefrs_id', 'Field', 'UpdateName', 'dbo.SablonRefrs.SablonRefrs_Id')
DBSetProp('SABLONREFRSVIEW.sablonrefrs_id', 'Field', 'DataType', "C(36)")
DBSetProp('SABLONREFRSVIEW.sablonrefrs_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for SABLONREFRSVIEW.sablonrefrs_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECDESCRIPT","Sablonrefrs Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECFRMCAPTN","Þablon Referans ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECDLGCAPTN","Þablon Referans ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECGRDCAPTN","Þablon Referans ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECRPTCAPTN","Þablon Referans ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFEMTOOLTIP","Þablon Referans ID                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFEMSTATUSTXT","Þablon Referans ID                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.sablonrefrs_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dosyatipi_id field.
DBSetProp('SABLONREFRSVIEW.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.SablonRefrs.DosyaTipi_Id')
DBSetProp('SABLONREFRSVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SABLONREFRSVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dosya_tipi field.
DBSetProp('SABLONREFRSVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dosya_Tipi')
DBSetProp('SABLONREFRSVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for SABLONREFRSVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dosya_tipi","FIELD",;
		"VFEMLUUPDFLDS","dosyatipi_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the SABLONREFRSVIEW.dokuman_adi field.
DBSetProp('SABLONREFRSVIEW.dokuman_adi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dokuman_adi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dokuman_adi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dokuman_Adi')
DBSetProp('SABLONREFRSVIEW.dokuman_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SABLONREFRSVIEW.dokuman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECDESCRIPT","Dokuman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECFRMCAPTN","Doküman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECDLGCAPTN","Doküman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECGRDCAPTN","Doküman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECRPTCAPTN","Doküman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFEMTOOLTIP","Doküman Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFEMSTATUSTXT","Doküman Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dokuman_tipi field.
DBSetProp('SABLONREFRSVIEW.dokuman_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dokuman_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dokuman_tipi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dokuman_Tipi')
DBSetProp('SABLONREFRSVIEW.dokuman_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SABLONREFRSVIEW.dokuman_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECDESCRIPT","Dokuman Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECFRMCAPTN","Doküman Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECDLGCAPTN","Doküman Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECGRDCAPTN","Doküman Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECRPTCAPTN","Doküman Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMTOOLTIP","Doküman Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMSTATUSTXT","Doküman Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!dokumantipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECLUTAG","dokuman_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMLUFIELDS","dokuman_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMLUUPDTEXP","Dokumantipilookupview.dokuman_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.talep_ifadesi field.
DBSetProp('SABLONREFRSVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Talep_Ifadesi')
DBSetProp('SABLONREFRSVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for SABLONREFRSVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.zarftipi_id field.
DBSetProp('SABLONREFRSVIEW.zarftipi_id', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.zarftipi_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.zarftipi_id', 'Field', 'UpdateName', 'dbo.SablonRefrs.ZarfTipi_Id')
DBSetProp('SABLONREFRSVIEW.zarftipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SABLONREFRSVIEW.zarftipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECDESCRIPT","Zarftipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECFRMCAPTN","Zarf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECDLGCAPTN","Zarf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECGRDCAPTN","Zarf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECRPTCAPTN","Zarf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMTOOLTIP","Zarf Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMSTATUSTXT","Zarf Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECLUTABLE","hbysdata!zarftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECLUTAG","sablonrefrs_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMLUFIELDS","dokuman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMLUUPDTEXP","Zarftipilookupview.sablonrefrs_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.zarftipi_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dokuman_sablonu field.
DBSetProp('SABLONREFRSVIEW.dokuman_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dokuman_sablonu', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dokuman_sablonu', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dokuman_Sablonu')
DBSetProp('SABLONREFRSVIEW.dokuman_sablonu', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for SABLONREFRSVIEW.dokuman_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECDESCRIPT","Dokuman Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECFRMCAPTN","Döküman Þablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECDLGCAPTN","Döküman Þablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECGRDCAPTN","Döküman Þablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECRPTCAPTN","Döküman Þablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFEMTOOLTIP","Döküman Þablonu                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFEMSTATUSTXT","Döküman Þablonu                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFECOBJTYPE","irichtextcontrol") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\iole.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_sablonu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dokuman_baski_adedi field.
DBSetProp('SABLONREFRSVIEW.dokuman_baski_adedi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dokuman_baski_adedi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dokuman_baski_adedi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dokuman_Baski_Adedi')
DBSetProp('SABLONREFRSVIEW.dokuman_baski_adedi', 'Field', 'DataType', "I")
*** DBCX Field Properties for SABLONREFRSVIEW.dokuman_baski_adedi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECDESCRIPT","Dokuman Baski Adedi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECFRMCAPTN","Döküman Baský Adedi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECDLGCAPTN","Döküman Baský Adedi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECGRDCAPTN","Döküman Baský Adedi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECRPTCAPTN","Döküman Baský Adedi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFEMTOOLTIP","Döküman Baský Adedi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFEMSTATUSTXT","Döküman Baský Adedi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_baski_adedi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.dokuman_arsivle field.
DBSetProp('SABLONREFRSVIEW.dokuman_arsivle', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.dokuman_arsivle', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.dokuman_arsivle', 'Field', 'UpdateName', 'dbo.SablonRefrs.Dokuman_Arsivle')
DBSetProp('SABLONREFRSVIEW.dokuman_arsivle', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONREFRSVIEW.dokuman_arsivle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECDESCRIPT","Dokuman Arsivle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECFRMCAPTN","Döküman Arþivle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECDLGCAPTN","Döküman Arþivle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECGRDCAPTN","Döküman Arþivle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECRPTCAPTN","Döküman Arþivle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFEMTOOLTIP","Döküman Arþivle                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFEMSTATUSTXT","Döküman Arþivle                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.dokuman_arsivle","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.gonderi_takibi field.
DBSetProp('SABLONREFRSVIEW.gonderi_takibi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.gonderi_takibi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.gonderi_takibi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Gonderi_Takibi')
DBSetProp('SABLONREFRSVIEW.gonderi_takibi', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONREFRSVIEW.gonderi_takibi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECDESCRIPT","Gonderi Takibi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECFRMCAPTN","Gönderi Takibi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECDLGCAPTN","Gönderi Takibi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECGRDCAPTN","Gönderi Takibi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECRPTCAPTN","Gönderi Takibi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFEMTOOLTIP","Gönderi Takibi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Takibi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_takibi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.gonderi_tipi field.
DBSetProp('SABLONREFRSVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Gonderi_Tipi')
DBSetProp('SABLONREFRSVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SABLONREFRSVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!gonderitipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECLUTAG","gonderi_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMLUFIELDS","gonderi_tipi, gonderi_kodu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Gonderitipilookupview.gonderi_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.barkod_bas field.
DBSetProp('SABLONREFRSVIEW.barkod_bas', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.barkod_bas', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.barkod_bas', 'Field', 'UpdateName', 'dbo.SablonRefrs.Barkod_Bas')
DBSetProp('SABLONREFRSVIEW.barkod_bas', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONREFRSVIEW.barkod_bas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECDESCRIPT","Barkod Bas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECFRMCAPTN","Barkod Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECDLGCAPTN","Barkod Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECGRDCAPTN","Barkod Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECRPTCAPTN","Barkod Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFEMTOOLTIP","Barkod Bas") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFEMSTATUSTXT","Barkod Bas") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_bas","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the SABLONREFRSVIEW.barkod_tipi field.
DBSetProp('SABLONREFRSVIEW.barkod_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONREFRSVIEW.barkod_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONREFRSVIEW.barkod_tipi', 'Field', 'UpdateName', 'dbo.SablonRefrs.Barkod_Tipi')
DBSetProp('SABLONREFRSVIEW.barkod_tipi', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for SABLONREFRSVIEW.barkod_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECDESCRIPT","Barkod Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECFRMCAPTN","Barkod Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECDLGCAPTN","Barkod Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECGRDCAPTN","Barkod Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECRPTCAPTN","Barkod Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMTOOLTIP","Barkod Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMSTATUSTXT","Barkod Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!barkodtipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECLUTAG","barkod_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMLUFIELDS","barkod_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMLUUPDTEXP","Barkodtipilookupview.barkod_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONREFRSVIEW.barkod_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
