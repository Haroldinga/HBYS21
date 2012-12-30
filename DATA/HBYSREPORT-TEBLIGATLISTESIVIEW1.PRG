***************** Begin View Definition TEBLIGATLISTESIVIEW ***************


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



CREATE SQL VIEW "TEBLIGATLISTESIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Gonderi.Gonderi_Id,;
		Gonderi.Gonderi_Fk,;
		Gonderi.Muamele_Id,;
		Gonderi.Gonderi_Tipi,;
		Gonderi.Gonderi_Adi,;
		Gonderi.Gonderi_Tarihi,;
		Gonderi.Muhatap_Adi,;
		Gonderi.Muhatap_Adresi,;
		Gonderi.BarKod,;
		Gonderi.Sorgu_Tarihi,;
		Gonderi.Sorgu_Bilgisi,;
		Gonderi.Sonuc_Tarihi,;
		Gonderi.Sonuc_Bilgisi,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.IcraMudurlugu_Adi;
	FROM dbo.Gonderi Gonderi;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Gonderi.Gonderi_Fk = Icradosya.IcraDosya_Id;
	ORDER BY Icradosya.IcraMudurlugu_Adi, Gonderi.Gonderi_Tarihi

DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'UpdateType', 1)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'WhereType', 3)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'Tables', 'dbo.Gonderi')
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'ParameterList', "vp_Gonderi_Fk,'C';vp_Gonderi_Adi,'C';vp_Gonderi_Tarihi,'D';vp_Gonderi_Tarihi2,'D';vp_Muhatap_Adi,'C';vp_barkod,'C';vp_Icra_Dosya_No,'V';vp_Buro_Dosya_No,'V';vp_IcraMudurlugu_Adi,'C';vp_Muamele_Id,'V'")
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'Comment', "")
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TEBLIGATLISTESIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for TEBLIGATLISTESIVIEW
	GoExplorer.odbcx.Validate("TEBLIGATLISTESIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW","VIEW",;
		"VFECDESCRIPT","TebligatListesiView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Gonderi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Gonderi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Gonderi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Gonderi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Gonderi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gonderi_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECFRMCAPTN","Gönderi Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECDLGCAPTN","Gönderi Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFENVPSIZE",100) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMTOOLTIP","Gönderi Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Gönderi Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECLUTABLE","HBYSREPORT!dokumanadilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Dokumanadilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gonderi_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Gönderi Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Gönderi Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Gönderi Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Gönderi Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Gonderi_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gonderi_Tarihi2
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Tarihi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECFRMCAPTN","Gönderi Tarihi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECDLGCAPTN","Gönderi Tarihi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMTOOLTIP","Gönderi Tarihi 2                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMSTATUSTXT","Gönderi Tarihi 2                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMCOMPARETO","Gonderi_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Gonderi_Tarihi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muhatap_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muhatap Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_barkod
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECDESCRIPT","Vp Barkod View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFENVPSIZE",12) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_barkod","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","IcraDosya.Buro_Dosya_NO IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMFORMAT","K") &&Format
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTABLE","HBYSREPORT!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUFIELDS","icramudurlugu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Icramudurlugu_adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","ITEXTBOX") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMDEFAULT","space(1000)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMWHEREEXPR","Gonderi.Muamele_Id IN ?.vp_Muamele_Id") &&Complete SQL Where Expression
ENDIF

*!* Field Level Properties for TEBLIGATLISTESIVIEW
*** Props for the TEBLIGATLISTESIVIEW.gonderi_id field.
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_id', 'Field', 'KeyField', .T.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_id', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_id', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Id')
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_id', 'Field', 'DataType', "C(36)")
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.gonderi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECDESCRIPT","Gonderi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECFRMCAPTN","Gönderi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECDLGCAPTN","Gönderi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECGRDCAPTN","Gönderi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECRPTCAPTN","Gönderi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFEMTOOLTIP","Gönderi ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFEMSTATUSTXT","Gönderi ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.gonderi_fk field.
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_fk', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_fk', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_fk', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Fk')
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.gonderi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECDESCRIPT","Gonderi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECFRMCAPTN","Gönderi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECDLGCAPTN","Gönderi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECGRDCAPTN","Gönderi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECRPTCAPTN","Gönderi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFEMTOOLTIP","Gönderi FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFEMSTATUSTXT","Gönderi FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.muamele_id field.
DBSetProp('TEBLIGATLISTESIVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATLISTESIVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Gonderi.Muamele_Id')
DBSetProp('TEBLIGATLISTESIVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.gonderi_tipi field.
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Tipi')
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.gonderi_adi field.
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_adi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_adi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_adi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Adi')
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.gonderi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECDESCRIPT","Gonderi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECFRMCAPTN","Gönderi Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECDLGCAPTN","Gönderi Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECGRDCAPTN","Gönderi Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECRPTCAPTN","Gönderi Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFEMTOOLTIP","Gönderi Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.gonderi_tarihi field.
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Tarihi')
DBSetProp('TEBLIGATLISTESIVIEW.gonderi_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.gonderi_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECDESCRIPT","Gonderi Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFECQFINDTAG","gondtarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.gonderi_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.muhatap_adi field.
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Gonderi.Muhatap_Adi')
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.muhatap_adresi field.
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adresi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Gonderi.Muhatap_Adresi')
DBSetProp('TEBLIGATLISTESIVIEW.muhatap_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.barkod field.
DBSetProp('TEBLIGATLISTESIVIEW.barkod', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.barkod', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.barkod', 'Field', 'UpdateName', 'dbo.Gonderi.BarKod')
DBSetProp('TEBLIGATLISTESIVIEW.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.barkod","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.sorgu_tarihi field.
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Sorgu_Tarihi')
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.sorgu_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECDESCRIPT","Sorgu Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECFRMCAPTN","Sorgu Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECDLGCAPTN","Sorgu Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECGRDCAPTN","Sorgu Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECRPTCAPTN","Sorgu Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFEMTOOLTIP","Sorgu Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFEMSTATUSTXT","Sorgu Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_tarihi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.sorgu_bilgisi field.
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_bilgisi', 'Field', 'UpdateName', 'dbo.Gonderi.Sorgu_Bilgisi')
DBSetProp('TEBLIGATLISTESIVIEW.sorgu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.sorgu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECDESCRIPT","Sorgu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Sorgu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Sorgu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Sorgu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Sorgu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Sorgu Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Sorgu Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sorgu_bilgisi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.sonuc_tarihi field.
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Tarihi')
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.sonuc_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECDESCRIPT","Sonuc Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECFRMCAPTN","Sonuç Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECDLGCAPTN","Sonuç Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECGRDCAPTN","Sonuç Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECRPTCAPTN","Sonuç Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFEMTOOLTIP","Sonuç Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFEMSTATUSTXT","Sonuç Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_tarihi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.sonuc_bilgisi field.
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_bilgisi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_bilgisi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Bilgisi')
DBSetProp('TEBLIGATLISTESIVIEW.sonuc_bilgisi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.sonuc_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDESCRIPT","Sonuc Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECFRMCAPTN","Sonuç Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDLGCAPTN","Sonuç Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECGRDCAPTN","Sonuç Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECRPTCAPTN","Sonuç Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMTOOLTIP","Sonuç Bilgisi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Sonuç Bilgisi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the TEBLIGATLISTESIVIEW.buro_dosya_no field.
DBSetProp('TEBLIGATLISTESIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('TEBLIGATLISTESIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFECQFINDTAG","burdosyno") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.icra_dosya_no field.
DBSetProp('TEBLIGATLISTESIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TEBLIGATLISTESIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECQFINDTAG","icrdosyno") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the TEBLIGATLISTESIVIEW.icramudurlugu_adi field.
DBSetProp('TEBLIGATLISTESIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TEBLIGATLISTESIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('TEBLIGATLISTESIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATLISTESIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!TEBLIGATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
