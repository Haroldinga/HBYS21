***************** Begin View Definition ISTAKVIMILISTVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSDATA")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSDATA"
ELSE
	SET DATABASE TO "HBYSDATA"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "ISTAKVIMILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Istakvimi.IsTakvimi_Id,;
		Istakvimi.Olay_Adi,;
		Istakvimi.Islem_Adi,;
		Istakvimi.IsKurali_Adi,;
		Istakvimi.IsKurali_Parametresi,;
		Istakvimi.Atama_Tipi,;
		Istakvimi.Semiramis_Isi,;
		Istakvimi.Personel_Id,;
		Istakvimi.Personel_Adi,;
		Istakvimi.Dosya_Id,;
		Istakvimi.Atanan_Tarih,;
		Istakvimi.Planlanan_Tarih,;
		Istakvimi.Gerceklesme_Tarihi,;
		Istakvimi.Islem_Statusu,;
		Istakvimi.Aciklama,;
		Istakvimi.Bilgilendirme_eMaili;
	FROM dbo.IsTakvimi Istakvimi

DBSetProp('ISTAKVIMILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'Tables', 'dbo.IsTakvimi')
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'ParameterList', "vp_Olay_Adi,'C';vp_Islem_Adi,'C';vp_Semiramis_Isi,'L';vp_Personel_Id,'C';vp_Atanan_Tarih,'D';vp_Atanan_Tarih1,'D';vp_Atanan_Tarih2,'D';vp_Planlanan_Tarih,'D';vp_Gerceklesme_Tarihi,'D';vp_Gerceklesme_Saati,'C';vp_Islem_Statusu,'C'")
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'Comment', "")
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ISTAKVIMILISTVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for ISTAKVIMILISTVIEW
	GoExplorer.odbcx.Validate("ISTAKVIMILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW","VIEW",;
		"VFECDESCRIPT","Istakvimilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Olay_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Olay Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECFRMCAPTN","Olay Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECDLGCAPTN","Olay Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMTOOLTIP","Olay Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Olay Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!olaylarlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLUTAG","olay_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMLUFIELDS","olay_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Olaylarlookupview.olay_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Olay_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Islem_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Islem Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýþlem Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýþlem Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýþlem Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýþlem Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!islemlerlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLUTAG","islem_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMLUFIELDS","islem_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Islemlerlookupview.islem_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMCOMPARETO","Islem_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Semiramis_Isi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECDESCRIPT","Vp Semiramis Isi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECFRMCAPTN","Semiramis Isi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECDLGCAPTN","Semiramis Isi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECVPTYPE","L") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFENVPSIZE",1) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFEMTOOLTIP","Semiramis Isi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis Isi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFEMCOMPARETO","Semiramis_Isi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Semiramis_Isi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUFIELDS","personel_adi, baro_sicil_no") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Atanan_Tarih
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECDESCRIPT","Vp Atanan Tarih View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECFRMCAPTN","Atanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECDLGCAPTN","Atanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFENVPSIZE",8) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMTOOLTIP","Atanan Tarih") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMSTATUSTXT","Atanan Tarih") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih","PARAMETER",;
		"VFEMWHEREEXPR","Atanan_Tarih=?.vp_Atanan_Tarih") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Atanan_Tarih1
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECDESCRIPT","Vp Atanan Tarih1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECFRMCAPTN","Atanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECDLGCAPTN","Atanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMTOOLTIP","Atanan Tarih                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMSTATUSTXT","Atanan Tarih                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih1","PARAMETER",;
		"VFEMWHEREEXPR","Atanan_Tarih>=?.vp_Atanan_Tarih1") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Atanan_Tarih2
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECDESCRIPT","Vp Atanan Tarih2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECFRMCAPTN","Atanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECDLGCAPTN","Atanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMTOOLTIP","Atanan Tarih                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMSTATUSTXT","Atanan Tarih                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMDEFAULT","date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Atanan_Tarih2","PARAMETER",;
		"VFEMWHEREEXPR","Atanan_Tarih<=?.vp_Atanan_Tarih2") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Planlanan_Tarih
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECDESCRIPT","Vp Planlanan Tarih View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECFRMCAPTN","Planlanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECDLGCAPTN","Planlanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMTOOLTIP","Planlanan Tarih") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMSTATUSTXT","Planlanan Tarih") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Planlanan_Tarih","PARAMETER",;
		"VFEMWHEREEXPR","Planlanan_Tarih<=?.vp_Planlanan_Tarih") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Gerceklesme_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Gerceklesme Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Gercekleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Gercekleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Gercekleþme Tarihi                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Gercekleþme Tarihi                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gerceklesme_Saati
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECDESCRIPT","Vp Gerceklesme Saati View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECFRMCAPTN","Gerçekleþme Saati") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECDLGCAPTN","Gerçekleþme Saati") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFEMTOOLTIP","Gerçekleþme Saati                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFEMSTATUSTXT","Gerçekleþme Saati                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Gerceklesme_Saati","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Islem_Statusu
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECDESCRIPT","Vp Islem Statusu View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECFRMCAPTN","Ýþlem Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECDLGCAPTN","Ýþlem Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMTOOLTIP","Ýþlem Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMSTATUSTXT","Ýþlem Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECLUTABLE","hbysdata!islemstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECLUTAG","islem_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMLUFIELDS","islem_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMLUUPDTEXP","Islemstatusulookupview.islem_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMCOMPARETO","Islem_Statusu") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.vp_Islem_Statusu","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!istakvimilistview.atantarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!istakvimilistview","atantarh","ATANAN_TARIH","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!istakvimilistview.atantarh","INDEX",;
		"VFECDESCRIPT","Atantarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!istakvimilistview.atantarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!istakvimilistview.atantarh","INDEX",;
		"VFECTAGCAPTN","Atantarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!istakvimilistview.atantarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for ISTAKVIMILISTVIEW
*** Props for the ISTAKVIMILISTVIEW.istakvimi_id field.
DBSetProp('ISTAKVIMILISTVIEW.istakvimi_id', 'Field', 'KeyField', .T.)
DBSetProp('ISTAKVIMILISTVIEW.istakvimi_id', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.istakvimi_id', 'Field', 'UpdateName', 'dbo.IsTakvimi.IsTakvimi_Id')
DBSetProp('ISTAKVIMILISTVIEW.istakvimi_id', 'Field', 'DataType', "C(36)")
DBSetProp('ISTAKVIMILISTVIEW.istakvimi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.istakvimi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECDESCRIPT","Istakvimi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECFRMCAPTN","Ýþ Takvimi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECDLGCAPTN","Ýþ Takvimi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECGRDCAPTN","Ýþ Takvimi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECRPTCAPTN","Ýþ Takvimi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFEMTOOLTIP","Ýþ Takvimi ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFEMSTATUSTXT","Ýþ Takvimi ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.istakvimi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.olay_adi field.
DBSetProp('ISTAKVIMILISTVIEW.olay_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.olay_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.olay_adi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Olay_Adi')
DBSetProp('ISTAKVIMILISTVIEW.olay_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.olay_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECDESCRIPT","Olay Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECFRMCAPTN","Olay Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECDLGCAPTN","Olay Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECGRDCAPTN","Olay Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECRPTCAPTN","Olay Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFEMTOOLTIP","Olay Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFEMSTATUSTXT","Olay Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.olay_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.islem_adi field.
DBSetProp('ISTAKVIMILISTVIEW.islem_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.islem_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.islem_adi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Islem_Adi')
DBSetProp('ISTAKVIMILISTVIEW.islem_adi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.islem_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECDESCRIPT","Islem Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECFRMCAPTN","Ýþlem Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECDLGCAPTN","Ýþlem Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECGRDCAPTN","Ýþlem Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECRPTCAPTN","Ýþlem Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFEMTOOLTIP","Ýþlem Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.iskurali_adi field.
DBSetProp('ISTAKVIMILISTVIEW.iskurali_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.iskurali_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.iskurali_adi', 'Field', 'UpdateName', 'dbo.IsTakvimi.IsKurali_Adi')
DBSetProp('ISTAKVIMILISTVIEW.iskurali_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.iskurali_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECDESCRIPT","Iskurali Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECFRMCAPTN","Ýþ Kuralý Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECDLGCAPTN","Ýþ Kuralý Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECGRDCAPTN","Ýþ Kuralý Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECRPTCAPTN","Ýþ Kuralý Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFEMTOOLTIP","Ýþ Kuralý Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþ Kuralý Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.iskurali_parametresi field.
DBSetProp('ISTAKVIMILISTVIEW.iskurali_parametresi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.iskurali_parametresi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.iskurali_parametresi', 'Field', 'UpdateName', 'dbo.IsTakvimi.IsKurali_Parametresi')
DBSetProp('ISTAKVIMILISTVIEW.iskurali_parametresi', 'Field', 'DataType', "M")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.iskurali_parametresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECDESCRIPT","Iskurali Parametresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECFRMCAPTN","Parametreler") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECDLGCAPTN","Parametreler") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECGRDCAPTN","Parametreler") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECRPTCAPTN","Parametreler") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFEMTOOLTIP","Parametreler                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFEMSTATUSTXT","Parametreler                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.iskurali_parametresi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.atama_tipi field.
DBSetProp('ISTAKVIMILISTVIEW.atama_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.atama_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.atama_tipi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Atama_Tipi')
DBSetProp('ISTAKVIMILISTVIEW.atama_tipi', 'Field', 'DataType', "C(9)")
DBSetProp('ISTAKVIMILISTVIEW.atama_tipi', 'Field', 'DefaultValue', "'Manual'")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.atama_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECDESCRIPT","Atama Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECFRMCAPTN","Atama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECDLGCAPTN","Atama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECGRDCAPTN","Atama Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECRPTCAPTN","Atama Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFEMTOOLTIP","Atama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFEMSTATUSTXT","Atama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFEMINLIST",'"Semiramis","Manual","Sistem"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atama_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.semiramis_isi field.
DBSetProp('ISTAKVIMILISTVIEW.semiramis_isi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.semiramis_isi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.semiramis_isi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Semiramis_Isi')
DBSetProp('ISTAKVIMILISTVIEW.semiramis_isi', 'Field', 'DataType', "L")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.semiramis_isi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECDESCRIPT","Semiramis Isi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECFRMCAPTN","Semiramis Ýþi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECDLGCAPTN","Semiramis Ýþi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECGRDCAPTN","Semiramis Ýþi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECRPTCAPTN","Semiramis Ýþi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFEMTOOLTIP","Semiramis Ýþi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFEMSTATUSTXT","Semiramis Ýþi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.semiramis_isi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.personel_id field.
DBSetProp('ISTAKVIMILISTVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.personel_id', 'Field', 'UpdateName', 'dbo.IsTakvimi.Personel_Id')
DBSetProp('ISTAKVIMILISTVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi, baro_sicil_no") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.personel_adi field.
DBSetProp('ISTAKVIMILISTVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Personel_Adi')
DBSetProp('ISTAKVIMILISTVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.dosya_id field.
DBSetProp('ISTAKVIMILISTVIEW.dosya_id', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.dosya_id', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.dosya_id', 'Field', 'UpdateName', 'dbo.IsTakvimi.Dosya_Id')
DBSetProp('ISTAKVIMILISTVIEW.dosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.dosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECDESCRIPT","Dosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECFRMCAPTN","Dosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECDLGCAPTN","Dosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECGRDCAPTN","Dosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECRPTCAPTN","Dosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFEMTOOLTIP","Dosya ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFEMSTATUSTXT","Dosya ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.dosya_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.atanan_tarih field.
DBSetProp('ISTAKVIMILISTVIEW.atanan_tarih', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.atanan_tarih', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.atanan_tarih', 'Field', 'UpdateName', 'dbo.IsTakvimi.Atanan_Tarih')
DBSetProp('ISTAKVIMILISTVIEW.atanan_tarih', 'Field', 'DataType', "D")
DBSetProp('ISTAKVIMILISTVIEW.atanan_tarih', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.atanan_tarih
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECDESCRIPT","Atanan Tarih Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECFRMCAPTN","Atanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECDLGCAPTN","Atanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECGRDCAPTN","Atanan Tarih") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECRPTCAPTN","Atanan Tarih") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFEMTOOLTIP","Atanan Tarih") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFEMSTATUSTXT","Atanan Tarih") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFECQFINDTAG","atantarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.atanan_tarih","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the ISTAKVIMILISTVIEW.planlanan_tarih field.
DBSetProp('ISTAKVIMILISTVIEW.planlanan_tarih', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.planlanan_tarih', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.planlanan_tarih', 'Field', 'UpdateName', 'dbo.IsTakvimi.Planlanan_Tarih')
DBSetProp('ISTAKVIMILISTVIEW.planlanan_tarih', 'Field', 'DataType', "D")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.planlanan_tarih
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECDESCRIPT","Planlanan Tarih Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECFRMCAPTN","Planlanan Tarih") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECDLGCAPTN","Planlanan Tarih") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECGRDCAPTN","Planlanan Tarih") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECRPTCAPTN","Planlanan Tarih") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFEMTOOLTIP","Planlanan Tarih") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFEMSTATUSTXT","Planlanan Tarih") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.planlanan_tarih","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.gerceklesme_tarihi field.
DBSetProp('ISTAKVIMILISTVIEW.gerceklesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.gerceklesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.gerceklesme_tarihi', 'Field', 'UpdateName', 'dbo.IsTakvimi.Gerceklesme_Tarihi')
DBSetProp('ISTAKVIMILISTVIEW.gerceklesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.gerceklesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECDESCRIPT","Gerceklesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Gerçekleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Gerçekleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Gerçekleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Gerçekleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Gerçekleþme Tarihi                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gerçekleþme Tarihi                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.gerceklesme_tarihi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.islem_statusu field.
DBSetProp('ISTAKVIMILISTVIEW.islem_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.islem_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.islem_statusu', 'Field', 'UpdateName', 'dbo.IsTakvimi.Islem_Statusu')
DBSetProp('ISTAKVIMILISTVIEW.islem_statusu', 'Field', 'DataType', "C(15)")
DBSetProp('ISTAKVIMILISTVIEW.islem_statusu', 'Field', 'DefaultValue', "'Atandý'")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.islem_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECDESCRIPT","Islem Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECFRMCAPTN","Ýþlem Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECDLGCAPTN","Ýþlem Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECGRDCAPTN","Ýþlem Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECRPTCAPTN","Ýþlem Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMTOOLTIP","Ýþlem Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMSTATUSTXT","Ýþlem Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!islemstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECLUTAG","islem_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMLUFIELDS","islem_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMLUUPDTEXP","Islemstatusulookupview.islem_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.islem_statusu","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.aciklama field.
DBSetProp('ISTAKVIMILISTVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.aciklama', 'Field', 'UpdateName', 'dbo.IsTakvimi.Aciklama')
DBSetProp('ISTAKVIMILISTVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.aciklama","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the ISTAKVIMILISTVIEW.bilgilendirme_emaili field.
DBSetProp('ISTAKVIMILISTVIEW.bilgilendirme_emaili', 'Field', 'KeyField', .F.)
DBSetProp('ISTAKVIMILISTVIEW.bilgilendirme_emaili', 'Field', 'Updatable', .T.)
DBSetProp('ISTAKVIMILISTVIEW.bilgilendirme_emaili', 'Field', 'UpdateName', 'dbo.IsTakvimi.Bilgilendirme_eMaili')
DBSetProp('ISTAKVIMILISTVIEW.bilgilendirme_emaili', 'Field', 'DataType', "M")
DBSetProp('ISTAKVIMILISTVIEW.bilgilendirme_emaili', 'Field', 'DefaultValue', "'Kime :'+chr(13)+'Bilgi :'+chr(13)+'Konu :'+chr(13)+'Mesaj :'")
*** DBCX Field Properties for ISTAKVIMILISTVIEW.bilgilendirme_emaili
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECDESCRIPT","Bilgilendirme Emaili Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECFRMCAPTN","Bilgilendirme Emaili") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECDLGCAPTN","Bilgilendirme Emaili") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECGRDCAPTN","Bilgilendirme Emaili") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECRPTCAPTN","Bilgilendirme Emaili") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMTOOLTIP","Bilgilendirme Emaili") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMSTATUSTXT","Bilgilendirme Emaili") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTAKVIMILISTVIEW.bilgilendirme_emaili","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
