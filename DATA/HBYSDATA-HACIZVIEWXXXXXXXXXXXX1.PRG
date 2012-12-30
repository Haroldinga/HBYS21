***************** Begin View Definition HACIZVIEWXXXXXXXXXXXX ***************


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



CREATE SQL VIEW "HACIZVIEWXXXXXXXXXXXX" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Haciz.Haciz_Id,;
		Haciz.Haciz_Fk,;
		Haciz.Borclu_Id,;
		Haciz.Borclu_Adi,;
		Haciz.Haciz_Tipi,;
		Haciz.Talimat_Tarihi,;
		Haciz.Haciz_Tarihi,;
		Haciz.Haczedilen_Tipi,;
		Haciz.Haciz_Bedeli,;
		Haciz.Teslim_Yeri,;
		Haciz.Personel_Id,;
		Haciz.Personel_Adi,;
		Haciz.Il_Adi,;
		Haciz.Aciklama;
	FROM dbo.Haciz Haciz

DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'UpdateType', 1)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'WhereType', 3)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'FetchMemo', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'SendUpdates', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'UseMemoSize', 255)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'MaxRecords', -1)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'Tables', 'dbo.Haciz')
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'Prepared', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'CompareMemo', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'FetchSize', -1)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'ParameterList', "vp_Haciz_Fk,'C';vp_Parameter_Degisken1_1,'C';;vp_Parameter_Degisken1_2,'C';vp_Parameter_Degisken1_3,'C';vp_Parameter_Degisken1_4,'C'")
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'Comment', "")
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'BatchUpdateCount', 1)
DBSetProp('HACIZVIEWXXXXXXXXXXXX', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HACIZVIEWXXXXXXXXXXXX
	GoExplorer.odbcx.Validate("HACIZVIEWXXXXXXXXXXXX","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX","VIEW",;
		"VFECDESCRIPT","Hacizviewxxxxxxxxxxxx Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Haciz_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Haciz Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECFRMCAPTN","Haciz Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECDLGCAPTN","Haciz Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFEMTOOLTIP","Haciz Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Haciz Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.vp_Haciz_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for HACIZVIEWXXXXXXXXXXXX
*** Props for the HACIZVIEWXXXXXXXXXXXX.haciz_id field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_id', 'Field', 'KeyField', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_id', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Id')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_id', 'Field', 'DataType', "C(36)")
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haciz_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECDESCRIPT","Haciz Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECFRMCAPTN","Haciz Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECDLGCAPTN","Haciz Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECGRDCAPTN","Haciz Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECRPTCAPTN","Haciz Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFEMTOOLTIP","Haciz Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFEMSTATUSTXT","Haciz Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.haciz_fk field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_fk', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_fk', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_fk', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Fk')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haciz_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECDESCRIPT","Haciz Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECFRMCAPTN","Haciz Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECDLGCAPTN","Haciz Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECGRDCAPTN","Haciz Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECRPTCAPTN","Haciz Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFEMTOOLTIP","Haciz Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFEMSTATUSTXT","Haciz Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.borclu_id field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_id', 'Field', 'UpdateName', 'dbo.Haciz.Borclu_Id')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borclu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borclu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borclu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borclu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borclu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borclu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.borclu_adi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_adi', 'Field', 'UpdateName', 'dbo.Haciz.Borclu_Adi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.haciz_tipi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tipi', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Tipi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haciz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECDESCRIPT","Haciz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECFRMCAPTN","Haciz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECDLGCAPTN","Haciz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECGRDCAPTN","Haciz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECRPTCAPTN","Haciz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFEMTOOLTIP","Haciz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.talimat_tarihi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.talimat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.talimat_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.talimat_tarihi', 'Field', 'UpdateName', 'dbo.Haciz.Talimat_Tarihi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.talimat_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.talimat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECDESCRIPT","Talimat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECFRMCAPTN","Talimat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECDLGCAPTN","Talimat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECGRDCAPTN","Talimat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECRPTCAPTN","Talimat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFEMTOOLTIP","Talimat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Talimat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.talimat_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.haciz_tarihi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Tarihi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi', 'Field', 'UpdateName', 'dbo.Haciz.Haczedilen_Tipi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECDESCRIPT","Haczedilen Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECFRMCAPTN","Haczedilen Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECDLGCAPTN","Haczedilen Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECGRDCAPTN","Haczedilen Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECRPTCAPTN","Haczedilen Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFEMTOOLTIP","Haczedilen Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFEMSTATUSTXT","Haczedilen Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haczedilen_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.haciz_bedeli field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_bedeli', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_bedeli', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_bedeli', 'Field', 'UpdateName', 'dbo.Haciz.Haciz_Bedeli')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_bedeli', 'Field', 'InputMask', "999,999,999,999")
DBSetProp('HACIZVIEWXXXXXXXXXXXX.haciz_bedeli', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.haciz_bedeli
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECDESCRIPT","Haciz Bedeli Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECFRMCAPTN","Haciz Bedeli") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECDLGCAPTN","Haciz Bedeli") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECGRDCAPTN","Haciz Bedeli") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECRPTCAPTN","Haciz Bedeli") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFEMTOOLTIP","Haciz Bedeli") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFEMSTATUSTXT","Haciz Bedeli") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.haciz_bedeli","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.teslim_yeri field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.teslim_yeri', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.teslim_yeri', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.teslim_yeri', 'Field', 'UpdateName', 'dbo.Haciz.Teslim_Yeri')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.teslim_yeri', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.teslim_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECDESCRIPT","Teslim Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECFRMCAPTN","Teslim Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECDLGCAPTN","Teslim Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECGRDCAPTN","Teslim Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECRPTCAPTN","Teslim Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFEMTOOLTIP","Teslim Yeri") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFEMSTATUSTXT","Teslim Yeri") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.teslim_yeri","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.personel_id field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_id', 'Field', 'UpdateName', 'dbo.Haciz.Personel_Id')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_id","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.personel_adi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_adi', 'Field', 'UpdateName', 'dbo.Haciz.Personel_Adi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.personel_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.il_adi field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.il_adi', 'Field', 'UpdateName', 'dbo.Haciz.Il_Adi')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECFRMCAPTN","Il Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECDLGCAPTN","Il Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECGRDCAPTN","Il Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECRPTCAPTN","Il Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFEMTOOLTIP","Il Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFEMSTATUSTXT","Il Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.il_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the HACIZVIEWXXXXXXXXXXXX.aciklama field.
DBSetProp('HACIZVIEWXXXXXXXXXXXX.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('HACIZVIEWXXXXXXXXXXXX.aciklama', 'Field', 'UpdateName', 'dbo.Haciz.Aciklama')
DBSetProp('HACIZVIEWXXXXXXXXXXXX.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for HACIZVIEWXXXXXXXXXXXX.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HACIZVIEWXXXXXXXXXXXX.aciklama","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
