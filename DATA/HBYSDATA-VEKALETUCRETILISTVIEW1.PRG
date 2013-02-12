***************** Begin View Definition VEKALETUCRETILISTVIEW ***************


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



CREATE SQL VIEW "VEKALETUCRETILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Vekaletucreti.VekaletUcreti_Id,;
		Vekaletucreti.VekaletUcreti_Fk,;
		Vekaletucreti.Vekalet_Ucreti_Tipi,;
		Vekaletucreti.Baslama_Tarihi,;
		Vekaletucreti.Minimum_Vekalet_Ucreti,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_1,;
		Vekaletucreti.Vekalet_Ucreti_Orani_1,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_2,;
		Vekaletucreti.Vekalet_Ucreti_Orani_2,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_3,;
		Vekaletucreti.Vekalet_Ucreti_Orani_3,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_4,;
		Vekaletucreti.Vekalet_Ucreti_Orani_4,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_5,;
		Vekaletucreti.Vekalet_Ucreti_Orani_5,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_6,;
		Vekaletucreti.Vekalet_Ucreti_Orani_6,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_7,;
		Vekaletucreti.Vekalet_Ucreti_Orani_7,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_8,;
		Vekaletucreti.Vekalet_Ucreti_Orani_8,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_9,;
		Vekaletucreti.Vekalet_Ucreti_Orani_9,;
		Vekaletucreti.Vekalet_Ucreti_Dilimi_10,;
		Vekaletucreti.Vekalet_Ucreti_Orani_10;
	FROM dbo.VekaletUcreti Vekaletucreti

DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'Tables', 'dbo.VekaletUcreti')
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'ParameterList', "vp_VekaletUcreti_Fk,'C';vp_Vekalet_Ucreti_Tipi,'C'")
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'Comment', "")
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('VEKALETUCRETILISTVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for VEKALETUCRETILISTVIEW
	GoExplorer.odbcx.Validate("VEKALETUCRETILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW","VIEW",;
		"VFECDESCRIPT","Vekaletucretilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_VekaletUcreti_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Vekaletucreti Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECFRMCAPTN","Vekaletucreti Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECDLGCAPTN","Vekaletucreti Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMTOOLTIP","Vekaletucreti Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Vekaletucreti Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMDEFAULT",'"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"') &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFELOR",.T.) &&Add to SQL with OR
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_VekaletUcreti_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Vekalet_Ucreti_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Vekalet Ucreti Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Vekalet Ücreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Vekalet Ücreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Vekalet Ücreti Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Vekalet Ücreti Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Vekalet_Ucreti_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFELOR",.T.) &&Add to SQL with OR
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vp_Vekalet_Ucreti_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!vekaletucretilistview.basltarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!vekaletucretilistview","basltarh","BASLAMA_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!vekaletucretilistview.basltarh","INDEX",;
		"VFECDESCRIPT","Basltarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!vekaletucretilistview.basltarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!vekaletucretilistview.basltarh","INDEX",;
		"VFECTAGCAPTN","Basltarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!vekaletucretilistview.basltarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for VEKALETUCRETILISTVIEW
*** Props for the VEKALETUCRETILISTVIEW.vekaletucreti_id field.
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_id', 'Field', 'KeyField', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_id', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_id', 'Field', 'UpdateName', 'dbo.VekaletUcreti.VekaletUcreti_Id')
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_id', 'Field', 'DataType', "C(36)")
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekaletucreti_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECDESCRIPT","Vekaletucreti Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti ID                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti ID                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekaletucreti_fk field.
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_fk', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_fk', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_fk', 'Field', 'UpdateName', 'dbo.VekaletUcreti.VekaletUcreti_Fk')
DBSetProp('VEKALETUCRETILISTVIEW.vekaletucreti_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekaletucreti_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECDESCRIPT","Vekaletucreti Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti FK                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti FK                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekaletucreti_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Tipi')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Tipi                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Tipi                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.baslama_tarihi field.
DBSetProp('VEKALETUCRETILISTVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Baslama_Tarihi')
DBSetProp('VEKALETUCRETILISTVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Baþlama Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Baþlama Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFECQFINDTAG","basltarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti field.
DBSetProp('VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Minimum_Vekalet_Ucreti')
DBSetProp('VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECDESCRIPT","Minimum Vekalet Ucreti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECFRMCAPTN","Minimum Vekalet Ücreti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECDLGCAPTN","Minimum Vekalet Ücreti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECGRDCAPTN","Minimum Vekalet Ücreti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECRPTCAPTN","Minimum Vekalet Ücreti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMTOOLTIP","Minimum Vekalet Ücreti                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMSTATUSTXT","Minimum Vekalet Ücreti                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.minimum_vekalet_ucreti","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_1')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 1                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 1                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_1","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_1')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 1") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 1") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 1") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 1") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 1                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 1                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_1","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_2')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 2                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 2                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_2","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_2')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 2 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 2") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 2") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 2") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 2") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 2                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 2                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_2","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_3')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 3                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 3                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_3","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_3')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 3 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 3") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 3") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 3") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 3") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 3                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 3                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFENDISPORDER",11) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_3","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_4')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 4                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 4                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFENDISPORDER",12) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_4","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_4')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 4 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 4") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 4") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 4") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 4") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 4                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 4                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFENDISPORDER",13) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_4","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_5')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 5                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 5                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFENDISPORDER",14) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_5","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_5')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 5 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 5") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 5") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 5") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 5") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 5                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 5                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFENDISPORDER",15) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_5","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_6')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 6                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 6                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFENDISPORDER",16) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_6","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_6')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 6 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 6") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 6") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 6") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 6") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 6                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 6                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_6","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_7')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 7                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 7                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFENDISPORDER",18) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_7","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_7')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 7 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 7") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 7") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 7") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 7") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 7                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 7                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFENDISPORDER",19) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_7","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_8')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 8                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 8                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFENDISPORDER",20) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_8","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_8')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 8 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 8") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 8") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 8") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 8") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 8                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 8                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFENDISPORDER",21) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_8","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_9')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 9                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 9                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFENDISPORDER",22) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_9","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_9')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 9 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 9") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 9") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 9") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 9") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 9                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 9                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFENDISPORDER",23) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_9","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Dilimi_10')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Dilimi 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Dilimi 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Dilimi 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Dilimi 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Dilimi 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Dilimi 10                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Dilimi 10                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFENDISPORDER",24) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_dilimi_10","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10 field.
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10', 'Field', 'KeyField', .F.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10', 'Field', 'Updatable', .T.)
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10', 'Field', 'UpdateName', 'dbo.VekaletUcreti.Vekalet_Ucreti_Orani_10')
DBSetProp('VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10', 'Field', 'DataType', "Y")
*** DBCX Field Properties for VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECDESCRIPT","Vekalet Ucreti Orani 10 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti Oraný 10") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti Oraný 10") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti Oraný 10") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti Oraný 10") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti Oraný 10                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti Oraný 10                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFENDISPORDER",25) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKALETUCRETILISTVIEW.vekalet_ucreti_orani_10","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
