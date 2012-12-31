***************** Begin View Definition TAKIPSEKLILOOKUPVIEW ***************


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



CREATE SQL VIEW "TAKIPSEKLILOOKUPVIEW" ; 
	AS SELECT Takipsekli.takip_sekli,;
		Takipsekli.takipsekli_id;
	FROM hbysreferans!takipsekli

DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!takipsekli')
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAKIPSEKLILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAKIPSEKLILOOKUPVIEW
	GoExplorer.odbcx.Validate("TAKIPSEKLILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Takipseklilookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TAKIPSEKLILOOKUPVIEW
*** Props for the TAKIPSEKLILOOKUPVIEW.takip_sekli field.
DBSetProp('TAKIPSEKLILOOKUPVIEW.takip_sekli', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPSEKLILOOKUPVIEW.takip_sekli', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPSEKLILOOKUPVIEW.takip_sekli', 'Field', 'UpdateName', 'hbysreferans!takipsekli.takip_sekli')
DBSetProp('TAKIPSEKLILOOKUPVIEW.takip_sekli', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for TAKIPSEKLILOOKUPVIEW.takip_sekli
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECDESCRIPT","Takip Sekli Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECFRMCAPTN","Takip Sekli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECDLGCAPTN","Takip Sekli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECGRDCAPTN","Takip Sekli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECRPTCAPTN","Takip Sekli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMTOOLTIP","Takip Sekli") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMSTATUSTXT","Takip Sekli") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takip_sekli","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAKIPSEKLILOOKUPVIEW.takipsekli_id field.
DBSetProp('TAKIPSEKLILOOKUPVIEW.takipsekli_id', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPSEKLILOOKUPVIEW.takipsekli_id', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPSEKLILOOKUPVIEW.takipsekli_id', 'Field', 'UpdateName', 'hbysreferans!takipsekli.takipsekli_id')
DBSetProp('TAKIPSEKLILOOKUPVIEW.takipsekli_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for TAKIPSEKLILOOKUPVIEW.takipsekli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECDESCRIPT","Takipsekli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECFRMCAPTN","Takipsekli Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECDLGCAPTN","Takipsekli Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECGRDCAPTN","Takipsekli Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECRPTCAPTN","Takipsekli Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMTOOLTIP","Takipsekli Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMSTATUSTXT","Takipsekli Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPSEKLILOOKUPVIEW.takipsekli_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
