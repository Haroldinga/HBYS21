***************** Begin View Definition DOSYATIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "DOSYATIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Dosyatipi.DosyaTipi_Id,;
		Dosyatipi.Dosya_Tipi,;
		Dosyatipi.Takip_Tipi,;
		Dosyatipi.Borc_Tipi,;
		Dosyatipi.Borc_Evragi;
	FROM dbo.DosyaTipi Dosyatipi

DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'Tables', 'dbo.DosyaTipi')
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOSYATIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOSYATIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("DOSYATIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Dosyatipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOSYATIPILOOKUPVIEW
*** Props for the DOSYATIPILOOKUPVIEW.dosyatipi_id field.
DBSetProp('DOSYATIPILOOKUPVIEW.dosyatipi_id', 'Field', 'KeyField', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.dosyatipi_id', 'Field', 'Updatable', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.dosyatipi_id', 'Field', 'UpdateName', 'dbo.DosyaTipi.DosyaTipi_Id')
DBSetProp('DOSYATIPILOOKUPVIEW.dosyatipi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.dosyatipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECDESCRIPT","Dosyatipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECFRMCAPTN","Dosyatipi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECDLGCAPTN","Dosyatipi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECGRDCAPTN","Dosyatipi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECRPTCAPTN","Dosyatipi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFEMTOOLTIP","Dosyatipi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFEMSTATUSTXT","Dosyatipi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosyatipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.dosya_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.dosya_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Dosya_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.takip_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.borc_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.borc_evragi field.
DBSetProp('DOSYATIPILOOKUPVIEW.borc_evragi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.borc_evragi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.borc_evragi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Borc_Evragi')
DBSetProp('DOSYATIPILOOKUPVIEW.borc_evragi', 'Field', 'DataType', "C(75)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.borc_evragi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECDESCRIPT","Borc Evragi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECFRMCAPTN","Borc Evragi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECDLGCAPTN","Borc Evragi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECGRDCAPTN","Borc Evragi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECRPTCAPTN","Borc Evragi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFEMTOOLTIP","Borc Evragi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFEMSTATUSTXT","Borc Evragi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.borc_evragi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
