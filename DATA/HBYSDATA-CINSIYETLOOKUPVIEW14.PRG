***************** Begin View Definition CINSIYETLOOKUPVIEW1 ***************


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



CREATE SQL VIEW "CINSIYETLOOKUPVIEW1" ; 
	AS SELECT Cinsiyet.cinsiyeti;
	FROM hbysreferans!cinsiyet

DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!cinsiyet')
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('CINSIYETLOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for CINSIYETLOOKUPVIEW1
	GoExplorer.odbcx.Validate("CINSIYETLOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Cinsiyetlookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for CINSIYETLOOKUPVIEW1
*** Props for the CINSIYETLOOKUPVIEW1.cinsiyeti field.
DBSetProp('CINSIYETLOOKUPVIEW1.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('CINSIYETLOOKUPVIEW1.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('CINSIYETLOOKUPVIEW1.cinsiyeti', 'Field', 'UpdateName', 'hbysreferans!cinsiyet.cinsiyeti')
DBSetProp('CINSIYETLOOKUPVIEW1.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for CINSIYETLOOKUPVIEW1.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!CINSIYETLOOKUPVIEW1.cinsiyeti","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
