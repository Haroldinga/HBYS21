***************** Begin View Definition GONDERIVIEW ***************


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



CREATE SQL VIEW "GONDERIVIEW" ; 
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
		Gonderi.Sonuc_Bilgisi;
	FROM dbo.Gonderi Gonderi

DBSetProp('GONDERIVIEW', 'View', 'UpdateType', 1)
DBSetProp('GONDERIVIEW', 'View', 'WhereType', 3)
DBSetProp('GONDERIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('GONDERIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('GONDERIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('GONDERIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('GONDERIVIEW', 'View', 'Tables', 'dbo.Gonderi')
DBSetProp('GONDERIVIEW', 'View', 'Prepared', .F.)
DBSetProp('GONDERIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('GONDERIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GONDERIVIEW', 'View', 'FetchSize', -1)
DBSetProp('GONDERIVIEW', 'View', 'ParameterList', "vp_Gonderi_Fk,'C';vp_Gonderi_Adi,'C';vp_Gonderi_Tarihi,'D';vp_Muhatap_Adi,'C';vp_barkod,'C';vp_Muamele_Id,'C'")
DBSetProp('GONDERIVIEW', 'View', 'Comment', "")
DBSetProp('GONDERIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('GONDERIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GONDERIVIEW
	GoExplorer.odbcx.Validate("GONDERIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW","VIEW",;
		"VFECDESCRIPT","Gonderiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Gonderi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Gonderi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Gonderi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Gonderi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Gonderi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gonderi_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECFRMCAPTN","Gonderi Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECDLGCAPTN","Gonderi Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFENVPSIZE",100) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMTOOLTIP","Gonderi Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Gonderi Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gonderi_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Gonderi Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Gonderi Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Gonderi Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Gonderi Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Gonderi_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muhatap_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muhatap Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECFRMCAPTN","Muhatap Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDLGCAPTN","Muhatap Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMTOOLTIP","Muhatap Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Muhatap Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_barkod
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECDESCRIPT","Vp Barkod View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFENVPSIZE",12) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_barkod","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!gonderiview.gonderitrh
	GoExplorer.odbcx.AddViewIndex("hbysdata!gonderiview","gonderitrh","GONDERI_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!gonderiview.gonderitrh","INDEX",;
		"VFECDESCRIPT","Gonderitrh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!gonderiview.gonderitrh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!gonderiview.gonderitrh","INDEX",;
		"VFECTAGCAPTN","Gonderitrh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!gonderiview.gonderitrh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for GONDERIVIEW
*** Props for the GONDERIVIEW.gonderi_id field.
DBSetProp('GONDERIVIEW.gonderi_id', 'Field', 'KeyField', .T.)
DBSetProp('GONDERIVIEW.gonderi_id', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.gonderi_id', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Id')
DBSetProp('GONDERIVIEW.gonderi_id', 'Field', 'DataType', "C(36)")
DBSetProp('GONDERIVIEW.gonderi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for GONDERIVIEW.gonderi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECDESCRIPT","Gonderi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECFRMCAPTN","Gönderi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECDLGCAPTN","Gönderi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECGRDCAPTN","Gönderi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECRPTCAPTN","Gönderi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFEMTOOLTIP","Gönderi ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFEMSTATUSTXT","Gönderi ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.gonderi_fk field.
DBSetProp('GONDERIVIEW.gonderi_fk', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.gonderi_fk', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.gonderi_fk', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Fk')
DBSetProp('GONDERIVIEW.gonderi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for GONDERIVIEW.gonderi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECDESCRIPT","Gonderi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECFRMCAPTN","Gönderi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECDLGCAPTN","Gönderi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECGRDCAPTN","Gönderi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECRPTCAPTN","Gönderi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFEMTOOLTIP","Gönderi FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFEMSTATUSTXT","Gönderi FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.muamele_id field.
DBSetProp('GONDERIVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Gonderi.Muamele_Id')
DBSetProp('GONDERIVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for GONDERIVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.gonderi_tipi field.
DBSetProp('GONDERIVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Tipi')
DBSetProp('GONDERIVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for GONDERIVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!gonderitipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECLUTAG","gonderi_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMLUFIELDS","gonderi_tipi, gonderi_kodu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Gonderitipilookupview.gonderi_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.gonderi_adi field.
DBSetProp('GONDERIVIEW.gonderi_adi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.gonderi_adi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.gonderi_adi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Adi')
DBSetProp('GONDERIVIEW.gonderi_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for GONDERIVIEW.gonderi_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECDESCRIPT","Gonderi Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECFRMCAPTN","Gönderi Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECDLGCAPTN","Gönderi Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECGRDCAPTN","Gönderi Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECRPTCAPTN","Gönderi Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFEMTOOLTIP","Gönderi Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.gonderi_tarihi field.
DBSetProp('GONDERIVIEW.gonderi_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.gonderi_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.gonderi_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Gonderi_Tarihi')
DBSetProp('GONDERIVIEW.gonderi_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for GONDERIVIEW.gonderi_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECDESCRIPT","Gonderi Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFECQFINDTAG","gonderitrh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.gonderi_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.muhatap_adi field.
DBSetProp('GONDERIVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Gonderi.Muhatap_Adi')
DBSetProp('GONDERIVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for GONDERIVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.muhatap_adresi field.
DBSetProp('GONDERIVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Gonderi.Muhatap_Adresi')
DBSetProp('GONDERIVIEW.muhatap_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for GONDERIVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.barkod field.
DBSetProp('GONDERIVIEW.barkod', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.barkod', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.barkod', 'Field', 'UpdateName', 'dbo.Gonderi.BarKod')
DBSetProp('GONDERIVIEW.barkod', 'Field', 'DataType', "C(13)")
*** DBCX Field Properties for GONDERIVIEW.barkod
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECDESCRIPT","Barkod Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECFRMCAPTN","Barkod") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECDLGCAPTN","Barkod") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECGRDCAPTN","Barkod") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECRPTCAPTN","Barkod") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFEMTOOLTIP","Barkod") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFEMSTATUSTXT","Barkod") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.barkod","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.sorgu_tarihi field.
DBSetProp('GONDERIVIEW.sorgu_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.sorgu_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.sorgu_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Sorgu_Tarihi')
DBSetProp('GONDERIVIEW.sorgu_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for GONDERIVIEW.sorgu_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECDESCRIPT","Sorgu Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECFRMCAPTN","Sorgu Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECDLGCAPTN","Sorgu Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECGRDCAPTN","Sorgu Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECRPTCAPTN","Sorgu Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFEMTOOLTIP","Sorgu Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFEMSTATUSTXT","Sorgu Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_tarihi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.sorgu_bilgisi field.
DBSetProp('GONDERIVIEW.sorgu_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.sorgu_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.sorgu_bilgisi', 'Field', 'UpdateName', 'dbo.Gonderi.Sorgu_Bilgisi')
DBSetProp('GONDERIVIEW.sorgu_bilgisi', 'Field', 'DataType', "M")
*** DBCX Field Properties for GONDERIVIEW.sorgu_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECDESCRIPT","Sorgu Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECFRMCAPTN","Sorgu Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECDLGCAPTN","Sorgu Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECGRDCAPTN","Sorgu Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECRPTCAPTN","Sorgu Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMTOOLTIP","Sorgu Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Sorgu Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sorgu_bilgisi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.sonuc_tarihi field.
DBSetProp('GONDERIVIEW.sonuc_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.sonuc_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.sonuc_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Tarihi')
DBSetProp('GONDERIVIEW.sonuc_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for GONDERIVIEW.sonuc_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECDESCRIPT","Sonuc Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECFRMCAPTN","Sonuç Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECDLGCAPTN","Sonuç Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECGRDCAPTN","Sonuç Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECRPTCAPTN","Sonuç Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFEMTOOLTIP","Sonuç Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFEMSTATUSTXT","Sonuç Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_tarihi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the GONDERIVIEW.sonuc_bilgisi field.
DBSetProp('GONDERIVIEW.sonuc_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERIVIEW.sonuc_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERIVIEW.sonuc_bilgisi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Bilgisi')
DBSetProp('GONDERIVIEW.sonuc_bilgisi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GONDERIVIEW.sonuc_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDESCRIPT","Sonuc Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECFRMCAPTN","Sonuç Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECDLGCAPTN","Sonuç Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECGRDCAPTN","Sonuç Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECRPTCAPTN","Sonuç Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMTOOLTIP","Sonuç Bilgisi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Sonuç Bilgisi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERIVIEW.sonuc_bilgisi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
