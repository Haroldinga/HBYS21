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
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\HBYSDATA"
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
		Malbilgisi.Maas_Muvafakat_Miktari;
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
 
