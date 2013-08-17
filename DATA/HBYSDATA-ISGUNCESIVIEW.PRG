***************** Begin View Definition ISGUNCESIVIEW ***************


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



CREATE SQL VIEW "ISGUNCESIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Isguncesi.IsGuncesi_Id,;
		Isguncesi.Departman_Adi,;
		Isguncesi.Gorev_Adi,;
		Isguncesi.Personel_Id,;
		Isguncesi.Islem_Adi,;
		Isguncesi.Islem_Tarihi,;
		Isguncesi.Aciklama;
	FROM dbo.IsGuncesi Isguncesi

DBSetProp('ISGUNCESIVIEW', 'View', 'UpdateType', 1)
DBSetProp('ISGUNCESIVIEW', 'View', 'WhereType', 3)
DBSetProp('ISGUNCESIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ISGUNCESIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ISGUNCESIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ISGUNCESIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ISGUNCESIVIEW', 'View', 'Tables', 'dbo.IsGuncesi')
DBSetProp('ISGUNCESIVIEW', 'View', 'Prepared', .F.)
DBSetProp('ISGUNCESIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ISGUNCESIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ISGUNCESIVIEW', 'View', 'FetchSize', -1)
DBSetProp('ISGUNCESIVIEW', 'View', 'Comment', "")
DBSetProp('ISGUNCESIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ISGUNCESIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ISGUNCESIVIEW
	GoExplorer.odbcx.Validate("ISGUNCESIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW","VIEW",;
		"VFECDESCRIPT","Isguncesiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for ISGUNCESIVIEW
*** Props for the ISGUNCESIVIEW.isguncesi_id field.
DBSetProp('ISGUNCESIVIEW.isguncesi_id', 'Field', 'KeyField', .T.)
DBSetProp('ISGUNCESIVIEW.isguncesi_id', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.isguncesi_id', 'Field', 'UpdateName', 'dbo.IsGuncesi.IsGuncesi_Id')
DBSetProp('ISGUNCESIVIEW.isguncesi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ISGUNCESIVIEW.isguncesi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECDESCRIPT","Isguncesi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECFRMCAPTN","Isguncesi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECDLGCAPTN","Isguncesi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECGRDCAPTN","Isguncesi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECRPTCAPTN","Isguncesi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFEMTOOLTIP","Isguncesi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFEMSTATUSTXT","Isguncesi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.isguncesi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.departman_adi field.
DBSetProp('ISGUNCESIVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Departman_Adi')
DBSetProp('ISGUNCESIVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ISGUNCESIVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.gorev_adi field.
DBSetProp('ISGUNCESIVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Gorev_Adi')
DBSetProp('ISGUNCESIVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ISGUNCESIVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Gorev Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Gorev Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Gorev Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Gorev Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Gorev Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Gorev Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.personel_id field.
DBSetProp('ISGUNCESIVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.personel_id', 'Field', 'UpdateName', 'dbo.IsGuncesi.Personel_Id')
DBSetProp('ISGUNCESIVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ISGUNCESIVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.personel_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.islem_adi field.
DBSetProp('ISGUNCESIVIEW.islem_adi', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.islem_adi', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.islem_adi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Islem_Adi')
DBSetProp('ISGUNCESIVIEW.islem_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISGUNCESIVIEW.islem_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECDESCRIPT","Islem Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECFRMCAPTN","Islem Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECDLGCAPTN","Islem Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECGRDCAPTN","Islem Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECRPTCAPTN","Islem Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFEMTOOLTIP","Islem Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFEMSTATUSTXT","Islem Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.islem_tarihi field.
DBSetProp('ISGUNCESIVIEW.islem_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.islem_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.islem_tarihi', 'Field', 'UpdateName', 'dbo.IsGuncesi.Islem_Tarihi')
DBSetProp('ISGUNCESIVIEW.islem_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for ISGUNCESIVIEW.islem_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECDESCRIPT","Islem Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECFRMCAPTN","Islem Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECDLGCAPTN","Islem Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECGRDCAPTN","Islem Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECRPTCAPTN","Islem Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFEMTOOLTIP","Islem Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFEMSTATUSTXT","Islem Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.islem_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ISGUNCESIVIEW.aciklama field.
DBSetProp('ISGUNCESIVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('ISGUNCESIVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('ISGUNCESIVIEW.aciklama', 'Field', 'UpdateName', 'dbo.IsGuncesi.Aciklama')
DBSetProp('ISGUNCESIVIEW.aciklama', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ISGUNCESIVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISGUNCESIVIEW.aciklama","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
