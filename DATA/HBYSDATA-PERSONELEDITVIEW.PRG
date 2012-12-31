***************** Begin View Definition PERSONELEDITVIEW ***************


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



CREATE SQL VIEW "PERSONELEDITVIEW" ; 
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
		Personel.Tbb_No,;
		Personel.Vekil_Tipi,;
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
		Personel.Ev_Tel_No,;
		Personel.Is_Tel_No,;
		Personel.Is_Tel_Dahili_No,;
		Personel.Cep_Tel_No,;
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

DBSetProp('PERSONELEDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('PERSONELEDITVIEW', 'View', 'WhereType', 2)
DBSetProp('PERSONELEDITVIEW', 'View', 'FetchMemo', .F.)
DBSetProp('PERSONELEDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('PERSONELEDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PERSONELEDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PERSONELEDITVIEW', 'View', 'Tables', 'dbo.Personel')
DBSetProp('PERSONELEDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('PERSONELEDITVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('PERSONELEDITVIEW', 'View', 'FetchAsNeeded', .T.)
DBSetProp('PERSONELEDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('PERSONELEDITVIEW', 'View', 'ParameterList', "vp_Personel_Id,'C'")
DBSetProp('PERSONELEDITVIEW', 'View', 'Comment', "")
DBSetProp('PERSONELEDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERSONELEDITVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()
_VFEGenView_F2()

IF lWriteDBCXProps
 
	*** DBCX View Properties for PERSONELEDITVIEW
	GoExplorer.odbcx.Validate("PERSONELEDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW","VIEW",;
		"VFECDESCRIPT","Personeleditview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for PERSONELEDITVIEW
*** Props for the PERSONELEDITVIEW.personel_id field.
DBSetProp('PERSONELEDITVIEW.personel_id', 'Field', 'KeyField', .T.)
DBSetProp('PERSONELEDITVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Personel.Personel_Id')
DBSetProp('PERSONELEDITVIEW.personel_id', 'Field', 'DataType', "C(36)")
DBSetProp('PERSONELEDITVIEW.personel_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for PERSONELEDITVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.user_id field.
DBSetProp('PERSONELEDITVIEW.user_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.user_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.user_id', 'Field', 'UpdateName', 'dbo.Personel.User_Id')
DBSetProp('PERSONELEDITVIEW.user_id', 'Field', 'DataType', "C(36)")
DBSetProp('PERSONELEDITVIEW.user_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for PERSONELEDITVIEW.user_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECDESCRIPT","User Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECFRMCAPTN","User Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECDLGCAPTN","User Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECGRDCAPTN","User Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECRPTCAPTN","User Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFEMTOOLTIP","User Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFEMSTATUSTXT","User Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.user_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.personel_adi field.
DBSetProp('PERSONELEDITVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('PERSONELEDITVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELEDITVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.is_unvani field.
DBSetProp('PERSONELEDITVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.is_unvani', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('PERSONELEDITVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.departman_adi field.
DBSetProp('PERSONELEDITVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.Personel.Departman_Adi')
DBSetProp('PERSONELEDITVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.gorev_adi field.
DBSetProp('PERSONELEDITVIEW.gorev_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.gorev_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.gorev_adi', 'Field', 'UpdateName', 'dbo.Personel.Gorev_Adi')
DBSetProp('PERSONELEDITVIEW.gorev_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.gorev_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECDESCRIPT","Gorev Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECFRMCAPTN","Görev Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECDLGCAPTN","Görev Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECGRDCAPTN","Görev Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECRPTCAPTN","Görev Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMTOOLTIP","Görev Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMSTATUSTXT","Görev Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECLUTABLE","hbysdata!gorevlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECLUTAG","gorev_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMLUFIELDS","gorev_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMLUUPDTEXP","Gorevlookupview.gorev_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.gorev_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.baslama_tarihi field.
DBSetProp('PERSONELEDITVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Baslama_Tarihi')
DBSetProp('PERSONELEDITVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELEDITVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýþe Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýþe Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýþe Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýþe Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýþe Baþlama Tarihi                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýþe Baþlama Tarihi                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ayrilis_tarihi field.
DBSetProp('PERSONELEDITVIEW.ayrilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ayrilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ayrilis_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Ayrilis_Tarihi')
DBSetProp('PERSONELEDITVIEW.ayrilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELEDITVIEW.ayrilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECDESCRIPT","Ayrilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Ayrýlýþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Ayrýlýþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Ayrýlýþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Ayrýlýþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Ayrýlýþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ayrýlýþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ayrilis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.tckimlik_no field.
DBSetProp('PERSONELEDITVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Personel.TcKimlik_No')
DBSetProp('PERSONELEDITVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TcKimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TcKimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TcKimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TcKimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TcKimlik No                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TcKimlik No                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.vergi_no field.
DBSetProp('PERSONELEDITVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Personel.Vergi_No')
DBSetProp('PERSONELEDITVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.vergi_dairesi field.
DBSetProp('PERSONELEDITVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Personel.Vergi_Dairesi')
DBSetProp('PERSONELEDITVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ssk_no field.
DBSetProp('PERSONELEDITVIEW.ssk_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ssk_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ssk_no', 'Field', 'UpdateName', 'dbo.Personel.Ssk_No')
DBSetProp('PERSONELEDITVIEW.ssk_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ssk_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECDESCRIPT","Ssk No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECFRMCAPTN","Ssk No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECDLGCAPTN","Ssk No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECGRDCAPTN","Ssk No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECRPTCAPTN","Ssk No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFEMTOOLTIP","Ssk No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFEMSTATUSTXT","Ssk No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ssk_no","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.baro_sicil_no field.
DBSetProp('PERSONELEDITVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Personel.Baro_Sicil_No')
DBSetProp('PERSONELEDITVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.tbb_no field.
DBSetProp('PERSONELEDITVIEW.tbb_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.tbb_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.tbb_no', 'Field', 'UpdateName', 'dbo.Personel.Tbb_No')
DBSetProp('PERSONELEDITVIEW.tbb_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.tbb_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECDESCRIPT","Tbb No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECFRMCAPTN","Tbb No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECDLGCAPTN","Tbb No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECGRDCAPTN","Tbb No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECRPTCAPTN","Tbb No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFEMTOOLTIP","Tbb No                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFEMSTATUSTXT","Tbb No                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.tbb_no","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.vekil_tipi field.
DBSetProp('PERSONELEDITVIEW.vekil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.vekil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.vekil_tipi', 'Field', 'UpdateName', 'dbo.Personel.Vekil_Tipi')
DBSetProp('PERSONELEDITVIEW.vekil_tipi', 'Field', 'DataType', "C(7)")
*** DBCX Field Properties for PERSONELEDITVIEW.vekil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECDESCRIPT","Vekil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECFRMCAPTN","Vekil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECDLGCAPTN","Vekil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECGRDCAPTN","Vekil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECRPTCAPTN","Vekil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFEMTOOLTIP","Vekil Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFEMSTATUSTXT","Vekil Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFEMINLIST",'"Serbest","Baro","Kurum"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.vekil_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.cinsiyeti field.
DBSetProp('PERSONELEDITVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Personel.Cinsiyeti')
DBSetProp('PERSONELEDITVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELEDITVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTABLE","hbysdata!cinsiyetlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTAG","cinsiyeti") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUFIELDS","cinsiyeti") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUUPDTEXP","Cinsiyetlookupview.cinsiyeti") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.kimlik_no field.
DBSetProp('PERSONELEDITVIEW.kimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.kimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.kimlik_no', 'Field', 'UpdateName', 'dbo.Personel.Kimlik_No')
DBSetProp('PERSONELEDITVIEW.kimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.kimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECDESCRIPT","Kimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECFRMCAPTN","Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECDLGCAPTN","Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECGRDCAPTN","Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECRPTCAPTN","Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFEMTOOLTIP","Kimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFEMSTATUSTXT","Kimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kimlik_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.baba_adi field.
DBSetProp('PERSONELEDITVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Personel.Baba_Adi')
DBSetProp('PERSONELEDITVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ana_adi field.
DBSetProp('PERSONELEDITVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Personel.Ana_Adi')
DBSetProp('PERSONELEDITVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adý                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adý                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.dogum_yeri field.
DBSetProp('PERSONELEDITVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Personel.Dogum_Yeri')
DBSetProp('PERSONELEDITVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.dogum_tarihi field.
DBSetProp('PERSONELEDITVIEW.dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.dogum_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.dogum_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Dogum_Tarihi')
DBSetProp('PERSONELEDITVIEW.dogum_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELEDITVIEW.dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Doðum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Doðum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Doðum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Doðum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Doðum Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Doðum Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.dogum_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.medeni_hali field.
DBSetProp('PERSONELEDITVIEW.medeni_hali', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.medeni_hali', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.medeni_hali', 'Field', 'UpdateName', 'dbo.Personel.Medeni_Hali')
DBSetProp('PERSONELEDITVIEW.medeni_hali', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELEDITVIEW.medeni_hali
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECDESCRIPT","Medeni Hali Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECFRMCAPTN","Medeni Hali") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECDLGCAPTN","Medeni Hali") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECGRDCAPTN","Medeni Hali") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECRPTCAPTN","Medeni Hali") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMTOOLTIP","Medeni Hali") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMSTATUSTXT","Medeni Hali") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECLUTABLE","hbysdata!medenihallookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECLUTAG","medeni_hali") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMLUFIELDS","medeni_hali") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMLUUPDTEXP","Medenihallookupview.medeni_hali") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.medeni_hali","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the PERSONELEDITVIEW.kan_grubu field.
DBSetProp('PERSONELEDITVIEW.kan_grubu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.kan_grubu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.kan_grubu', 'Field', 'UpdateName', 'dbo.Personel.Kan_Grubu')
DBSetProp('PERSONELEDITVIEW.kan_grubu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.kan_grubu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECDESCRIPT","Kan Grubu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECFRMCAPTN","Kan Grubu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECDLGCAPTN","Kan Grubu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECGRDCAPTN","Kan Grubu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECRPTCAPTN","Kan Grubu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMTOOLTIP","Kan Grubu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMSTATUSTXT","Kan Grubu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECLUTABLE","hbysdata!kangrubulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECLUTAG","kan_grubu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMLUFIELDS","kan_grubu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMLUUPDTEXP","Kangrubulookupview.kan_grubu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kan_grubu","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.il_adi field.
DBSetProp('PERSONELEDITVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Personel.Il_Adi')
DBSetProp('PERSONELEDITVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.il_adi","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ilce_adi field.
DBSetProp('PERSONELEDITVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Personel.Ilce_Adi')
DBSetProp('PERSONELEDITVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi, il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",44) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.mahalle field.
DBSetProp('PERSONELEDITVIEW.mahalle', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.mahalle', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.mahalle', 'Field', 'UpdateName', 'dbo.Personel.Mahalle')
DBSetProp('PERSONELEDITVIEW.mahalle', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.mahalle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECDESCRIPT","Mahalle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECFRMCAPTN","Mahalle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECDLGCAPTN","Mahalle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECGRDCAPTN","Mahalle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECRPTCAPTN","Mahalle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFEMTOOLTIP","Mahalle") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFEMSTATUSTXT","Mahalle") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.mahalle","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.koy field.
DBSetProp('PERSONELEDITVIEW.koy', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.koy', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.koy', 'Field', 'UpdateName', 'dbo.Personel.Koy')
DBSetProp('PERSONELEDITVIEW.koy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.koy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECDESCRIPT","Koy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECFRMCAPTN","Köy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECDLGCAPTN","Köy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECGRDCAPTN","Köy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECRPTCAPTN","Köy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFEMTOOLTIP","Köy                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFEMSTATUSTXT","Köy                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.koy","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.cilt_no field.
DBSetProp('PERSONELEDITVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.Personel.Cilt_No')
DBSetProp('PERSONELEDITVIEW.cilt_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELEDITVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.sira_no field.
DBSetProp('PERSONELEDITVIEW.sira_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.sira_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.sira_no', 'Field', 'UpdateName', 'dbo.Personel.Sira_No')
DBSetProp('PERSONELEDITVIEW.sira_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELEDITVIEW.sira_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECDESCRIPT","Sira No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECFRMCAPTN","Sýra No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECDLGCAPTN","Sýra No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECGRDCAPTN","Sýra No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECRPTCAPTN","Sýra No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFEMTOOLTIP","Sýra No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFEMSTATUSTXT","Sýra No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.sira_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.verildigi_yer field.
DBSetProp('PERSONELEDITVIEW.verildigi_yer', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.verildigi_yer', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.verildigi_yer', 'Field', 'UpdateName', 'dbo.Personel.Verildigi_Yer')
DBSetProp('PERSONELEDITVIEW.verildigi_yer', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.verildigi_yer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECDESCRIPT","Verildigi Yer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECFRMCAPTN","Verildiði Yer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECDLGCAPTN","Verildiði Yer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECGRDCAPTN","Verildiði Yer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECRPTCAPTN","Verildiði Yer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFEMTOOLTIP","Verildiði Yer                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFEMSTATUSTXT","Verildiði Yer                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verildigi_yer","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.verilis_nedeni field.
DBSetProp('PERSONELEDITVIEW.verilis_nedeni', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.verilis_nedeni', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.verilis_nedeni', 'Field', 'UpdateName', 'dbo.Personel.Verilis_Nedeni')
DBSetProp('PERSONELEDITVIEW.verilis_nedeni', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.verilis_nedeni
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECDESCRIPT","Verilis Nedeni Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECFRMCAPTN","Veriliþ Nedeni") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECDLGCAPTN","Veriliþ Nedeni") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECGRDCAPTN","Veriliþ Nedeni") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECRPTCAPTN","Veriliþ Nedeni") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMTOOLTIP","Veriliþ Nedeni                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Nedeni                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_nedeni","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.verilis_tarihi field.
DBSetProp('PERSONELEDITVIEW.verilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.verilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.verilis_tarihi', 'Field', 'UpdateName', 'dbo.Personel.Verilis_Tarihi')
DBSetProp('PERSONELEDITVIEW.verilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for PERSONELEDITVIEW.verilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECDESCRIPT","Verilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Veriliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Veriliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Veriliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Veriliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Veriliþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.verilis_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.e_posta field.
DBSetProp('PERSONELEDITVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Personel.e_Posta')
DBSetProp('PERSONELEDITVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELEDITVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","e_Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","e_Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","e_Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","e_Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","e_Posta                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","e_Posta                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.e_posta_kullanici_adi field.
DBSetProp('PERSONELEDITVIEW.e_posta_kullanici_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.e_posta_kullanici_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.e_posta_kullanici_adi', 'Field', 'UpdateName', 'dbo.Personel.e_Posta_Kullanici_Adi')
DBSetProp('PERSONELEDITVIEW.e_posta_kullanici_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for PERSONELEDITVIEW.e_posta_kullanici_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECDESCRIPT","E Posta Kullanici Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECFRMCAPTN","e_Posta Kullanýcý Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECDLGCAPTN","e_Posta Kullanýcý Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECGRDCAPTN","e_Posta Kullanýcý Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECRPTCAPTN","e_Posta Kullanýcý Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMTOOLTIP","e_Posta Kullanýcý Adý                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMSTATUSTXT","e_Posta Kullanýcý Adý                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_kullanici_adi","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.e_posta_parola field.
DBSetProp('PERSONELEDITVIEW.e_posta_parola', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.e_posta_parola', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.e_posta_parola', 'Field', 'UpdateName', 'dbo.Personel.e_Posta_Parola')
DBSetProp('PERSONELEDITVIEW.e_posta_parola', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.e_posta_parola
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECDESCRIPT","E Posta Parola Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECFRMCAPTN","e_Posta Parolasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECDLGCAPTN","e_Posta Parolasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECGRDCAPTN","e_Posta Parolasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECRPTCAPTN","e_Posta Parolasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFEMTOOLTIP","e_Posta Parolasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFEMSTATUSTXT","e_Posta Parolasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.e_posta_parola","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ev_tel_no field.
DBSetProp('PERSONELEDITVIEW.ev_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Ev_Tel_No')
DBSetProp('PERSONELEDITVIEW.ev_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECDESCRIPT","Ev Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECFRMCAPTN","Ev Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECDLGCAPTN","Ev Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECGRDCAPTN","Ev Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECRPTCAPTN","Ev Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMTOOLTIP","Ev Tel                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMSTATUSTXT","Ev Tel                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFENDISPORDER",30) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELEDITVIEW.is_tel_no field.
DBSetProp('PERSONELEDITVIEW.is_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.is_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.is_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Is_Tel_No')
DBSetProp('PERSONELEDITVIEW.is_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.is_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECDESCRIPT","Is Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECFRMCAPTN","Ýþ Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECDLGCAPTN","Ýþ Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECGRDCAPTN","Ýþ Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECRPTCAPTN","Ýþ Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMTOOLTIP","Ýþ Tel                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMSTATUSTXT","Ýþ Tel                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFENDISPORDER",33) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELEDITVIEW.is_tel_dahili_no field.
DBSetProp('PERSONELEDITVIEW.is_tel_dahili_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.is_tel_dahili_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.is_tel_dahili_no', 'Field', 'UpdateName', 'dbo.Personel.Is_Tel_Dahili_No')
DBSetProp('PERSONELEDITVIEW.is_tel_dahili_no', 'Field', 'DataType', "C(4)")
*** DBCX Field Properties for PERSONELEDITVIEW.is_tel_dahili_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECDESCRIPT","Is Tel Dahili No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECFRMCAPTN","Is Tel Dahili No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECDLGCAPTN","Is Tel Dahili No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECGRDCAPTN","Is Tel Dahili No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECRPTCAPTN","Is Tel Dahili No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFEMTOOLTIP","Is Tel Dahili No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFEMSTATUSTXT","Is Tel Dahili No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.is_tel_dahili_no","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.cep_tel_no field.
DBSetProp('PERSONELEDITVIEW.cep_tel_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.cep_tel_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.cep_tel_no', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_No')
DBSetProp('PERSONELEDITVIEW.cep_tel_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.cep_tel_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECDESCRIPT","Cep Tel No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECFRMCAPTN","Cep Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECDLGCAPTN","Cep Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECGRDCAPTN","Cep Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECRPTCAPTN","Cep Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMTOOLTIP","Cep Tel                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMSTATUSTXT","Cep Tel                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFENDISPORDER",37) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELEDITVIEW.cep_tel_2_no field.
DBSetProp('PERSONELEDITVIEW.cep_tel_2_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.cep_tel_2_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.cep_tel_2_no', 'Field', 'UpdateName', 'dbo.Personel.Cep_Tel_2_No')
DBSetProp('PERSONELEDITVIEW.cep_tel_2_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.cep_tel_2_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECDESCRIPT","Cep Tel 2 No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECFRMCAPTN","Cep 2 Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECDLGCAPTN","Cep 2 Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECGRDCAPTN","Cep 2 Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECRPTCAPTN","Cep 2 Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMTOOLTIP","Cep 2 Tel                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMSTATUSTXT","Cep 2 Tel                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFENDISPORDER",40) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.cep_tel_2_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the PERSONELEDITVIEW.ev_adresi field.
DBSetProp('PERSONELEDITVIEW.ev_adresi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_adresi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_adresi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi')
DBSetProp('PERSONELEDITVIEW.ev_adresi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECFRMCAPTN","Ev Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECDLGCAPTN","Ev Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECGRDCAPTN","Ev Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECRPTCAPTN","Ev Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFEMTOOLTIP","Ev Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFEMSTATUSTXT","Ev Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ev_adresi_posta_kodu field.
DBSetProp('PERSONELEDITVIEW.ev_adresi_posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_posta_kodu', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Posta_Kodu')
DBSetProp('PERSONELEDITVIEW.ev_adresi_posta_kodu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_adresi_posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECDESCRIPT","Ev Adresi Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_posta_kodu","FIELD",;
		"VFENDISPORDER",42) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ev_adresi_il_adi field.
DBSetProp('PERSONELEDITVIEW.ev_adresi_il_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_il_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_il_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Il_Adi')
DBSetProp('PERSONELEDITVIEW.ev_adresi_il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_adresi_il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_il_adi","FIELD",;
		"VFENDISPORDER",43) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.ev_adresi_ilce_adi field.
DBSetProp('PERSONELEDITVIEW.ev_adresi_ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_ilce_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Ilce_Adi')
DBSetProp('PERSONELEDITVIEW.ev_adresi_ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_adresi_ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi, il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ilce_adi","FIELD",;
		"VFENDISPORDER",44) &&Display Order
ENDIF
 
ENDPROC




***Split to stay below 64K limit***
FUNCTION _VFEGenView_F2
*** Props for the PERSONELEDITVIEW.ev_adresi_ulke_adi field.
DBSetProp('PERSONELEDITVIEW.ev_adresi_ulke_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_ulke_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.ev_adresi_ulke_adi', 'Field', 'UpdateName', 'dbo.Personel.Ev_Adresi_Ulke_Adi')
DBSetProp('PERSONELEDITVIEW.ev_adresi_ulke_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELEDITVIEW.ev_adresi_ulke_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECDESCRIPT","Ev Adresi Ulke Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECFRMCAPTN","Ülke Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECDLGCAPTN","Ülke Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECGRDCAPTN","Ülke Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECRPTCAPTN","Ülke Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMTOOLTIP","Ülke Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMSTATUSTXT","Ülke Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.ev_adresi_ulke_adi","FIELD",;
		"VFENDISPORDER",45) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.resim_id field.
DBSetProp('PERSONELEDITVIEW.resim_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.resim_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.resim_id', 'Field', 'UpdateName', 'dbo.Personel.Resim_Id')
DBSetProp('PERSONELEDITVIEW.resim_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELEDITVIEW.resim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECDESCRIPT","Resim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECFRMCAPTN","Resim") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECDLGCAPTN","Resim") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECGRDCAPTN","Resim") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECRPTCAPTN","Resim") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFEMTOOLTIP","Resim                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFEMSTATUSTXT","Resim                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_id","FIELD",;
		"VFENDISPORDER",47) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.resim_len field.
DBSetProp('PERSONELEDITVIEW.resim_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.resim_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.resim_len', 'Field', 'UpdateName', 'dbo.Personel.Resim_Len')
DBSetProp('PERSONELEDITVIEW.resim_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELEDITVIEW.resim_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECDESCRIPT","Resim Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECFRMCAPTN","Resim Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECDLGCAPTN","Resim Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECGRDCAPTN","Resim Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECRPTCAPTN","Resim Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFEMTOOLTIP","Resim Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFEMSTATUSTXT","Resim Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.resim_len","FIELD",;
		"VFENDISPORDER",48) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.kase_id field.
DBSetProp('PERSONELEDITVIEW.kase_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.kase_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.kase_id', 'Field', 'UpdateName', 'dbo.Personel.Kase_Id')
DBSetProp('PERSONELEDITVIEW.kase_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELEDITVIEW.kase_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECDESCRIPT","Kase Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECFRMCAPTN","Kaþe") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECDLGCAPTN","Kaþe") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECGRDCAPTN","Kaþe") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECRPTCAPTN","Kaþe") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFEMTOOLTIP","Kaþe                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFEMSTATUSTXT","Kaþe                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_id","FIELD",;
		"VFENDISPORDER",50) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.kase_len field.
DBSetProp('PERSONELEDITVIEW.kase_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.kase_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.kase_len', 'Field', 'UpdateName', 'dbo.Personel.Kase_Len')
DBSetProp('PERSONELEDITVIEW.kase_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELEDITVIEW.kase_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECDESCRIPT","Kase Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECFRMCAPTN","Kase Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECDLGCAPTN","Kase Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECGRDCAPTN","Kase Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECRPTCAPTN","Kase Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFEMTOOLTIP","Kase Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFEMSTATUSTXT","Kase Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.kase_len","FIELD",;
		"VFENDISPORDER",51) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.imza_id field.
DBSetProp('PERSONELEDITVIEW.imza_id', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.imza_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.imza_id', 'Field', 'UpdateName', 'dbo.Personel.Imza_Id')
DBSetProp('PERSONELEDITVIEW.imza_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELEDITVIEW.imza_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECDESCRIPT","Imza Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECFRMCAPTN","Ýmza") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECDLGCAPTN","Ýmza") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECGRDCAPTN","Ýmza") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECRPTCAPTN","Ýmza") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFEMTOOLTIP","Ýmza                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFEMSTATUSTXT","Ýmza                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_id","FIELD",;
		"VFENDISPORDER",53) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.imza_len field.
DBSetProp('PERSONELEDITVIEW.imza_len', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.imza_len', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.imza_len', 'Field', 'UpdateName', 'dbo.Personel.Imza_Len')
DBSetProp('PERSONELEDITVIEW.imza_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for PERSONELEDITVIEW.imza_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECDESCRIPT","Imza Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECFRMCAPTN","Imza Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECDLGCAPTN","Imza Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECGRDCAPTN","Imza Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECRPTCAPTN","Imza Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFEMTOOLTIP","Imza Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFEMSTATUSTXT","Imza Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.imza_len","FIELD",;
		"VFENDISPORDER",54) &&Display Order
ENDIF
 
*** Props for the PERSONELEDITVIEW.notlar field.
DBSetProp('PERSONELEDITVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELEDITVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELEDITVIEW.notlar', 'Field', 'UpdateName', 'dbo.Personel.Notlar')
DBSetProp('PERSONELEDITVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for PERSONELEDITVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELEDITVIEW.notlar","FIELD",;
		"VFENDISPORDER",54) &&Display Order
ENDIF
 
