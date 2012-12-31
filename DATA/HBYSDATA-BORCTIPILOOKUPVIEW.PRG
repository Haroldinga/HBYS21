***************** Begin View Definition BORCTIPILOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\hbysreferans"
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



CREATE SQL VIEW "BORCTIPILOOKUPVIEW" ; 
	AS SELECT Borctipi.borc_tipi;
	FROM hbysreferans!borctipi

DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!borctipi')
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BORCTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("BORCTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","BORCTIPILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BORCTIPILOOKUPVIEW
*** Props for the BORCTIPILOOKUPVIEW.borc_tipi field.
DBSetProp('BORCTIPILOOKUPVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BORCTIPILOOKUPVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BORCTIPILOOKUPVIEW.borc_tipi', 'Field', 'UpdateName', 'hbysreferans!borctipi.borc_tipi')
DBSetProp('BORCTIPILOOKUPVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCTIPILOOKUPVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCTIPILOOKUPVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
