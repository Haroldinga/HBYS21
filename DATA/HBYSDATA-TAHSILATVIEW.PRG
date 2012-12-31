***************** Begin View Definition TAHSILATVIEW ***************


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



CREATE SQL VIEW "TAHSILATVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Tahsilat.Tahsilat_Id,;
		Tahsilat.Tahsilat_Fk,;
		Tahsilat.Borclu_Id,;
		Tahsilat.Borclu_Adi,;
		Tahsilat.Tahsilat_Tipi,;
		Tahsilat.Tahsilat_Tarihi,;
		Tahsilat.Tahsilat_Miktari,;
		Tahsilat.Personel_Id,;
		Tahsilat.Personel_Adi,;
		Tahsilat.Reddiyat_Tarihi,;
		Tahsilat.Reddiyat_Miktari,;
		Tahsilat.Aciklama,;
		Tahsilat.Aciklama AS aciklama1;
	FROM dbo.Tahsilat Tahsilat

DBSetProp('TAHSILATVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAHSILATVIEW', 'View', 'WhereType', 3)
DBSetProp('TAHSILATVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAHSILATVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TAHSILATVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAHSILATVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAHSILATVIEW', 'View', 'Tables', 'dbo.Tahsilat')
DBSetProp('TAHSILATVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAHSILATVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAHSILATVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAHSILATVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAHSILATVIEW', 'View', 'ParameterList', "vp_Tahsilat_Fk,'C'")
DBSetProp('TAHSILATVIEW', 'View', 'Comment', "")
DBSetProp('TAHSILATVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAHSILATVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAHSILATVIEW
	GoExplorer.odbcx.Validate("TAHSILATVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW","VIEW",;
		"VFECDESCRIPT","Tahsilatview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.vp_Tahsilat_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!tahsilatview.tahstarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!tahsilatview","tahstarh","TAHSILAT_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tahsilatview.tahstarh","INDEX",;
		"VFECDESCRIPT","Tahstarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tahsilatview.tahstarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tahsilatview.tahstarh","INDEX",;
		"VFECTAGCAPTN","Tahstarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tahsilatview.tahstarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for TAHSILATVIEW
*** Props for the TAHSILATVIEW.tahsilat_id field.
DBSetProp('TAHSILATVIEW.tahsilat_id', 'Field', 'KeyField', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_id', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_id', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Id')
DBSetProp('TAHSILATVIEW.tahsilat_id', 'Field', 'DataType', "C(36)")
DBSetProp('TAHSILATVIEW.tahsilat_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TAHSILATVIEW.tahsilat_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECDESCRIPT","Tahsilat Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECFRMCAPTN","Tahsilat ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECDLGCAPTN","Tahsilat ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECGRDCAPTN","Tahsilat ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECRPTCAPTN","Tahsilat ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFEMTOOLTIP","Tahsilat ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFEMSTATUSTXT","Tahsilat ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.tahsilat_fk field.
DBSetProp('TAHSILATVIEW.tahsilat_fk', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.tahsilat_fk', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_fk', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Fk')
DBSetProp('TAHSILATVIEW.tahsilat_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATVIEW.tahsilat_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECDESCRIPT","Tahsilat Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECFRMCAPTN","Tahsilat FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECDLGCAPTN","Tahsilat FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECGRDCAPTN","Tahsilat FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECRPTCAPTN","Tahsilat FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFEMTOOLTIP","Tahsilat FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFEMSTATUSTXT","Tahsilat FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.borclu_id field.
DBSetProp('TAHSILATVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Tahsilat.Borclu_Id')
DBSetProp('TAHSILATVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the TAHSILATVIEW.borclu_adi field.
DBSetProp('TAHSILATVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Tahsilat.Borclu_Adi')
DBSetProp('TAHSILATVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.tahsilat_tipi field.
DBSetProp('TAHSILATVIEW.tahsilat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.tahsilat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_tipi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tipi')
DBSetProp('TAHSILATVIEW.tahsilat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATVIEW.tahsilat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!tahsilattipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECLUTAG","tahsilat_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMLUFIELDS","tahsilat_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMLUUPDTEXP","Tahsilattipilookupview.tahsilat_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.tahsilat_tarihi field.
DBSetProp('TAHSILATVIEW.tahsilat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.tahsilat_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tarihi')
DBSetProp('TAHSILATVIEW.tahsilat_tarihi', 'Field', 'DataType', "D")
DBSetProp('TAHSILATVIEW.tahsilat_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for TAHSILATVIEW.tahsilat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECQFINDTAG","tahstarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the TAHSILATVIEW.tahsilat_miktari field.
DBSetProp('TAHSILATVIEW.tahsilat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.tahsilat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.tahsilat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('TAHSILATVIEW.tahsilat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TAHSILATVIEW.tahsilat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECDESCRIPT","Tahsilat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMFORMAT","KRZ") &&Format
ENDIF
 
*** Props for the TAHSILATVIEW.personel_id field.
DBSetProp('TAHSILATVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Tahsilat.Personel_Id')
DBSetProp('TAHSILATVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the TAHSILATVIEW.personel_adi field.
DBSetProp('TAHSILATVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Tahsilat.Personel_Adi')
DBSetProp('TAHSILATVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.reddiyat_tarihi field.
DBSetProp('TAHSILATVIEW.reddiyat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.reddiyat_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.reddiyat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Reddiyat_Tarihi')
DBSetProp('TAHSILATVIEW.reddiyat_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TAHSILATVIEW.reddiyat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECDESCRIPT","Reddiyat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECFRMCAPTN","Reddiyat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECDLGCAPTN","Reddiyat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECGRDCAPTN","Reddiyat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECRPTCAPTN","Reddiyat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFEMTOOLTIP","Reddiyat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Reddiyat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.reddiyat_miktari field.
DBSetProp('TAHSILATVIEW.reddiyat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.reddiyat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.reddiyat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Reddiyat_Miktari')
DBSetProp('TAHSILATVIEW.reddiyat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TAHSILATVIEW.reddiyat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECDESCRIPT","Reddiyat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECFRMCAPTN","Reddiyat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECDLGCAPTN","Reddiyat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECGRDCAPTN","Reddiyat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECRPTCAPTN","Reddiyat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMTOOLTIP","Reddiyat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMSTATUSTXT","Reddiyat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.reddiyat_miktari","FIELD",;
		"VFEMFORMAT","KRZ") &&Format
ENDIF
 
*** Props for the TAHSILATVIEW.aciklama field.
DBSetProp('TAHSILATVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Tahsilat.Aciklama')
DBSetProp('TAHSILATVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for TAHSILATVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATVIEW.aciklama1 field.
DBSetProp('TAHSILATVIEW.aciklama1', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATVIEW.aciklama1', 'Field', 'Updatable', .F.)
DBSetProp('TAHSILATVIEW.aciklama1', 'Field', 'UpdateName', 'dbo.Tahsilat.Aciklama')
DBSetProp('TAHSILATVIEW.aciklama1', 'Field', 'DataType', "C(253)")
*** DBCX Field Properties for TAHSILATVIEW.aciklama1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECDESCRIPT","Aciklama1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATVIEW.aciklama1","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
