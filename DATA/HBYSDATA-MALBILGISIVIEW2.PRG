***************** Begin View Definition MALBILGISIVIEW ***************


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



CREATE SQL VIEW "MALBILGISIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Malbilgisi.MalBilgisi_Id,;
		Malbilgisi.MalBilgisi_Fk,;
		Malbilgisi.Borclu_Id,;
		Malbilgisi.Borclu_Adi,;
		Malbilgisi.Rehber_Id,;
		Malbilgisi.Mal_Tipi,;
		Malbilgisi.Mal_Bilgisi,;
		Malbilgisi.Menkul_Bilgisi,;
		Malbilgisi.Banka_Hesap_No,;
		Malbilgisi.Arac_Tipi,;
		Malbilgisi.Plaka_No,;
		Malbilgisi.Il_Adi,;
		Malbilgisi.Ilce_Adi,;
		Malbilgisi.Mahalle_Adi,;
		Malbilgisi.Mulk_Tipi,;
		Malbilgisi.Parsel,;
		Malbilgisi.Sayfa_No,;
		Malbilgisi.Cilt_No,;
		Malbilgisi.Aciklama,;
		Malbilgisi.Mal_Tutari,;
		Malbilgisi.Muhatap_Adi,;
		Malbilgisi.Muhatap_Adresi,;
		Malbilgisi.Haciz_Tarihi,;
		Malbilgisi.Maas_Muvafakat_Miktari;
	FROM dbo.MalBilgisi Malbilgisi

DBSetProp('MALBILGISIVIEW', 'View', 'UpdateType', 1)
DBSetProp('MALBILGISIVIEW', 'View', 'WhereType', 3)
DBSetProp('MALBILGISIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MALBILGISIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MALBILGISIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MALBILGISIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MALBILGISIVIEW', 'View', 'Tables', 'dbo.MalBilgisi')
DBSetProp('MALBILGISIVIEW', 'View', 'Prepared', .F.)
DBSetProp('MALBILGISIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MALBILGISIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MALBILGISIVIEW', 'View', 'FetchSize', -1)
DBSetProp('MALBILGISIVIEW', 'View', 'ParameterList', "vp_MalBilgisi_Fk,'C'")
DBSetProp('MALBILGISIVIEW', 'View', 'Comment', "")
DBSetProp('MALBILGISIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MALBILGISIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MALBILGISIVIEW
	GoExplorer.odbcx.Validate("MALBILGISIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW","VIEW",;
		"VFECDESCRIPT","Malbilgisiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MalBilgisi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Malbilgisi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Albilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Albilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Albilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Albilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MALBILGISIVIEW
*** Props for the MALBILGISIVIEW.malbilgisi_id field.
DBSetProp('MALBILGISIVIEW.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('MALBILGISIVIEW.malbilgisi_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('MALBILGISIVIEW.malbilgisi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MALBILGISIVIEW.malbilgisi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MALBILGISIVIEW.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Albilgisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Albilgisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Albilgisi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Albilgisi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Albilgisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Albilgisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.malbilgisi_fk field.
DBSetProp('MALBILGISIVIEW.malbilgisi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.malbilgisi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.malbilgisi_fk', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Fk')
DBSetProp('MALBILGISIVIEW.malbilgisi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIVIEW.malbilgisi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECDESCRIPT","Malbilgisi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECFRMCAPTN","Albilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECDLGCAPTN","Albilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECGRDCAPTN","Albilgisi Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECRPTCAPTN","Albilgisi Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFEMTOOLTIP","Albilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFEMSTATUSTXT","Albilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.malbilgisi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.borclu_id field.
DBSetProp('MALBILGISIVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Id')
DBSetProp('MALBILGISIVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Orclu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Orclu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Orclu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Orclu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Orclu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Orclu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.borclu_adi field.
DBSetProp('MALBILGISIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Adi')
DBSetProp('MALBILGISIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Orclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Orclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Orclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Orclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Orclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Orclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.rehber_id field.
DBSetProp('MALBILGISIVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Rehber_Id')
DBSetProp('MALBILGISIVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Ehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Ehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Ehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Ehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Ehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Ehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.mal_tipi field.
DBSetProp('MALBILGISIVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('MALBILGISIVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Al Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Al Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Al Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Al Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Al Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Al Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.mal_bilgisi field.
DBSetProp('MALBILGISIVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('MALBILGISIVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Al Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Al Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Al Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Al Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Al Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Al Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.menkul_bilgisi field.
DBSetProp('MALBILGISIVIEW.menkul_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.menkul_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.menkul_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Menkul_Bilgisi')
DBSetProp('MALBILGISIVIEW.menkul_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIVIEW.menkul_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECDESCRIPT","Menkul Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECFRMCAPTN","Enkul Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECDLGCAPTN","Enkul Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECGRDCAPTN","Enkul Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECRPTCAPTN","Enkul Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFEMTOOLTIP","Enkul Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Enkul Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.menkul_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.banka_hesap_no field.
DBSetProp('MALBILGISIVIEW.banka_hesap_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.banka_hesap_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.banka_hesap_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Banka_Hesap_No')
DBSetProp('MALBILGISIVIEW.banka_hesap_no', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISIVIEW.banka_hesap_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECDESCRIPT","Banka Hesap No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECFRMCAPTN","Anka Hesap No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECDLGCAPTN","Anka Hesap No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECGRDCAPTN","Anka Hesap No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECRPTCAPTN","Anka Hesap No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFEMTOOLTIP","Anka Hesap No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFEMSTATUSTXT","Anka Hesap No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.banka_hesap_no","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.arac_tipi field.
DBSetProp('MALBILGISIVIEW.arac_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.arac_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.arac_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Arac_Tipi')
DBSetProp('MALBILGISIVIEW.arac_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MALBILGISIVIEW.arac_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECDESCRIPT","Arac Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECFRMCAPTN","Rac Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECDLGCAPTN","Rac Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECGRDCAPTN","Rac Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECRPTCAPTN","Rac Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFEMTOOLTIP","Rac Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFEMSTATUSTXT","Rac Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.arac_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.plaka_no field.
DBSetProp('MALBILGISIVIEW.plaka_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.plaka_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.plaka_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Plaka_No')
DBSetProp('MALBILGISIVIEW.plaka_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MALBILGISIVIEW.plaka_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECDESCRIPT","Plaka No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECFRMCAPTN","Laka No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECDLGCAPTN","Laka No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECGRDCAPTN","Laka No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECRPTCAPTN","Laka No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFEMTOOLTIP","Laka No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFEMSTATUSTXT","Laka No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.plaka_no","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.il_adi field.
DBSetProp('MALBILGISIVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.il_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Il_Adi')
DBSetProp('MALBILGISIVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","L Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","L Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","L Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","L Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","L Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","L Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.il_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.ilce_adi field.
DBSetProp('MALBILGISIVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Ilce_Adi')
DBSetProp('MALBILGISIVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Lce Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Lce Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Lce Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Lce Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Lce Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Lce Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.mahalle_adi field.
DBSetProp('MALBILGISIVIEW.mahalle_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.mahalle_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.mahalle_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mahalle_Adi')
DBSetProp('MALBILGISIVIEW.mahalle_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIVIEW.mahalle_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECDESCRIPT","Mahalle Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECFRMCAPTN","Ahalle Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECDLGCAPTN","Ahalle Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECGRDCAPTN","Ahalle Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECRPTCAPTN","Ahalle Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFEMTOOLTIP","Ahalle Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFEMSTATUSTXT","Ahalle Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mahalle_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.mulk_tipi field.
DBSetProp('MALBILGISIVIEW.mulk_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.mulk_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.mulk_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mulk_Tipi')
DBSetProp('MALBILGISIVIEW.mulk_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIVIEW.mulk_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECDESCRIPT","Mulk Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECFRMCAPTN","Ulk Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECDLGCAPTN","Ulk Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECGRDCAPTN","Ulk Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECRPTCAPTN","Ulk Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFEMTOOLTIP","Ulk Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFEMSTATUSTXT","Ulk Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mulk_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.parsel field.
DBSetProp('MALBILGISIVIEW.parsel', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.parsel', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.parsel', 'Field', 'UpdateName', 'dbo.MalBilgisi.Parsel')
DBSetProp('MALBILGISIVIEW.parsel', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISIVIEW.parsel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECDESCRIPT","Parsel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECFRMCAPTN","Arsel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECDLGCAPTN","Arsel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECGRDCAPTN","Arsel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECRPTCAPTN","Arsel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFEMTOOLTIP","Arsel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFEMSTATUSTXT","Arsel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.parsel","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.sayfa_no field.
DBSetProp('MALBILGISIVIEW.sayfa_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.sayfa_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.sayfa_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Sayfa_No')
DBSetProp('MALBILGISIVIEW.sayfa_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISIVIEW.sayfa_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECDESCRIPT","Sayfa No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECFRMCAPTN","Ayfa No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECDLGCAPTN","Ayfa No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECGRDCAPTN","Ayfa No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECRPTCAPTN","Ayfa No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFEMTOOLTIP","Ayfa No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFEMSTATUSTXT","Ayfa No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.sayfa_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.cilt_no field.
DBSetProp('MALBILGISIVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Cilt_No')
DBSetProp('MALBILGISIVIEW.cilt_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISIVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Ilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Ilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Ilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Ilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Ilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Ilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.aciklama field.
DBSetProp('MALBILGISIVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.aciklama', 'Field', 'UpdateName', 'dbo.MalBilgisi.Aciklama')
DBSetProp('MALBILGISIVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Ciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Ciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Ciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Ciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Ciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Ciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.aciklama","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.mal_tutari field.
DBSetProp('MALBILGISIVIEW.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.mal_tutari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.mal_tutari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tutari')
DBSetProp('MALBILGISIVIEW.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISIVIEW.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Al Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Al Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Al Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Al Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Al Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Al Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.mal_tutari","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.muhatap_adi field.
DBSetProp('MALBILGISIVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adi')
DBSetProp('MALBILGISIVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISIVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Uhatap Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Uhatap Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Uhatap Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Uhatap Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Uhatap Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Uhatap Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.muhatap_adresi field.
DBSetProp('MALBILGISIVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adresi')
DBSetProp('MALBILGISIVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Uhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Uhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Uhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Uhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Uhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Uhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.haciz_tarihi field.
DBSetProp('MALBILGISIVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Haciz_Tarihi')
DBSetProp('MALBILGISIVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MALBILGISIVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Aciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Aciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Aciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Aciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Aciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Aciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MALBILGISIVIEW.maas_muvafakat_miktari field.
DBSetProp('MALBILGISIVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Maas_Muvafakat_Miktari')
DBSetProp('MALBILGISIVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISIVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Aas Muvafakat Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Aas Muvafakat Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Aas Muvafakat Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Aas Muvafakat Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Aas Muvafakat Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Aas Muvafakat Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
