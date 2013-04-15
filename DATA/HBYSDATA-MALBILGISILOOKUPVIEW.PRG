***************** Begin View Definition MALBILGISILOOKUPVIEW ***************


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



CREATE SQL VIEW "MALBILGISILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Malbilgisi.MalBilgisi_Id,;
		Malbilgisi.MalBilgisi_Fk,;
		Malbilgisi.Mal_Bilgisi,;
		Malbilgisi.Borclu_Adi,;
		Malbilgisi.Mal_Tipi,;
		Malbilgisi.Mal_Tutari,;
		Malbilgisi.Muhatap_Adi,;
		Malbilgisi.Muhatap_Adresi,;
		Malbilgisi.Haciz_Tarihi,;
		Malbilgisi.Maas_Muvafakat_Miktari,;
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
		Malbilgisi.Cilt_No;
	FROM dbo.MalBilgisi Malbilgisi;
	WHERE Malbilgisi.MalBilgisi_Fk = ( ?vp_MalBilgisi_Fk )

DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'Tables', 'dbo.MalBilgisi')
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'ParameterList', "vp_MalBilgisi_Fk,'C'")
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MALBILGISILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MALBILGISILOOKUPVIEW
	GoExplorer.odbcx.Validate("MALBILGISILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Malbilgisilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MalBilgisi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Malbilgisi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Malbilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Malbilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Malbilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Malbilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MALBILGISILOOKUPVIEW
*** Props for the MALBILGISILOOKUPVIEW.malbilgisi_id field.
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_id', 'Field', 'Updatable', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Malbilgisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Malbilgisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Malbilgisi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Malbilgisi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Malbilgisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.malbilgisi_fk field.
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_fk', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Fk')
DBSetProp('MALBILGISILOOKUPVIEW.malbilgisi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.malbilgisi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECDESCRIPT","Malbilgisi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECFRMCAPTN","Malbilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECDLGCAPTN","Malbilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECGRDCAPTN","Malbilgisi Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECRPTCAPTN","Malbilgisi Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFEMTOOLTIP","Malbilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.malbilgisi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.mal_bilgisi field.
DBSetProp('MALBILGISILOOKUPVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('MALBILGISILOOKUPVIEW.mal_bilgisi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.borclu_adi field.
DBSetProp('MALBILGISILOOKUPVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Adi')
DBSetProp('MALBILGISILOOKUPVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.mal_tipi field.
DBSetProp('MALBILGISILOOKUPVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('MALBILGISILOOKUPVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.mal_tutari field.
DBSetProp('MALBILGISILOOKUPVIEW.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_tutari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.mal_tutari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tutari')
DBSetProp('MALBILGISILOOKUPVIEW.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mal_tutari","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.muhatap_adi field.
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adi')
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.muhatap_adresi field.
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adresi')
DBSetProp('MALBILGISILOOKUPVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.haciz_tarihi field.
DBSetProp('MALBILGISILOOKUPVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Haciz_Tarihi')
DBSetProp('MALBILGISILOOKUPVIEW.haciz_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.maas_muvafakat_miktari field.
DBSetProp('MALBILGISILOOKUPVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Maas_Muvafakat_Miktari')
DBSetProp('MALBILGISILOOKUPVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maas Muvafakat Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maas Muvafakat Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maas Muvafakat Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maas Muvafakat Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maas Muvafakat Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maas Muvafakat Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.menkul_bilgisi field.
DBSetProp('MALBILGISILOOKUPVIEW.menkul_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.menkul_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.menkul_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Menkul_Bilgisi')
DBSetProp('MALBILGISILOOKUPVIEW.menkul_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.menkul_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECDESCRIPT","Menkul Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECFRMCAPTN","Enkul Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECDLGCAPTN","Enkul Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECGRDCAPTN","Enkul Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECRPTCAPTN","Enkul Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFEMTOOLTIP","Enkul Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Enkul Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.menkul_bilgisi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.banka_hesap_no field.
DBSetProp('MALBILGISILOOKUPVIEW.banka_hesap_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.banka_hesap_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.banka_hesap_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Banka_Hesap_No')
DBSetProp('MALBILGISILOOKUPVIEW.banka_hesap_no', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.banka_hesap_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECDESCRIPT","Banka Hesap No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECFRMCAPTN","Anka Hesap No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECDLGCAPTN","Anka Hesap No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECGRDCAPTN","Anka Hesap No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECRPTCAPTN","Anka Hesap No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFEMTOOLTIP","Anka Hesap No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFEMSTATUSTXT","Anka Hesap No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.banka_hesap_no","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.arac_tipi field.
DBSetProp('MALBILGISILOOKUPVIEW.arac_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.arac_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.arac_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Arac_Tipi')
DBSetProp('MALBILGISILOOKUPVIEW.arac_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.arac_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECDESCRIPT","Arac Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECFRMCAPTN","Rac Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECDLGCAPTN","Rac Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECGRDCAPTN","Rac Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECRPTCAPTN","Rac Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFEMTOOLTIP","Rac Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFEMSTATUSTXT","Rac Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.arac_tipi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.plaka_no field.
DBSetProp('MALBILGISILOOKUPVIEW.plaka_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.plaka_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.plaka_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Plaka_No')
DBSetProp('MALBILGISILOOKUPVIEW.plaka_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.plaka_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECDESCRIPT","Plaka No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECFRMCAPTN","Laka No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECDLGCAPTN","Laka No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECGRDCAPTN","Laka No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECRPTCAPTN","Laka No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFEMTOOLTIP","Laka No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFEMSTATUSTXT","Laka No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.plaka_no","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.il_adi field.
DBSetProp('MALBILGISILOOKUPVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.il_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Il_Adi')
DBSetProp('MALBILGISILOOKUPVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","L Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","L Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","L Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","L Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","L Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","L Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.il_adi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.ilce_adi field.
DBSetProp('MALBILGISILOOKUPVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Ilce_Adi')
DBSetProp('MALBILGISILOOKUPVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Lce Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Lce Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Lce Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Lce Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Lce Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Lce Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.mahalle_adi field.
DBSetProp('MALBILGISILOOKUPVIEW.mahalle_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.mahalle_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.mahalle_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mahalle_Adi')
DBSetProp('MALBILGISILOOKUPVIEW.mahalle_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.mahalle_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECDESCRIPT","Mahalle Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECFRMCAPTN","Ahalle Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECDLGCAPTN","Ahalle Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECGRDCAPTN","Ahalle Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECRPTCAPTN","Ahalle Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFEMTOOLTIP","Ahalle Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFEMSTATUSTXT","Ahalle Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mahalle_adi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.mulk_tipi field.
DBSetProp('MALBILGISILOOKUPVIEW.mulk_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.mulk_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.mulk_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mulk_Tipi')
DBSetProp('MALBILGISILOOKUPVIEW.mulk_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.mulk_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECDESCRIPT","Mulk Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECFRMCAPTN","Ulk Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECDLGCAPTN","Ulk Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECGRDCAPTN","Ulk Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECRPTCAPTN","Ulk Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFEMTOOLTIP","Ulk Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFEMSTATUSTXT","Ulk Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.mulk_tipi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.parsel field.
DBSetProp('MALBILGISILOOKUPVIEW.parsel', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.parsel', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.parsel', 'Field', 'UpdateName', 'dbo.MalBilgisi.Parsel')
DBSetProp('MALBILGISILOOKUPVIEW.parsel', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.parsel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECDESCRIPT","Parsel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECFRMCAPTN","Arsel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECDLGCAPTN","Arsel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECGRDCAPTN","Arsel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECRPTCAPTN","Arsel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFEMTOOLTIP","Arsel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFEMSTATUSTXT","Arsel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.parsel","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.sayfa_no field.
DBSetProp('MALBILGISILOOKUPVIEW.sayfa_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.sayfa_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.sayfa_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Sayfa_No')
DBSetProp('MALBILGISILOOKUPVIEW.sayfa_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.sayfa_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECDESCRIPT","Sayfa No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECFRMCAPTN","Ayfa No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECDLGCAPTN","Ayfa No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECGRDCAPTN","Ayfa No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECRPTCAPTN","Ayfa No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFEMTOOLTIP","Ayfa No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFEMSTATUSTXT","Ayfa No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.sayfa_no","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MALBILGISILOOKUPVIEW.cilt_no field.
DBSetProp('MALBILGISILOOKUPVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILOOKUPVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILOOKUPVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Cilt_No')
DBSetProp('MALBILGISILOOKUPVIEW.cilt_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MALBILGISILOOKUPVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Ilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Ilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Ilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Ilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Ilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Ilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILOOKUPVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
