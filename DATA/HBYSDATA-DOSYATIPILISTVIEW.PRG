***************** Begin View Definition DOSYATIPILISTVIEW ***************


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



CREATE SQL VIEW "DOSYATIPILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Dosyatipi.DosyaTipi_Id,;
		Dosyatipi.Dosya_Tipi,;
		Dosyatipi.Takip_Tipi,;
		Dosyatipi.Borc_Tipi,;
		Dosyatipi.Borc_Evragi;
	FROM dbo.DosyaTipi Dosyatipi

DBSetProp('DOSYATIPILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'Tables', 'dbo.DosyaTipi')
DBSetProp('DOSYATIPILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'ParameterList', "vp_Dosya_Tipi,'C';vp_Takip_Tipi,'C';vp_Borc_Tipi,'C'")
DBSetProp('DOSYATIPILISTVIEW', 'View', 'Comment', "")
DBSetProp('DOSYATIPILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOSYATIPILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOSYATIPILISTVIEW
	GoExplorer.odbcx.Validate("DOSYATIPILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW","VIEW",;
		"VFECDESCRIPT","Dosyatipilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Dosya_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Dosya Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Dosya_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Takip_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Takip Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Takip_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for DOSYATIPILISTVIEW
*** Props for the DOSYATIPILISTVIEW.dosyatipi_id field.
DBSetProp('DOSYATIPILISTVIEW.dosyatipi_id', 'Field', 'KeyField', .T.)
DBSetProp('DOSYATIPILISTVIEW.dosyatipi_id', 'Field', 'Updatable', .F.)
DBSetProp('DOSYATIPILISTVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.DosyaTipi.DosyaTipi_Id')
DBSetProp('DOSYATIPILISTVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for DOSYATIPILISTVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosyatipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosyatipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosyatipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosyatipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosyatipi ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosyatipi ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILISTVIEW.dosya_tipi field.
DBSetProp('DOSYATIPILISTVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILISTVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILISTVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Dosya_Tipi')
DBSetProp('DOSYATIPILISTVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILISTVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILISTVIEW.takip_tipi field.
DBSetProp('DOSYATIPILISTVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILISTVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILISTVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Tipi')
DBSetProp('DOSYATIPILISTVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DOSYATIPILISTVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILISTVIEW.borc_tipi field.
DBSetProp('DOSYATIPILISTVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILISTVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILISTVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Tipi')
DBSetProp('DOSYATIPILISTVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILISTVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILISTVIEW.borc_evragi field.
DBSetProp('DOSYATIPILISTVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILISTVIEW.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILISTVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Evragi')
DBSetProp('DOSYATIPILISTVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for DOSYATIPILISTVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borç Evraðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borç Evraðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borç Evraðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borç Evraðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borç Evraðý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borç Evraðý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILISTVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
