***************** Begin View Definition PERSONELLISTVIEW ***************


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



CREATE SQL VIEW "PERSONELLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Personel.Personel_Id,;
		Personel.User_Id,;
		Personel.Personel_Adi,;
		Personel.Departman_Adi,;
		Personel.Gorev_Adi,;
		Personel.Baslama_Tarihi,;
		Personel.Ayrilis_Tarihi;
	FROM dbo.Personel Personel

DBSetProp('PERSONELLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('PERSONELLISTVIEW', 'View', 'WhereType', 2)
DBSetProp('PERSONELLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('PERSONELLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('PERSONELLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PERSONELLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PERSONELLISTVIEW', 'View', 'Tables', 'dbo.Personel')
DBSetProp('PERSONELLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('PERSONELLISTVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('PERSONELLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PERSONELLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('PERSONELLISTVIEW', 'View', 'ParameterList', "vp_Departman_Adi,'C';vp_Personel_Adi,'C';vp_Personel_Id,'C';vp_User_Id,'C'")
DBSetProp('PERSONELLISTVIEW', 'View', 'Comment', "")
DBSetProp('PERSONELLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERSONELLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for PERSONELLISTVIEW
	GoExplorer.odbcx.Validate("PERSONELLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW","VIEW",;
		"VFECDESCRIPT","Personellistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Departman_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Departman Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_User_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECDESCRIPT","Vp User Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.vp_User_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for PERSONELLISTVIEW
*** Props for the PERSONELLISTVIEW.personel_id field.
DBSetProp('PERSONELLISTVIEW.personel_id', 'Field', 'KeyField', .T.)
DBSetProp('PERSONELLISTVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Personel.Personel_Id')
DBSetProp('PERSONELLISTVIEW.personel_id', 'Field', 'DataType', "C(36)")
DBSetProp('PERSONELLISTVIEW.personel_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for PERSONELLISTVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.user_id field.
DBSetProp('PERSONELLISTVIEW.user_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.user_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.user_id', 'Field', 'UpdateName', 'dbo.Personel.User_Id')
DBSetProp('PERSONELLISTVIEW.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELLISTVIEW.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.user_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.personel_adi field.
DBSetProp('PERSONELLISTVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('PERSONELLISTVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELLISTVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.departman_adi field.
DBSetProp('PERSONELLISTVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.Personel.Departman_Adi')
DBSetProp('PERSONELLISTVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELLISTVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.gorev_adi field.
DBSetProp('PERSONELLISTVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.Personel.Gorev_Adi')
DBSetProp('PERSONELLISTVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELLISTVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Görev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Görev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Görev Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Görev Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Görev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Görev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECLUTABLE","hbysdata!gorevlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECLUTAG","gorev_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMLUFIELDS","gorev_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMLUUPDTEXP","Gorevlookupview.gorev_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.baslama_tarihi field.
DBSetProp('PERSONELLISTVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Baslama_Tarihi')
DBSetProp('PERSONELLISTVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELLISTVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýþe Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýþe Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýþe Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýþe Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýþe Baþlama Tarihi                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýþe Baþlama Tarihi                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELLISTVIEW.ayrilis_tarihi field.
DBSetProp('PERSONELLISTVIEW.ayrilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLISTVIEW.ayrilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLISTVIEW.ayrilis_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Ayrilis_Tarihi')
DBSetProp('PERSONELLISTVIEW.ayrilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELLISTVIEW.ayrilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECDESCRIPT","Ayrilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Ayrýlýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Ayrýlýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Ayrýlýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Ayrýlýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Ayrýlýþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ayrýlýþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLISTVIEW.ayrilis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
