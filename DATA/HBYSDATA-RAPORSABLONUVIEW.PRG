***************** Begin View Definition RAPORSABLONUVIEW ***************


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



CREATE SQL VIEW "RAPORSABLONUVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporsablonu.RaporSablonu_Id,;
		Raporsablonu.RaporSablonu_Fk,;
		Raporsablonu.DosyaTipi_Id,;
		Raporsablonu.Dosya_Tipi,;
		Raporsablonu.Rapor_Sablonu;
	FROM dbo.RaporSablonu Raporsablonu

DBSetProp('RAPORSABLONUVIEW', 'View', 'UpdateType', 1)
DBSetProp('RAPORSABLONUVIEW', 'View', 'WhereType', 1)
DBSetProp('RAPORSABLONUVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('RAPORSABLONUVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('RAPORSABLONUVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('RAPORSABLONUVIEW', 'View', 'MaxRecords', -1)
DBSetProp('RAPORSABLONUVIEW', 'View', 'Tables', 'dbo.RaporSablonu')
DBSetProp('RAPORSABLONUVIEW', 'View', 'Prepared', .F.)
DBSetProp('RAPORSABLONUVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('RAPORSABLONUVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RAPORSABLONUVIEW', 'View', 'FetchSize', -1)
DBSetProp('RAPORSABLONUVIEW', 'View', 'ParameterList', "vp_RaporSablonu_Fk,'C'")
DBSetProp('RAPORSABLONUVIEW', 'View', 'Comment', "")
DBSetProp('RAPORSABLONUVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('RAPORSABLONUVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for RAPORSABLONUVIEW
	GoExplorer.odbcx.Validate("RAPORSABLONUVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW","VIEW",;
		"VFECDESCRIPT","Raporsablonuview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_RaporSablonu_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Raporsablonu Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECFRMCAPTN","Raporsablonu Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECDLGCAPTN","Raporsablonu Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFEMTOOLTIP","Raporsablonu Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Raporsablonu Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.vp_RaporSablonu_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for RAPORSABLONUVIEW
*** Props for the RAPORSABLONUVIEW.raporsablonu_id field.
DBSetProp('RAPORSABLONUVIEW.raporsablonu_id', 'Field', 'KeyField', .T.)
DBSetProp('RAPORSABLONUVIEW.raporsablonu_id', 'Field', 'Updatable', .T.)
DBSetProp('RAPORSABLONUVIEW.raporsablonu_id', 'Field', 'UpdateName', 'dbo.RaporSablonu.RaporSablonu_Id')
DBSetProp('RAPORSABLONUVIEW.raporsablonu_id', 'Field', 'DataType', "C(36)")
DBSetProp('RAPORSABLONUVIEW.raporsablonu_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for RAPORSABLONUVIEW.raporsablonu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECDESCRIPT","Raporsablonu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECFRMCAPTN","RaporSablonu ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECDLGCAPTN","RaporSablonu ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECGRDCAPTN","RaporSablonu ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECRPTCAPTN","RaporSablonu ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFEMTOOLTIP","RaporSablonu ID                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFEMSTATUSTXT","RaporSablonu ID                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the RAPORSABLONUVIEW.raporsablonu_fk field.
DBSetProp('RAPORSABLONUVIEW.raporsablonu_fk', 'Field', 'KeyField', .F.)
DBSetProp('RAPORSABLONUVIEW.raporsablonu_fk', 'Field', 'Updatable', .T.)
DBSetProp('RAPORSABLONUVIEW.raporsablonu_fk', 'Field', 'UpdateName', 'dbo.RaporSablonu.RaporSablonu_Fk')
DBSetProp('RAPORSABLONUVIEW.raporsablonu_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for RAPORSABLONUVIEW.raporsablonu_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECDESCRIPT","Raporsablonu Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECFRMCAPTN","RaporSablonu FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECDLGCAPTN","RaporSablonu FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECGRDCAPTN","RaporSablonu FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECRPTCAPTN","RaporSablonu FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFEMTOOLTIP","RaporSablonu FK                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFEMSTATUSTXT","RaporSablonu FK                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.raporsablonu_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the RAPORSABLONUVIEW.dosyatipi_id field.
DBSetProp('RAPORSABLONUVIEW.dosyatipi_id', 'Field', 'KeyField', .F.)
DBSetProp('RAPORSABLONUVIEW.dosyatipi_id', 'Field', 'Updatable', .T.)
DBSetProp('RAPORSABLONUVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.RaporSablonu.DosyaTipi_Id')
DBSetProp('RAPORSABLONUVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for RAPORSABLONUVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the RAPORSABLONUVIEW.dosya_tipi field.
DBSetProp('RAPORSABLONUVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('RAPORSABLONUVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('RAPORSABLONUVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.RaporSablonu.Dosya_Tipi')
DBSetProp('RAPORSABLONUVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for RAPORSABLONUVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!dosyatipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECLUTAG","dosya_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMLUFIELDS","dosya_tipi, takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMLUUPDTEXP","Dosyatipilookupview.dosya_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.dosya_tipi","FIELD",;
		"VFEMLUUPDFLDS","dosyatipi_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the RAPORSABLONUVIEW.rapor_sablonu field.
DBSetProp('RAPORSABLONUVIEW.rapor_sablonu', 'Field', 'KeyField', .F.)
DBSetProp('RAPORSABLONUVIEW.rapor_sablonu', 'Field', 'Updatable', .T.)
DBSetProp('RAPORSABLONUVIEW.rapor_sablonu', 'Field', 'UpdateName', 'dbo.RaporSablonu.Rapor_Sablonu')
DBSetProp('RAPORSABLONUVIEW.rapor_sablonu', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for RAPORSABLONUVIEW.rapor_sablonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECDESCRIPT","Rapor Sablonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECFRMCAPTN","Rapor Þablonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECDLGCAPTN","Rapor Þablonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECGRDCAPTN","Rapor Þablonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECRPTCAPTN","Rapor Þablonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFEMTOOLTIP","Rapor Þablonu                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFEMSTATUSTXT","Rapor Þablonu                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!RAPORSABLONUVIEW.rapor_sablonu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
