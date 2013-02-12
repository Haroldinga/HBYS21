***************** Begin View Definition HARCORANILISTVIEW ***************


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



CREATE SQL VIEW "HARCORANILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Harcorani.HarcOrani_Id,;
		Harcorani.Baslama_Tarihi,;
		Harcorani.Pesin_Harc,;
		Harcorani.Vekaletname_Harci,;
		Harcorani.Cezaevi_Harci,;
		Harcorani.Tebligat_Harci,;
		Harcorani.Dosya_Harci,;
		Harcorani.Evrak_Harci,;
		Harcorani.Icra_Basvuru_Harci,;
		Harcorani.Icra_Yerine_Getirme_Harci,;
		Harcorani.Haciz_Oncesi_Tahsil_Harci,;
		Harcorani.Haciz_Sonrasi_Tahsil_Harci,;
		Harcorani.Satis_Tahsil_Harci,;
		Harcorani.Maas_Haczi_Tahsil_Harci,;
		Harcorani.Takip_Feragat_Harci,;
		Harcorani.Gayrimenkul_Teslim_Harci,;
		Harcorani.Gayrimenkul_Tahliye_Harci,;
		Harcorani.Menkul_Teslim_Harci,;
		Harcorani.Menkul_Icra_Harci,;
		Harcorani.Sulh_Hukuk_Karar_Harci,;
		Harcorani.Sulh_Hukuk_Basvuru_Harci,;
		Harcorani.Ahm_Atm_Karar_Harci,;
		Harcorani.Ahm_Atm_Basvuru_Harci,;
		Harcorani.Maktu_Cezaevi_Harci;
	FROM dbo.HarcOrani Harcorani

DBSetProp('HARCORANILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('HARCORANILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('HARCORANILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HARCORANILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('HARCORANILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HARCORANILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HARCORANILISTVIEW', 'View', 'Tables', 'dbo.HarcOrani')
DBSetProp('HARCORANILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('HARCORANILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HARCORANILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HARCORANILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('HARCORANILISTVIEW', 'View', 'ParameterList', "vp_Baslama_Tarihi,'C'")
DBSetProp('HARCORANILISTVIEW', 'View', 'Comment', "")
DBSetProp('HARCORANILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HARCORANILISTVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for HARCORANILISTVIEW
	GoExplorer.odbcx.Validate("HARCORANILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW","VIEW",;
		"VFECDESCRIPT","Harcoranilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Baslama_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Baslama Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Baslama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Baslama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFENVPSIZE",8) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Baslama Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Baslama Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!harcoranilistview.basltarih
	GoExplorer.odbcx.AddViewIndex("hbysdata!harcoranilistview","basltarih","BASLAMA_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harcoranilistview.basltarih","INDEX",;
		"VFECDESCRIPT","Basltarih Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harcoranilistview.basltarih","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harcoranilistview.basltarih","INDEX",;
		"VFECTAGCAPTN","Baþlama Tarihi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harcoranilistview.basltarih","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for HARCORANILISTVIEW
*** Props for the HARCORANILISTVIEW.harcorani_id field.
DBSetProp('HARCORANILISTVIEW.harcorani_id', 'Field', 'KeyField', .T.)
DBSetProp('HARCORANILISTVIEW.harcorani_id', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.harcorani_id', 'Field', 'UpdateName', 'dbo.HarcOrani.HarcOrani_Id')
DBSetProp('HARCORANILISTVIEW.harcorani_id', 'Field', 'DataType', "C(36)")
DBSetProp('HARCORANILISTVIEW.harcorani_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HARCORANILISTVIEW.harcorani_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECDESCRIPT","Harcorani Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECFRMCAPTN","Harç Oraný ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECDLGCAPTN","Harç Oraný ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECGRDCAPTN","Harç Oraný ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECRPTCAPTN","Harç Oraný ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFEMTOOLTIP","Harç Oraný ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFEMSTATUSTXT","Harç Oraný ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.harcorani_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HARCORANILISTVIEW.baslama_tarihi field.
DBSetProp('HARCORANILISTVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.HarcOrani.Baslama_Tarihi')
DBSetProp('HARCORANILISTVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HARCORANILISTVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Baþlama Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Baþlama Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HARCORANILISTVIEW.pesin_harc field.
DBSetProp('HARCORANILISTVIEW.pesin_harc', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.pesin_harc', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.pesin_harc', 'Field', 'UpdateName', 'dbo.HarcOrani.Pesin_Harc')
DBSetProp('HARCORANILISTVIEW.pesin_harc', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.pesin_harc
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECDESCRIPT","Pesin Harc Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECFRMCAPTN","Peþin Harç") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECDLGCAPTN","Peþin Harç") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECGRDCAPTN","Peþin Harç") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECRPTCAPTN","Peþin Harç") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMTOOLTIP","Peþin Harç                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMSTATUSTXT","Peþin Harç                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.pesin_harc","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.vekaletname_harci field.
DBSetProp('HARCORANILISTVIEW.vekaletname_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.vekaletname_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.vekaletname_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Vekaletname_Harci')
DBSetProp('HARCORANILISTVIEW.vekaletname_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.vekaletname_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECDESCRIPT","Vekaletname Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECFRMCAPTN","Vekaletname Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECDLGCAPTN","Vekaletname Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECGRDCAPTN","Vekaletname Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECRPTCAPTN","Vekaletname Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMTOOLTIP","Vekaletname Harcý                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMSTATUSTXT","Vekaletname Harcý                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.vekaletname_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.cezaevi_harci field.
DBSetProp('HARCORANILISTVIEW.cezaevi_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.cezaevi_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.cezaevi_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Cezaevi_Harci')
DBSetProp('HARCORANILISTVIEW.cezaevi_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.cezaevi_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECDESCRIPT","Cezaevi Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECFRMCAPTN","Cezaevi Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECDLGCAPTN","Cezaevi Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECGRDCAPTN","Cezaevi Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECRPTCAPTN","Cezaevi Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMTOOLTIP","Cezaevi Harcý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMSTATUSTXT","Cezaevi Harcý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.cezaevi_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.tebligat_harci field.
DBSetProp('HARCORANILISTVIEW.tebligat_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.tebligat_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.tebligat_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Tebligat_Harci')
DBSetProp('HARCORANILISTVIEW.tebligat_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.tebligat_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECDESCRIPT","Tebligat Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECFRMCAPTN","Tebligat Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECDLGCAPTN","Tebligat Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECGRDCAPTN","Tebligat Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECRPTCAPTN","Tebligat Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMTOOLTIP","Tebligat Harcý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMSTATUSTXT","Tebligat Harcý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.tebligat_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.dosya_harci field.
DBSetProp('HARCORANILISTVIEW.dosya_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.dosya_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.dosya_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Dosya_Harci')
DBSetProp('HARCORANILISTVIEW.dosya_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.dosya_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECDESCRIPT","Dosya Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECFRMCAPTN","Dosya Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECDLGCAPTN","Dosya Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECGRDCAPTN","Dosya Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECRPTCAPTN","Dosya Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMTOOLTIP","Dosya Harcý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMSTATUSTXT","Dosya Harcý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.dosya_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.evrak_harci field.
DBSetProp('HARCORANILISTVIEW.evrak_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.evrak_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.evrak_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Evrak_Harci')
DBSetProp('HARCORANILISTVIEW.evrak_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.evrak_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECDESCRIPT","Evrak Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECFRMCAPTN","Evrak Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECDLGCAPTN","Evrak Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECGRDCAPTN","Evrak Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECRPTCAPTN","Evrak Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMTOOLTIP","Evrak Harcý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMSTATUSTXT","Evrak Harcý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.evrak_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.icra_basvuru_harci field.
DBSetProp('HARCORANILISTVIEW.icra_basvuru_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.icra_basvuru_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.icra_basvuru_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Icra_Basvuru_Harci')
DBSetProp('HARCORANILISTVIEW.icra_basvuru_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.icra_basvuru_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECDESCRIPT","Icra Basvuru Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECFRMCAPTN","Ýcra Baþvuru Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECDLGCAPTN","Ýcra Baþvuru Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECGRDCAPTN","Ýcra Baþvuru Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECRPTCAPTN","Ýcra Baþvuru Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMTOOLTIP","Ýcra Baþvuru Harcý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMSTATUSTXT","Ýcra Baþvuru Harcý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_basvuru_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.icra_yerine_getirme_harci field.
DBSetProp('HARCORANILISTVIEW.icra_yerine_getirme_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.icra_yerine_getirme_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.icra_yerine_getirme_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Icra_Yerine_Getirme_Harci')
DBSetProp('HARCORANILISTVIEW.icra_yerine_getirme_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.icra_yerine_getirme_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECDESCRIPT","Icra Yerine Getirme Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECFRMCAPTN","Ýcra Yerine Getirme Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECDLGCAPTN","Ýcra Yerine Getirme Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECGRDCAPTN","Ýcra Yerine Getirme Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECRPTCAPTN","Ýcra Yerine Getirme Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMTOOLTIP","Ýcra Yerine Getirme Harcý                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMSTATUSTXT","Ýcra Yerine Getirme Harcý                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.icra_yerine_getirme_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.haciz_oncesi_tahsil_harci field.
DBSetProp('HARCORANILISTVIEW.haciz_oncesi_tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.haciz_oncesi_tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.haciz_oncesi_tahsil_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Haciz_Oncesi_Tahsil_Harci')
DBSetProp('HARCORANILISTVIEW.haciz_oncesi_tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.haciz_oncesi_tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECDESCRIPT","Haciz Oncesi Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECFRMCAPTN","Haciz Öncesi Tahsil Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECDLGCAPTN","Haciz Öncesi Tahsil Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECGRDCAPTN","Haciz Öncesi Tahsil Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECRPTCAPTN","Haciz Öncesi Tahsil Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMTOOLTIP","Haciz Öncesi Tahsil Harcý                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","Haciz Öncesi Tahsil Harcý                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFENDISPORDER",11) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_oncesi_tahsil_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci field.
DBSetProp('HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Haciz_Sonrasi_Tahsil_Harci')
DBSetProp('HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECDESCRIPT","Haciz Sonrasi Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECFRMCAPTN","Haciz Sonrasý Tahsil Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECDLGCAPTN","Haciz Sonrasý Tahsil Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECGRDCAPTN","Haciz Sonrasý Tahsil Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECRPTCAPTN","Haciz Sonrasý Tahsil Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMTOOLTIP","Haciz Sonrasý Tahsil Harcý                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","Haciz Sonrasý Tahsil Harcý                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFENDISPORDER",12) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.haciz_sonrasi_tahsil_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.satis_tahsil_harci field.
DBSetProp('HARCORANILISTVIEW.satis_tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.satis_tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.satis_tahsil_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Satis_Tahsil_Harci')
DBSetProp('HARCORANILISTVIEW.satis_tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.satis_tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECDESCRIPT","Satis Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECFRMCAPTN","SatýþTahsil Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECDLGCAPTN","SatýþTahsil Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECGRDCAPTN","SatýþTahsil Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECRPTCAPTN","SatýþTahsil Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMTOOLTIP","SatýþTahsil Harcý                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","SatýþTahsil Harcý                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFENDISPORDER",13) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.satis_tahsil_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.maas_haczi_tahsil_harci field.
DBSetProp('HARCORANILISTVIEW.maas_haczi_tahsil_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.maas_haczi_tahsil_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.maas_haczi_tahsil_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Maas_Haczi_Tahsil_Harci')
DBSetProp('HARCORANILISTVIEW.maas_haczi_tahsil_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.maas_haczi_tahsil_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECDESCRIPT","Maas Haczi Tahsil Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECFRMCAPTN","Maaþ Haczi Tahsil Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECDLGCAPTN","Maaþ Haczi Tahsil Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECGRDCAPTN","Maaþ Haczi Tahsil Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECRPTCAPTN","Maaþ Haczi Tahsil Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMTOOLTIP","Maaþ Haczi Tahsil Harcý                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMSTATUSTXT","Maaþ Haczi Tahsil Harcý                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFENDISPORDER",14) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maas_haczi_tahsil_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.takip_feragat_harci field.
DBSetProp('HARCORANILISTVIEW.takip_feragat_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.takip_feragat_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.takip_feragat_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Takip_Feragat_Harci')
DBSetProp('HARCORANILISTVIEW.takip_feragat_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.takip_feragat_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECDESCRIPT","Takip Feragat Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECFRMCAPTN","Takip Feragat Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECDLGCAPTN","Takip Feragat Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECGRDCAPTN","Takip Feragat Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECRPTCAPTN","Takip Feragat Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMTOOLTIP","Takip Feragat Harcý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMSTATUSTXT","Takip Feragat Harcý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFENDISPORDER",15) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.takip_feragat_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.gayrimenkul_teslim_harci field.
DBSetProp('HARCORANILISTVIEW.gayrimenkul_teslim_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.gayrimenkul_teslim_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.gayrimenkul_teslim_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Gayrimenkul_Teslim_Harci')
DBSetProp('HARCORANILISTVIEW.gayrimenkul_teslim_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.gayrimenkul_teslim_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECDESCRIPT","Gayrimenkul Teslim Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECFRMCAPTN","Gayrimenkul Teslim Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECDLGCAPTN","Gayrimenkul Teslim Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECGRDCAPTN","Gayrimenkul Teslim Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECRPTCAPTN","Gayrimenkul Teslim Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMTOOLTIP","Gayrimenkul Teslim Harcý                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMSTATUSTXT","Gayrimenkul Teslim Harcý                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFENDISPORDER",16) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_teslim_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.gayrimenkul_tahliye_harci field.
DBSetProp('HARCORANILISTVIEW.gayrimenkul_tahliye_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.gayrimenkul_tahliye_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.gayrimenkul_tahliye_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Gayrimenkul_Tahliye_Harci')
DBSetProp('HARCORANILISTVIEW.gayrimenkul_tahliye_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.gayrimenkul_tahliye_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECDESCRIPT","Gayrimenkul Tahliye Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECFRMCAPTN","Gayrimenkul Tahliye Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECDLGCAPTN","Gayrimenkul Tahliye Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECGRDCAPTN","Gayrimenkul Tahliye Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECRPTCAPTN","Gayrimenkul Tahliye Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMTOOLTIP","Gayrimenkul Tahliye Harcý                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMSTATUSTXT","Gayrimenkul Tahliye Harcý                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.gayrimenkul_tahliye_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.menkul_teslim_harci field.
DBSetProp('HARCORANILISTVIEW.menkul_teslim_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.menkul_teslim_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.menkul_teslim_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Menkul_Teslim_Harci')
DBSetProp('HARCORANILISTVIEW.menkul_teslim_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.menkul_teslim_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECDESCRIPT","Menkul Teslim Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECFRMCAPTN","Menkul Teslim Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECDLGCAPTN","Menkul Teslim Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECGRDCAPTN","Menkul Teslim Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECRPTCAPTN","Menkul Teslim Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMTOOLTIP","Menkul Teslim Harcý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMSTATUSTXT","Menkul Teslim Harcý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFENDISPORDER",18) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_teslim_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.menkul_icra_harci field.
DBSetProp('HARCORANILISTVIEW.menkul_icra_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.menkul_icra_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.menkul_icra_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Menkul_Icra_Harci')
DBSetProp('HARCORANILISTVIEW.menkul_icra_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.menkul_icra_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECDESCRIPT","Menkul Icra Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECFRMCAPTN","Menkul Ýcra Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECDLGCAPTN","Menkul Ýcra Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECGRDCAPTN","Menkul Ýcra Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECRPTCAPTN","Menkul Ýcra Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMTOOLTIP","Menkul Ýcra Harcý                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMSTATUSTXT","Menkul Ýcra Harcý                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFENDISPORDER",19) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.menkul_icra_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the HARCORANILISTVIEW.sulh_hukuk_karar_harci field.
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_karar_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_karar_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_karar_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Sulh_Hukuk_Karar_Harci')
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_karar_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.sulh_hukuk_karar_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECDESCRIPT","Sulh Hukuk Karar Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECFRMCAPTN","Sulh Hukuk Karar Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECDLGCAPTN","Sulh Hukuk Karar Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECGRDCAPTN","Sulh Hukuk Karar Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECRPTCAPTN","Sulh Hukuk Karar Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMTOOLTIP","Sulh Hukuk Karar Harcý                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMSTATUSTXT","Sulh Hukuk Karar Harcý                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFENDISPORDER",20) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_karar_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.sulh_hukuk_basvuru_harci field.
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_basvuru_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_basvuru_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_basvuru_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Sulh_Hukuk_Basvuru_Harci')
DBSetProp('HARCORANILISTVIEW.sulh_hukuk_basvuru_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.sulh_hukuk_basvuru_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECDESCRIPT","Sulh Hukuk Basvuru Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECFRMCAPTN","Sulh Hukuk Baþvuru Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECDLGCAPTN","Sulh Hukuk Baþvuru Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECGRDCAPTN","Sulh Hukuk Baþvuru Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECRPTCAPTN","Sulh Hukuk Baþvuru Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMTOOLTIP","Sulh Hukuk Baþvuru Harcý                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMSTATUSTXT","Sulh Hukuk Baþvuru Harcý                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFENDISPORDER",21) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.sulh_hukuk_basvuru_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.ahm_atm_karar_harci field.
DBSetProp('HARCORANILISTVIEW.ahm_atm_karar_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.ahm_atm_karar_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.ahm_atm_karar_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Ahm_Atm_Karar_Harci')
DBSetProp('HARCORANILISTVIEW.ahm_atm_karar_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.ahm_atm_karar_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECDESCRIPT","Ahm Atm Karar Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECFRMCAPTN","Ahm Atm Karar Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECDLGCAPTN","Ahm Atm Karar Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECGRDCAPTN","Ahm Atm Karar Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECRPTCAPTN","Ahm Atm Karar Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMTOOLTIP","Ahm Atm Karar Harcý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMSTATUSTXT","Ahm Atm Karar Harcý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFENDISPORDER",22) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_karar_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.ahm_atm_basvuru_harci field.
DBSetProp('HARCORANILISTVIEW.ahm_atm_basvuru_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.ahm_atm_basvuru_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.ahm_atm_basvuru_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Ahm_Atm_Basvuru_Harci')
DBSetProp('HARCORANILISTVIEW.ahm_atm_basvuru_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.ahm_atm_basvuru_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECDESCRIPT","Ahm Atm Basvuru Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECFRMCAPTN","Ahm Atm Baþvuru Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECDLGCAPTN","Ahm Atm Baþvuru Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECGRDCAPTN","Ahm Atm Baþvuru Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECRPTCAPTN","Ahm Atm Baþvuru Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMTOOLTIP","Ahm Atm Baþvuru Harcý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMSTATUSTXT","Ahm Atm Baþvuru Harcý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFENDISPORDER",23) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.ahm_atm_basvuru_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCORANILISTVIEW.maktu_cezaevi_harci field.
DBSetProp('HARCORANILISTVIEW.maktu_cezaevi_harci', 'Field', 'KeyField', .F.)
DBSetProp('HARCORANILISTVIEW.maktu_cezaevi_harci', 'Field', 'Updatable', .T.)
DBSetProp('HARCORANILISTVIEW.maktu_cezaevi_harci', 'Field', 'UpdateName', 'dbo.HarcOrani.Maktu_Cezaevi_Harci')
DBSetProp('HARCORANILISTVIEW.maktu_cezaevi_harci', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCORANILISTVIEW.maktu_cezaevi_harci
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECDESCRIPT","Maktu Cezaevi Harci Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECFRMCAPTN","Maktu Cezaevi Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECDLGCAPTN","Maktu Cezaevi Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECGRDCAPTN","Maktu Cezaevi Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECRPTCAPTN","Maktu Cezaevi Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMTOOLTIP","Maktu Cezaevi Harcý                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMSTATUSTXT","Maktu Cezaevi Harcý                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFENDISPORDER",24) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCORANILISTVIEW.maktu_cezaevi_harci","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
