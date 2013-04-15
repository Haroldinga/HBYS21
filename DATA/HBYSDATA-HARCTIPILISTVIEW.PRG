***************** Begin View Definition HARCTIPILISTVIEW ***************


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



CREATE SQL VIEW "HARCTIPILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Harctipi.HarcTipi_Id,;
		Harctipi.Harc_Tipi,;
		Harctipi.Harc_Orani,;
		Harctipi.Harc_Miktari,;
		Harctipi.Uygulama_Tipi,;
		Harctipi.Uygulama_Asamasi;
	FROM dbo.HarcTipi Harctipi

DBSetProp('HARCTIPILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('HARCTIPILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('HARCTIPILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HARCTIPILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('HARCTIPILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HARCTIPILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HARCTIPILISTVIEW', 'View', 'Tables', 'dbo.HarcTipi')
DBSetProp('HARCTIPILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('HARCTIPILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HARCTIPILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HARCTIPILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('HARCTIPILISTVIEW', 'View', 'ParameterList', "vp_HarcTipi_Id,'C';vp_Harc_Tipi,'C';vp_Uygulama_Tipi,'C';vp_Uygulama_Asamasi,'C'")
DBSetProp('HARCTIPILISTVIEW', 'View', 'Comment', "")
DBSetProp('HARCTIPILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HARCTIPILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HARCTIPILISTVIEW
	GoExplorer.odbcx.Validate("HARCTIPILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW","VIEW",;
		"VFECDESCRIPT","Harctipilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_HarcTipi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Harctipi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECFRMCAPTN","Harctipi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECDLGCAPTN","Harctipi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFEMTOOLTIP","Harctipi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Harctipi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_HarcTipi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Harc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Harc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Harç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Harç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Harç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Harç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Uygulama_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Uygulama Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Uygulama_Asamasi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECDESCRIPT","Vp Uygulama Asamasi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECLUTABLE","hbysdata!icradosyaasamasilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECLUTAG","dosya_asamasi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMLUFIELDS","dosya_asamasi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMLUUPDTEXP","Icradosyaasamasilookupview.dosya_asamasi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.vp_Uygulama_Asamasi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for HARCTIPILISTVIEW
*** Props for the HARCTIPILISTVIEW.harctipi_id field.
DBSetProp('HARCTIPILISTVIEW.harctipi_id', 'Field', 'KeyField', .T.)
DBSetProp('HARCTIPILISTVIEW.harctipi_id', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.harctipi_id', 'Field', 'UpdateName', 'dbo.HarcTipi.HarcTipi_Id')
DBSetProp('HARCTIPILISTVIEW.harctipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('HARCTIPILISTVIEW.harctipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HARCTIPILISTVIEW.harctipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECDESCRIPT","Harctipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECFRMCAPTN","Harç Tipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECDLGCAPTN","Harç Tipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECGRDCAPTN","Harç Tipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECRPTCAPTN","Harç Tipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFEMTOOLTIP","Harç Tipi ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFEMSTATUSTXT","Harç Tipi ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harctipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HARCTIPILISTVIEW.harc_tipi field.
DBSetProp('HARCTIPILISTVIEW.harc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILISTVIEW.harc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.harc_tipi', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Tipi')
DBSetProp('HARCTIPILISTVIEW.harc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HARCTIPILISTVIEW.harc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECDESCRIPT","Harc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECFRMCAPTN","Harç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECDLGCAPTN","Harç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECGRDCAPTN","Harç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECRPTCAPTN","Harç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFEMTOOLTIP","Harç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFEMSTATUSTXT","Harç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HARCTIPILISTVIEW.harc_orani field.
DBSetProp('HARCTIPILISTVIEW.harc_orani', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILISTVIEW.harc_orani', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.harc_orani', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Orani')
DBSetProp('HARCTIPILISTVIEW.harc_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCTIPILISTVIEW.harc_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECDESCRIPT","Harc Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECFRMCAPTN","Harç Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECDLGCAPTN","Harç Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECGRDCAPTN","Harç Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECRPTCAPTN","Harç Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMTOOLTIP","Harç Oraný                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMSTATUSTXT","Harç Oraný                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMINPUTMASK","99.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCTIPILISTVIEW.harc_miktari field.
DBSetProp('HARCTIPILISTVIEW.harc_miktari', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILISTVIEW.harc_miktari', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.harc_miktari', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Miktari')
DBSetProp('HARCTIPILISTVIEW.harc_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCTIPILISTVIEW.harc_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECDESCRIPT","Harc Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECFRMCAPTN","Harç Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECDLGCAPTN","Harç Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECGRDCAPTN","Harç Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECRPTCAPTN","Harç Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMTOOLTIP","Harç Miktarý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMSTATUSTXT","Harç Miktarý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.harc_miktari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the HARCTIPILISTVIEW.uygulama_tipi field.
DBSetProp('HARCTIPILISTVIEW.uygulama_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILISTVIEW.uygulama_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.uygulama_tipi', 'Field', 'UpdateName', 'dbo.HarcTipi.Uygulama_Tipi')
DBSetProp('HARCTIPILISTVIEW.uygulama_tipi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for HARCTIPILISTVIEW.uygulama_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDESCRIPT","Uygulama Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECGRDCAPTN","Uygulama Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECRPTCAPTN","Uygulama Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMINLIST",'"Otomatik","Standart"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HARCTIPILISTVIEW.uygulama_asamasi field.
DBSetProp('HARCTIPILISTVIEW.uygulama_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILISTVIEW.uygulama_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILISTVIEW.uygulama_asamasi', 'Field', 'UpdateName', 'dbo.HarcTipi.Uygulama_Asamasi')
DBSetProp('HARCTIPILISTVIEW.uygulama_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HARCTIPILISTVIEW.uygulama_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDESCRIPT","Uygulama Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECGRDCAPTN","Uygulama Aþamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECRPTCAPTN","Uygulama Aþamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTABLE","hbysdata!icradosyaasamasilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTAG","dosya_asamasi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUFIELDS","dosya_asamasi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUUPDTEXP","Icradosyaasamasilookupview.dosya_asamasi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
