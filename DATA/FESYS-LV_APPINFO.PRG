***************** Begin View Definition LV_APPINFO ***************


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



CREATE SQL VIEW "LV_APPINFO" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT * ,;
		Appinfo.cid,;
		Appinfo.nminpasswordlength,;
		Appinfo.nminuseridlength,;
		Appinfo.nmaxlogins,;
		Appinfo.nfailures,;
		Appinfo.luniquepassword,;
		Appinfo.nchangepassword,;
		Appinfo.ndefaultlevel,;
		Appinfo.timestamp_column;
	FROM dbo.appinfo Appinfo

DBSetProp('LV_APPINFO', 'View', 'UpdateType', 1)
DBSetProp('LV_APPINFO', 'View', 'WhereType', 3)
DBSetProp('LV_APPINFO', 'View', 'FetchMemo', .T.)
DBSetProp('LV_APPINFO', 'View', 'SendUpdates', .T.)
DBSetProp('LV_APPINFO', 'View', 'UseMemoSize', 255)
DBSetProp('LV_APPINFO', 'View', 'MaxRecords', -1)
DBSetProp('LV_APPINFO', 'View', 'Tables', 'dbo.appinfo')
DBSetProp('LV_APPINFO', 'View', 'Prepared', .F.)
DBSetProp('LV_APPINFO', 'View', 'CompareMemo', .T.)
DBSetProp('LV_APPINFO', 'View', 'FetchAsNeeded', .F.)
DBSetProp('LV_APPINFO', 'View', 'FetchSize', -1)
DBSetProp('LV_APPINFO', 'View', 'Comment', "")
DBSetProp('LV_APPINFO', 'View', 'BatchUpdateCount', 1)
DBSetProp('LV_APPINFO', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for LV_APPINFO
	GoExplorer.odbcx.Validate("LV_APPINFO","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO","VIEW",;
		"VFECDESCRIPT","Lv Appinfo Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for LV_APPINFO
*** Props for the LV_APPINFO.cid field.
DBSetProp('LV_APPINFO.cid', 'Field', 'KeyField', .T.)
DBSetProp('LV_APPINFO.cid', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.cid', 'Field', 'UpdateName', 'dbo.appinfo.cid')
DBSetProp('LV_APPINFO.cid', 'Field', 'DataType', "C(16) NOCPTRANS")
DBSetProp('LV_APPINFO.cid', 'Field', 'DefaultValue', "GUID()")
*** DBCX Field Properties for LV_APPINFO.cid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECDESCRIPT","Cid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECFRMCAPTN","Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECDLGCAPTN","Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECGRDCAPTN","Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECRPTCAPTN","Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFEMTOOLTIP","Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFEMSTATUSTXT","Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nminpasswordlength field.
DBSetProp('LV_APPINFO.nminpasswordlength', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nminpasswordlength', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nminpasswordlength', 'Field', 'UpdateName', 'dbo.appinfo.nminpasswordlength')
DBSetProp('LV_APPINFO.nminpasswordlength', 'Field', 'DataType', "N(2)")
DBSetProp('LV_APPINFO.nminpasswordlength', 'Field', 'DefaultValue', "4")
*** DBCX Field Properties for LV_APPINFO.nminpasswordlength
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECDESCRIPT","Nminpasswordlength Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECFRMCAPTN","Minpasswordlength") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECDLGCAPTN","Minpasswordlength") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECGRDCAPTN","Minpasswordlength") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECRPTCAPTN","Minpasswordlength") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMTOOLTIP","Minpasswordlength") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMSTATUSTXT","Minpasswordlength") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nminuseridlength field.
DBSetProp('LV_APPINFO.nminuseridlength', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nminuseridlength', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nminuseridlength', 'Field', 'UpdateName', 'dbo.appinfo.nminuseridlength')
DBSetProp('LV_APPINFO.nminuseridlength', 'Field', 'DataType', "N(2)")
DBSetProp('LV_APPINFO.nminuseridlength', 'Field', 'DefaultValue', "3")
*** DBCX Field Properties for LV_APPINFO.nminuseridlength
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECDESCRIPT","Nminuseridlength Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECFRMCAPTN","Minuseridlength") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECDLGCAPTN","Minuseridlength") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECGRDCAPTN","Minuseridlength") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECRPTCAPTN","Minuseridlength") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFEMTOOLTIP","Minuseridlength") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFEMSTATUSTXT","Minuseridlength") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nmaxlogins field.
DBSetProp('LV_APPINFO.nmaxlogins', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nmaxlogins', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nmaxlogins', 'Field', 'UpdateName', 'dbo.appinfo.nmaxlogins')
DBSetProp('LV_APPINFO.nmaxlogins', 'Field', 'DataType', "N(2)")
DBSetProp('LV_APPINFO.nmaxlogins', 'Field', 'DefaultValue', "1")
*** DBCX Field Properties for LV_APPINFO.nmaxlogins
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECDESCRIPT","Nmaxlogins Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECFRMCAPTN","Maxlogins") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECDLGCAPTN","Maxlogins") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECGRDCAPTN","Maxlogins") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECRPTCAPTN","Maxlogins") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFEMTOOLTIP","Maxlogins") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFEMSTATUSTXT","Maxlogins") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nfailures field.
DBSetProp('LV_APPINFO.nfailures', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nfailures', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nfailures', 'Field', 'UpdateName', 'dbo.appinfo.nfailures')
DBSetProp('LV_APPINFO.nfailures', 'Field', 'DataType', "N(2)")
DBSetProp('LV_APPINFO.nfailures', 'Field', 'DefaultValue', "3")
*** DBCX Field Properties for LV_APPINFO.nfailures
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECDESCRIPT","Nfailures Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECFRMCAPTN","Failures") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECDLGCAPTN","Failures") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECGRDCAPTN","Failures") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECRPTCAPTN","Failures") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFEMTOOLTIP","Failures") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFEMSTATUSTXT","Failures") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.luniquepassword field.
DBSetProp('LV_APPINFO.luniquepassword', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.luniquepassword', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.luniquepassword', 'Field', 'UpdateName', 'dbo.appinfo.luniquepassword')
DBSetProp('LV_APPINFO.luniquepassword', 'Field', 'DataType', "L")
DBSetProp('LV_APPINFO.luniquepassword', 'Field', 'DefaultValue', ".T.")
*** DBCX Field Properties for LV_APPINFO.luniquepassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECDESCRIPT","Luniquepassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECFRMCAPTN","Uniquepassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECDLGCAPTN","Uniquepassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECGRDCAPTN","Uniquepassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECRPTCAPTN","Uniquepassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFEMTOOLTIP","Uniquepassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFEMSTATUSTXT","Uniquepassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nchangepassword field.
DBSetProp('LV_APPINFO.nchangepassword', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nchangepassword', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nchangepassword', 'Field', 'UpdateName', 'dbo.appinfo.nchangepassword')
DBSetProp('LV_APPINFO.nchangepassword', 'Field', 'DataType', "N(4)")
DBSetProp('LV_APPINFO.nchangepassword', 'Field', 'DefaultValue', "0")
*** DBCX Field Properties for LV_APPINFO.nchangepassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECDESCRIPT","Nchangepassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECFRMCAPTN","Changepassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECDLGCAPTN","Changepassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECGRDCAPTN","Changepassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECRPTCAPTN","Changepassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFEMTOOLTIP","Changepassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFEMSTATUSTXT","Changepassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.ndefaultlevel field.
DBSetProp('LV_APPINFO.ndefaultlevel', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.ndefaultlevel', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.ndefaultlevel', 'Field', 'UpdateName', 'dbo.appinfo.ndefaultlevel')
DBSetProp('LV_APPINFO.ndefaultlevel', 'Field', 'DataType', "N(1)")
DBSetProp('LV_APPINFO.ndefaultlevel', 'Field', 'DefaultValue', "1")
*** DBCX Field Properties for LV_APPINFO.ndefaultlevel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECDESCRIPT","Ndefaultlevel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECFRMCAPTN","Defaultlevel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECDLGCAPTN","Defaultlevel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECGRDCAPTN","Defaultlevel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECRPTCAPTN","Defaultlevel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMTOOLTIP","Defaultlevel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMSTATUSTXT","Defaultlevel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.timestamp_column field.
DBSetProp('LV_APPINFO.timestamp_column', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.timestamp_column', 'Field', 'Updatable', .F.)
DBSetProp('LV_APPINFO.timestamp_column', 'Field', 'UpdateName', 'dbo.appinfo.timestamp_column')
DBSetProp('LV_APPINFO.timestamp_column', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_APPINFO.timestamp_column
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECDESCRIPT","Timestamp Column Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECFRMCAPTN","Timestamp Column") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECDLGCAPTN","Timestamp Column") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECGRDCAPTN","Timestamp Column") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECRPTCAPTN","Timestamp Column") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFEMTOOLTIP","Timestamp Column") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.cid1 field.
DBSetProp('LV_APPINFO.cid1', 'Field', 'KeyField', .T.)
DBSetProp('LV_APPINFO.cid1', 'Field', 'Updatable', .F.)
DBSetProp('LV_APPINFO.cid1', 'Field', 'UpdateName', 'dbo.appinfo.cid')
DBSetProp('LV_APPINFO.cid1', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for LV_APPINFO.cid1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECDESCRIPT","Cid1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECFRMCAPTN","Cid1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECDLGCAPTN","Cid1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECGRDCAPTN","Cid1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECRPTCAPTN","Cid1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFEMTOOLTIP","Cid1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFEMSTATUSTXT","Cid1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.cid1","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nminpasswordlength1 field.
DBSetProp('LV_APPINFO.nminpasswordlength1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nminpasswordlength1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nminpasswordlength1', 'Field', 'UpdateName', 'dbo.appinfo.nminpasswordlength')
DBSetProp('LV_APPINFO.nminpasswordlength1', 'Field', 'DataType', "N(4)")
*** DBCX Field Properties for LV_APPINFO.nminpasswordlength1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECDESCRIPT","Nminpasswordlength1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECFRMCAPTN","Nminpasswordlength1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECDLGCAPTN","Nminpasswordlength1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECGRDCAPTN","Nminpasswordlength1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECRPTCAPTN","Nminpasswordlength1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFEMTOOLTIP","Nminpasswordlength1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFEMSTATUSTXT","Nminpasswordlength1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminpasswordlength1","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nminuseridlength1 field.
DBSetProp('LV_APPINFO.nminuseridlength1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nminuseridlength1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nminuseridlength1', 'Field', 'UpdateName', 'dbo.appinfo.nminuseridlength')
DBSetProp('LV_APPINFO.nminuseridlength1', 'Field', 'DataType', "N(4)")
*** DBCX Field Properties for LV_APPINFO.nminuseridlength1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECDESCRIPT","Nminuseridlength1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECFRMCAPTN","Nminuseridlength1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECDLGCAPTN","Nminuseridlength1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECGRDCAPTN","Nminuseridlength1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECRPTCAPTN","Nminuseridlength1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFEMTOOLTIP","Nminuseridlength1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFEMSTATUSTXT","Nminuseridlength1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nminuseridlength1","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nmaxlogins1 field.
DBSetProp('LV_APPINFO.nmaxlogins1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nmaxlogins1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nmaxlogins1', 'Field', 'UpdateName', 'dbo.appinfo.nmaxlogins')
DBSetProp('LV_APPINFO.nmaxlogins1', 'Field', 'DataType', "N(4)")
*** DBCX Field Properties for LV_APPINFO.nmaxlogins1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECDESCRIPT","Nmaxlogins1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECFRMCAPTN","Nmaxlogins1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECDLGCAPTN","Nmaxlogins1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECGRDCAPTN","Nmaxlogins1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECRPTCAPTN","Nmaxlogins1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFEMTOOLTIP","Nmaxlogins1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFEMSTATUSTXT","Nmaxlogins1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nmaxlogins1","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nfailures1 field.
DBSetProp('LV_APPINFO.nfailures1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nfailures1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nfailures1', 'Field', 'UpdateName', 'dbo.appinfo.nfailures')
DBSetProp('LV_APPINFO.nfailures1', 'Field', 'DataType', "N(4)")
*** DBCX Field Properties for LV_APPINFO.nfailures1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECDESCRIPT","Nfailures1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECFRMCAPTN","Nfailures1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECDLGCAPTN","Nfailures1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECGRDCAPTN","Nfailures1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECRPTCAPTN","Nfailures1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFEMTOOLTIP","Nfailures1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFEMSTATUSTXT","Nfailures1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nfailures1","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.luniquepassword1 field.
DBSetProp('LV_APPINFO.luniquepassword1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.luniquepassword1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.luniquepassword1', 'Field', 'UpdateName', 'dbo.appinfo.luniquepassword')
DBSetProp('LV_APPINFO.luniquepassword1', 'Field', 'DataType', "L")
*** DBCX Field Properties for LV_APPINFO.luniquepassword1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECDESCRIPT","Luniquepassword1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECFRMCAPTN","Luniquepassword1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECDLGCAPTN","Luniquepassword1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECGRDCAPTN","Luniquepassword1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECRPTCAPTN","Luniquepassword1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFEMTOOLTIP","Luniquepassword1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFEMSTATUSTXT","Luniquepassword1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.luniquepassword1","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.nchangepassword1 field.
DBSetProp('LV_APPINFO.nchangepassword1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.nchangepassword1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.nchangepassword1', 'Field', 'UpdateName', 'dbo.appinfo.nchangepassword')
DBSetProp('LV_APPINFO.nchangepassword1', 'Field', 'DataType', "N(6)")
*** DBCX Field Properties for LV_APPINFO.nchangepassword1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECDESCRIPT","Nchangepassword1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECFRMCAPTN","Nchangepassword1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECDLGCAPTN","Nchangepassword1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECGRDCAPTN","Nchangepassword1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECRPTCAPTN","Nchangepassword1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFEMTOOLTIP","Nchangepassword1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFEMSTATUSTXT","Nchangepassword1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.nchangepassword1","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.ndefaultlevel1 field.
DBSetProp('LV_APPINFO.ndefaultlevel1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.ndefaultlevel1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.ndefaultlevel1', 'Field', 'UpdateName', 'dbo.appinfo.ndefaultlevel')
DBSetProp('LV_APPINFO.ndefaultlevel1', 'Field', 'DataType', "N(3)")
*** DBCX Field Properties for LV_APPINFO.ndefaultlevel1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECDESCRIPT","Ndefaultlevel1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECFRMCAPTN","Ndefaultlevel1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECDLGCAPTN","Ndefaultlevel1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECGRDCAPTN","Ndefaultlevel1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECRPTCAPTN","Ndefaultlevel1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFEMTOOLTIP","Ndefaultlevel1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFEMSTATUSTXT","Ndefaultlevel1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.ndefaultlevel1","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the LV_APPINFO.timestamp_column1 field.
DBSetProp('LV_APPINFO.timestamp_column1', 'Field', 'KeyField', .F.)
DBSetProp('LV_APPINFO.timestamp_column1', 'Field', 'Updatable', .T.)
DBSetProp('LV_APPINFO.timestamp_column1', 'Field', 'UpdateName', 'dbo.appinfo.timestamp_column')
DBSetProp('LV_APPINFO.timestamp_column1', 'Field', 'DataType', "M NOCPTRANS")
*** DBCX Field Properties for LV_APPINFO.timestamp_column1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECDESCRIPT","Timestamp Column1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECFRMCAPTN","Timestamp Column1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECDLGCAPTN","Timestamp Column1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECGRDCAPTN","Timestamp Column1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECRPTCAPTN","Timestamp Column1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFEMTOOLTIP","Timestamp Column1") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFEMSTATUSTXT","Timestamp Column1") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!LV_APPINFO.timestamp_column1","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
