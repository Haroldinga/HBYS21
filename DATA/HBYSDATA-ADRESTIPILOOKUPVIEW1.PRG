***************** Begin View Definition ADRESTIPILOOKUPVIEW1 ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\hbysreferans"
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



CREATE SQL VIEW "ADRESTIPILOOKUPVIEW1" ; 
	AS SELECT Adrestipi.adres_tipi;
	FROM hbysreferans!adrestipi

DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!adrestipi')
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADRESTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADRESTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("ADRESTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Adrestipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADRESTIPILOOKUPVIEW1
*** Props for the ADRESTIPILOOKUPVIEW1.adres_tipi field.
DBSetProp('ADRESTIPILOOKUPVIEW1.adres_tipi', 'Field', 'KeyField', .F.)
DBSetProp('ADRESTIPILOOKUPVIEW1.adres_tipi', 'Field', 'Updatable', .T.)
DBSetProp('ADRESTIPILOOKUPVIEW1.adres_tipi', 'Field', 'UpdateName', 'hbysreferans!adrestipi.adres_tipi')
DBSetProp('ADRESTIPILOOKUPVIEW1.adres_tipi', 'Field', 'DataType', "C(20)")
*** DBCX Field Properties for ADRESTIPILOOKUPVIEW1.adres_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECDESCRIPT","Adres Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECFRMCAPTN","Adres Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECDLGCAPTN","Adres Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECGRDCAPTN","Adres Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECRPTCAPTN","Adres Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFEMTOOLTIP","Adres Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFEMSTATUSTXT","Adres Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADRESTIPILOOKUPVIEW1.adres_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
