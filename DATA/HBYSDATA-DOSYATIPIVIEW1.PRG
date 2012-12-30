***************** Begin View Definition DOSYATIPIVIEW ***************


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



CREATE SQL VIEW "DOSYATIPIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Dosyatipi.DosyaTipi_Id,;
		Dosyatipi.Dosya_Tipi,;
		Dosyatipi.Takip_Tipi,;
		Dosyatipi.TakipYolu_Id,;
		Dosyatipi.Takip_Yolu,;
		Dosyatipi.TakipSekli_Id,;
		Dosyatipi.Takip_Sekli,;
		Dosyatipi.Borc_Tipi,;
		Dosyatipi.Borc_Evragi,;
		Dosyatipi.Talep_Edilen_Hak,;
		Dosyatipi.Gecikme_Faizi_Tipi,;
		Dosyatipi.Temerrut_Faizi_Tipi,;
		Dosyatipi.Takip_Faizi_Tipi,;
		Dosyatipi.Vekalet_Ucreti_Tipi;
	FROM dbo.DosyaTipi Dosyatipi

DBSetProp('DOSYATIPIVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOSYATIPIVIEW', 'View', 'WhereType', 3)
DBSetProp('DOSYATIPIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOSYATIPIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('DOSYATIPIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOSYATIPIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOSYATIPIVIEW', 'View', 'Tables', 'dbo.DosyaTipi')
DBSetProp('DOSYATIPIVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOSYATIPIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOSYATIPIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOSYATIPIVIEW', 'View', 'FetchSize', -1)
DBSetProp('DOSYATIPIVIEW', 'View', 'ParameterList', "vp_DosyaTipi_Id,'C'")
DBSetProp('DOSYATIPIVIEW', 'View', 'Comment', "")
DBSetProp('DOSYATIPIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOSYATIPIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOSYATIPIVIEW
	GoExplorer.odbcx.Validate("DOSYATIPIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW","VIEW",;
		"VFECDESCRIPT","Dosyatipiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_DosyaTipi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Dosyatipi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECFRMCAPTN","Dosyatipi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECDLGCAPTN","Dosyatipi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMTOOLTIP","Dosyatipi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Dosyatipi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMCOMPARETO","DosyaTipi_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vp_DosyaTipi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for DOSYATIPIVIEW
*** Props for the DOSYATIPIVIEW.dosyatipi_id field.
DBSetProp('DOSYATIPIVIEW.dosyatipi_id', 'Field', 'KeyField', .T.)
DBSetProp('DOSYATIPIVIEW.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.DosyaTipi.DosyaTipi_Id')
DBSetProp('DOSYATIPIVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('DOSYATIPIVIEW.dosyatipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for DOSYATIPIVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosyatipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosyatipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosyatipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosyatipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosyatipi ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosyatipi ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.dosya_tipi field.
DBSetProp('DOSYATIPIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Dosya_Tipi')
DBSetProp('DOSYATIPIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.takip_tipi field.
DBSetProp('DOSYATIPIVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Tipi')
DBSetProp('DOSYATIPIVIEW.takip_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOSYATIPIVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.borc_tipi field.
DBSetProp('DOSYATIPIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Tipi')
DBSetProp('DOSYATIPIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.borc_evragi field.
DBSetProp('DOSYATIPIVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Evragi')
DBSetProp('DOSYATIPIVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for DOSYATIPIVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borç Evraðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borç Evraðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borç Evraðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borç Evraðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borç Evraðý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borç Evraðý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.gecikme_faizi_tipi field.
DBSetProp('DOSYATIPIVIEW.gecikme_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.gecikme_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.gecikme_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Gecikme_Faizi_Tipi')
DBSetProp('DOSYATIPIVIEW.gecikme_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPIVIEW.gecikme_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!faiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECLUTAG","faiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMLUFIELDS","faiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Faiztipilookupview.faiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.gecikme_faizi_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.temerrut_faizi_tipi field.
DBSetProp('DOSYATIPIVIEW.temerrut_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.temerrut_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.temerrut_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Temerrut_Faizi_Tipi')
DBSetProp('DOSYATIPIVIEW.temerrut_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPIVIEW.temerrut_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Temerrüt Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Temerrüt Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Temerrüt Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Temerrüt Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Temerrüt Faizi Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Temerrüt Faizi Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!faiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECLUTAG","faiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMLUFIELDS","faiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Faiztipilookupview.faiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.temerrut_faizi_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.takip_faizi_tipi field.
DBSetProp('DOSYATIPIVIEW.takip_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.takip_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.takip_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Faizi_Tipi')
DBSetProp('DOSYATIPIVIEW.takip_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPIVIEW.takip_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Takip Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!faiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECLUTAG","faiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMLUFIELDS","faiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Faiztipilookupview.faiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.takip_faizi_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the DOSYATIPIVIEW.vekalet_ucreti_tipi field.
DBSetProp('DOSYATIPIVIEW.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPIVIEW.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPIVIEW.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Vekalet_Ucreti_Tipi')
DBSetProp('DOSYATIPIVIEW.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
DBSetProp('DOSYATIPIVIEW.vekalet_ucreti_tipi', 'Field', 'DefaultValue', "'Resmi Vekalet Ücreti'")
*** DBCX Field Properties for DOSYATIPIVIEW.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMINLIST",'"Resmi Vekalet Ücreti","Özel Vekalet Ücreti"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPIVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
