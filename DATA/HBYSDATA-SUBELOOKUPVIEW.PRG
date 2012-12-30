***************** Begin View Definition SUBELOOKUPVIEW ***************


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



CREATE SQL VIEW "SUBELOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Sube.Sube_Id,;
		Sube.Muvekkil_Id,;
		Sube.Sube_Adi,;
		Sube.Sube_Kodu,;
		Sube.Muvekkil_Adi;
	FROM dbo.Sube Sube

DBSetProp('SUBELOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('SUBELOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('SUBELOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('SUBELOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('SUBELOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('SUBELOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('SUBELOOKUPVIEW', 'View', 'Tables', 'dbo.Sube')
DBSetProp('SUBELOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('SUBELOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('SUBELOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SUBELOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('SUBELOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('SUBELOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('SUBELOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for SUBELOOKUPVIEW
	GoExplorer.odbcx.Validate("SUBELOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Subelookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for SUBELOOKUPVIEW
*** Props for the SUBELOOKUPVIEW.sube_id field.
DBSetProp('SUBELOOKUPVIEW.sube_id', 'Field', 'KeyField', .T.)
DBSetProp('SUBELOOKUPVIEW.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('SUBELOOKUPVIEW.sube_id', 'Field', 'UpdateName', 'dbo.Sube.Sube_Id')
DBSetProp('SUBELOOKUPVIEW.sube_id', 'Field', 'DataType', "C(36)")
DBSetProp('SUBELOOKUPVIEW.sube_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for SUBELOOKUPVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Sube Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Sube Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Sube Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Sube Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Sube Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Sube Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the SUBELOOKUPVIEW.muvekkil_id field.
DBSetProp('SUBELOOKUPVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('SUBELOOKUPVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('SUBELOOKUPVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Sube.Muvekkil_Id')
DBSetProp('SUBELOOKUPVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SUBELOOKUPVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the SUBELOOKUPVIEW.sube_adi field.
DBSetProp('SUBELOOKUPVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBELOOKUPVIEW.sube_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBELOOKUPVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('SUBELOOKUPVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBELOOKUPVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Sube Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Sube Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Sube Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Sube Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Sube Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Sube Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SUBELOOKUPVIEW.sube_kodu field.
DBSetProp('SUBELOOKUPVIEW.sube_kodu', 'Field', 'KeyField', .F.)
DBSetProp('SUBELOOKUPVIEW.sube_kodu', 'Field', 'Updatable', .T.)
DBSetProp('SUBELOOKUPVIEW.sube_kodu', 'Field', 'UpdateName', 'dbo.Sube.Sube_Kodu')
DBSetProp('SUBELOOKUPVIEW.sube_kodu', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for SUBELOOKUPVIEW.sube_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECDESCRIPT","Sube Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECFRMCAPTN","Sube Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECDLGCAPTN","Sube Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECGRDCAPTN","Sube Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECRPTCAPTN","Sube Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFEMTOOLTIP","Sube Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFEMSTATUSTXT","Sube Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.sube_kodu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the SUBELOOKUPVIEW.muvekkil_adi field.
DBSetProp('SUBELOOKUPVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBELOOKUPVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBELOOKUPVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Sube.Muvekkil_Adi')
DBSetProp('SUBELOOKUPVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBELOOKUPVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBELOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
