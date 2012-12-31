***************** Begin View Definition OLDV_APPINFO ***************


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



CREATE SQL VIEW "OLDV_APPINFO" ; 
	AS SELECT appinfo.cid,;
		appinfo.nminpasswordlength,;
		appinfo.nminuseridlength,;
		appinfo.nmaxlogins,;
		appinfo.nfailures,;
		appinfo.luniquepassword,;
		appinfo.nchangepassword,;
		appinfo.ndefaultlevel;
	FROM fesys!appinfo

DBSetProp('OLDV_APPINFO', 'View', 'UpdateType', 1)
DBSetProp('OLDV_APPINFO', 'View', 'WhereType', 3)
DBSetProp('OLDV_APPINFO', 'View', 'FetchMemo', .T.)
DBSetProp('OLDV_APPINFO', 'View', 'SendUpdates', .T.)
DBSetProp('OLDV_APPINFO', 'View', 'UseMemoSize', 255)
DBSetProp('OLDV_APPINFO', 'View', 'MaxRecords', -1)
DBSetProp('OLDV_APPINFO', 'View', 'Tables', 'fesys!appinfo')
DBSetProp('OLDV_APPINFO', 'View', 'Prepared', .F.)
DBSetProp('OLDV_APPINFO', 'View', 'CompareMemo', .T.)
DBSetProp('OLDV_APPINFO', 'View', 'FetchAsNeeded', .F.)
DBSetProp('OLDV_APPINFO', 'View', 'FetchSize', 100)
DBSetProp('OLDV_APPINFO', 'View', 'Comment', "")
DBSetProp('OLDV_APPINFO', 'View', 'BatchUpdateCount', 1)
DBSetProp('OLDV_APPINFO', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for OLDV_APPINFO
	GoExplorer.odbcx.Validate("OLDV_APPINFO","View")
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO","VIEW",;
		"VFECDESCRIPT","Oldv Appinfo Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for OLDV_APPINFO
*** Props for the OLDV_APPINFO.cid field.
DBSetProp('OLDV_APPINFO.cid', 'Field', 'KeyField', .T.)
DBSetProp('OLDV_APPINFO.cid', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.cid', 'Field', 'UpdateName', 'fesys!appinfo.cid')
DBSetProp('OLDV_APPINFO.cid', 'Field', 'DisplayClass', "cactivedoc")
DBSetProp('OLDV_APPINFO.cid', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.cid', 'Field', 'DataType', "C(16) NOCPTRANS")
DBSetProp('OLDV_APPINFO.cid', 'Field', 'DefaultValue', "GUID()")
*** DBCX Field Properties for OLDV_APPINFO.cid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECDESCRIPT","Cid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECFRMCAPTN","Cid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECDLGCAPTN","Cid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECGRDCAPTN","Cid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECRPTCAPTN","Cid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFEMTOOLTIP","Cid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFEMSTATUSTXT","Cid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.cid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.nminpasswordlength field.
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'UpdateName', 'fesys!appinfo.nminpasswordlength')
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'DisplayClass', "cspinner")
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'DataType', "N(2)")
DBSetProp('OLDV_APPINFO.nminpasswordlength', 'Field', 'DefaultValue', "4")
*** DBCX Field Properties for OLDV_APPINFO.nminpasswordlength
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECDESCRIPT","Nminpasswordlength Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECFRMCAPTN","Nminpasswordlength") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECDLGCAPTN","Nminpasswordlength") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECGRDCAPTN","Nminpasswordlength") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECRPTCAPTN","Nminpasswordlength") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMTOOLTIP","Nminpasswordlength") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMSTATUSTXT","Nminpasswordlength") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminpasswordlength","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.nminuseridlength field.
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'UpdateName', 'fesys!appinfo.nminuseridlength')
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'DisplayClass', "cspinner")
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'DataType', "N(2)")
DBSetProp('OLDV_APPINFO.nminuseridlength', 'Field', 'DefaultValue', "3")
*** DBCX Field Properties for OLDV_APPINFO.nminuseridlength
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECDESCRIPT","Nminuseridlength Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECFRMCAPTN","Nminuseridlength") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECDLGCAPTN","Nminuseridlength") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECGRDCAPTN","Nminuseridlength") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECRPTCAPTN","Nminuseridlength") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFEMTOOLTIP","Nminuseridlength") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFEMSTATUSTXT","Nminuseridlength") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nminuseridlength","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.nmaxlogins field.
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'UpdateName', 'fesys!appinfo.nmaxlogins')
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'DisplayClass', "cspinner")
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'DataType', "N(2)")
DBSetProp('OLDV_APPINFO.nmaxlogins', 'Field', 'DefaultValue', "1")
*** DBCX Field Properties for OLDV_APPINFO.nmaxlogins
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECDESCRIPT","Nmaxlogins Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECFRMCAPTN","Nmaxlogins") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECDLGCAPTN","Nmaxlogins") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECGRDCAPTN","Nmaxlogins") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECRPTCAPTN","Nmaxlogins") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFEMTOOLTIP","Nmaxlogins") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFEMSTATUSTXT","Nmaxlogins") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nmaxlogins","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.nfailures field.
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'UpdateName', 'fesys!appinfo.nfailures')
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'DisplayClass', "cspinner")
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'DataType', "N(2)")
DBSetProp('OLDV_APPINFO.nfailures', 'Field', 'DefaultValue', "3")
*** DBCX Field Properties for OLDV_APPINFO.nfailures
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECDESCRIPT","Nfailures Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECFRMCAPTN","Nfailures") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECDLGCAPTN","Nfailures") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECGRDCAPTN","Nfailures") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECRPTCAPTN","Nfailures") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFEMTOOLTIP","Nfailures") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFEMSTATUSTXT","Nfailures") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nfailures","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.luniquepassword field.
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'UpdateName', 'fesys!appinfo.luniquepassword')
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'DisplayClass', "ccheckbox")
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'DataType', "L")
DBSetProp('OLDV_APPINFO.luniquepassword', 'Field', 'DefaultValue', ".T.")
*** DBCX Field Properties for OLDV_APPINFO.luniquepassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECDESCRIPT","Luniquepassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECFRMCAPTN","Luniquepassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECDLGCAPTN","Luniquepassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECGRDCAPTN","Luniquepassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECRPTCAPTN","Luniquepassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFEMTOOLTIP","Luniquepassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFEMSTATUSTXT","Luniquepassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.luniquepassword","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.nchangepassword field.
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'UpdateName', 'fesys!appinfo.nchangepassword')
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'DisplayClass', "cspinner")
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'DataType', "N(4)")
DBSetProp('OLDV_APPINFO.nchangepassword', 'Field', 'DefaultValue', "0")
*** DBCX Field Properties for OLDV_APPINFO.nchangepassword
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECDESCRIPT","Nchangepassword Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECFRMCAPTN","Nchangepassword") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECDLGCAPTN","Nchangepassword") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECGRDCAPTN","Nchangepassword") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECRPTCAPTN","Nchangepassword") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFEMTOOLTIP","Nchangepassword") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFEMSTATUSTXT","Nchangepassword") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.nchangepassword","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the OLDV_APPINFO.ndefaultlevel field.
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'KeyField', .F.)
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'Updatable', .T.)
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'UpdateName', 'fesys!appinfo.ndefaultlevel')
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'DisplayClass', "coptiongroup")
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'DisplayClassLibrary', "c:\vfe98\vfeframe\libs\ccontrls.vcx")
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'DataType', "N(1)")
DBSetProp('OLDV_APPINFO.ndefaultlevel', 'Field', 'DefaultValue', "1")
*** DBCX Field Properties for OLDV_APPINFO.ndefaultlevel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECDESCRIPT","Ndefaultlevel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECFRMCAPTN","Ndefaultlevel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECDLGCAPTN","Ndefaultlevel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECGRDCAPTN","Ndefaultlevel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECRPTCAPTN","Ndefaultlevel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMTOOLTIP","Ndefaultlevel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMSTATUSTXT","Ndefaultlevel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("FESYS!OLDV_APPINFO.ndefaultlevel","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
