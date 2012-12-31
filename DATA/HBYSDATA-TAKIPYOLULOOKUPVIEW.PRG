***************** Begin View Definition TAKIPYOLULOOKUPVIEW ***************


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



CREATE SQL VIEW "TAKIPYOLULOOKUPVIEW" ; 
	AS SELECT Takipyolu.takipyolu_id,;
		Takipyolu.takip_yolu;
	FROM hbysreferans!takipyolu

DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'Tables', 'hbysreferans!takipyolu')
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAKIPYOLULOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAKIPYOLULOOKUPVIEW
	GoExplorer.odbcx.Validate("TAKIPYOLULOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Takipyolulookupview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TAKIPYOLULOOKUPVIEW
*** Props for the TAKIPYOLULOOKUPVIEW.takipyolu_id field.
DBSetProp('TAKIPYOLULOOKUPVIEW.takipyolu_id', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPYOLULOOKUPVIEW.takipyolu_id', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPYOLULOOKUPVIEW.takipyolu_id', 'Field', 'UpdateName', 'hbysreferans!takipyolu.takipyolu_id')
DBSetProp('TAKIPYOLULOOKUPVIEW.takipyolu_id', 'Field', 'DataType', "I")
*** DBCX Field Properties for TAKIPYOLULOOKUPVIEW.takipyolu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECDESCRIPT","Takipyolu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECFRMCAPTN","Takipyolu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECDLGCAPTN","Takipyolu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECGRDCAPTN","Takipyolu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECRPTCAPTN","Takipyolu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMTOOLTIP","Takipyolu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMSTATUSTXT","Takipyolu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takipyolu_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAKIPYOLULOOKUPVIEW.takip_yolu field.
DBSetProp('TAKIPYOLULOOKUPVIEW.takip_yolu', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPYOLULOOKUPVIEW.takip_yolu', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPYOLULOOKUPVIEW.takip_yolu', 'Field', 'UpdateName', 'hbysreferans!takipyolu.takip_yolu')
DBSetProp('TAKIPYOLULOOKUPVIEW.takip_yolu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAKIPYOLULOOKUPVIEW.takip_yolu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECDESCRIPT","Takip Yolu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECFRMCAPTN","Takip Yolu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECDLGCAPTN","Takip Yolu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECGRDCAPTN","Takip Yolu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECRPTCAPTN","Takip Yolu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMTOOLTIP","Takip Yolu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMSTATUSTXT","Takip Yolu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPYOLULOOKUPVIEW.takip_yolu","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
