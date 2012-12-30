***************** Begin View Definition SEMIRAMISLISTVIEW ***************


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



CREATE SQL VIEW "SEMIRAMISLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Semiramis.Semiramis_Id,;
		Semiramis.Aktif,;
		Semiramis.Eylem,;
		Semiramis.Olay_Adi,;
		Semiramis.Islem_Periyodu,;
		Semiramis.Islem_Gunu,;
		Semiramis.Islem_Saati,;
		Semiramis.Islem_Adi,;
		Semiramis.IsKurali_Adi,;
		Semiramis.Semiramis_Isi,;
		Semiramis.Personel_Id,;
		Semiramis.Personel_Adi,;
		Semiramis.Hedef_Sure,;
		Semiramis.Bilgilendirme_eMaili;
	FROM dbo.Semiramis Semiramis

DBSetProp('SEMIRAMISLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'Tables', 'dbo.Semiramis')
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'ParameterList', "vp_Semiramis_Id,'C';vp_Olay_Adi,'C';vp_Islem_Adi,'C';vp_Personel_Id,'C';vp_Eylem,'V';vp_Aktif,'L'")
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'Comment', "")
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('SEMIRAMISLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for SEMIRAMISLISTVIEW
	GoExplorer.odbcx.Validate("SEMIRAMISLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW","VIEW",;
		"VFECDESCRIPT","Semiramislistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Semiramis_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Semiramis Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECFRMCAPTN","Semiramis ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECDLGCAPTN","Semiramis ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMTOOLTIP","Semiramis ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMCOMPARETO","Semiramis_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Semiramis_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Olay_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Olay Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECFRMCAPTN","Olay Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECDLGCAPTN","Olay Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMTOOLTIP","Olay Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Olay Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!olaylarlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLUTAG","olay_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMLUFIELDS","olay_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Olaylarlookupview.olay_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMCOMPARETO","Olay_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Islem_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Islem Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýþlem Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýþlem Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýþlem Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýþlem Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!islemlerlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLUTAG","islem_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMLUFIELDS","islem_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Islemlerlookupview.islem_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Eylem
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECDESCRIPT","Vp Eylem View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECFRMCAPTN","Eylem") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECDLGCAPTN","Eylem") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFEMTOOLTIP","Eylem") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFEMSTATUSTXT","Eylem") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFEMINLIST",'"Ýþ Takvimine At","Ýcra Et"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Eylem","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Aktif
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECDESCRIPT","Vp Aktif View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECFRMCAPTN","Aktif") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECDLGCAPTN","Aktif") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFEMTOOLTIP","Aktif") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFEMSTATUSTXT","Aktif") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.vp_Aktif","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for SEMIRAMISLISTVIEW
*** Props for the SEMIRAMISLISTVIEW.semiramis_id field.
DBSetProp('SEMIRAMISLISTVIEW.semiramis_id', 'Field', 'KeyField', .T.)
DBSetProp('SEMIRAMISLISTVIEW.semiramis_id', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.semiramis_id', 'Field', 'UpdateName', 'dbo.Semiramis.Semiramis_Id')
DBSetProp('SEMIRAMISLISTVIEW.semiramis_id', 'Field', 'DataType', "C(36)")
DBSetProp('SEMIRAMISLISTVIEW.semiramis_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.semiramis_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECDESCRIPT","Semiramis Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECFRMCAPTN","Semiramis ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECDLGCAPTN","Semiramis ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECGRDCAPTN","Semiramis ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECRPTCAPTN","Semiramis ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFEMTOOLTIP","Semiramis ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFEMSTATUSTXT","Semiramis ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.aktif field.
DBSetProp('SEMIRAMISLISTVIEW.aktif', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.aktif', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.aktif', 'Field', 'UpdateName', 'dbo.Semiramis.Aktif')
DBSetProp('SEMIRAMISLISTVIEW.aktif', 'Field', 'DataType', "L")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.aktif
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECDESCRIPT","Aktif Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECFRMCAPTN","Aktif") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECDLGCAPTN","Aktif") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECGRDCAPTN","Aktif") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECRPTCAPTN","Aktif") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFEMTOOLTIP","Aktif") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFEMSTATUSTXT","Aktif") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.aktif","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.eylem field.
DBSetProp('SEMIRAMISLISTVIEW.eylem', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.eylem', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.eylem', 'Field', 'UpdateName', 'dbo.Semiramis.Eylem')
DBSetProp('SEMIRAMISLISTVIEW.eylem', 'Field', 'DataType', "C(15)")
DBSetProp('SEMIRAMISLISTVIEW.eylem', 'Field', 'DefaultValue', "'Ýþ Takvimine At'")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.eylem
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECDESCRIPT","Eylem Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECFRMCAPTN","Eylem") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECDLGCAPTN","Eylem") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECGRDCAPTN","Eylem") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECRPTCAPTN","Eylem") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFEMTOOLTIP","Eylem") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFEMSTATUSTXT","Eylem") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFEMINLIST",'"Ýþ Takvimine At","Ýcra Et"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.eylem","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.olay_adi field.
DBSetProp('SEMIRAMISLISTVIEW.olay_adi', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.olay_adi', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.olay_adi', 'Field', 'UpdateName', 'dbo.Semiramis.Olay_Adi')
DBSetProp('SEMIRAMISLISTVIEW.olay_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.olay_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECDESCRIPT","Olay Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECFRMCAPTN","Olay Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECDLGCAPTN","Olay Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECGRDCAPTN","Olay Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECRPTCAPTN","Olay Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMTOOLTIP","Olay Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMSTATUSTXT","Olay Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECLUTABLE","hbysdata!olaylarlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECLUTAG","olay_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMLUFIELDS","olay_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMLUUPDTEXP","Olaylarlookupview.olay_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.olay_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.islem_periyodu field.
DBSetProp('SEMIRAMISLISTVIEW.islem_periyodu', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.islem_periyodu', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.islem_periyodu', 'Field', 'UpdateName', 'dbo.Semiramis.Islem_Periyodu')
DBSetProp('SEMIRAMISLISTVIEW.islem_periyodu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.islem_periyodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECDESCRIPT","Islem Periyodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECFRMCAPTN","Ýþlem Periyodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECDLGCAPTN","Ýþlem Periyodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECGRDCAPTN","Ýþlem Periyodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECRPTCAPTN","Ýþlem Periyodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFEMTOOLTIP","Ýþlem Periyodu                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Periyodu                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFEMINLIST",'"Hergün","Haftada Bir","Ayda Bir"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_periyodu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.islem_gunu field.
DBSetProp('SEMIRAMISLISTVIEW.islem_gunu', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.islem_gunu', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.islem_gunu', 'Field', 'UpdateName', 'dbo.Semiramis.Islem_Gunu')
DBSetProp('SEMIRAMISLISTVIEW.islem_gunu', 'Field', 'DataType', "I")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.islem_gunu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECDESCRIPT","Islem Gunu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECFRMCAPTN","Ýþlem Günü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECDLGCAPTN","Ýþlem Günü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECGRDCAPTN","Ýþlem Günü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECRPTCAPTN","Ýþlem Günü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFEMTOOLTIP","Ýþlem Günü                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Günü                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_gunu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.islem_saati field.
DBSetProp('SEMIRAMISLISTVIEW.islem_saati', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.islem_saati', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.islem_saati', 'Field', 'UpdateName', 'dbo.Semiramis.Islem_Saati')
DBSetProp('SEMIRAMISLISTVIEW.islem_saati', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.islem_saati
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECDESCRIPT","Islem Saati Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECFRMCAPTN","Ýþlem Saati") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECDLGCAPTN","Ýþlem Saati") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECGRDCAPTN","Ýþlem Saati") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECRPTCAPTN","Ýþlem Saati") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFEMTOOLTIP","Ýþlem Saati                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Saati                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_saati","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.islem_adi field.
DBSetProp('SEMIRAMISLISTVIEW.islem_adi', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.islem_adi', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.islem_adi', 'Field', 'UpdateName', 'dbo.Semiramis.Islem_Adi')
DBSetProp('SEMIRAMISLISTVIEW.islem_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.islem_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECDESCRIPT","Islem Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECFRMCAPTN","Ýþlem Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECDLGCAPTN","Ýþlem Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECGRDCAPTN","Ýþlem Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECRPTCAPTN","Ýþlem Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMTOOLTIP","Ýþlem Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECLUTABLE","hbysdata!islemlerlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECLUTAG","islem_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMLUFIELDS","islem_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMLUUPDTEXP","Islemlerlookupview.islem_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.islem_adi","FIELD",;
		"VFEMLUUPDFLDS","iskurali_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.iskurali_adi field.
DBSetProp('SEMIRAMISLISTVIEW.iskurali_adi', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.iskurali_adi', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.iskurali_adi', 'Field', 'UpdateName', 'dbo.Semiramis.IsKurali_Adi')
DBSetProp('SEMIRAMISLISTVIEW.iskurali_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.iskurali_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECDESCRIPT","Iskurali Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECFRMCAPTN","Ýþ Kuralý Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECDLGCAPTN","Ýþ Kuralý Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECGRDCAPTN","Ýþ Kuralý Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECRPTCAPTN","Ýþ Kuralý Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFEMTOOLTIP","Ýþ Kuralý Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþ Kuralý Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.iskurali_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.semiramis_isi field.
DBSetProp('SEMIRAMISLISTVIEW.semiramis_isi', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.semiramis_isi', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.semiramis_isi', 'Field', 'UpdateName', 'dbo.Semiramis.Semiramis_Isi')
DBSetProp('SEMIRAMISLISTVIEW.semiramis_isi', 'Field', 'DataType', "L")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.semiramis_isi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECDESCRIPT","Semiramis Isi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECFRMCAPTN","Semiramise Ata") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECDLGCAPTN","Semiramise Ata") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECGRDCAPTN","Semiramise Ata") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECRPTCAPTN","Semiramise Ata") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFEMTOOLTIP","Semiramise Ata                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFEMSTATUSTXT","Semiramise Ata                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.semiramis_isi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.personel_id field.
DBSetProp('SEMIRAMISLISTVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Semiramis.Personel_Id')
DBSetProp('SEMIRAMISLISTVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.personel_adi field.
DBSetProp('SEMIRAMISLISTVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Semiramis.Personel_Adi')
DBSetProp('SEMIRAMISLISTVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.hedef_sure field.
DBSetProp('SEMIRAMISLISTVIEW.hedef_sure', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.hedef_sure', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.hedef_sure', 'Field', 'UpdateName', 'dbo.Semiramis.Hedef_Sure')
DBSetProp('SEMIRAMISLISTVIEW.hedef_sure', 'Field', 'DataType', "I")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.hedef_sure
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECDESCRIPT","Hedef Sure Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECFRMCAPTN","Hedef Süre") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECDLGCAPTN","Hedef Süre") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECGRDCAPTN","Hedef Süre") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECRPTCAPTN","Hedef Süre") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFEMTOOLTIP","Hedef Süre                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFEMSTATUSTXT","Hedef Süre                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.hedef_sure","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the SEMIRAMISLISTVIEW.bilgilendirme_emaili field.
DBSetProp('SEMIRAMISLISTVIEW.bilgilendirme_emaili', 'Field', 'KeyField', .F.)
DBSetProp('SEMIRAMISLISTVIEW.bilgilendirme_emaili', 'Field', 'Updatable', .T.)
DBSetProp('SEMIRAMISLISTVIEW.bilgilendirme_emaili', 'Field', 'UpdateName', 'dbo.Semiramis.Bilgilendirme_eMaili')
DBSetProp('SEMIRAMISLISTVIEW.bilgilendirme_emaili', 'Field', 'DataType', "M")
DBSetProp('SEMIRAMISLISTVIEW.bilgilendirme_emaili', 'Field', 'DefaultValue', "'Kime :'+chr(13)+'Bilgi :'+chr(13)+'Konu :'+chr(13)+'Mesaj :'")
*** DBCX Field Properties for SEMIRAMISLISTVIEW.bilgilendirme_emaili
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECDESCRIPT","Bilgilendirme Emaili Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECFRMCAPTN","Bilgilendirme Emaili") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECDLGCAPTN","Bilgilendirme Emaili") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECGRDCAPTN","Bilgilendirme Emaili") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECRPTCAPTN","Bilgilendirme Emaili") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMTOOLTIP","Bilgilendirme Emaili") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMSTATUSTXT","Bilgilendirme Emaili") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SEMIRAMISLISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
