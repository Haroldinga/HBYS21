***************** Begin View Definition LV_SECURITYNAMES ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"FESYS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\FESYS"
ELSE
	SET DATABASE TO "FESYS"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "LV_SECURITYNAMES" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT appnames.cname,;
		appnames.mdescription,;
		appnames.timestamp_column;
	FROM dbo.appnames Appnames

DBSetProp('LV_SECURITYNAMES', 'View', 'UpdateType', 1)
DBSetProp('LV_SECURITYNAMES', 'View', 'WhereType', 3)
DBSetProp('LV_SECURITYNAMES', 'View', 'FetchMemo', .T.)
DBSetProp('LV_SECURITYNAMES', 'View', 'SendUpdates', .T.)
DBSetProp('LV_SECURITYNAMES', 'View', 'UseMemoSize', 255)
DBSetProp('LV_SECURITYNAMES', 'View', 'MaxRecords', -1)
DBSetProp('LV_SECURITYNAMES', 'View', 'Tables', 'dbo.appnames')
DBSetProp('LV_SECURITYNAMES', 'View', 'Prepared', .F.)
DBSetProp('LV_SECURITYNAMES', 'View', 'CompareMemo', .T.)
DBSetProp('LV_SECURITYNAMES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_SECURITYNAMES', 'View', 'FetchSize', -1)
DBSetProp('LV_SECURITYNAMES', 'View', 'Comment', "")
DBSetProp('LV_SECURITYNAMES', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_SECURITYNAMES', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_SECURITYNAMES
	GoExplorer.odbcx.Validate("LV_SECURITYNAMES","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES","VIEW",;
		"VFECDESCRIPT","Lv Securitynames Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_SECURITYNAMES
*** Props for the LV_SECURITYNAMES.cname field.
DBSetProp('LV_SECURITYNAMES.cname', 'Field', 'KeyField', .T.)
DBSetProp('LV_SECURITYNAMES.cname', 'Field', 'Updatable', .T.)
DBSetProp('LV_SECURITYNAMES.cname', 'Field', 'UpdateName', 'dbo.appnames.cname')
DBSetProp('LV_SECURITYNAMES.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for LV_SECURITYNAMES.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECFRMCAPTN","Name") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECDLGCAPTN","Name") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECGRDCAPTN","Name") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECRPTCAPTN","Name") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFEMTOOLTIP","Name") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFEMSTATUSTXT","Name") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.cname","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_SECURITYNAMES.mdescription field.
DBSetProp('LV_SECURITYNAMES.mdescription', 'Field', 'KeyField', .F.)
DBSetProp('LV_SECURITYNAMES.mdescription', 'Field', 'Updatable', .T.)
DBSetProp('LV_SECURITYNAMES.mdescription', 'Field', 'UpdateName', 'dbo.appnames.mdescription')
DBSetProp('LV_SECURITYNAMES.mdescription', 'Field', 'DataType', "M")
*** DBCX Field Properties for LV_SECURITYNAMES.mdescription
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECDESCRIPT","Mdescription Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECFRMCAPTN","Description") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECDLGCAPTN","Description") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECGRDCAPTN","Description") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECRPTCAPTN","Description") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMTOOLTIP","Description") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMSTATUSTXT","Description") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.mdescription","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_SECURITYNAMES.timestamp_column field.
DBSetProp('LV_SECURITYNAMES.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_SECURITYNAMES.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_SECURITYNAMES.timestamp_column', 'Field', 'UpdateName', 'dbo.appnames.timestamp_column')
DBSetProp('LV_SECURITYNAMES.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_SECURITYNAMES.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_SECURITYNAMES.timestamp_column","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
