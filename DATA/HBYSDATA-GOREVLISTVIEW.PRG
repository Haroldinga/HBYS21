***************** Begin View Definition GOREVLISTVIEW ***************


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



CREATE SQL VIEW "GOREVLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Gorev.Gorev_Id,;
		Gorev.Gorev_Adi,;
		Gorev.Gorev_Tanimi;
	FROM dbo.Gorev Gorev

DBSetProp('GOREVLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('GOREVLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('GOREVLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('GOREVLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('GOREVLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('GOREVLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('GOREVLISTVIEW', 'View', 'Tables', 'dbo.Gorev')
DBSetProp('GOREVLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('GOREVLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('GOREVLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GOREVLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('GOREVLISTVIEW', 'View', 'ParameterList', "vp_Gorev_Id,'C';vp_Gorev_Adi,'C'")
DBSetProp('GOREVLISTVIEW', 'View', 'Comment', "")
DBSetProp('GOREVLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('GOREVLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GOREVLISTVIEW
	GoExplorer.odbcx.Validate("GOREVLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW","VIEW",;
		"VFECDESCRIPT","Gorevlistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Gorev_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Gorev Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECFRMCAPTN","Gorev Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECDLGCAPTN","Gorev Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMTOOLTIP","Gorev Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMSTATUSTXT","Gorev Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMCOMPARETO","Gorev_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Gorev_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Gorev Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECFRMCAPTN","Görev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECDLGCAPTN","Görev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMTOOLTIP","Görev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Görev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMCOMPARETO","Gorev_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.vp_Gorev_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for GOREVLISTVIEW
*** Props for the GOREVLISTVIEW.gorev_id field.
DBSetProp('GOREVLISTVIEW.gorev_id', 'Field', 'KeyField', .T.)
DBSetProp('GOREVLISTVIEW.gorev_id', 'Field', 'Updatable', .T.)
DBSetProp('GOREVLISTVIEW.gorev_id', 'Field', 'UpdateName', 'dbo.Gorev.Gorev_Id')
DBSetProp('GOREVLISTVIEW.gorev_id', 'Field', 'DataType', "C(36)")
DBSetProp('GOREVLISTVIEW.gorev_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for GOREVLISTVIEW.gorev_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECDESCRIPT","Gorev Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECFRMCAPTN","Görev ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECDLGCAPTN","Görev ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECGRDCAPTN","Görev ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECRPTCAPTN","Görev ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFEMTOOLTIP","Görev ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFEMSTATUSTXT","Görev ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the GOREVLISTVIEW.gorev_adi field.
DBSetProp('GOREVLISTVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('GOREVLISTVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('GOREVLISTVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.Gorev.Gorev_Adi')
DBSetProp('GOREVLISTVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GOREVLISTVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Görev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Görev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Görev Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Görev Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Görev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Görev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the GOREVLISTVIEW.gorev_tanimi field.
DBSetProp('GOREVLISTVIEW.gorev_tanimi', 'Field', 'KeyField', .F.)
DBSetProp('GOREVLISTVIEW.gorev_tanimi', 'Field', 'Updatable', .T.)
DBSetProp('GOREVLISTVIEW.gorev_tanimi', 'Field', 'UpdateName', 'dbo.Gorev.Gorev_Tanimi')
DBSetProp('GOREVLISTVIEW.gorev_tanimi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for GOREVLISTVIEW.gorev_tanimi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECDESCRIPT","Gorev Tanimi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECFRMCAPTN","Görev Tanýmý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECDLGCAPTN","Görev Tanýmý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECGRDCAPTN","Görev Tanýmý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECRPTCAPTN","Görev Tanýmý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFEMTOOLTIP","Görev Tanýmý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFEMSTATUSTXT","Görev Tanýmý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GOREVLISTVIEW.gorev_tanimi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
