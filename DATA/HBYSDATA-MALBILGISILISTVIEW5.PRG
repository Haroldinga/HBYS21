***************** Begin View Definition MalBilgisiView ***************


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



CREATE SQL VIEW "MalBilgisiView" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Malbilgisi.MalBilgisi_Id,;
		Malbilgisi.MalBilgisi_Fk,;
		Malbilgisi.Borclu_Id,;
		Malbilgisi.Borclu_Adi,;
		Malbilgisi.Rehber_Id,;
		Malbilgisi.Mal_Tipi,;
		Malbilgisi.Mal_Bilgisi,;
		Malbilgisi.Menkul_Bilgisi,;
		Malbilgisi.Banka_Hesap_No,;
		Malbilgisi.Arac_Tipi,;
		Malbilgisi.Plaka_No,;
		Malbilgisi.Il_Adi,;
		Malbilgisi.Ilce_Adi,;
		Malbilgisi.Mahalle_Adi,;
		Malbilgisi.Mulk_Tipi,;
		Malbilgisi.Parsel,;
		Malbilgisi.Sayfa_No,;
		Malbilgisi.Cilt_No,;
		Malbilgisi.Aciklama,;
		Malbilgisi.Mal_Tutari,;
		Malbilgisi.Muhatap_Adi,;
		Malbilgisi.Muhatap_Adresi,;
		Malbilgisi.Haciz_Tarihi,;
		Malbilgisi.Maas_Muvafakat_Miktari;
	FROM dbo.MalBilgisi Malbilgisi

DBSetProp('MalBilgisiView', 'View', 'UpdateType', 1)
DBSetProp('MalBilgisiView', 'View', 'WhereType', 3)
DBSetProp('MalBilgisiView', 'View', 'FetchMemo', .T.)
DBSetProp('MalBilgisiView', 'View', 'SendUpdates', .T.)
DBSetProp('MalBilgisiView', 'View', 'UseMemoSize', 255)
DBSetProp('MalBilgisiView', 'View', 'MaxRecords', -1)
DBSetProp('MalBilgisiView', 'View', 'Tables', 'dbo.MalBilgisi')
DBSetProp('MalBilgisiView', 'View', 'Prepared', .F.)
DBSetProp('MalBilgisiView', 'View', 'CompareMemo', .T.)
DBSetProp('MalBilgisiView', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MalBilgisiView', 'View', 'FetchSize', -1)
DBSetProp('MalBilgisiView', 'View', 'ParameterList', "vp_MalBilgisi_Fk,'C'")
DBSetProp('MalBilgisiView', 'View', 'Comment', "")
DBSetProp('MalBilgisiView', 'View', 'BatchUpdateCount', 1)
DBSetProp('MalBilgisiView', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MalBilgisiView
	GoExplorer.odbcx.Validate("MalBilgisiView","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView","VIEW",;
		"VFECDESCRIPT","MalBilgisiView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MalBilgisi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Malbilgisi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Malbilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Malbilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Malbilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Malbilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MalBilgisiView
*** Props for the MalBilgisiView.malbilgisi_id field.
DBSetProp('MalBilgisiView.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('MalBilgisiView.malbilgisi_id', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('MalBilgisiView.malbilgisi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MalBilgisiView.malbilgisi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MalBilgisiView.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Malbilgisi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Malbilgisi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Malbilgisi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Malbilgisi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Malbilgisi ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.malbilgisi_fk field.
DBSetProp('MalBilgisiView.malbilgisi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.malbilgisi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.malbilgisi_fk', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Fk')
DBSetProp('MalBilgisiView.malbilgisi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MalBilgisiView.malbilgisi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECDESCRIPT","Malbilgisi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECFRMCAPTN","Malbilgisi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECDLGCAPTN","Malbilgisi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECGRDCAPTN","Malbilgisi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECRPTCAPTN","Malbilgisi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFEMTOOLTIP","Malbilgisi FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.malbilgisi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.borclu_id field.
DBSetProp('MalBilgisiView.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.borclu_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Id')
DBSetProp('MalBilgisiView.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MalBilgisiView.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi, rehber_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the MalBilgisiView.borclu_adi field.
DBSetProp('MalBilgisiView.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.borclu_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Adi')
DBSetProp('MalBilgisiView.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MalBilgisiView.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.rehber_id field.
DBSetProp('MalBilgisiView.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.rehber_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Rehber_Id')
DBSetProp('MalBilgisiView.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MalBilgisiView.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.mal_tipi field.
DBSetProp('MalBilgisiView.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('MalBilgisiView.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MalBilgisiView.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!maltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECLUTAG","mal_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMLUFIELDS","mal_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMLUUPDTEXP","Maltipilookupview.mal_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.mal_bilgisi field.
DBSetProp('MalBilgisiView.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('MalBilgisiView.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MalBilgisiView.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_bilgisi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.menkul_bilgisi field.
DBSetProp('MalBilgisiView.menkul_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.menkul_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.menkul_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Menkul_Bilgisi')
DBSetProp('MalBilgisiView.menkul_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MalBilgisiView.menkul_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECDESCRIPT","Menkul Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECFRMCAPTN","Menkul Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECDLGCAPTN","Menkul Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECGRDCAPTN","Menkul Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECRPTCAPTN","Menkul Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFEMTOOLTIP","Menkul Bilgisi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Menkul Bilgisi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.menkul_bilgisi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.banka_hesap_no field.
DBSetProp('MalBilgisiView.banka_hesap_no', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.banka_hesap_no', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.banka_hesap_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Banka_Hesap_No')
DBSetProp('MalBilgisiView.banka_hesap_no', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MalBilgisiView.banka_hesap_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECDESCRIPT","Banka Hesap No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECFRMCAPTN","Banka Hesap No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECDLGCAPTN","Banka Hesap No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECGRDCAPTN","Banka Hesap No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECRPTCAPTN","Banka Hesap No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFEMTOOLTIP","Banka Hesap No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFEMSTATUSTXT","Banka Hesap No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.banka_hesap_no","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.arac_tipi field.
DBSetProp('MalBilgisiView.arac_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.arac_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.arac_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Arac_Tipi')
DBSetProp('MalBilgisiView.arac_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MalBilgisiView.arac_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECDESCRIPT","Arac Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECFRMCAPTN","Araç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECDLGCAPTN","Araç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECGRDCAPTN","Araç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECRPTCAPTN","Araç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFEMTOOLTIP","Araç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFEMSTATUSTXT","Araç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.arac_tipi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.plaka_no field.
DBSetProp('MalBilgisiView.plaka_no', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.plaka_no', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.plaka_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Plaka_No')
DBSetProp('MalBilgisiView.plaka_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MalBilgisiView.plaka_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECDESCRIPT","Plaka No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECFRMCAPTN","Plaka No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECDLGCAPTN","Plaka No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECGRDCAPTN","Plaka No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECRPTCAPTN","Plaka No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFEMTOOLTIP","Plaka No                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFEMSTATUSTXT","Plaka No                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.plaka_no","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.il_adi field.
DBSetProp('MalBilgisiView.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.il_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Il_Adi')
DBSetProp('MalBilgisiView.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MalBilgisiView.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.il_adi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.ilce_adi field.
DBSetProp('MalBilgisiView.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.ilce_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Ilce_Adi')
DBSetProp('MalBilgisiView.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MalBilgisiView.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.ilce_adi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.mahalle_adi field.
DBSetProp('MalBilgisiView.mahalle_adi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.mahalle_adi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.mahalle_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mahalle_Adi')
DBSetProp('MalBilgisiView.mahalle_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MalBilgisiView.mahalle_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECDESCRIPT","Mahalle Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECFRMCAPTN","Mahalle Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECDLGCAPTN","Mahalle Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECGRDCAPTN","Mahalle Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECRPTCAPTN","Mahalle Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFEMTOOLTIP","Mahalle Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFEMSTATUSTXT","Mahalle Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mahalle_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.mulk_tipi field.
DBSetProp('MalBilgisiView.mulk_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.mulk_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.mulk_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mulk_Tipi')
DBSetProp('MalBilgisiView.mulk_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MalBilgisiView.mulk_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECDESCRIPT","Mulk Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECFRMCAPTN","Mülk Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECDLGCAPTN","Mülk Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECGRDCAPTN","Mülk Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECRPTCAPTN","Mülk Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFEMTOOLTIP","Mülk Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFEMSTATUSTXT","Mülk Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mulk_tipi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.parsel field.
DBSetProp('MalBilgisiView.parsel', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.parsel', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.parsel', 'Field', 'UpdateName', 'dbo.MalBilgisi.Parsel')
DBSetProp('MalBilgisiView.parsel', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MalBilgisiView.parsel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECDESCRIPT","Parsel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECFRMCAPTN","Parsel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECDLGCAPTN","Parsel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECGRDCAPTN","Parsel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECRPTCAPTN","Parsel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFEMTOOLTIP","Parsel                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFEMSTATUSTXT","Parsel                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.parsel","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.sayfa_no field.
DBSetProp('MalBilgisiView.sayfa_no', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.sayfa_no', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.sayfa_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Sayfa_No')
DBSetProp('MalBilgisiView.sayfa_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MalBilgisiView.sayfa_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECDESCRIPT","Sayfa No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECFRMCAPTN","Sayfa No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECDLGCAPTN","Sayfa No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECGRDCAPTN","Sayfa No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECRPTCAPTN","Sayfa No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFEMTOOLTIP","Sayfa No                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFEMSTATUSTXT","Sayfa No                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.sayfa_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.cilt_no field.
DBSetProp('MalBilgisiView.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.cilt_no', 'Field', 'UpdateName', 'dbo.MalBilgisi.Cilt_No')
DBSetProp('MalBilgisiView.cilt_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for MalBilgisiView.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.cilt_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.aciklama field.
DBSetProp('MalBilgisiView.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.aciklama', 'Field', 'UpdateName', 'dbo.MalBilgisi.Aciklama')
DBSetProp('MalBilgisiView.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MalBilgisiView.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.aciklama","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.mal_tutari field.
DBSetProp('MalBilgisiView.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.mal_tutari', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.mal_tutari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tutari')
DBSetProp('MalBilgisiView.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MalBilgisiView.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutarý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutarý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.mal_tutari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MalBilgisiView.muhatap_adi field.
DBSetProp('MalBilgisiView.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.muhatap_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adi')
DBSetProp('MalBilgisiView.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MalBilgisiView.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.muhatap_adresi field.
DBSetProp('MalBilgisiView.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.muhatap_adresi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adresi')
DBSetProp('MalBilgisiView.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MalBilgisiView.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.muhatap_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MalBilgisiView.haciz_tarihi field.
DBSetProp('MalBilgisiView.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.haciz_tarihi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Haciz_Tarihi')
DBSetProp('MalBilgisiView.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MalBilgisiView.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.haciz_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MalBilgisiView.maas_muvafakat_miktari field.
DBSetProp('MalBilgisiView.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MalBilgisiView.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MalBilgisiView.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Maas_Muvafakat_Miktari')
DBSetProp('MalBilgisiView.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MalBilgisiView.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MalBilgisiView.maas_muvafakat_miktari","FIELD",;
		"VFEMFORMAT","KRZ") &&Format
ENDIF
 
