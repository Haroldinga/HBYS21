***************** Begin View Definition ADRESTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "ADRESTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Adrestipi.Adres_Tipi;
	FROM dbo.AdresTipi Adrestipi

DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.AdresTipi')
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADRESTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADRESTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("ADRESTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Adrestipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADRESTIPILOOKUPVIEW
*** Props for the ADRESTIPILOOKUPVIEW.adres_tipi field.
DBSetProp('ADRESTIPILOOKUPVIEW.adres_tipi', 'Field', 'KeyField', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW.adres_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW.adres_tipi', 'Field', 'UpdateName', 'dbo.AdresTipi.Adres_Tipi')
DBSetProp('ADRESTIPILOOKUPVIEW.adres_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ADRESTIPILOOKUPVIEW.adres_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECDESCRIPT","Adres Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECFRMCAPTN","Adres Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECDLGCAPTN","Adres Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECGRDCAPTN","Adres Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECRPTCAPTN","Adres Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFEMTOOLTIP","Adres Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFEMSTATUSTXT","Adres Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW.adres_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
