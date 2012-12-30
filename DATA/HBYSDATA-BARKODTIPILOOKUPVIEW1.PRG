***************** Begin View Definition BARKODTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "BARKODTIPILOOKUPVIEW" ; 
	AS SELECT STR(Bcinfo.id,3)+" "+Bcinfo.name AS barkod_tipi;
		;
	FROM bcinfo

DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'Tables', '')
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BARKODTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BARKODTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("BARKODTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Barkodtipilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BARKODTIPILOOKUPVIEW
*** Props for the BARKODTIPILOOKUPVIEW.barkod_tipi field.
DBSetProp('BARKODTIPILOOKUPVIEW.barkod_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BARKODTIPILOOKUPVIEW.barkod_tipi', 'Field', 'Updatable', .F.)
DBSetProp('BARKODTIPILOOKUPVIEW.barkod_tipi', 'Field', 'UpdateName', '')
DBSetProp('BARKODTIPILOOKUPVIEW.barkod_tipi', 'Field', 'DataType', "C(34)")
*** DBCX Field Properties for BARKODTIPILOOKUPVIEW.barkod_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECDESCRIPT","Barkod Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECFRMCAPTN","Barkod Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECDLGCAPTN","Barkod Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECGRDCAPTN","Barkod Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECRPTCAPTN","Barkod Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFEMTOOLTIP","Barkod Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFEMSTATUSTXT","Barkod Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BARKODTIPILOOKUPVIEW.barkod_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
