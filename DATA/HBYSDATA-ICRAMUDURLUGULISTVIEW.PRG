***************** Begin View Definition ICRAMUDURLUGULISTVIEW ***************


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



CREATE SQL VIEW "ICRAMUDURLUGULISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icramudurlugu.IcraMudurlugu_Id,;
		Icramudurlugu.IcraMudurlugu_Adi,;
		Icramudurlugu.Adliye_Adi,;
		Icramudurlugu.Tel,;
		Icramudurlugu.Faks,;
		Icramudurlugu.Adres,;
		Icramudurlugu.Il_Adi,;
		Icramudurlugu.Ilce_Adi,;
		Icramudurlugu.IMNo;
	FROM dbo.IcraMudurlugu Icramudurlugu

DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'WhereType', 3)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'Tables', 'dbo.IcraMudurlugu')
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'ParameterList', "vp_IcraMudurlugu_Id,'C';vp_IcraMudurlugu_Adi,'C';vp_Adliye_Adi,'C';vp_Il_Adi,'C'")
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'Comment', "")
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ICRAMUDURLUGULISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ICRAMUDURLUGULISTVIEW
	GoExplorer.odbcx.Validate("ICRAMUDURLUGULISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW","VIEW",;
		"VFECDESCRIPT","Icramudurlugulistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_IcraMudurlugu_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Icramudurlugu Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_IcraMudurlugu_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Il_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Il Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECFRMCAPTN","ÝL Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDLGCAPTN","ÝL Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMTOOLTIP","ÝL Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMSTATUSTXT","ÝL Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ICRAMUDURLUGULISTVIEW
*** Props for the ICRAMUDURLUGULISTVIEW.icramudurlugu_id field.
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_id', 'Field', 'KeyField', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IcraMudurlugu_Id')
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_id', 'Field', 'DataType', "C(36)")
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü ID                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü ID                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.icramudurlugu_adi field.
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IcraMudurlugu_Adi')
DBSetProp('ICRAMUDURLUGULISTVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.adliye_adi field.
DBSetProp('ICRAMUDURLUGULISTVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Adliye_Adi')
DBSetProp('ICRAMUDURLUGULISTVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECLUTABLE","hbysdata!adliyelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECLUTAG","adliye_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMLUFIELDS","adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMLUUPDTEXP","Adliyelookupview.adliye_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.tel field.
DBSetProp('ICRAMUDURLUGULISTVIEW.tel', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.tel', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.tel', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Tel')
DBSetProp('ICRAMUDURLUGULISTVIEW.tel', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.tel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECDESCRIPT","Tel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECFRMCAPTN","Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECDLGCAPTN","Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECGRDCAPTN","Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECRPTCAPTN","Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMTOOLTIP","Tel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMSTATUSTXT","Tel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.tel","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.faks field.
DBSetProp('ICRAMUDURLUGULISTVIEW.faks', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.faks', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.faks', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Faks')
DBSetProp('ICRAMUDURLUGULISTVIEW.faks', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.faks
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECDESCRIPT","Faks Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECFRMCAPTN","Faks") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECDLGCAPTN","Faks") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECGRDCAPTN","Faks") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECRPTCAPTN","Faks") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMTOOLTIP","Faks") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMSTATUSTXT","Faks") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.faks","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.adres field.
DBSetProp('ICRAMUDURLUGULISTVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.adres', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.adres', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Adres')
DBSetProp('ICRAMUDURLUGULISTVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.adres","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.il_adi field.
DBSetProp('ICRAMUDURLUGULISTVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.il_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Il_Adi')
DBSetProp('ICRAMUDURLUGULISTVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","ÝL Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","ÝL Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","ÝL Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","ÝL Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","ÝL Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","ÝL Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.il_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.ilce_adi field.
DBSetProp('ICRAMUDURLUGULISTVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.Ilce_Adi')
DBSetProp('ICRAMUDURLUGULISTVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ilce Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ilce Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ilce Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ilce Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ilce Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ilce Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi, il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the ICRAMUDURLUGULISTVIEW.imno field.
DBSetProp('ICRAMUDURLUGULISTVIEW.imno', 'Field', 'KeyField', .F.)
DBSetProp('ICRAMUDURLUGULISTVIEW.imno', 'Field', 'Updatable', .T.)
DBSetProp('ICRAMUDURLUGULISTVIEW.imno', 'Field', 'UpdateName', 'dbo.IcraMudurlugu.IMNo')
DBSetProp('ICRAMUDURLUGULISTVIEW.imno', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for ICRAMUDURLUGULISTVIEW.imno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECDESCRIPT","Imno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECFRMCAPTN","Imno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECDLGCAPTN","Imno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECGRDCAPTN","Imno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECRPTCAPTN","Imno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFEMTOOLTIP","Imno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFEMSTATUSTXT","Imno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ICRAMUDURLUGULISTVIEW.imno","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
