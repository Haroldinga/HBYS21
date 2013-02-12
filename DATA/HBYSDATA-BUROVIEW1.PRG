***************** Begin View Definition BUROVIEW ***************


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



CREATE SQL VIEW "BUROVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Buro.Buro_Id,;
		Buro.Buro_Adi,;
		Buro.Buro_Unvani,;
		Buro.Vergi_Dairesi,;
		Buro.Vergi_No,;
		Buro.Baro_Adi,;
		Buro.Tel,;
		Buro.Faks,;
		Buro.Web_Adresi,;
		Buro.e_Posta,;
		Buro.Adres,;
		Buro.Il_Adi,;
		Buro.Ilce_Adi,;
		Buro.Posta_Kodu,;
		Buro.Ulke,;
		Buro.Logo_Id,;
		Buro.Logo_Len,;
		Buro.Kase_Id,;
		Buro.Kase_Len,;
		Buro.glnPosta_Sunucusu,;
		Buro.gdnPosta_Sunucusu,;
		Buro.Kullanici_Adi,;
		Buro.Parola,;
		Buro.UseSSL,;
		Buro.Semiramis_cUserId,;
		Buro.Semiramis_Periyodu;
	FROM dbo.Buro Buro

DBSetProp('BUROVIEW', 'View', 'UpdateType', 1)
DBSetProp('BUROVIEW', 'View', 'WhereType', 2)
DBSetProp('BUROVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BUROVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('BUROVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BUROVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BUROVIEW', 'View', 'Tables', 'dbo.Buro')
DBSetProp('BUROVIEW', 'View', 'Prepared', .F.)
DBSetProp('BUROVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('BUROVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BUROVIEW', 'View', 'FetchSize', -1)
DBSetProp('BUROVIEW', 'View', 'Comment', "")
DBSetProp('BUROVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BUROVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for BUROVIEW
	GoExplorer.odbcx.Validate("BUROVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW","VIEW",;
		"VFECDESCRIPT","Buroview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for BUROVIEW
*** Props for the BUROVIEW.buro_id field.
DBSetProp('BUROVIEW.buro_id', 'Field', 'KeyField', .T.)
DBSetProp('BUROVIEW.buro_id', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.buro_id', 'Field', 'UpdateName', 'dbo.Buro.Buro_Id')
DBSetProp('BUROVIEW.buro_id', 'Field', 'DataType', "C(36)")
DBSetProp('BUROVIEW.buro_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for BUROVIEW.buro_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECDESCRIPT","Buro Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECFRMCAPTN","Büro ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECDLGCAPTN","Büro ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECGRDCAPTN","Büro ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECRPTCAPTN","Büro ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFEMTOOLTIP","Büro ID                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFEMSTATUSTXT","Büro ID                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.buro_adi field.
DBSetProp('BUROVIEW.buro_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.buro_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.buro_adi', 'Field', 'UpdateName', 'dbo.Buro.Buro_Adi')
DBSetProp('BUROVIEW.buro_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BUROVIEW.buro_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECDESCRIPT","Buro Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECFRMCAPTN","Büro Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECDLGCAPTN","Büro Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECGRDCAPTN","Büro Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECRPTCAPTN","Büro Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFEMTOOLTIP","Büro Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFEMSTATUSTXT","Büro Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.buro_unvani field.
DBSetProp('BUROVIEW.buro_unvani', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.buro_unvani', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.buro_unvani', 'Field', 'UpdateName', 'dbo.Buro.Buro_Unvani')
DBSetProp('BUROVIEW.buro_unvani', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BUROVIEW.buro_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECDESCRIPT","Buro Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECFRMCAPTN","Büro Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECDLGCAPTN","Büro Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECGRDCAPTN","Büro Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECRPTCAPTN","Büro Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFEMTOOLTIP","Büro Ünvaný                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFEMSTATUSTXT","Büro Ünvaný                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.buro_unvani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.vergi_dairesi field.
DBSetProp('BUROVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Buro.Vergi_Dairesi')
DBSetProp('BUROVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BUROVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.vergi_no field.
DBSetProp('BUROVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Buro.Vergi_No')
DBSetProp('BUROVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.baro_adi field.
DBSetProp('BUROVIEW.baro_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.baro_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.baro_adi', 'Field', 'UpdateName', 'dbo.Buro.Baro_Adi')
DBSetProp('BUROVIEW.baro_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BUROVIEW.baro_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECDESCRIPT","Baro Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECFRMCAPTN","Baro Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECDLGCAPTN","Baro Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECGRDCAPTN","Baro Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECRPTCAPTN","Baro Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFEMTOOLTIP","Baro Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFEMSTATUSTXT","Baro Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.baro_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.tel field.
DBSetProp('BUROVIEW.tel', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.tel', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.tel', 'Field', 'UpdateName', 'dbo.Buro.Tel')
DBSetProp('BUROVIEW.tel', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.tel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECDESCRIPT","Tel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECFRMCAPTN","Telefon") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECDLGCAPTN","Telefon") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECGRDCAPTN","Telefon") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECRPTCAPTN","Telefon") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMTOOLTIP","Telefon                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMSTATUSTXT","Telefon                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECCLASS","aphonefield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMINPUTMASK","0(999) 999 9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.tel","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the BUROVIEW.faks field.
DBSetProp('BUROVIEW.faks', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.faks', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.faks', 'Field', 'UpdateName', 'dbo.Buro.Faks')
DBSetProp('BUROVIEW.faks', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.faks
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECDESCRIPT","Faks Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECFRMCAPTN","Faks") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECDLGCAPTN","Faks") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECGRDCAPTN","Faks") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECRPTCAPTN","Faks") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMTOOLTIP","Faks") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMSTATUSTXT","Faks") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECCLASS","aphonefield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMINPUTMASK","0(999) 999 9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.faks","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the BUROVIEW.web_adresi field.
DBSetProp('BUROVIEW.web_adresi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.web_adresi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.web_adresi', 'Field', 'UpdateName', 'dbo.Buro.Web_Adresi')
DBSetProp('BUROVIEW.web_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BUROVIEW.web_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECDESCRIPT","Web Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECFRMCAPTN","Web Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECDLGCAPTN","Web Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECGRDCAPTN","Web Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECRPTCAPTN","Web Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFEMTOOLTIP","Web Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFEMSTATUSTXT","Web Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.web_adresi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.e_posta field.
DBSetProp('BUROVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Buro.e_Posta')
DBSetProp('BUROVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BUROVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","e_Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","e_Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","e_Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","e_Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","e_Posta                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","e_Posta                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.e_posta","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.adres field.
DBSetProp('BUROVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.adres', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.adres', 'Field', 'UpdateName', 'dbo.Buro.Adres')
DBSetProp('BUROVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BUROVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.adres","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.il_adi field.
DBSetProp('BUROVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Buro.Il_Adi')
DBSetProp('BUROVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECCLASS","ail_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.il_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.ilce_adi field.
DBSetProp('BUROVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Buro.Ilce_Adi')
DBSetProp('BUROVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECCLASS","ailce_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.posta_kodu field.
DBSetProp('BUROVIEW.posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.posta_kodu', 'Field', 'UpdateName', 'dbo.Buro.Posta_Kodu')
DBSetProp('BUROVIEW.posta_kodu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BUROVIEW.posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECDESCRIPT","Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.posta_kodu","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.ulke field.
DBSetProp('BUROVIEW.ulke', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.ulke', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.ulke', 'Field', 'UpdateName', 'dbo.Buro.Ulke')
DBSetProp('BUROVIEW.ulke', 'Field', 'DataType', "C(25)")
DBSetProp('BUROVIEW.ulke', 'Field', 'DefaultValue', "'Türkiye'")
*** DBCX Field Properties for BUROVIEW.ulke
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECDESCRIPT","Ulke Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECFRMCAPTN","Ülke") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECDLGCAPTN","Ülke") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECGRDCAPTN","Ülke") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECRPTCAPTN","Ülke") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFEMTOOLTIP","Ülke                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFEMSTATUSTXT","Ülke                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.ulke","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.logo_id field.
DBSetProp('BUROVIEW.logo_id', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.logo_id', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.logo_id', 'Field', 'UpdateName', 'dbo.Buro.Logo_Id')
DBSetProp('BUROVIEW.logo_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BUROVIEW.logo_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECDESCRIPT","Logo Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECFRMCAPTN","Logo") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECDLGCAPTN","Logo") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECGRDCAPTN","Logo") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECRPTCAPTN","Logo") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFEMTOOLTIP","Logo                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFEMSTATUSTXT","Logo                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_id","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.logo_len field.
DBSetProp('BUROVIEW.logo_len', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.logo_len', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.logo_len', 'Field', 'UpdateName', 'dbo.Buro.Logo_Len')
DBSetProp('BUROVIEW.logo_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for BUROVIEW.logo_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECDESCRIPT","Logo Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECFRMCAPTN","Logo Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECDLGCAPTN","Logo Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECGRDCAPTN","Logo Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECRPTCAPTN","Logo Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFEMTOOLTIP","Logo Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFEMSTATUSTXT","Logo Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.logo_len","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.kase_id field.
DBSetProp('BUROVIEW.kase_id', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.kase_id', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.kase_id', 'Field', 'UpdateName', 'dbo.Buro.Kase_Id')
DBSetProp('BUROVIEW.kase_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BUROVIEW.kase_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECDESCRIPT","Kase Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECFRMCAPTN","Kase Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECDLGCAPTN","Kase Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECGRDCAPTN","Kase Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECRPTCAPTN","Kase Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFEMTOOLTIP","Kase Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFEMSTATUSTXT","Kase Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_id","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.kase_len field.
DBSetProp('BUROVIEW.kase_len', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.kase_len', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.kase_len', 'Field', 'UpdateName', 'dbo.Buro.Kase_Len')
DBSetProp('BUROVIEW.kase_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for BUROVIEW.kase_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECDESCRIPT","Kase Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECFRMCAPTN","Kase Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECDLGCAPTN","Kase Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECGRDCAPTN","Kase Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECRPTCAPTN","Kase Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFEMTOOLTIP","Kase Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFEMSTATUSTXT","Kase Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kase_len","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.glnposta_sunucusu field.
DBSetProp('BUROVIEW.glnposta_sunucusu', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.glnposta_sunucusu', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.glnposta_sunucusu', 'Field', 'UpdateName', 'dbo.Buro.glnPosta_Sunucusu')
DBSetProp('BUROVIEW.glnposta_sunucusu', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BUROVIEW.glnposta_sunucusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECDESCRIPT","Glnposta Sunucusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECFRMCAPTN","Gelen Posta Sunucusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECDLGCAPTN","Gelen Posta Sunucusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECGRDCAPTN","Gelen Posta Sunucusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECRPTCAPTN","Gelen Posta Sunucusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFEMTOOLTIP","Gelen Posta Sunucusu                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFEMSTATUSTXT","Gelen Posta Sunucusu                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.glnposta_sunucusu","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.gdnposta_sunucusu field.
DBSetProp('BUROVIEW.gdnposta_sunucusu', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.gdnposta_sunucusu', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.gdnposta_sunucusu', 'Field', 'UpdateName', 'dbo.Buro.gdnPosta_Sunucusu')
DBSetProp('BUROVIEW.gdnposta_sunucusu', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BUROVIEW.gdnposta_sunucusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECDESCRIPT","Gdnposta Sunucusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECFRMCAPTN","Giden Posta Sunucusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECDLGCAPTN","Giden Posta Sunucusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECGRDCAPTN","Giden Posta Sunucusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECRPTCAPTN","Giden Posta Sunucusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFEMTOOLTIP","Giden Posta Sunucusu                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFEMSTATUSTXT","Giden Posta Sunucusu                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.gdnposta_sunucusu","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.kullanici_adi field.
DBSetProp('BUROVIEW.kullanici_adi', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.kullanici_adi', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.kullanici_adi', 'Field', 'UpdateName', 'dbo.Buro.Kullanici_Adi')
DBSetProp('BUROVIEW.kullanici_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BUROVIEW.kullanici_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECDESCRIPT","Kullanici Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECFRMCAPTN","Kullanýcý Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECDLGCAPTN","Kullanýcý Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECGRDCAPTN","Kullanýcý Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECRPTCAPTN","Kullanýcý Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFEMTOOLTIP","Kullanýcý Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFEMSTATUSTXT","Kullanýcý Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.kullanici_adi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.parola field.
DBSetProp('BUROVIEW.parola', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.parola', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.parola', 'Field', 'UpdateName', 'dbo.Buro.Parola')
DBSetProp('BUROVIEW.parola', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BUROVIEW.parola
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECDESCRIPT","Parola Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECFRMCAPTN","Parola") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECDLGCAPTN","Parola") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECGRDCAPTN","Parola") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECRPTCAPTN","Parola") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFEMTOOLTIP","Parola") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFEMSTATUSTXT","Parola") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.parola","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.usessl field.
DBSetProp('BUROVIEW.usessl', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.usessl', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.usessl', 'Field', 'UpdateName', 'dbo.Buro.UseSSL')
DBSetProp('BUROVIEW.usessl', 'Field', 'DataType', "L")
*** DBCX Field Properties for BUROVIEW.usessl
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECDESCRIPT","Usessl Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECFRMCAPTN","SSL") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECDLGCAPTN","SSL") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECGRDCAPTN","SSL") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECRPTCAPTN","SSL") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFEMTOOLTIP","SSL                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFEMSTATUSTXT","SSL                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.usessl","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the BUROVIEW.semiramis_cuserid field.
DBSetProp('BUROVIEW.semiramis_cuserid', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.semiramis_cuserid', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.semiramis_cuserid', 'Field', 'UpdateName', 'dbo.Buro.Semiramis_cUserId')
DBSetProp('BUROVIEW.semiramis_cuserid', 'Field', 'DataType', "C(30)")
*** DBCX Field Properties for BUROVIEW.semiramis_cuserid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECDESCRIPT","Semiramis Cuserid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECFRMCAPTN","Semiramis Kullanýcýsý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECDLGCAPTN","Semiramis Kullanýcýsý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECGRDCAPTN","Semiramis Kullanýcýsý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECRPTCAPTN","Semiramis Kullanýcýsý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFEMTOOLTIP","Semiramis Kullanýcýsý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFEMSTATUSTXT","Semiramis Kullanýcýsý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_cuserid","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the BUROVIEW.semiramis_periyodu field.
DBSetProp('BUROVIEW.semiramis_periyodu', 'Field', 'KeyField', .F.)
DBSetProp('BUROVIEW.semiramis_periyodu', 'Field', 'Updatable', .T.)
DBSetProp('BUROVIEW.semiramis_periyodu', 'Field', 'UpdateName', 'dbo.Buro.Semiramis_Periyodu')
DBSetProp('BUROVIEW.semiramis_periyodu', 'Field', 'DataType', "I")
*** DBCX Field Properties for BUROVIEW.semiramis_periyodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECDESCRIPT","Semiramis Periyodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECFRMCAPTN","Semiramis Periyodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECDLGCAPTN","Semiramis Periyodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECGRDCAPTN","Semiramis Periyodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECRPTCAPTN","Semiramis Periyodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFEMTOOLTIP","Semiramis Periyodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFEMSTATUSTXT","Semiramis Periyodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BUROVIEW.semiramis_periyodu","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
