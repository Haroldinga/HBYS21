***************** Begin View Definition ICRADOSYAHGVIEW ***************


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
DBSetProp('ICRADOSYAHOGVIEW', 'View', 'SendUpdates', .T.)
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
 
	*** DBCX View Properties for ICRADOSYAHGVIEW
	GoExplorer.odbcx.Validate("ICRADOSYAHOGVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"CBMNOTES","Ýcra Dosya Numarasýný hýzlý bir þekilde girebilmek için kullanýlýr.") &&Notes
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFECDESCRIPT","Icradosyahgview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for ICRADOSYAHGVIEW
*** Props for the ICRADOSYAHGVIEW.icradosya_id field.
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('ICRADOSYAHOGVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ICRADOSYAHGVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","IcraDosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","IcraDosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","IcraDosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","IcraDosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","IcraDosya ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","IcraDosya ID                                         ") &&Status Bar Text
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
 
*** Props for the ICRADOSYAHGVIEW.buro_dosya_no field.
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('ICRADOSYAHOGVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for ICRADOSYAHGVIEW.buro_dosya_no
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
ENDIF
 
*** Props for the ICRADOSYAHGVIEW.icra_dosya_no field.
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('ICRADOSYAHOGVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRADOSYAHGVIEW.icra_dosya_no
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
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRADOSYAHOGVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
