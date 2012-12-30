***************** Begin View Definition DEPARTMANLOOKUPVIEW ***************


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



CREATE SQL VIEW "DEPARTMANLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Departman.Departman_Adi;
	FROM dbo.Departman Departman

DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'Tables', 'dbo.Departman')
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DEPARTMANLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DEPARTMANLOOKUPVIEW
	GoExplorer.odbcx.Validate("DEPARTMANLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Departmanlookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DEPARTMANLOOKUPVIEW
*** Props for the DEPARTMANLOOKUPVIEW.departman_adi field.
DBSetProp('DEPARTMANLOOKUPVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('DEPARTMANLOOKUPVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('DEPARTMANLOOKUPVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.Departman.Departman_Adi')
DBSetProp('DEPARTMANLOOKUPVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DEPARTMANLOOKUPVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANLOOKUPVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
