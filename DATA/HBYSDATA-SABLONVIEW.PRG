***************** Begin View Definition SABLONVIEW ***************


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



CREATE SQL VIEW "SABLONVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Sablon.Sablon_Id,;
		Sablon.Sablon_Fk,;
		Sablon.SablonRefrs_Id,;
		Sablon.Dokuman_Adi,;
		Sablon.Dokuman_Tipi,;
		Sablon.Talep_Ifadesi,;
		Sablon.ZarfTipi_Id,;
		Sablon.Dokuman_Sablonu,;
		Sablon.Dokuman_Arsivle,;
		Sablon.Gonderi_Takibi,;
		Sablon.Gonderi_Tipi,;
		Sablon.Barkod_Bas,;
		Sablon.Barkod_Tipi;
	FROM dbo.Sablon Sablon

DBSetProp('SABLONVIEW', 'View', 'UpdateType', 1)
DBSetProp('SABLONVIEW', 'View', 'WhereType', 1)
DBSetProp('SABLONVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('SABLONVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('SABLONVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('SABLONVIEW', 'View', 'MaxRecords', -1)
DBSetProp('SABLONVIEW', 'View', 'Tables', 'dbo.Sablon')
DBSetProp('SABLONVIEW', 'View', 'Prepared', .F.)
DBSetProp('SABLONVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('SABLONVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SABLONVIEW', 'View', 'FetchSize', -1)
DBSetProp('SABLONVIEW', 'View', 'ParameterList', "vp_Sablon_Fk,'C';vp_SablonRefrs_Id,'C'")
DBSetProp('SABLONVIEW', 'View', 'Comment', "")
DBSetProp('SABLONVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('SABLONVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for SABLONVIEW
	GoExplorer.odbcx.Validate("SABLONVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW","VIEW",;
		"VFECDESCRIPT","Sablonview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Sablon_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Sablon Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECFRMCAPTN","Þablon FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECDLGCAPTN","Þablon FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMTOOLTIP","Þablon FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Þablon FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMCOMPARETO","Sablon_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_Sablon_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_SablonRefrs_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Sablonrefrs Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECFRMCAPTN","Sablonrefrs Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECDLGCAPTN","Sablonrefrs Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMTOOLTIP","Sablonrefrs Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMSTATUSTXT","Sablonrefrs Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.vp_SablonRefrs_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for SABLONVIEW
*** Props for the SABLONVIEW.sablon_id field.
DBSetProp('SABLONVIEW.sablon_id', 'Field', 'KeyField', .T.)
DBSetProp('SABLONVIEW.sablon_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.sablon_id', 'Field', 'UpdateName', 'dbo.Sablon.Sablon_Id')
DBSetProp('SABLONVIEW.sablon_id', 'Field', 'DataType', "C(36)")
DBSetProp('SABLONVIEW.sablon_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for SABLONVIEW.sablon_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECDESCRIPT","Sablon Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECFRMCAPTN","Þablon ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECDLGCAPTN","Þablon ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECGRDCAPTN","Þablon ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECRPTCAPTN","Þablon ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFEMTOOLTIP","Þablon ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFEMSTATUSTXT","Þablon ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.sablon_fk field.
DBSetProp('SABLONVIEW.sablon_fk', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.sablon_fk', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.sablon_fk', 'Field', 'UpdateName', 'dbo.Sablon.Sablon_Fk')
DBSetProp('SABLONVIEW.sablon_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SABLONVIEW.sablon_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECDESCRIPT","Sablon Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECFRMCAPTN","Þablon FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECDLGCAPTN","Þablon FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECGRDCAPTN","Þablon FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECRPTCAPTN","Þablon FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFEMTOOLTIP","Þablon FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFEMSTATUSTXT","Þablon FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablon_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.sablonrefrs_id field.
DBSetProp('SABLONVIEW.sablonrefrs_id', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.sablonrefrs_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.sablonrefrs_id', 'Field', 'UpdateName', 'dbo.Sablon.SablonRefrs_Id')
DBSetProp('SABLONVIEW.sablonrefrs_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SABLONVIEW.sablonrefrs_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECDESCRIPT","Sablonrefrs Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECFRMCAPTN","Sablonrefrs Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECDLGCAPTN","Sablonrefrs Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECGRDCAPTN","Sablonrefrs Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECRPTCAPTN","Sablonrefrs Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFEMTOOLTIP","Sablonrefrs Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFEMSTATUSTXT","Sablonrefrs Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.sablonrefrs_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.dokuman_adi field.
DBSetProp('SABLONVIEW.dokuman_adi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.dokuman_adi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.dokuman_adi', 'Field', 'UpdateName', 'dbo.Sablon.Dokuman_Adi')
DBSetProp('SABLONVIEW.dokuman_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SABLONVIEW.dokuman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECDESCRIPT","Dokuman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECFRMCAPTN","Döküman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECDLGCAPTN","Döküman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECGRDCAPTN","Döküman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECRPTCAPTN","Döküman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMTOOLTIP","Döküman Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMSTATUSTXT","Döküman Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECLUTABLE","hbysdata!dokumanadilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECLUTAG","dokuman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMLUFIELDS","dokuman_adi, dokuman_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMLUUPDTEXP","Dokumanadilookupview.dokuman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_adi","FIELD",;
		"VFEMLUUPDFLDS","dokuman_tipi, sablonrefrs_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the SABLONVIEW.dokuman_tipi field.
DBSetProp('SABLONVIEW.dokuman_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.dokuman_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.dokuman_tipi', 'Field', 'UpdateName', 'dbo.Sablon.Dokuman_Tipi')
DBSetProp('SABLONVIEW.dokuman_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SABLONVIEW.dokuman_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECDESCRIPT","Dokuman Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECFRMCAPTN","Doküman Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECDLGCAPTN","Doküman Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECGRDCAPTN","Doküman Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECRPTCAPTN","Doküman Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMTOOLTIP","Doküman Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMSTATUSTXT","Doküman Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!dokumantipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECLUTAG","dokuman_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMLUFIELDS","dokuman_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMLUUPDTEXP","Dokumantipilookupview.dokuman_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.talep_ifadesi field.
DBSetProp('SABLONVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.Sablon.Talep_Ifadesi')
DBSetProp('SABLONVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for SABLONVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.zarftipi_id field.
DBSetProp('SABLONVIEW.zarftipi_id', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.zarftipi_id', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.zarftipi_id', 'Field', 'UpdateName', 'dbo.Sablon.ZarfTipi_Id')
DBSetProp('SABLONVIEW.zarftipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SABLONVIEW.zarftipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECDESCRIPT","Zarftipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECFRMCAPTN","Zarf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECDLGCAPTN","Zarf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECGRDCAPTN","Zarf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECRPTCAPTN","Zarf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFEMTOOLTIP","Zarf Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFEMSTATUSTXT","Zarf Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.zarftipi_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.dokuman_sablonu field.
DBSetProp('SABLONVIEW.dokuman_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.dokuman_sablonu', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.dokuman_sablonu', 'Field', 'UpdateName', 'dbo.Sablon.Dokuman_Sablonu')
DBSetProp('SABLONVIEW.dokuman_sablonu', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for SABLONVIEW.dokuman_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECDESCRIPT","Dokuman Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECFRMCAPTN","Döküman Þablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECDLGCAPTN","Döküman Þablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECGRDCAPTN","Döküman Þablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECRPTCAPTN","Döküman Þablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFEMTOOLTIP","Döküman Þablonu                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFEMSTATUSTXT","Döküman Þablonu                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_sablonu","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.dokuman_arsivle field.
DBSetProp('SABLONVIEW.dokuman_arsivle', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.dokuman_arsivle', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.dokuman_arsivle', 'Field', 'UpdateName', 'dbo.Sablon.Dokuman_Arsivle')
DBSetProp('SABLONVIEW.dokuman_arsivle', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONVIEW.dokuman_arsivle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECDESCRIPT","Dokuman Arsivle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECFRMCAPTN","Döküman Arþivle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECDLGCAPTN","Döküman Arþivle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECGRDCAPTN","Döküman Arþivle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECRPTCAPTN","Döküman Arþivle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFEMTOOLTIP","Döküman Arþivle                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFEMSTATUSTXT","Döküman Arþivle                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.dokuman_arsivle","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.gonderi_takibi field.
DBSetProp('SABLONVIEW.gonderi_takibi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.gonderi_takibi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.gonderi_takibi', 'Field', 'UpdateName', 'dbo.Sablon.Gonderi_Takibi')
DBSetProp('SABLONVIEW.gonderi_takibi', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONVIEW.gonderi_takibi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECDESCRIPT","Gonderi Takibi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECFRMCAPTN","Gönderi Takibi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECDLGCAPTN","Gönderi Takibi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECGRDCAPTN","Gönderi Takibi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECRPTCAPTN","Gönderi Takibi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFEMTOOLTIP","Gönderi Takibi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Takibi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_takibi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.gonderi_tipi field.
DBSetProp('SABLONVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.Sablon.Gonderi_Tipi')
DBSetProp('SABLONVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SABLONVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!gonderitipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECLUTAG","gonderi_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMLUFIELDS","gonderi_tipi, gonderi_kodu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Gonderitipilookupview.gonderi_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.barkod_bas field.
DBSetProp('SABLONVIEW.barkod_bas', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.barkod_bas', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.barkod_bas', 'Field', 'UpdateName', 'dbo.Sablon.Barkod_Bas')
DBSetProp('SABLONVIEW.barkod_bas', 'Field', 'DataType', "L")
*** DBCX Field Properties for SABLONVIEW.barkod_bas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECDESCRIPT","Barkod Bas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECFRMCAPTN","Barkod Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECDLGCAPTN","Barkod Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECGRDCAPTN","Barkod Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECRPTCAPTN","Barkod Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFEMTOOLTIP","Barkod Bas") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFEMSTATUSTXT","Barkod Bas") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_bas","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the SABLONVIEW.barkod_tipi field.
DBSetProp('SABLONVIEW.barkod_tipi', 'Field', 'KeyField', .F.)
DBSetProp('SABLONVIEW.barkod_tipi', 'Field', 'Updatable', .T.)
DBSetProp('SABLONVIEW.barkod_tipi', 'Field', 'UpdateName', 'dbo.Sablon.Barkod_Tipi')
DBSetProp('SABLONVIEW.barkod_tipi', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for SABLONVIEW.barkod_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECDESCRIPT","Barkod Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECFRMCAPTN","Barkod Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECDLGCAPTN","Barkod Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECGRDCAPTN","Barkod Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECRPTCAPTN","Barkod Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMTOOLTIP","Barkod Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMSTATUSTXT","Barkod Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!barkodtipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECLUTAG","barkod_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMLUFIELDS","barkod_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMLUUPDTEXP","Barkodtipilookupview.barkod_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SABLONVIEW.barkod_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
