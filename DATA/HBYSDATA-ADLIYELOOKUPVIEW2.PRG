***************** Begin View Definition ADLIYELOOKUPVIEW ***************


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



CREATE SQL VIEW "ADLIYELOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT DISTINCT Adlibolge.Adliye_Adi;
	FROM dbo.AdliBolge Adlibolge;
	ORDER BY Adlibolge.Adliye_Adi

DBSetProp('ADLIYELOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'Tables', 'dbo.AdliBolge')
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADLIYELOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADLIYELOOKUPVIEW
	GoExplorer.odbcx.Validate("ADLIYELOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Adliyelookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ADLIYELOOKUPVIEW
*** Props for the ADLIYELOOKUPVIEW.adliye_adi field.
DBSetProp('ADLIYELOOKUPVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ADLIYELOOKUPVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('ADLIYELOOKUPVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.AdliBolge.Adliye_Adi')
DBSetProp('ADLIYELOOKUPVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ADLIYELOOKUPVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
