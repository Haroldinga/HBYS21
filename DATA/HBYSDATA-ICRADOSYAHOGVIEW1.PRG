***************** Begin View Definition ICRADOSYAHOGVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
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



CREATE SQL VIEW "ICRADOSYAHOGVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No;
	FROM dbo.IcraDosya Icradosya

DBSetProp('ICRADOSYAHOGVIEW', 'View', 'UpdateType', 1)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'WhereType', 3)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'Prepared', .F.)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'FetchSize', -1)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'Comment', "")
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRADOSYAHOGVIEW
	GoExplorer.odbcx.Validate("ICRADOSYAHOGVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"CBMNOTES","IcraDosya Hýzlý Ön Giriþ View - Ýcra Dosya Numarasýný hýzlý bir þekilde girebilmek için kullanýlýr.") &&Notes
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFECDESCRIPT","Icradosyahogview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ICRADOSYAHOGVIEW
*** Props for the ICRADOSYAHOGVIEW.icradosya_id field.
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAHOGVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Cradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Cradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Cradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Cradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Cradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Cradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRADOSYAHOGVIEW.buro_dosya_no field.
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for ICRADOSYAHOGVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.buro_dosya_no","FIELD",;
		"VFEMFORMAT","ZK") &&Format
ENDIF
 
*** Props for the ICRADOSYAHOGVIEW.icra_dosya_no field.
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'DefaultValue', "transform(year(date()),'9999')+'/'")
*** DBCX Field Properties for ICRADOSYAHOGVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
