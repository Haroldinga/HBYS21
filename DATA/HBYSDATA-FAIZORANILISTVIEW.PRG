***************** Begin View Definition FAIZORANILISTVIEW ***************


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



CREATE SQL VIEW "FAIZORANILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Faizorani.FaizOrani_Id,;
		Faizorani.FaizOrani_Fk,;
		Faizorani.Dosya_Tipi,;
		Faizorani.Takip_Tipi,;
		Faizorani.Baslama_Tarihi,;
		Faizorani.Gecikme_Faizi,;
		Faizorani.Temerrut_Faizi,;
		Faizorani.Takip_Faizi,;
		Faizorani.Uygulama_Tipi,;
		Faizorani.Yillik_Gun_Sayisi;
	FROM dbo.FaizOrani Faizorani

DBSetProp('FAIZORANILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('FAIZORANILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('FAIZORANILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('FAIZORANILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('FAIZORANILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('FAIZORANILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('FAIZORANILISTVIEW', 'View', 'Tables', 'dbo.FaizOrani')
DBSetProp('FAIZORANILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('FAIZORANILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('FAIZORANILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('FAIZORANILISTVIEW', 'View', 'FetchSize', 100)
DBSetProp('FAIZORANILISTVIEW', 'View', 'ParameterList', "vp_FaizOrani_Fk,'C';vp_Dosya_Tipi,'C';vp_Takip_Tipi,'C'")
DBSetProp('FAIZORANILISTVIEW', 'View', 'Comment', "")
DBSetProp('FAIZORANILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('FAIZORANILISTVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for FAIZORANILISTVIEW
	GoExplorer.odbcx.Validate("FAIZORANILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW","VIEW",;
		"VFECDESCRIPT","Faizoranilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_FaizOrani_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Faizorani Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECFRMCAPTN","Faiz Oraný FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECDLGCAPTN","Faiz Oraný FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFEMTOOLTIP","Faiz Oraný FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Faiz Oraný FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_FaizOrani_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!faizoranilistview.basltarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!faizoranilistview","basltarh","BASLAMA_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faizoranilistview.basltarh","INDEX",;
		"VFECDESCRIPT","Basltarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faizoranilistview.basltarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faizoranilistview.basltarh","INDEX",;
		"VFECTAGCAPTN","Basltarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faizoranilistview.basltarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for FAIZORANILISTVIEW
*** Props for the FAIZORANILISTVIEW.faizorani_id field.
DBSetProp('FAIZORANILISTVIEW.faizorani_id', 'Field', 'KeyField', .T.)
DBSetProp('FAIZORANILISTVIEW.faizorani_id', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.faizorani_id', 'Field', 'UpdateName', 'dbo.FaizOrani.FaizOrani_Id')
DBSetProp('FAIZORANILISTVIEW.faizorani_id', 'Field', 'DataType', "C(36)")
DBSetProp('FAIZORANILISTVIEW.faizorani_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for FAIZORANILISTVIEW.faizorani_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECDESCRIPT","Faizorani Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECFRMCAPTN","Faiz Oraný ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECDLGCAPTN","Faiz Oraný ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECGRDCAPTN","Faiz Oraný ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECRPTCAPTN","Faiz Oraný ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFEMTOOLTIP","Faiz Oraný ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFEMSTATUSTXT","Faiz Oraný ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the FAIZORANILISTVIEW.faizorani_fk field.
DBSetProp('FAIZORANILISTVIEW.faizorani_fk', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.faizorani_fk', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.faizorani_fk', 'Field', 'UpdateName', 'dbo.FaizOrani.FaizOrani_Fk')
DBSetProp('FAIZORANILISTVIEW.faizorani_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for FAIZORANILISTVIEW.faizorani_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECDESCRIPT","Faizorani Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECFRMCAPTN","Faiz Oraný FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECDLGCAPTN","Faiz Oraný FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECGRDCAPTN","Faiz Oraný FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECRPTCAPTN","Faiz Oraný FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFEMTOOLTIP","Faiz Oraný FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFEMSTATUSTXT","Faiz Oraný FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.faizorani_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the FAIZORANILISTVIEW.dosya_tipi field.
DBSetProp('FAIZORANILISTVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.FaizOrani.Dosya_Tipi')
DBSetProp('FAIZORANILISTVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for FAIZORANILISTVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the FAIZORANILISTVIEW.takip_tipi field.
DBSetProp('FAIZORANILISTVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.FaizOrani.Takip_Tipi')
DBSetProp('FAIZORANILISTVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for FAIZORANILISTVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the FAIZORANILISTVIEW.baslama_tarihi field.
DBSetProp('FAIZORANILISTVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.FaizOrani.Baslama_Tarihi')
DBSetProp('FAIZORANILISTVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for FAIZORANILISTVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Baþlama Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Baþlama Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFECQFINDTAG","basltarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the FAIZORANILISTVIEW.gecikme_faizi field.
DBSetProp('FAIZORANILISTVIEW.gecikme_faizi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.gecikme_faizi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.gecikme_faizi', 'Field', 'UpdateName', 'dbo.FaizOrani.Gecikme_Faizi')
DBSetProp('FAIZORANILISTVIEW.gecikme_faizi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for FAIZORANILISTVIEW.gecikme_faizi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi (%)") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi (%)") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi (%)") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi (%)") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi (%)                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi (%)                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMINPUTMASK","999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.gecikme_faizi","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the FAIZORANILISTVIEW.temerrut_faizi field.
DBSetProp('FAIZORANILISTVIEW.temerrut_faizi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.temerrut_faizi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.temerrut_faizi', 'Field', 'UpdateName', 'dbo.FaizOrani.Temerrut_Faizi')
DBSetProp('FAIZORANILISTVIEW.temerrut_faizi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for FAIZORANILISTVIEW.temerrut_faizi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi (%)") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi (%)") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi (%)") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi (%)") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi (%)                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi (%)                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMINPUTMASK","999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.temerrut_faizi","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the FAIZORANILISTVIEW.takip_faizi field.
DBSetProp('FAIZORANILISTVIEW.takip_faizi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.takip_faizi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.takip_faizi', 'Field', 'UpdateName', 'dbo.FaizOrani.Takip_Faizi')
DBSetProp('FAIZORANILISTVIEW.takip_faizi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for FAIZORANILISTVIEW.takip_faizi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECDESCRIPT","Takip Faizi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECFRMCAPTN","Takip Faizi (%)") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECDLGCAPTN","Takip Faizi (%)") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECGRDCAPTN","Takip Faizi (%)") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECRPTCAPTN","Takip Faizi (%)") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMTOOLTIP","Takip Faizi (%)                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi (%)                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMINPUTMASK","999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.takip_faizi","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the FAIZORANILISTVIEW.uygulama_tipi field.
DBSetProp('FAIZORANILISTVIEW.uygulama_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.uygulama_tipi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.uygulama_tipi', 'Field', 'UpdateName', 'dbo.FaizOrani.Uygulama_Tipi')
DBSetProp('FAIZORANILISTVIEW.uygulama_tipi', 'Field', 'DataType', "C(6)")
DBSetProp('FAIZORANILISTVIEW.uygulama_tipi', 'Field', 'DefaultValue', "'Yýllýk'")
*** DBCX Field Properties for FAIZORANILISTVIEW.uygulama_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDESCRIPT","Uygulama Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECGRDCAPTN","Uygulama Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECRPTCAPTN","Uygulama Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMINLIST",'"Günlük","Aylýk","Yýllýk"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the FAIZORANILISTVIEW.yillik_gun_sayisi field.
DBSetProp('FAIZORANILISTVIEW.yillik_gun_sayisi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZORANILISTVIEW.yillik_gun_sayisi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZORANILISTVIEW.yillik_gun_sayisi', 'Field', 'UpdateName', 'dbo.FaizOrani.Yillik_Gun_Sayisi')
DBSetProp('FAIZORANILISTVIEW.yillik_gun_sayisi', 'Field', 'DataType', "I")
DBSetProp('FAIZORANILISTVIEW.yillik_gun_sayisi', 'Field', 'DefaultValue', "365")
*** DBCX Field Properties for FAIZORANILISTVIEW.yillik_gun_sayisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECDESCRIPT","Yillik Gun Sayisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECFRMCAPTN","Yýllýk Gün Sayýsý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECDLGCAPTN","Yýllýk Gün Sayýsý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECGRDCAPTN","Yýllýk Gün Sayýsý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECRPTCAPTN","Yýllýk Gün Sayýsý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMTOOLTIP","Yýllýk Gün Sayýsý                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMSTATUSTXT","Yýllýk Gün Sayýsý                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZORANILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
