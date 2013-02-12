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
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSDATA"
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
		Dosyatipi.TakipYolu_Id,;
		Dosyatipi.Takip_Yolu,;
		Dosyatipi.TakipSekli_Id,;
		Dosyatipi.Takip_Sekli,;
		Dosyatipi.Borc_Tipi,;
		Dosyatipi.Borc_Evragi,;
		Dosyatipi.Talep_Edilen_Hak,;
		Dosyatipi.BK84Madde_Uygulansin,;
		Dosyatipi.BSMV_Uygulansin,;
		Dosyatipi.KKDF_Uygulansin,;
		Dosyatipi.Gecikme_Faizi_Tipi,;
		Dosyatipi.Temerrut_Faizi_Tipi,;
		Dosyatipi.Takip_Faizi_Tipi,;
		Dosyatipi.Vekalet_Ucreti_Tipi;
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
DBSetProp('DOSYATIPILOOKUPVIEW.takip_tipi', 'Field', 'DataType', "C(15)")
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
 
*** Props for the DOSYATIPILOOKUPVIEW.takipyolu_id field.
DBSetProp('DOSYATIPILOOKUPVIEW.takipyolu_id', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takipyolu_id', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takipyolu_id', 'Field', 'UpdateName', 'dbo.DosyaTipi.TakipYolu_Id')
DBSetProp('DOSYATIPILOOKUPVIEW.takipyolu_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takipyolu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECDESCRIPT","Takipyolu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECFRMCAPTN","Takipyolu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECDLGCAPTN","Takipyolu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECGRDCAPTN","Takipyolu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECRPTCAPTN","Takipyolu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMTOOLTIP","Takipyolu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMSTATUSTXT","Takipyolu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipyolu_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.takip_yolu field.
DBSetProp('DOSYATIPILOOKUPVIEW.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_yolu', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Yolu')
DBSetProp('DOSYATIPILOOKUPVIEW.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_yolu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.takipsekli_id field.
DBSetProp('DOSYATIPILOOKUPVIEW.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takipsekli_id', 'Field', 'UpdateName', 'dbo.DosyaTipi.TakipSekli_Id')
DBSetProp('DOSYATIPILOOKUPVIEW.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takipsekli Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takipsekli Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takipsekli Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takipsekli Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takipsekli Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takipsekli Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.takip_sekli field.
DBSetProp('DOSYATIPILOOKUPVIEW.takip_sekli', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_sekli', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_sekli', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Sekli')
DBSetProp('DOSYATIPILOOKUPVIEW.takip_sekli', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takip_sekli
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECDESCRIPT","Takip Sekli Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECFRMCAPTN","Takip Sekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECDLGCAPTN","Takip Sekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECGRDCAPTN","Takip Sekli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECRPTCAPTN","Takip Sekli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMTOOLTIP","Takip Sekli") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMSTATUSTXT","Takip Sekli") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_sekli","FIELD",;
		"VFENDISPORDER",7) &&Display Order
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
 
*** Props for the DOSYATIPILOOKUPVIEW.talep_edilen_hak field.
DBSetProp('DOSYATIPILOOKUPVIEW.talep_edilen_hak', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.talep_edilen_hak', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.talep_edilen_hak', 'Field', 'UpdateName', 'dbo.DosyaTipi.Talep_Edilen_Hak')
DBSetProp('DOSYATIPILOOKUPVIEW.talep_edilen_hak', 'Field', 'DataType', "M")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.talep_edilen_hak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECDESCRIPT","Talep Edilen Hak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECGRDCAPTN","Talep Edilen Hak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECRPTCAPTN","Talep Edilen Hak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.talep_edilen_hak","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.bk84madde_uygulansin field.
DBSetProp('DOSYATIPILOOKUPVIEW.bk84madde_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.bk84madde_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.bk84madde_uygulansin', 'Field', 'UpdateName', 'dbo.DosyaTipi.BK84Madde_Uygulansin')
DBSetProp('DOSYATIPILOOKUPVIEW.bk84madde_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.bk84madde_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECDESCRIPT","Bk84madde Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bk84madde Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bk84madde Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bk84madde Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bk84madde Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bk84madde Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bk84madde Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bk84madde_uygulansin","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.bsmv_uygulansin field.
DBSetProp('DOSYATIPILOOKUPVIEW.bsmv_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.bsmv_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.bsmv_uygulansin', 'Field', 'UpdateName', 'dbo.DosyaTipi.BSMV_Uygulansin')
DBSetProp('DOSYATIPILOOKUPVIEW.bsmv_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.bsmv_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECDESCRIPT","Bsmv Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bsmv Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bsmv Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bsmv Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bsmv Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bsmv Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bsmv Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.bsmv_uygulansin","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.kkdf_uygulansin field.
DBSetProp('DOSYATIPILOOKUPVIEW.kkdf_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.kkdf_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.kkdf_uygulansin', 'Field', 'UpdateName', 'dbo.DosyaTipi.KKDF_Uygulansin')
DBSetProp('DOSYATIPILOOKUPVIEW.kkdf_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.kkdf_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECDESCRIPT","Kkdf Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECFRMCAPTN","Kkdf Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECDLGCAPTN","Kkdf Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECGRDCAPTN","Kkdf Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECRPTCAPTN","Kkdf Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFEMTOOLTIP","Kkdf Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Kkdf Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.kkdf_uygulansin","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Gecikme_Faizi_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Gecikme Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Gecikme Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Gecikme Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Gecikme Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Gecikme Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Gecikme Faizi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gecikme Faizi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.gecikme_faizi_tipi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Temerrut_Faizi_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Temerrut Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Temerrut Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Temerrut Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Temerrut Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Temerrut Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Temerrut Faizi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Temerrut Faizi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.temerrut_faizi_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.takip_faizi_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.takip_faizi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_faizi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.takip_faizi_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Takip_Faizi_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.takip_faizi_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.takip_faizi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECDESCRIPT","Takip Faizi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Faizi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Faizi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Faizi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Faizi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Faizi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Faizi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.takip_faizi_tipi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi field.
DBSetProp('DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.DosyaTipi.Vekalet_Ucreti_Tipi')
DBSetProp('DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ucreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ucreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ucreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ucreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ucreti Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ucreti Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOSYATIPILOOKUPVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
