***************** Begin View Definition DFDFDFD ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "DFDFDFD" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Buro.Buro_Id,;
		Buro.Buro_Adi,;
		Buro.Buro_Unvani,;
		Buro.Vergi_Dairesi,;
		Buro.Vergi_No,;
		(select SUM(IcraDosyaHesabi.asil_alacak);
	FROM dbo.Icradosyahesabi IcraDosyahesabi) as toplam;
	FROM dbo.Buro Buro

DBSetProp('DFDFDFD', 'View', 'UpdateType', 1)
DBSetProp('DFDFDFD', 'View', 'WhereType', 3)
DBSetProp('DFDFDFD', 'View', 'FetchMemo', .T.)
DBSetProp('DFDFDFD', 'View', 'SendUpdates', .F.)
DBSetProp('DFDFDFD', 'View', 'UseMemoSize', 255)
DBSetProp('DFDFDFD', 'View', 'MaxRecords', -1)
DBSetProp('DFDFDFD', 'View', 'Tables', 'dbo.Buro')
DBSetProp('DFDFDFD', 'View', 'Prepared', .F.)
DBSetProp('DFDFDFD', 'View', 'CompareMemo', .T.)
DBSetProp('DFDFDFD', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DFDFDFD', 'View', 'FetchSize', 100)
DBSetProp('DFDFDFD', 'View', 'Comment', "")
DBSetProp('DFDFDFD', 'View', 'BatchUpdateCount', 1)
DBSetProp('DFDFDFD', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DFDFDFD
	GoExplorer.odbcx.Validate("DFDFDFD","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD","VIEW",;
		"VFECDESCRIPT","Dfdfdfd Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DFDFDFD
*** Props for the DFDFDFD.buro_id field.
DBSetProp('DFDFDFD.buro_id', 'Field', 'KeyField', .T.)
DBSetProp('DFDFDFD.buro_id', 'Field', 'Updatable', .F.)
DBSetProp('DFDFDFD.buro_id', 'Field', 'UpdateName', 'dbo.Buro.Buro_Id')
DBSetProp('DFDFDFD.buro_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for DFDFDFD.buro_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECDESCRIPT","Buro Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECFRMCAPTN","Buro Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECDLGCAPTN","Buro Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECGRDCAPTN","Buro Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECRPTCAPTN","Buro Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFEMTOOLTIP","Buro Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFEMSTATUSTXT","Buro Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DFDFDFD.buro_adi field.
DBSetProp('DFDFDFD.buro_adi', 'Field', 'KeyField', .F.)
DBSetProp('DFDFDFD.buro_adi', 'Field', 'Updatable', .T.)
DBSetProp('DFDFDFD.buro_adi', 'Field', 'UpdateName', 'dbo.Buro.Buro_Adi')
DBSetProp('DFDFDFD.buro_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DFDFDFD.buro_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECDESCRIPT","Buro Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECFRMCAPTN","Buro Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECDLGCAPTN","Buro Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECGRDCAPTN","Buro Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECRPTCAPTN","Buro Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFEMTOOLTIP","Buro Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFEMSTATUSTXT","Buro Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DFDFDFD.buro_unvani field.
DBSetProp('DFDFDFD.buro_unvani', 'Field', 'KeyField', .F.)
DBSetProp('DFDFDFD.buro_unvani', 'Field', 'Updatable', .T.)
DBSetProp('DFDFDFD.buro_unvani', 'Field', 'UpdateName', 'dbo.Buro.Buro_Unvani')
DBSetProp('DFDFDFD.buro_unvani', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for DFDFDFD.buro_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECDESCRIPT","Buro Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECFRMCAPTN","Buro Unvani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECDLGCAPTN","Buro Unvani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECGRDCAPTN","Buro Unvani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECRPTCAPTN","Buro Unvani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFEMTOOLTIP","Buro Unvani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFEMSTATUSTXT","Buro Unvani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.buro_unvani","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DFDFDFD.vergi_dairesi field.
DBSetProp('DFDFDFD.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('DFDFDFD.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('DFDFDFD.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Buro.Vergi_Dairesi')
DBSetProp('DFDFDFD.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DFDFDFD.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_dairesi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the DFDFDFD.vergi_no field.
DBSetProp('DFDFDFD.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('DFDFDFD.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('DFDFDFD.vergi_no', 'Field', 'UpdateName', 'dbo.Buro.Vergi_No')
DBSetProp('DFDFDFD.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DFDFDFD.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.vergi_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the DFDFDFD.toplam field.
DBSetProp('DFDFDFD.toplam', 'Field', 'KeyField', .F.)
DBSetProp('DFDFDFD.toplam', 'Field', 'Updatable', .F.)
DBSetProp('DFDFDFD.toplam', 'Field', 'UpdateName', '(select SUM(IcraDosyaHesabi.asil_alacak) from dbo.Icradosyahesabi IcraDosyahesabi)')
DBSetProp('DFDFDFD.toplam', 'Field', 'DataType', "Y")
*** DBCX Field Properties for DFDFDFD.toplam
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECDESCRIPT","Toplam Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECFRMCAPTN","Toplam") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECDLGCAPTN","Toplam") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECGRDCAPTN","Toplam") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECRPTCAPTN","Toplam") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFEMTOOLTIP","Toplam") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFEMSTATUSTXT","Toplam") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!DFDFDFD.toplam","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
