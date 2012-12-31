***************** Begin View Definition HACIZVIEW ***************


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



CREATE SQL VIEW "HACIZVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Haciz.Haciz_Id,;
		Haciz.Haciz_Fk,;
		Haciz.Borclu_Id,;
		Haciz.Borclu_Adi,;
		Haciz.Haciz_Tipi,;
		Haciz.Talimat_Tarihi,;
		Haciz.Haciz_Tarihi,;
		Haciz.Haczedilen_Tipi,;
		Haciz.Haciz_Bedeli,;
		Haciz.Teslim_Yeri,;
		Haciz.Personel_Id,;
		Haciz.Personel_Adi,;
		Haciz.Il_Adi,;
		Haciz.Aciklama;
	FROM dbo.Haciz Haciz

DBSetProp('HACIZVIEW', 'View', 'UpdateType', 1)
DBSetProp('HACIZVIEW', 'View', 'WhereType', 3)
DBSetProp('HACIZVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HACIZVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('HACIZVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HACIZVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HACIZVIEW', 'View', 'Tables', 'dbo.Haciz')
DBSetProp('HACIZVIEW', 'View', 'Prepared', .F.)
DBSetProp('HACIZVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HACIZVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HACIZVIEW', 'View', 'FetchSize', -1)
DBSetProp('HACIZVIEW', 'View', 'ParameterList', "vp_Haciz_Fk,'C'")
DBSetProp('HACIZVIEW', 'View', 'Comment', "")
DBSetProp('HACIZVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HACIZVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HACIZVIEW
	GoExplorer.odbcx.Validate("HACIZVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW","VIEW",;
		"VFECDESCRIPT","Hacizview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Haciz_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Haciz Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECFRMCAPTN","Haciz Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECDLGCAPTN","Haciz Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMTOOLTIP","Haciz Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Haciz Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMCOMPARETO","Haciz_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.vp_Haciz_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for HACIZVIEW
*** Props for the HACIZVIEW.haciz_id field.
DBSetProp('HACIZVIEW.haciz_id', 'Field', 'KeyField', .T.)
DBSetProp('HACIZVIEW.haciz_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haciz_id', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Id')
DBSetProp('HACIZVIEW.haciz_id', 'Field', 'DataType', "C(36)")
DBSetProp('HACIZVIEW.haciz_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HACIZVIEW.haciz_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECDESCRIPT","Haciz Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECFRMCAPTN","Haciz ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECDLGCAPTN","Haciz ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECGRDCAPTN","Haciz ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECRPTCAPTN","Haciz ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFEMTOOLTIP","Haciz ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFEMSTATUSTXT","Haciz ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.haciz_fk field.
DBSetProp('HACIZVIEW.haciz_fk', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.haciz_fk', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haciz_fk', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Fk')
DBSetProp('HACIZVIEW.haciz_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEW.haciz_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECDESCRIPT","Haciz Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECFRMCAPTN","Haciz FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECDLGCAPTN","Haciz FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECGRDCAPTN","Haciz FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECRPTCAPTN","Haciz FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFEMTOOLTIP","Haciz FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFEMSTATUSTXT","Haciz FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.borclu_id field.
DBSetProp('HACIZVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Haciz.Borclu_Id')
DBSetProp('HACIZVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the HACIZVIEW.borclu_adi field.
DBSetProp('HACIZVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Haciz.Borclu_Adi')
DBSetProp('HACIZVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HACIZVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.haciz_tipi field.
DBSetProp('HACIZVIEW.haciz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.haciz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haciz_tipi', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Tipi')
DBSetProp('HACIZVIEW.haciz_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEW.haciz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECDESCRIPT","Haciz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECFRMCAPTN","Haciz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECDLGCAPTN","Haciz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECGRDCAPTN","Haciz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECRPTCAPTN","Haciz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMTOOLTIP","Haciz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!haciztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECLUTAG","haciz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMLUFIELDS","haciz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMLUUPDTEXP","Haciztipilookupview.haciz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.talimat_tarihi field.
DBSetProp('HACIZVIEW.talimat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.talimat_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.talimat_tarihi', 'Field', 'UpdateName', 'dbo.Haciz.Talimat_Tarihi')
DBSetProp('HACIZVIEW.talimat_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HACIZVIEW.talimat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECDESCRIPT","Talimat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECFRMCAPTN","Talimat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECDLGCAPTN","Talimat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECGRDCAPTN","Talimat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECRPTCAPTN","Talimat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFEMTOOLTIP","Talimat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Talimat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.talimat_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.haciz_tarihi field.
DBSetProp('HACIZVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Tarihi')
DBSetProp('HACIZVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HACIZVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.haczedilen_tipi field.
DBSetProp('HACIZVIEW.haczedilen_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.haczedilen_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haczedilen_tipi', 'Field', 'UpdateName', 'dbo.Haciz.Haczedilen_Tipi')
DBSetProp('HACIZVIEW.haczedilen_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEW.haczedilen_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECDESCRIPT","Haczedilen Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECFRMCAPTN","Haczedilen Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECDLGCAPTN","Haczedilen Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECGRDCAPTN","Haczedilen Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECRPTCAPTN","Haczedilen Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFEMTOOLTIP","Haczedilen Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFEMSTATUSTXT","Haczedilen Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haczedilen_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.haciz_bedeli field.
DBSetProp('HACIZVIEW.haciz_bedeli', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.haciz_bedeli', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.haciz_bedeli', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Bedeli')
DBSetProp('HACIZVIEW.haciz_bedeli', 'Field', 'InputMask', "999,999,999,999")
DBSetProp('HACIZVIEW.haciz_bedeli', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HACIZVIEW.haciz_bedeli
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECDESCRIPT","Haciz Bedeli Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECFRMCAPTN","Haciz Bedeli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECDLGCAPTN","Haciz Bedeli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECGRDCAPTN","Haciz Bedeli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECRPTCAPTN","Haciz Bedeli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMTOOLTIP","Haciz Bedeli") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMSTATUSTXT","Haciz Bedeli") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.haciz_bedeli","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the HACIZVIEW.teslim_yeri field.
DBSetProp('HACIZVIEW.teslim_yeri', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.teslim_yeri', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.teslim_yeri', 'Field', 'UpdateName', 'dbo.Haciz.Teslim_Yeri')
DBSetProp('HACIZVIEW.teslim_yeri', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEW.teslim_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECDESCRIPT","Teslim Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECFRMCAPTN","Teslim Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECDLGCAPTN","Teslim Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECGRDCAPTN","Teslim Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECRPTCAPTN","Teslim Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFEMTOOLTIP","Teslim Yeri") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFEMSTATUSTXT","Teslim Yeri") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFEMINLIST",'"Borçlu","Yed-i Emin","Bayi","Diðer"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.teslim_yeri","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.personel_id field.
DBSetProp('HACIZVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Haciz.Personel_Id')
DBSetProp('HACIZVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the HACIZVIEW.personel_adi field.
DBSetProp('HACIZVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Haciz.Personel_Adi')
DBSetProp('HACIZVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HACIZVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.il_adi field.
DBSetProp('HACIZVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Haciz.Il_Adi')
DBSetProp('HACIZVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Þehir") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Þehir") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Þehir") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Þehir") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Þehir                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Þehir                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECADDFORM","ILLOOKUPVIEWFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.il_adi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the HACIZVIEW.aciklama field.
DBSetProp('HACIZVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Haciz.Aciklama')
DBSetProp('HACIZVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for HACIZVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEW.aciklama","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
