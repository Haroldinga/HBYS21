***************** Begin View Definition REMOTE_APPNAMES ***************


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



CREATE SQL VIEW "REMOTE_APPNAMES" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Appnames.cname,;
		Appnames.mdescription,;
		Appnames.timestamp_column;
	FROM dbo.appnames Appnames

DBSetProp('REMOTE_APPNAMES', 'View', 'UpdateType', 1)
DBSetProp('REMOTE_APPNAMES', 'View', 'WhereType', 1)
DBSetProp('REMOTE_APPNAMES', 'View', 'FetchMemo', .T.)
DBSetProp('REMOTE_APPNAMES', 'View', 'SendUpdates', .T.)
DBSetProp('REMOTE_APPNAMES', 'View', 'UseMemoSize', 255)
DBSetProp('REMOTE_APPNAMES', 'View', 'MaxRecords', -1)
DBSetProp('REMOTE_APPNAMES', 'View', 'Tables', 'dbo.appnames')
DBSetProp('REMOTE_APPNAMES', 'View', 'Prepared', .F.)
DBSetProp('REMOTE_APPNAMES', 'View', 'CompareMemo', .T.)
DBSetProp('REMOTE_APPNAMES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REMOTE_APPNAMES', 'View', 'FetchSize', -1)
DBSetProp('REMOTE_APPNAMES', 'View', 'Comment', "")
DBSetProp('REMOTE_APPNAMES', 'View', 'BatchUpdateCount', 1)
DBSetProp('REMOTE_APPNAMES', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REMOTE_APPNAMES
	GoExplorer.odbcx.Validate("REMOTE_APPNAMES","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES","VIEW",;
		"VFECDESCRIPT","Remote Appnames Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for REMOTE_APPNAMES
*** Props for the REMOTE_APPNAMES.cname field.
DBSetProp('REMOTE_APPNAMES.cname', 'Field', 'KeyField', .T.)
DBSetProp('REMOTE_APPNAMES.cname', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPNAMES.cname', 'Field', 'UpdateName', 'dbo.appnames.cname')
DBSetProp('REMOTE_APPNAMES.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for REMOTE_APPNAMES.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.cname","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPNAMES.mdescription field.
DBSetProp('REMOTE_APPNAMES.mdescription', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPNAMES.mdescription', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPNAMES.mdescription', 'Field', 'UpdateName', 'dbo.appnames.mdescription')
DBSetProp('REMOTE_APPNAMES.mdescription', 'Field', 'DataType', "M")
*** DBCX Field Properties for REMOTE_APPNAMES.mdescription
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECDESCRIPT","Mdescription Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECFRMCAPTN","Mdescription") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECDLGCAPTN","Mdescription") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECGRDCAPTN","Mdescription") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECRPTCAPTN","Mdescription") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFEMTOOLTIP","Mdescription") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFEMSTATUSTXT","Mdescription") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.mdescription","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REMOTE_APPNAMES.timestamp_column field.
DBSetProp('REMOTE_APPNAMES.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('REMOTE_APPNAMES.timestamp_column', 'Field', 'Updatable', .T.)
DBSetProp('REMOTE_APPNAMES.timestamp_column', 'Field', 'UpdateName', 'dbo.appnames.timestamp_column')
DBSetProp('REMOTE_APPNAMES.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for REMOTE_APPNAMES.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!REMOTE_APPNAMES.timestamp_column","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
