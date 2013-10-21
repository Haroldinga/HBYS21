***************** Begin View Definition BorcluLookupView_VisualType_DontDelete ***************


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



CREATE SQL VIEW "BorcluLookupView_VisualType_DontDelete" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Borclu.Borclu_Id,;
		Borclu.Borclu_Fk,;
		Borclu.Rehber_Id,;
		Borclu.Borclu_Adi,;
		CAST('' AS CHAR(200)) AS borclu_adresi,;
		CAST('' AS CHAR(15)) AS borclu_il_adi,;
		CAST('' AS CHAR(15)) AS borclu_ilce_adi;
	FROM dbo.Borclu Borclu;
	WHERE Borclu.Borclu_Fk = ( ?vp_Borclu_Fk )

DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'UpdateType', 1)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'WhereType', 3)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'FetchMemo', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'SendUpdates', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'UseMemoSize', 255)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'MaxRecords', -1)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'Tables', 'dbo.Borclu')
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'Prepared', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'CompareMemo', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'FetchSize', -1)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'ParameterList', "vp_Borclu_Fk,'C'")
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'Comment', "")
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'BatchUpdateCount', 1)
DBSetProp('BorcluLookupView_VisualType_DontDelete', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BorcluLookupView_VisualType_DontDelete
	GoExplorer.odbcx.Validate("BorcluLookupView_VisualType_DontDelete","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete","VIEW",;
		"VFECDESCRIPT","BorcluLookupView_VisualType_DontDelete Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete","VIEW",;
		"VFECCLASS","icursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete","VIEW",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Borclu_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECFRMCAPTN","Borclu Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECDLGCAPTN","Borclu Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFEMTOOLTIP","Borclu Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Borclu Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECCLASS","iviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.vp_Borclu_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for BorcluLookupView_VisualType_DontDelete
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_id field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_id', 'Field', 'KeyField', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_id', 'Field', 'Updatable', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_id', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Id')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borclu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borclu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borclu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borclu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borclu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borclu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_fk field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_fk', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_fk', 'Field', 'Updatable', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_fk', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Fk')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECDESCRIPT","Borclu Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECFRMCAPTN","Borclu Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECDLGCAPTN","Borclu Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECGRDCAPTN","Borclu Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECRPTCAPTN","Borclu Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFEMTOOLTIP","Borclu Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFEMSTATUSTXT","Borclu Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.rehber_id field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.rehber_id', 'Field', 'UpdateName', 'dbo.Borclu.Rehber_Id')
DBSetProp('BorcluLookupView_VisualType_DontDelete.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.rehber_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_adi field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_adresi field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adresi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adresi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_adresi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_il_adi field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_il_adi', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_il_adi', 'Field', 'Updatable', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_il_adi', 'Field', 'UpdateName', 'Borclu_Il_Adi')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECDESCRIPT","Borclu Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Ýl Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Ýl Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_il_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi field.
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi', 'Field', 'Updatable', .F.)
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi', 'Field', 'UpdateName', 'Borclu_Ilce_Adi')
DBSetProp('BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECDESCRIPT","Borclu Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Ýlçe Adý                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Ýlçe Adý                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BorcluLookupView_VisualType_DontDelete.borclu_ilce_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
