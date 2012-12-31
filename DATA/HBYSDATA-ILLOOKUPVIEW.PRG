***************** Begin View Definition ILLOOKUPVIEW ***************


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



CREATE SQL VIEW "ILLOOKUPVIEW" ; 
	AS SELECT DISTINCT Postakodu.il_adi;
	FROM hbysreferans!postakodu

DBSetProp('ILLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ILLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ILLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ILLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ILLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ILLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ILLOOKUPVIEW', 'View', 'Tables', 'hbysreferans!postakodu')
DBSetProp('ILLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ILLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ILLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ILLOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ILLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ILLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ILLOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ILLOOKUPVIEW
	GoExplorer.odbcx.Validate("ILLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Illookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ILLOOKUPVIEW
*** Props for the ILLOOKUPVIEW.il_adi field.
DBSetProp('ILLOOKUPVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('ILLOOKUPVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('ILLOOKUPVIEW.il_adi', 'Field', 'UpdateName', 'hbysreferans!postakodu.il_adi')
DBSetProp('ILLOOKUPVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILLOOKUPVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILLOOKUPVIEW.il_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
