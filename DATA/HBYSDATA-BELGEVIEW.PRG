***************** Begin View Definition BELGEVIEW ***************


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



CREATE SQL VIEW "BELGEVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Belge.Belge_Id,;
		Belge.Belge_Fk,;
		Belge.Belge_Adi,;
		Belge.Belge_Tarihi,;
		Belge.Belge_Tipi,;
		Belge.Borca_Esas_Evrak,;
		Belge.Masrafa_Esas_Evrak,;
		Belge.Belge_Yonu,;
		Belge.Muhatap_Adi,;
		Belge.Muhatap_Adresi,;
		Belge.Aciklama,;
		Belge.Belge_Formati,;
		Belge.Belge_Konumu;
	FROM dbo.Belge Belge

DBSetProp('BELGEVIEW', 'View', 'UpdateType', 1)
DBSetProp('BELGEVIEW', 'View', 'WhereType', 3)
DBSetProp('BELGEVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BELGEVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('BELGEVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BELGEVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BELGEVIEW', 'View', 'Tables', 'dbo.Belge')
DBSetProp('BELGEVIEW', 'View', 'Prepared', .F.)
DBSetProp('BELGEVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BELGEVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BELGEVIEW', 'View', 'FetchSize', -1)
DBSetProp('BELGEVIEW', 'View', 'ParameterList', "vp_Belge_Fk,'C';vp_Belge_Adi,'C';vp_Belge_Tarihi,'D';vp_Muhatap_Adi,'C'")
DBSetProp('BELGEVIEW', 'View', 'Comment', "")
DBSetProp('BELGEVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BELGEVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BELGEVIEW
	GoExplorer.odbcx.Validate("BELGEVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW","VIEW",;
		"VFECDESCRIPT","Belgeview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Belge_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Belge Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECFRMCAPTN","Belge FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECDLGCAPTN","Belge FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMTOOLTIP","Belge FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Belge FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMCOMPARETO","Belge_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Belge_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Belge Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECFRMCAPTN","Belge Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECDLGCAPTN","Belge Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFENVPSIZE",100) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFEMTOOLTIP","Belge Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Belge Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Belge_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Belge Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Belge Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Belge Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Belge Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Belge Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Belge_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muhatap_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muhatap Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.vp_Muhatap_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!belgeview.belgetrh
	GoExplorer.odbcx.AddViewIndex("hbysdata!belgeview","belgetrh","BELGE_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgeview.belgetrh","INDEX",;
		"VFECDESCRIPT","Belgetrh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgeview.belgetrh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgeview.belgetrh","INDEX",;
		"VFECTAGCAPTN","Belgetrh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!belgeview.belgetrh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for BELGEVIEW
*** Props for the BELGEVIEW.belge_id field.
DBSetProp('BELGEVIEW.belge_id', 'Field', 'KeyField', .T.)
DBSetProp('BELGEVIEW.belge_id', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_id', 'Field', 'UpdateName', 'dbo.Belge.Belge_Id')
DBSetProp('BELGEVIEW.belge_id', 'Field', 'DataType', "C(36)")
DBSetProp('BELGEVIEW.belge_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for BELGEVIEW.belge_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECDESCRIPT","Belge Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECFRMCAPTN","Belge ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECDLGCAPTN","Belge ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECGRDCAPTN","Belge ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECRPTCAPTN","Belge ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFEMTOOLTIP","Belge ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFEMSTATUSTXT","Belge ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_fk field.
DBSetProp('BELGEVIEW.belge_fk', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_fk', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_fk', 'Field', 'UpdateName', 'dbo.Belge.Belge_Fk')
DBSetProp('BELGEVIEW.belge_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BELGEVIEW.belge_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECDESCRIPT","Belge Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECFRMCAPTN","Belge FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECDLGCAPTN","Belge FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECGRDCAPTN","Belge FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECRPTCAPTN","Belge FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFEMTOOLTIP","Belge FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFEMSTATUSTXT","Belge FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_adi field.
DBSetProp('BELGEVIEW.belge_adi', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_adi', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_adi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Adi')
DBSetProp('BELGEVIEW.belge_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BELGEVIEW.belge_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECDESCRIPT","Belge Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECFRMCAPTN","Belge Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECDLGCAPTN","Belge Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECGRDCAPTN","Belge Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECRPTCAPTN","Belge Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFEMTOOLTIP","Belge Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFEMSTATUSTXT","Belge Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_tarihi field.
DBSetProp('BELGEVIEW.belge_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_tarihi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Tarihi')
DBSetProp('BELGEVIEW.belge_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for BELGEVIEW.belge_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECDESCRIPT","Belge Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECFRMCAPTN","Belge Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECDLGCAPTN","Belge Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECGRDCAPTN","Belge Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECRPTCAPTN","Belge Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFEMTOOLTIP","Belge Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFEMSTATUSTXT","Belge Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFECQFINDTAG","belgetrh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_tipi field.
DBSetProp('BELGEVIEW.belge_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_tipi', 'Field', 'UpdateName', 'dbo.Belge.Belge_Tipi')
DBSetProp('BELGEVIEW.belge_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BELGEVIEW.belge_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECDESCRIPT","Belge Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECFRMCAPTN","Belge Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECDLGCAPTN","Belge Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECGRDCAPTN","Belge Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECRPTCAPTN","Belge Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMTOOLTIP","Belge Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMSTATUSTXT","Belge Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!belgetipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECLUTAG","belge_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMLUFIELDS","belge_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMLUUPDTEXP","Belgetipilookupview.belge_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.borca_esas_evrak field.
DBSetProp('BELGEVIEW.borca_esas_evrak', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.borca_esas_evrak', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.borca_esas_evrak', 'Field', 'UpdateName', 'dbo.Belge.Borca_Esas_Evrak')
DBSetProp('BELGEVIEW.borca_esas_evrak', 'Field', 'DataType', "L")
*** DBCX Field Properties for BELGEVIEW.borca_esas_evrak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECDESCRIPT","Borca Esas Evrak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECFRMCAPTN","Borca Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECDLGCAPTN","Borca Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECGRDCAPTN","Borca Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECRPTCAPTN","Borca Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFEMTOOLTIP","Borca Esas Evrak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFEMSTATUSTXT","Borca Esas Evrak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.borca_esas_evrak","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.masrafa_esas_evrak field.
DBSetProp('BELGEVIEW.masrafa_esas_evrak', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.masrafa_esas_evrak', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.masrafa_esas_evrak', 'Field', 'UpdateName', 'dbo.Belge.Masrafa_Esas_Evrak')
DBSetProp('BELGEVIEW.masrafa_esas_evrak', 'Field', 'DataType', "L")
*** DBCX Field Properties for BELGEVIEW.masrafa_esas_evrak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECDESCRIPT","Masrafa Esas Evrak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECFRMCAPTN","Masrafa Esas Evrak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECDLGCAPTN","Masrafa Esas Evrak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECGRDCAPTN","Masrafa Esas Evrak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECRPTCAPTN","Masrafa Esas Evrak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMTOOLTIP","Masrafa Esas Evrak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMSTATUSTXT","Masrafa Esas Evrak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.masrafa_esas_evrak","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_yonu field.
DBSetProp('BELGEVIEW.belge_yonu', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_yonu', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_yonu', 'Field', 'UpdateName', 'dbo.Belge.Belge_Yonu')
DBSetProp('BELGEVIEW.belge_yonu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BELGEVIEW.belge_yonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECDESCRIPT","Belge Yonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECFRMCAPTN","Belge Yönü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECDLGCAPTN","Belge Yönü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECGRDCAPTN","Belge Yönü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECRPTCAPTN","Belge Yönü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFEMTOOLTIP","Belge Yönü                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFEMSTATUSTXT","Belge Yönü                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFEMINLIST",'"Gelen ","Giden "') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_yonu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.muhatap_adi field.
DBSetProp('BELGEVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Belge.Muhatap_Adi')
DBSetProp('BELGEVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BELGEVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.muhatap_adresi field.
DBSetProp('BELGEVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Belge.Muhatap_Adresi')
DBSetProp('BELGEVIEW.muhatap_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for BELGEVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.aciklama field.
DBSetProp('BELGEVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Belge.Aciklama')
DBSetProp('BELGEVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for BELGEVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.aciklama","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_formati field.
DBSetProp('BELGEVIEW.belge_formati', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_formati', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_formati', 'Field', 'UpdateName', 'dbo.Belge.Belge_Formati')
DBSetProp('BELGEVIEW.belge_formati', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for BELGEVIEW.belge_formati
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECDESCRIPT","Belge Formati Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECFRMCAPTN","Belge Formatý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECDLGCAPTN","Belge Formatý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECGRDCAPTN","Belge Formatý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECRPTCAPTN","Belge Formatý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFEMTOOLTIP","Belge Formatý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFEMSTATUSTXT","Belge Formatý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFEMINLIST",'"Döküman","Ses","Resim","Video"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_formati","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BELGEVIEW.belge_konumu field.
DBSetProp('BELGEVIEW.belge_konumu', 'Field', 'KeyField', .F.)
DBSetProp('BELGEVIEW.belge_konumu', 'Field', 'Updatable', .T.)
DBSetProp('BELGEVIEW.belge_konumu', 'Field', 'UpdateName', 'dbo.Belge.Belge_Konumu')
DBSetProp('BELGEVIEW.belge_konumu', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for BELGEVIEW.belge_konumu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECDESCRIPT","Belge Konumu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECFRMCAPTN","Belge Konumu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECDLGCAPTN","Belge Konumu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECGRDCAPTN","Belge Konumu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECRPTCAPTN","Belge Konumu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFEMTOOLTIP","Belge Konumu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFEMSTATUSTXT","Belge Konumu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BELGEVIEW.belge_konumu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
