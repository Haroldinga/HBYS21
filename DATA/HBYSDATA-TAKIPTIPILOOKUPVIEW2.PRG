***************** Begin View Definition TAKIPTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "TAKIPTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Takiptipi.TakipTipi_Id,;
		Takiptipi.Takip_Tipi;
	FROM dbo.TakipTipi Takiptipi

DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.TakipTipi')
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAKIPTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAKIPTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("TAKIPTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Takiptipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TAKIPTIPILOOKUPVIEW
*** Props for the TAKIPTIPILOOKUPVIEW.takiptipi_id field.
DBSetProp('TAKIPTIPILOOKUPVIEW.takiptipi_id', 'Field', 'KeyField', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW.takiptipi_id', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW.takiptipi_id', 'Field', 'UpdateName', 'dbo.TakipTipi.TakipTipi_Id')
DBSetProp('TAKIPTIPILOOKUPVIEW.takiptipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('TAKIPTIPILOOKUPVIEW.takiptipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TAKIPTIPILOOKUPVIEW.takiptipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECDESCRIPT","Takiptipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECFRMCAPTN","Takip Tipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECDLGCAPTN","Takip Tipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECGRDCAPTN","Takip Tipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECRPTCAPTN","Takip Tipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFEMTOOLTIP","Takip Tipi ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takiptipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAKIPTIPILOOKUPVIEW.takip_tipi field.
DBSetProp('TAKIPTIPILOOKUPVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW.takip_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.TakipTipi.Takip_Tipi')
DBSetProp('TAKIPTIPILOOKUPVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAKIPTIPILOOKUPVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
