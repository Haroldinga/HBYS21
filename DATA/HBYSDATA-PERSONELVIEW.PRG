***************** Begin View Definition PERSONELVIEW ***************


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



CREATE SQL VIEW "PERSONELVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Personel.Personel_Id,;
		Personel.User_Id,;
		Personel.Personel_Adi,;
		Personel.Is_Unvani,;
		Personel.Departman_Adi,;
		Personel.Gorev_Adi,;
		Personel.Baslama_Tarihi,;
		Personel.Ayrilis_Tarihi,;
		Personel.TcKimlik_No,;
		Personel.Vergi_No,;
		Personel.Vergi_Dairesi,;
		Personel.Ssk_No,;
		Personel.Baro_Sicil_No,;
		Personel.Cinsiyeti,;
		Personel.Kimlik_No,;
		Personel.Baba_Adi,;
		Personel.Ana_Adi,;
		Personel.Dogum_Yeri,;
		Personel.Dogum_Tarihi,;
		Personel.Medeni_Hali,;
		Personel.Kan_Grubu,;
		Personel.Il_Adi,;
		Personel.Ilce_Adi,;
		Personel.Mahalle,;
		Personel.Koy,;
		Personel.Cilt_No,;
		Personel.Sira_No,;
		Personel.Verildigi_Yer,;
		Personel.Verilis_Nedeni,;
		Personel.Verilis_Tarihi,;
		Personel.e_Posta,;
		Personel.e_Posta_Kullanici_Adi,;
		Personel.e_Posta_Parola,;
		Personel.Ev_Tel_Ulke_Kodu,;
		Personel.Ev_Tel_No,;
		Personel.Is_Tel_Ulke_Kodu,;
		Personel.Is_Tel_No,;
		Personel.Is_Tel_Dahili_No,;
		Personel.Cep_Tel_Ulke_Kodu,;
		Personel.Cep_Tel_No,;
		Personel.Cep_Tel_2_Ulke_Kodu,;
		Personel.Cep_Tel_2_No,;
		Personel.Ev_Adresi,;
		Personel.Ev_Adresi_Posta_Kodu,;
		Personel.Ev_Adresi_Il_Adi,;
		Personel.Ev_Adresi_Ilce_Adi,;
		Personel.Ev_Adresi_Ulke_Adi,;
		Personel.Resim_Id,;
		Personel.Resim_Len,;
		Personel.Kase_Id,;
		Personel.Kase_Len,;
		Personel.Imza_Id,;
		Personel.Imza_Len,;
		Personel.Notlar;
	FROM dbo.Personel Personel

DBSetProp('PERSONELVIEW', 'View', 'UpdateType', 1)
DBSetProp('PERSONELVIEW', 'View', 'WhereType', 2)
DBSetProp('PERSONELVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('PERSONELVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('PERSONELVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PERSONELVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PERSONELVIEW', 'View', 'Tables', 'dbo.Personel')
DBSetProp('PERSONELVIEW', 'View', 'Prepared', .F.)
DBSetProp('PERSONELVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('PERSONELVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PERSONELVIEW', 'View', 'FetchSize', -1)
DBSetProp('PERSONELVIEW', 'View', 'ParameterList', "vp_Departman_Adi,'C';vp_Personel_Adi,'C';vp_User_id,'C';vp_Personel_Id,'C'")
DBSetProp('PERSONELVIEW', 'View', 'Comment', "")
DBSetProp('PERSONELVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERSONELVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for PERSONELVIEW
	GoExplorer.odbcx.Validate("PERSONELVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW","VIEW",;
		"VFECDESCRIPT","Personelview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Departman_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Departman Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMCOMPARETO","Departman_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMCOMPARETO","Personel_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_User_id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECDESCRIPT","Vp User Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMCOMPARETO","User_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_User_id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCOMPARETO","Personel_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for PERSONELVIEW
*** Props for the PERSONELVIEW.personel_id field.
DBSetProp('PERSONELVIEW.personel_id', 'Field', 'KeyField', .T.)
DBSetProp('PERSONELVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Personel.Personel_Id')
DBSetProp('PERSONELVIEW.personel_id', 'Field', 'DataType', "C(36)")
DBSetProp('PERSONELVIEW.personel_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for PERSONELVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.user_id field.
DBSetProp('PERSONELVIEW.user_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.user_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.user_id', 'Field', 'UpdateName', 'dbo.Personel.User_Id')
DBSetProp('PERSONELVIEW.user_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELVIEW.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.user_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.personel_adi field.
DBSetProp('PERSONELVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('PERSONELVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.is_unvani field.
DBSetProp('PERSONELVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.is_unvani', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('PERSONELVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.departman_adi field.
DBSetProp('PERSONELVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.Personel.Departman_Adi')
DBSetProp('PERSONELVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.gorev_adi field.
DBSetProp('PERSONELVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.Personel.Gorev_Adi')
DBSetProp('PERSONELVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Görev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Görev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Görev Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Görev Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Görev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Görev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECLUTABLE","hbysdata!gorevlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECLUTAG","gorev_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMLUFIELDS","gorev_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMLUUPDTEXP","Gorevlookupview.gorev_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.baslama_tarihi field.
DBSetProp('PERSONELVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Baslama_Tarihi')
DBSetProp('PERSONELVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýþe Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýþe Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýþe Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýþe Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýþe Baþlama Tarihi                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýþe Baþlama Tarihi                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ayrilis_tarihi field.
DBSetProp('PERSONELVIEW.ayrilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ayrilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ayrilis_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Ayrilis_Tarihi')
DBSetProp('PERSONELVIEW.ayrilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELVIEW.ayrilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECDESCRIPT","Ayrilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Ayrýlýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Ayrýlýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Ayrýlýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Ayrýlýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Ayrýlýþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ayrýlýþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ayrilis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.tckimlik_no field.
DBSetProp('PERSONELVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Personel.TcKimlik_No')
DBSetProp('PERSONELVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TcKimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TcKimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TcKimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TcKimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TcKimlik No                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TcKimlik No                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.vergi_no field.
DBSetProp('PERSONELVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Personel.Vergi_No')
DBSetProp('PERSONELVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.vergi_dairesi field.
DBSetProp('PERSONELVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Personel.Vergi_Dairesi')
DBSetProp('PERSONELVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ssk_no field.
DBSetProp('PERSONELVIEW.ssk_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ssk_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ssk_no', 'Field', 'UpdateName', 'dbo.Personel.Ssk_No')
DBSetProp('PERSONELVIEW.ssk_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ssk_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECDESCRIPT","Ssk No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECFRMCAPTN","Ssk No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECDLGCAPTN","Ssk No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECGRDCAPTN","Ssk No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECRPTCAPTN","Ssk No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFEMTOOLTIP","Ssk No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFEMSTATUSTXT","Ssk No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ssk_no","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.baro_sicil_no field.
DBSetProp('PERSONELVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Personel.Baro_Sicil_No')
DBSetProp('PERSONELVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.cinsiyeti field.
DBSetProp('PERSONELVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Personel.Cinsiyeti')
DBSetProp('PERSONELVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECLUTABLE","hbysdata!cinsiyetlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECLUTAG","cinsiyeti") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMLUFIELDS","cinsiyeti") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMLUUPDTEXP","Cinsiyetlookupview.cinsiyeti") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.kimlik_no field.
DBSetProp('PERSONELVIEW.kimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.kimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.kimlik_no', 'Field', 'UpdateName', 'dbo.Personel.Kimlik_No')
DBSetProp('PERSONELVIEW.kimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.kimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECDESCRIPT","Kimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECFRMCAPTN","Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECDLGCAPTN","Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECGRDCAPTN","Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECRPTCAPTN","Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFEMTOOLTIP","Kimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFEMSTATUSTXT","Kimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kimlik_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.baba_adi field.
DBSetProp('PERSONELVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Personel.Baba_Adi')
DBSetProp('PERSONELVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ana_adi field.
DBSetProp('PERSONELVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Personel.Ana_Adi')
DBSetProp('PERSONELVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adý                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adý                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.dogum_yeri field.
DBSetProp('PERSONELVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Personel.Dogum_Yeri')
DBSetProp('PERSONELVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.dogum_tarihi field.
DBSetProp('PERSONELVIEW.dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.dogum_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.dogum_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Dogum_Tarihi')
DBSetProp('PERSONELVIEW.dogum_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for PERSONELVIEW.dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Dogum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Dogum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Dogum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Dogum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Dogum Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Dogum Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.dogum_tarihi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.medeni_hali field.
DBSetProp('PERSONELVIEW.medeni_hali', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.medeni_hali', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.medeni_hali', 'Field', 'UpdateName', 'dbo.Personel.Medeni_Hali')
DBSetProp('PERSONELVIEW.medeni_hali', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELVIEW.medeni_hali
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECDESCRIPT","Medeni Hali Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECFRMCAPTN","Medeni Hali") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECDLGCAPTN","Medeni Hali") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECGRDCAPTN","Medeni Hali") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECRPTCAPTN","Medeni Hali") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMTOOLTIP","Medeni Hali") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMSTATUSTXT","Medeni Hali") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECLUTABLE","hbysdata!medenihallookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECLUTAG","medeni_hali") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMLUFIELDS","medeni_hali") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMLUUPDTEXP","Medenihallookupview.medeni_hali") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.medeni_hali","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the PERSONELVIEW.kan_grubu field.
DBSetProp('PERSONELVIEW.kan_grubu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.kan_grubu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.kan_grubu', 'Field', 'UpdateName', 'dbo.Personel.Kan_Grubu')
DBSetProp('PERSONELVIEW.kan_grubu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.kan_grubu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECDESCRIPT","Kan Grubu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECFRMCAPTN","Kan Grubu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECDLGCAPTN","Kan Grubu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECGRDCAPTN","Kan Grubu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECRPTCAPTN","Kan Grubu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMTOOLTIP","Kan Grubu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMSTATUSTXT","Kan Grubu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECLUTABLE","hbysdata!kangrubulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECLUTAG","kan_grubu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMLUFIELDS","kan_grubu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMLUUPDTEXP","Kangrubulookupview.kan_grubu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kan_grubu","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.il_adi field.
DBSetProp('PERSONELVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Personel.Il_Adi')
DBSetProp('PERSONELVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECCLASS","ail_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.il_adi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ilce_adi field.
DBSetProp('PERSONELVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Personel.Ilce_Adi')
DBSetProp('PERSONELVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECCLASS","ailce_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.mahalle field.
DBSetProp('PERSONELVIEW.mahalle', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.mahalle', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.mahalle', 'Field', 'UpdateName', 'dbo.Personel.Mahalle')
DBSetProp('PERSONELVIEW.mahalle', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.mahalle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECDESCRIPT","Mahalle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECFRMCAPTN","Mahalle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECDLGCAPTN","Mahalle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECGRDCAPTN","Mahalle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECRPTCAPTN","Mahalle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFEMTOOLTIP","Mahalle") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFEMSTATUSTXT","Mahalle") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.mahalle","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.koy field.
DBSetProp('PERSONELVIEW.koy', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.koy', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.koy', 'Field', 'UpdateName', 'dbo.Personel.Koy')
DBSetProp('PERSONELVIEW.koy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.koy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECDESCRIPT","Koy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECFRMCAPTN","Köy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECDLGCAPTN","Köy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECGRDCAPTN","Köy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECRPTCAPTN","Köy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFEMTOOLTIP","Köy                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFEMSTATUSTXT","Köy                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.koy","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.cilt_no field.
DBSetProp('PERSONELVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.Personel.Cilt_No')
DBSetProp('PERSONELVIEW.cilt_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.sira_no field.
DBSetProp('PERSONELVIEW.sira_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.sira_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.sira_no', 'Field', 'UpdateName', 'dbo.Personel.Sira_No')
DBSetProp('PERSONELVIEW.sira_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELVIEW.sira_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECDESCRIPT","Sira No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECFRMCAPTN","Sýra No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECDLGCAPTN","Sýra No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECGRDCAPTN","Sýra No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECRPTCAPTN","Sýra No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFEMTOOLTIP","Sýra No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFEMSTATUSTXT","Sýra No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.sira_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.verildigi_yer field.
DBSetProp('PERSONELVIEW.verildigi_yer', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.verildigi_yer', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.verildigi_yer', 'Field', 'UpdateName', 'dbo.Personel.Verildigi_Yer')
DBSetProp('PERSONELVIEW.verildigi_yer', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.verildigi_yer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECDESCRIPT","Verildigi Yer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECFRMCAPTN","Verildiði Yer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECDLGCAPTN","Verildiði Yer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECGRDCAPTN","Verildiði Yer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECRPTCAPTN","Verildiði Yer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFEMTOOLTIP","Verildiði Yer                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFEMSTATUSTXT","Verildiði Yer                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verildigi_yer","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.verilis_nedeni field.
DBSetProp('PERSONELVIEW.verilis_nedeni', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.verilis_nedeni', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.verilis_nedeni', 'Field', 'UpdateName', 'dbo.Personel.Verilis_Nedeni')
DBSetProp('PERSONELVIEW.verilis_nedeni', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.verilis_nedeni
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECDESCRIPT","Verilis Nedeni Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECFRMCAPTN","Veriliþ Nedeni") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECDLGCAPTN","Veriliþ Nedeni") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECGRDCAPTN","Veriliþ Nedeni") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECRPTCAPTN","Veriliþ Nedeni") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFEMTOOLTIP","Veriliþ Nedeni                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Nedeni                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_nedeni","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.verilis_tarihi field.
DBSetProp('PERSONELVIEW.verilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.verilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.verilis_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Verilis_Tarihi')
DBSetProp('PERSONELVIEW.verilis_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for PERSONELVIEW.verilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECDESCRIPT","Verilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Verilis Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Verilis Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Verilis Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Verilis Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Verilis Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Verilis Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.verilis_tarihi","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.e_posta field.
DBSetProp('PERSONELVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Personel.e_Posta')
DBSetProp('PERSONELVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","E-Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","E-Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","E-Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","E-Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","E-Posta                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","E-Posta                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.e_posta_kullanici_adi field.
DBSetProp('PERSONELVIEW.e_posta_kullanici_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.e_posta_kullanici_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.e_posta_kullanici_adi', 'Field', 'UpdateName', 'dbo.Personel.e_Posta_Kullanici_Adi')
DBSetProp('PERSONELVIEW.e_posta_kullanici_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELVIEW.e_posta_kullanici_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECDESCRIPT","E Posta Kullanici Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECFRMCAPTN","E-Posta Kullanýcý Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECDLGCAPTN","E-Posta Kullanýcý Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECGRDCAPTN","E-Posta Kullanýcý Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECRPTCAPTN","E-Posta Kullanýcý Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMTOOLTIP","E-Posta Kullanýcý Adý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMSTATUSTXT","E-Posta Kullanýcý Adý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_kullanici_adi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.e_posta_parola field.
DBSetProp('PERSONELVIEW.e_posta_parola', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.e_posta_parola', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.e_posta_parola', 'Field', 'UpdateName', 'dbo.Personel.e_Posta_Parola')
DBSetProp('PERSONELVIEW.e_posta_parola', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.e_posta_parola
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECDESCRIPT","E Posta Parola Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECFRMCAPTN","E-Posta Parolasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECDLGCAPTN","E-Posta Parolasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECGRDCAPTN","E-Posta Parolasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECRPTCAPTN","E-Posta Parolasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFEMTOOLTIP","E-Posta Parolasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFEMSTATUSTXT","E-Posta Parolasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.e_posta_parola","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ev_tel_ulke_kodu field.
DBSetProp('PERSONELVIEW.ev_tel_ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_tel_ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_tel_ulke_kodu', 'Field', 'UpdateName', 'dbo.Personel.Ev_Tel_Ulke_Kodu')
DBSetProp('PERSONELVIEW.ev_tel_ulke_kodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for PERSONELVIEW.ev_tel_ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECDESCRIPT","Ev Tel Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Ev Tel Ulke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Ev Tel Ulke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Ev Tel Ulke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Ev Tel Ulke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Ev Tel Ulke Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Ev Tel Ulke Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_ulke_kodu","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ev_tel_no field.
DBSetProp('PERSONELVIEW.ev_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Ev_Tel_No')
DBSetProp('PERSONELVIEW.ev_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ev_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECDESCRIPT","Ev Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECFRMCAPTN","Ev Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECDLGCAPTN","Ev Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECGRDCAPTN","Ev Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECRPTCAPTN","Ev Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMTOOLTIP","Ev Tel                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMSTATUSTXT","Ev Tel                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFENDISPORDER",30) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELVIEW.is_tel_ulke_kodu field.
DBSetProp('PERSONELVIEW.is_tel_ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.is_tel_ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.is_tel_ulke_kodu', 'Field', 'UpdateName', 'dbo.Personel.Is_Tel_Ulke_Kodu')
DBSetProp('PERSONELVIEW.is_tel_ulke_kodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for PERSONELVIEW.is_tel_ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECDESCRIPT","Is Tel Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Is Tel Ulke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Is Tel Ulke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Is Tel Ulke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Is Tel Ulke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Is Tel Ulke Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Is Tel Ulke Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_ulke_kodu","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.is_tel_no field.
DBSetProp('PERSONELVIEW.is_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.is_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.is_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Is_Tel_No')
DBSetProp('PERSONELVIEW.is_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.is_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECDESCRIPT","Is Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECFRMCAPTN","Ýþ Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECDLGCAPTN","Ýþ Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECGRDCAPTN","Ýþ Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECRPTCAPTN","Ýþ Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMTOOLTIP","Ýþ Tel                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMSTATUSTXT","Ýþ Tel                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFENDISPORDER",33) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELVIEW.is_tel_dahili_no field.
DBSetProp('PERSONELVIEW.is_tel_dahili_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.is_tel_dahili_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.is_tel_dahili_no', 'Field', 'UpdateName', 'dbo.Personel.Is_Tel_Dahili_No')
DBSetProp('PERSONELVIEW.is_tel_dahili_no', 'Field', 'DataType', "C(4)")
*** DBCX Field Properties for PERSONELVIEW.is_tel_dahili_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECDESCRIPT","Is Tel Dahili No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECFRMCAPTN","Is Tel Dahili No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECDLGCAPTN","Is Tel Dahili No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECGRDCAPTN","Is Tel Dahili No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECRPTCAPTN","Is Tel Dahili No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFEMTOOLTIP","Is Tel Dahili No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFEMSTATUSTXT","Is Tel Dahili No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.is_tel_dahili_no","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.cep_tel_ulke_kodu field.
DBSetProp('PERSONELVIEW.cep_tel_ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cep_tel_ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cep_tel_ulke_kodu', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_Ulke_Kodu')
DBSetProp('PERSONELVIEW.cep_tel_ulke_kodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for PERSONELVIEW.cep_tel_ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECDESCRIPT","Cep Tel Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Cep Tel Ulke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Cep Tel Ulke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Cep Tel Ulke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Cep Tel Ulke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Cep Tel Ulke Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Cep Tel Ulke Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_ulke_kodu","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.cep_tel_no field.
DBSetProp('PERSONELVIEW.cep_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cep_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cep_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_No')
DBSetProp('PERSONELVIEW.cep_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.cep_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECDESCRIPT","Cep Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECFRMCAPTN","Cep Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECDLGCAPTN","Cep Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECGRDCAPTN","Cep Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECRPTCAPTN","Cep Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMTOOLTIP","Cep Tel                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMSTATUSTXT","Cep Tel                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFENDISPORDER",37) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELVIEW.cep_tel_2_ulke_kodu field.
DBSetProp('PERSONELVIEW.cep_tel_2_ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cep_tel_2_ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cep_tel_2_ulke_kodu', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_2_Ulke_Kodu')
DBSetProp('PERSONELVIEW.cep_tel_2_ulke_kodu', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for PERSONELVIEW.cep_tel_2_ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECDESCRIPT","Cep Tel 2 Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Cep Tel 2 Ulke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Cep Tel 2 Ulke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Cep Tel 2 Ulke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Cep Tel 2 Ulke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Cep Tel 2 Ulke Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Cep Tel 2 Ulke Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_ulke_kodu","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.cep_tel_2_no field.
DBSetProp('PERSONELVIEW.cep_tel_2_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.cep_tel_2_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.cep_tel_2_no', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_2_No')
DBSetProp('PERSONELVIEW.cep_tel_2_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.cep_tel_2_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECDESCRIPT","Cep Tel 2 No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECFRMCAPTN","Cep 2 Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECDLGCAPTN","Cep 2 Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECGRDCAPTN","Cep 2 Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECRPTCAPTN","Cep 2 Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMTOOLTIP","Cep 2 Tel                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMSTATUSTXT","Cep 2 Tel                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFENDISPORDER",40) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.cep_tel_2_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELVIEW.ev_adresi field.
DBSetProp('PERSONELVIEW.ev_adresi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_adresi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_adresi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi')
DBSetProp('PERSONELVIEW.ev_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for PERSONELVIEW.ev_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECFRMCAPTN","Ev Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECDLGCAPTN","Ev Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECGRDCAPTN","Ev Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECRPTCAPTN","Ev Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFEMTOOLTIP","Ev Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFEMSTATUSTXT","Ev Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ev_adresi_posta_kodu field.
DBSetProp('PERSONELVIEW.ev_adresi_posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_adresi_posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_adresi_posta_kodu', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Posta_Kodu')
DBSetProp('PERSONELVIEW.ev_adresi_posta_kodu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELVIEW.ev_adresi_posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECDESCRIPT","Ev Adresi Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFENDISPORDER",42) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the PERSONELVIEW.ev_adresi_il_adi field.
DBSetProp('PERSONELVIEW.ev_adresi_il_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_adresi_il_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_adresi_il_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Il_Adi')
DBSetProp('PERSONELVIEW.ev_adresi_il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ev_adresi_il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_il_adi","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ev_adresi_ilce_adi field.
DBSetProp('PERSONELVIEW.ev_adresi_ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_adresi_ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_adresi_ilce_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Ilce_Adi')
DBSetProp('PERSONELVIEW.ev_adresi_ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ev_adresi_ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENDISPORDER",44) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.ev_adresi_ulke_adi field.
DBSetProp('PERSONELVIEW.ev_adresi_ulke_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.ev_adresi_ulke_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.ev_adresi_ulke_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Ulke_Adi')
DBSetProp('PERSONELVIEW.ev_adresi_ulke_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELVIEW.ev_adresi_ulke_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Ulke Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECFRMCAPTN","Ülke Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECDLGCAPTN","Ülke Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECGRDCAPTN","Ülke Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECRPTCAPTN","Ülke Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMTOOLTIP","Ülke Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMSTATUSTXT","Ülke Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFENDISPORDER",45) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.resim_id field.
DBSetProp('PERSONELVIEW.resim_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.resim_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.resim_id', 'Field', 'UpdateName', 'dbo.Personel.Resim_Id')
DBSetProp('PERSONELVIEW.resim_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELVIEW.resim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECDESCRIPT","Resim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECFRMCAPTN","Resim Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECDLGCAPTN","Resim Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECGRDCAPTN","Resim Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECRPTCAPTN","Resim Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFEMTOOLTIP","Resim Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFEMSTATUSTXT","Resim Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_id","FIELD",;
		"VFENDISPORDER",46) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.resim_len field.
DBSetProp('PERSONELVIEW.resim_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.resim_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.resim_len', 'Field', 'UpdateName', 'dbo.Personel.Resim_Len')
DBSetProp('PERSONELVIEW.resim_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELVIEW.resim_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECDESCRIPT","Resim Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECFRMCAPTN","Resim Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECDLGCAPTN","Resim Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECGRDCAPTN","Resim Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECRPTCAPTN","Resim Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFEMTOOLTIP","Resim Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFEMSTATUSTXT","Resim Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.resim_len","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.kase_id field.
DBSetProp('PERSONELVIEW.kase_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.kase_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.kase_id', 'Field', 'UpdateName', 'dbo.Personel.Kase_Id')
DBSetProp('PERSONELVIEW.kase_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELVIEW.kase_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECDESCRIPT","Kase Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECFRMCAPTN","Kase Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECDLGCAPTN","Kase Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECGRDCAPTN","Kase Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECRPTCAPTN","Kase Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFEMTOOLTIP","Kase Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFEMSTATUSTXT","Kase Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_id","FIELD",;
		"VFENDISPORDER",48) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.kase_len field.
DBSetProp('PERSONELVIEW.kase_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.kase_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.kase_len', 'Field', 'UpdateName', 'dbo.Personel.Kase_Len')
DBSetProp('PERSONELVIEW.kase_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELVIEW.kase_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECDESCRIPT","Kase Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECFRMCAPTN","Kase Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECDLGCAPTN","Kase Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECGRDCAPTN","Kase Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECRPTCAPTN","Kase Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFEMTOOLTIP","Kase Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFEMSTATUSTXT","Kase Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.kase_len","FIELD",;
		"VFENDISPORDER",49) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.imza_id field.
DBSetProp('PERSONELVIEW.imza_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.imza_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.imza_id', 'Field', 'UpdateName', 'dbo.Personel.Imza_Id')
DBSetProp('PERSONELVIEW.imza_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELVIEW.imza_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECDESCRIPT","Imza Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECFRMCAPTN","Imza Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECDLGCAPTN","Imza Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECGRDCAPTN","Imza Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECRPTCAPTN","Imza Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFEMTOOLTIP","Imza Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFEMSTATUSTXT","Imza Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_id","FIELD",;
		"VFENDISPORDER",50) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.imza_len field.
DBSetProp('PERSONELVIEW.imza_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.imza_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.imza_len', 'Field', 'UpdateName', 'dbo.Personel.Imza_Len')
DBSetProp('PERSONELVIEW.imza_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELVIEW.imza_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECDESCRIPT","Imza Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECFRMCAPTN","Imza Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECDLGCAPTN","Imza Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECGRDCAPTN","Imza Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECRPTCAPTN","Imza Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFEMTOOLTIP","Imza Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFEMSTATUSTXT","Imza Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.imza_len","FIELD",;
		"VFENDISPORDER",51) &&Display Order
ENDIF
 
*** Props for the PERSONELVIEW.notlar field.
DBSetProp('PERSONELVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELVIEW.notlar', 'Field', 'UpdateName', 'dbo.Personel.Notlar')
DBSetProp('PERSONELVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for PERSONELVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELVIEW.notlar","FIELD",;
		"VFENDISPORDER",54) &&Display Order
ENDIF
 
