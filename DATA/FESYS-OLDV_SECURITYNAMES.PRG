***************** Begin View Definition OLDV_SECURITYNAMES ***************


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



CREATE SQL VIEW "OLDV_SECURITYNAMES" ; 
	AS SELECT appnames.cname,;
		appnames.mdescription;
	FROM fesys!appnames

DBSetProp('OLDV_SECURITYNAMES', 'View', 'UpdateType', 1)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'WhereType', 3)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'Tables', 'fesys!appnames')
DBSetProp('OLDV_SECURITYNAMES', 'View', 'Prepared', .F.)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'FetchSize', 100)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'Comment', "")
DBSetProp('OLDV_SECURITYNAMES', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_SECURITYNAMES', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_SECURITYNAMES
	GoExplorer.odbcx.Validate("OLDV_SECURITYNAMES","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES","VIEW",;
		"VFECDESCRIPT","Oldv Securitynames Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_SECURITYNAMES
*** Props for the OLDV_SECURITYNAMES.cname field.
DBSetProp('OLDV_SECURITYNAMES.cname', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_SECURITYNAMES.cname', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_SECURITYNAMES.cname', 'Field', 'UpdateName', 'fesys!appnames.cname')
DBSetProp('OLDV_SECURITYNAMES.cname', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for OLDV_SECURITYNAMES.cname
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECDESCRIPT","Cname Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECFRMCAPTN","Cname") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECDLGCAPTN","Cname") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECGRDCAPTN","Cname") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECRPTCAPTN","Cname") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFEMTOOLTIP","Cname") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFEMSTATUSTXT","Cname") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.cname","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_SECURITYNAMES.mdescription field.
DBSetProp('OLDV_SECURITYNAMES.mdescription', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_SECURITYNAMES.mdescription', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_SECURITYNAMES.mdescription', 'Field', 'UpdateName', 'fesys!appnames.mdescription')
DBSetProp('OLDV_SECURITYNAMES.mdescription', 'Field', 'DataType', "M")
*** DBCX Field Properties for OLDV_SECURITYNAMES.mdescription
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECDESCRIPT","Mdescription Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECFRMCAPTN","Mdescription") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECDLGCAPTN","Mdescription") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECGRDCAPTN","Mdescription") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECRPTCAPTN","Mdescription") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMTOOLTIP","Mdescription") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMSTATUSTXT","Mdescription") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_SECURITYNAMES.mdescription","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
