***************** Begin View Definition PTTBARKODVIEW ***************


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



CREATE SQL VIEW "PTTBARKODVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Pttbarkod.Barkod_Id,;
		Pttbarkod.Gonderi_Tipi,;
		Pttbarkod.Gonderi_Kodu,;
		Pttbarkod.Ptt_Musteri_No,;
		Pttbarkod.Ilk_Gonderi_No,;
		Pttbarkod.Son_Gonderi_No,;
		Pttbarkod.Siradaki_Gonderi_No;
	FROM dbo.PTTBarkod Pttbarkod

DBSetProp('PTTBARKODVIEW', 'View', 'UpdateType', 1)
DBSetProp('PTTBARKODVIEW', 'View', 'WhereType', 3)
DBSetProp('PTTBARKODVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('PTTBARKODVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('PTTBARKODVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PTTBARKODVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PTTBARKODVIEW', 'View', 'Tables', 'dbo.PTTBarkod')
DBSetProp('PTTBARKODVIEW', 'View', 'Prepared', .F.)
DBSetProp('PTTBARKODVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('PTTBARKODVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PTTBARKODVIEW', 'View', 'FetchSize', -1)
DBSetProp('PTTBARKODVIEW', 'View', 'ParameterList', "vp_Gonderi_Tipi,'C'")
DBSetProp('PTTBARKODVIEW', 'View', 'Comment', "")
DBSetProp('PTTBARKODVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PTTBARKODVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for PTTBARKODVIEW
	GoExplorer.odbcx.Validate("PTTBARKODVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW","VIEW",;
		"VFECDESCRIPT","Pttbarkodview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Gonderi_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Gonderi Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Gonderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Gonderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Gonderi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Gonderi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.vp_Gonderi_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for PTTBARKODVIEW
*** Props for the PTTBARKODVIEW.barkod_id field.
DBSetProp('PTTBARKODVIEW.barkod_id', 'Field', 'KeyField', .T.)
DBSetProp('PTTBARKODVIEW.barkod_id', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.barkod_id', 'Field', 'UpdateName', 'dbo.PTTBarkod.Barkod_Id')
DBSetProp('PTTBARKODVIEW.barkod_id', 'Field', 'DataType', "C(36)")
DBSetProp('PTTBARKODVIEW.barkod_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for PTTBARKODVIEW.barkod_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECDESCRIPT","Barkod Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECFRMCAPTN","Barkod Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECDLGCAPTN","Barkod Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECGRDCAPTN","Barkod Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECRPTCAPTN","Barkod Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFEMTOOLTIP","Barkod Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFEMSTATUSTXT","Barkod Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.barkod_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PTTBARKODVIEW.gonderi_tipi field.
DBSetProp('PTTBARKODVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.gonderi_tipi', 'Field', 'UpdateName', 'dbo.PTTBarkod.Gonderi_Tipi')
DBSetProp('PTTBARKODVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
DBSetProp('PTTBARKODVIEW.gonderi_tipi', 'Field', 'DefaultValue', "'Tebligat'")
*** DBCX Field Properties for PTTBARKODVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!gonderitipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECLUTAG","gonderi_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMLUFIELDS","gonderi_tipi, gonderi_kodu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDTEXP","Gonderitipilookupview.gonderi_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_tipi","FIELD",;
		"VFEMLUUPDFLDS","gonderi_kodu") &&After Lookup Update Field List
ENDIF
 
*** Props for the PTTBARKODVIEW.gonderi_kodu field.
DBSetProp('PTTBARKODVIEW.gonderi_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.gonderi_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.gonderi_kodu', 'Field', 'UpdateName', 'dbo.PTTBarkod.Gonderi_Kodu')
DBSetProp('PTTBARKODVIEW.gonderi_kodu', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for PTTBARKODVIEW.gonderi_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECDESCRIPT","Gonderi Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECFRMCAPTN","Gönderi Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECDLGCAPTN","Gönderi Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECGRDCAPTN","Gönderi Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECRPTCAPTN","Gönderi Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFEMTOOLTIP","Gönderi Kodu                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFEMSTATUSTXT","Gönderi Kodu                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.gonderi_kodu","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PTTBARKODVIEW.ptt_musteri_no field.
DBSetProp('PTTBARKODVIEW.ptt_musteri_no', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.ptt_musteri_no', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.ptt_musteri_no', 'Field', 'UpdateName', 'dbo.PTTBarkod.Ptt_Musteri_No')
DBSetProp('PTTBARKODVIEW.ptt_musteri_no', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for PTTBARKODVIEW.ptt_musteri_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECDESCRIPT","Ptt Musteri No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECFRMCAPTN","Ptt Müþteri No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECDLGCAPTN","Ptt Müþteri No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECGRDCAPTN","Ptt Müþteri No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECRPTCAPTN","Ptt Müþteri No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFEMTOOLTIP","Ptt Müþteri No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFEMSTATUSTXT","Ptt Müþteri No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ptt_musteri_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PTTBARKODVIEW.ilk_gonderi_no field.
DBSetProp('PTTBARKODVIEW.ilk_gonderi_no', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.ilk_gonderi_no', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.ilk_gonderi_no', 'Field', 'UpdateName', 'dbo.PTTBarkod.Ilk_Gonderi_No')
DBSetProp('PTTBARKODVIEW.ilk_gonderi_no', 'Field', 'DataType', "C(7)")
*** DBCX Field Properties for PTTBARKODVIEW.ilk_gonderi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECDESCRIPT","Ilk Gonderi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECFRMCAPTN","Ýlk Gönderi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECDLGCAPTN","Ýlk Gönderi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECGRDCAPTN","Ýlk Gönderi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECRPTCAPTN","Ýlk Gönderi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFEMTOOLTIP","Ýlk Gönderi No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFEMSTATUSTXT","Ýlk Gönderi No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.ilk_gonderi_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the PTTBARKODVIEW.son_gonderi_no field.
DBSetProp('PTTBARKODVIEW.son_gonderi_no', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.son_gonderi_no', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.son_gonderi_no', 'Field', 'UpdateName', 'dbo.PTTBarkod.Son_Gonderi_No')
DBSetProp('PTTBARKODVIEW.son_gonderi_no', 'Field', 'DataType', "C(7)")
*** DBCX Field Properties for PTTBARKODVIEW.son_gonderi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECDESCRIPT","Son Gonderi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECFRMCAPTN","Son Gönderi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECDLGCAPTN","Son Gönderi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECGRDCAPTN","Son Gönderi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECRPTCAPTN","Son Gönderi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFEMTOOLTIP","Son Gönderi No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFEMSTATUSTXT","Son Gönderi No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.son_gonderi_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the PTTBARKODVIEW.siradaki_gonderi_no field.
DBSetProp('PTTBARKODVIEW.siradaki_gonderi_no', 'Field', 'KeyField', .F.)
DBSetProp('PTTBARKODVIEW.siradaki_gonderi_no', 'Field', 'Updatable', .T.)
DBSetProp('PTTBARKODVIEW.siradaki_gonderi_no', 'Field', 'UpdateName', 'dbo.PTTBarkod.Siradaki_Gonderi_No')
DBSetProp('PTTBARKODVIEW.siradaki_gonderi_no', 'Field', 'DataType', "C(12)")
*** DBCX Field Properties for PTTBARKODVIEW.siradaki_gonderi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECDESCRIPT","Siradaki Gonderi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECFRMCAPTN","Sýradaki Gönderi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECDLGCAPTN","Sýradaki Gönderi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECGRDCAPTN","Sýradaki Gönderi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECRPTCAPTN","Sýradaki Gönderi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFEMTOOLTIP","Sýradaki Gönderi No                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFEMSTATUSTXT","Sýradaki Gönderi No                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PTTBARKODVIEW.siradaki_gonderi_no","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
