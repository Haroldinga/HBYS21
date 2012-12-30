***************** Begin View Definition ALACAKVIEW ***************


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



CREATE SQL VIEW "ALACAKVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Alacak.Alacak_Id,;
		Alacak.Alacak_Fk,;
		Alacak.Belge_Tipi,;
		Alacak.Belge_Statusu,;
		Alacak.Doviz_Tipi,;
		Alacak.Doviz_Kuru,;
		Alacak.Faiz_Tipi,;
		Alacak.Tanzim_Tarihi,;
		Alacak.Vade_Tarihi,;
		Alacak.Ihtarname_Tarihi,;
		Alacak.Belge_Miktari,;
		Alacak.Odenen_Miktar,;
		Alacak.Aciklama;
	FROM dbo.Alacak Alacak

DBSetProp('ALACAKVIEW', 'View', 'UpdateType', 1)
DBSetProp('ALACAKVIEW', 'View', 'WhereType', 3)
DBSetProp('ALACAKVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ALACAKVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ALACAKVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ALACAKVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ALACAKVIEW', 'View', 'Tables', 'dbo.Alacak')
DBSetProp('ALACAKVIEW', 'View', 'Prepared', .F.)
DBSetProp('ALACAKVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ALACAKVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ALACAKVIEW', 'View', 'FetchSize', -1)
DBSetProp('ALACAKVIEW', 'View', 'ParameterList', "vp_Alacak_Fk,'C'")
DBSetProp('ALACAKVIEW', 'View', 'Comment', "")
DBSetProp('ALACAKVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ALACAKVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ALACAKVIEW
	GoExplorer.odbcx.Validate("ALACAKVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW","VIEW",;
		"VFECDESCRIPT","Alacakview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Alacak_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Alacak Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECFRMCAPTN","Alacak Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECDLGCAPTN","Alacak Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMTOOLTIP","Alacak Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Alacak Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vp_Alacak_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ALACAKVIEW
*** Props for the ALACAKVIEW.alacak_id field.
DBSetProp('ALACAKVIEW.alacak_id', 'Field', 'KeyField', .T.)
DBSetProp('ALACAKVIEW.alacak_id', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.alacak_id', 'Field', 'UpdateName', 'dbo.Alacak.Alacak_Id')
DBSetProp('ALACAKVIEW.alacak_id', 'Field', 'DataType', "C(36)")
DBSetProp('ALACAKVIEW.alacak_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ALACAKVIEW.alacak_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECDESCRIPT","Alacak Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECFRMCAPTN","Alacak ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECDLGCAPTN","Alacak ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECGRDCAPTN","Alacak ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECRPTCAPTN","Alacak ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFEMTOOLTIP","Alacak ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFEMSTATUSTXT","Alacak ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.alacak_fk field.
DBSetProp('ALACAKVIEW.alacak_fk', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.alacak_fk', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.alacak_fk', 'Field', 'UpdateName', 'dbo.Alacak.Alacak_Fk')
DBSetProp('ALACAKVIEW.alacak_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ALACAKVIEW.alacak_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECDESCRIPT","Alacak Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECFRMCAPTN","Alacak FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECDLGCAPTN","Alacak FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECGRDCAPTN","Alacak FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECRPTCAPTN","Alacak FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFEMTOOLTIP","Alacak FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFEMSTATUSTXT","Alacak FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.alacak_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.belge_tipi field.
DBSetProp('ALACAKVIEW.belge_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.belge_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.belge_tipi', 'Field', 'UpdateName', 'dbo.Alacak.Belge_Tipi')
DBSetProp('ALACAKVIEW.belge_tipi', 'Field', 'DataType', "C(10)")
DBSetProp('ALACAKVIEW.belge_tipi', 'Field', 'DefaultValue', "'Diðer'")
*** DBCX Field Properties for ALACAKVIEW.belge_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECDESCRIPT","Belge Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECFRMCAPTN","Belge Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECDLGCAPTN","Belge Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECGRDCAPTN","Belge Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECRPTCAPTN","Belge Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFEMTOOLTIP","Belge Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFEMSTATUSTXT","Belge Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFEMINLIST",'"Çek","Senet","Sözleþme","Diðer"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.belge_statusu field.
DBSetProp('ALACAKVIEW.belge_statusu', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.belge_statusu', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.belge_statusu', 'Field', 'UpdateName', 'dbo.Alacak.Belge_Statusu')
DBSetProp('ALACAKVIEW.belge_statusu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for ALACAKVIEW.belge_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECDESCRIPT","Belge Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECFRMCAPTN","Belge Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECDLGCAPTN","Belge Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECGRDCAPTN","Belge Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECRPTCAPTN","Belge Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFEMTOOLTIP","Belge Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFEMSTATUSTXT","Belge Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_statusu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.doviz_tipi field.
DBSetProp('ALACAKVIEW.doviz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.doviz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.doviz_tipi', 'Field', 'UpdateName', 'dbo.Alacak.Doviz_Tipi')
DBSetProp('ALACAKVIEW.doviz_tipi', 'Field', 'DataType', "C(3)")
DBSetProp('ALACAKVIEW.doviz_tipi', 'Field', 'DefaultValue', "'TL'")
*** DBCX Field Properties for ALACAKVIEW.doviz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECDESCRIPT","Doviz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECFRMCAPTN","Döviz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECDLGCAPTN","Döviz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECGRDCAPTN","Döviz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECRPTCAPTN","Döviz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMTOOLTIP","Döviz Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMSTATUSTXT","Döviz Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!doviztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECLUTAG","doviz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMLUFIELDS","doviz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMLUUPDTEXP","Doviztipilookupview.doviz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.doviz_kuru field.
DBSetProp('ALACAKVIEW.doviz_kuru', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.doviz_kuru', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.doviz_kuru', 'Field', 'UpdateName', 'dbo.Alacak.Doviz_Kuru')
DBSetProp('ALACAKVIEW.doviz_kuru', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ALACAKVIEW.doviz_kuru
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECDESCRIPT","Doviz Kuru Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECFRMCAPTN","Döviz Kuru") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECDLGCAPTN","Döviz Kuru") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECGRDCAPTN","Döviz Kuru") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECRPTCAPTN","Döviz Kuru") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFEMTOOLTIP","Döviz Kuru                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFEMSTATUSTXT","Döviz Kuru                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.doviz_kuru","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.faiz_tipi field.
DBSetProp('ALACAKVIEW.faiz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.faiz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.faiz_tipi', 'Field', 'UpdateName', 'dbo.Alacak.Faiz_Tipi')
DBSetProp('ALACAKVIEW.faiz_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('ALACAKVIEW.faiz_tipi', 'Field', 'DefaultValue', "'Dosya Tipi Faiz Oraný'")
*** DBCX Field Properties for ALACAKVIEW.faiz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECDESCRIPT","Faiz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECFRMCAPTN","Faiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECDLGCAPTN","Faiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECGRDCAPTN","Faiz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECRPTCAPTN","Faiz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMTOOLTIP","Faiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMSTATUSTXT","Faiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!faiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECLUTAG","faiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMLUFIELDS","faiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMLUUPDTEXP","Faiztipilookupview.faiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.faiz_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.tanzim_tarihi field.
DBSetProp('ALACAKVIEW.tanzim_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.tanzim_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.tanzim_tarihi', 'Field', 'UpdateName', 'dbo.Alacak.Tanzim_Tarihi')
DBSetProp('ALACAKVIEW.tanzim_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ALACAKVIEW.tanzim_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECDESCRIPT","Tanzim Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECFRMCAPTN","Tanzim Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECDLGCAPTN","Tanzim Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECGRDCAPTN","Tanzim Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECRPTCAPTN","Tanzim Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFEMTOOLTIP","Tanzim Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tanzim Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.tanzim_tarihi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.vade_tarihi field.
DBSetProp('ALACAKVIEW.vade_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.vade_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.vade_tarihi', 'Field', 'UpdateName', 'dbo.Alacak.Vade_Tarihi')
DBSetProp('ALACAKVIEW.vade_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ALACAKVIEW.vade_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECDESCRIPT","Vade Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECFRMCAPTN","Vade Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECDLGCAPTN","Vade Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECGRDCAPTN","Vade Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECRPTCAPTN","Vade Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFEMTOOLTIP","Vade Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFEMSTATUSTXT","Vade Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.vade_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.ihtarname_tarihi field.
DBSetProp('ALACAKVIEW.ihtarname_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.ihtarname_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.ihtarname_tarihi', 'Field', 'UpdateName', 'dbo.Alacak.Ihtarname_Tarihi')
DBSetProp('ALACAKVIEW.ihtarname_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for ALACAKVIEW.ihtarname_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECDESCRIPT","Ihtarname Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýhtarname Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýhtarname Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýhtarname Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýhtarname Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýhtarname Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýhtarname Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.ihtarname_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the ALACAKVIEW.belge_miktari field.
DBSetProp('ALACAKVIEW.belge_miktari', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.belge_miktari', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.belge_miktari', 'Field', 'UpdateName', 'dbo.Alacak.Belge_Miktari')
DBSetProp('ALACAKVIEW.belge_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ALACAKVIEW.belge_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECDESCRIPT","Belge Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECFRMCAPTN","Belge Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECDLGCAPTN","Belge Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECGRDCAPTN","Belge Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECRPTCAPTN","Belge Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMTOOLTIP","Belge Miktarý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMSTATUSTXT","Belge Miktarý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.belge_miktari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the ALACAKVIEW.odenen_miktar field.
DBSetProp('ALACAKVIEW.odenen_miktar', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.odenen_miktar', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.odenen_miktar', 'Field', 'UpdateName', 'dbo.Alacak.Odenen_Miktar')
DBSetProp('ALACAKVIEW.odenen_miktar', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ALACAKVIEW.odenen_miktar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECDESCRIPT","Odenen Miktar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECFRMCAPTN","Ödenen Miktar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECDLGCAPTN","Ödenen Miktar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECGRDCAPTN","Ödenen Miktar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECRPTCAPTN","Ödenen Miktar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMTOOLTIP","Ödenen Miktar                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMSTATUSTXT","Ödenen Miktar                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.odenen_miktar","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the ALACAKVIEW.aciklama field.
DBSetProp('ALACAKVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Alacak.Aciklama')
DBSetProp('ALACAKVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for ALACAKVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKVIEW.aciklama","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
