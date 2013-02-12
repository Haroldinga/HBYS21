***************** Begin View Definition REHBERLISTVIEW ***************


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



CREATE SQL VIEW "REHBERLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Rehber.Rehber_Id,;
		Rehber.Rehber_Tipi,;
		Rehber.TcKimlik_No,;
		Rehber.Ticaret_Sicil_No,;
		Rehber.Adi,;
		Rehber.Baba_Adi,;
		Rehber.Dogum_Yeri,;
		Rehber.Dogum_Tarihi;
	FROM dbo.Rehber Rehber

DBSetProp('REHBERLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('REHBERLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('REHBERLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('REHBERLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('REHBERLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('REHBERLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('REHBERLISTVIEW', 'View', 'Tables', 'dbo.Rehber')
DBSetProp('REHBERLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('REHBERLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('REHBERLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REHBERLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('REHBERLISTVIEW', 'View', 'ParameterList', "vp_TcKimlik_No,'C';vp_Ticaret_Sicil_No,'C';vp_Adi,'C';vp_Baba_Adi,'C';vp_Rehber_Id,'C'")
DBSetProp('REHBERLISTVIEW', 'View', 'Comment', "")
DBSetProp('REHBERLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('REHBERLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REHBERLISTVIEW
	GoExplorer.odbcx.Validate("REHBERLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW","VIEW",;
		"VFECDESCRIPT","Rehberlistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_TcKimlik_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECDESCRIPT","Vp Tckimlik No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMCOMPARETO","TcKimlik_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Ticaret_Sicil_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDESCRIPT","Vp Ticaret Sicil No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adý                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adý                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Baba_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Baba Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Baba_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Rehber_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Rehber Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMDEFAULT","NULL") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for REHBERLISTVIEW
*** Props for the REHBERLISTVIEW.rehber_id field.
DBSetProp('REHBERLISTVIEW.rehber_id', 'Field', 'KeyField', .T.)
DBSetProp('REHBERLISTVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Id')
DBSetProp('REHBERLISTVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for REHBERLISTVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.rehber_tipi field.
DBSetProp('REHBERLISTVIEW.rehber_tipi', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.rehber_tipi', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.rehber_tipi', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Tipi')
DBSetProp('REHBERLISTVIEW.rehber_tipi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for REHBERLISTVIEW.rehber_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECDESCRIPT","Rehber Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECFRMCAPTN","Rehber Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECDLGCAPTN","Rehber Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECGRDCAPTN","Rehber Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECRPTCAPTN","Rehber Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFEMTOOLTIP","Rehber Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFEMSTATUSTXT","Rehber Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFEMINLIST",'"Þahýs","Kurum","Banka","Þirket"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.rehber_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.tckimlik_no field.
DBSetProp('REHBERLISTVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Rehber.TcKimlik_No')
DBSetProp('REHBERLISTVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBERLISTVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tc Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tc Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.ticaret_sicil_no field.
DBSetProp('REHBERLISTVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Rehber.Ticaret_Sicil_No')
DBSetProp('REHBERLISTVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBERLISTVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.adi field.
DBSetProp('REHBERLISTVIEW.adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.adi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('REHBERLISTVIEW.adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REHBERLISTVIEW.adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECDESCRIPT","Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECFRMCAPTN","Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECDLGCAPTN","Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECGRDCAPTN","Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECRPTCAPTN","Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFEMTOOLTIP","Adý                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFEMSTATUSTXT","Adý                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.baba_adi field.
DBSetProp('REHBERLISTVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Rehber.Baba_Adi')
DBSetProp('REHBERLISTVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBERLISTVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.dogum_yeri field.
DBSetProp('REHBERLISTVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Yeri')
DBSetProp('REHBERLISTVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBERLISTVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the REHBERLISTVIEW.dogum_tarihi field.
DBSetProp('REHBERLISTVIEW.dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('REHBERLISTVIEW.dogum_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('REHBERLISTVIEW.dogum_tarihi', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Tarihi')
DBSetProp('REHBERLISTVIEW.dogum_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for REHBERLISTVIEW.dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Dogum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Dogum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Dogum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Dogum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Dogum Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Dogum Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBERLISTVIEW.dogum_tarihi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
